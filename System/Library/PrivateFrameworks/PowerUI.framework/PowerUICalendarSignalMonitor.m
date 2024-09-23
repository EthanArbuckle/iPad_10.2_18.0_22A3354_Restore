@implementation PowerUICalendarSignalMonitor

- (PowerUICalendarSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  PowerUICalendarSignalMonitor *v10;
  uint64_t v11;
  EKEventStore *calendar;
  os_log_t v13;
  OS_os_log *log;
  uint64_t v15;
  id v16;
  PowerUICalendarSignalMonitor *v17;
  void (**v18)(void);
  NSObject *v19;
  _QWORD v21[4];
  PowerUICalendarSignalMonitor *v22;
  int out_token;
  _QWORD v24[4];
  id v25;
  PowerUICalendarSignalMonitor *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PowerUICalendarSignalMonitor;
  v10 = -[PowerUICalendarSignalMonitor init](&v27, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDC74E8]), "initWithEKOptions:", 128);
    calendar = v10->_calendar;
    v10->_calendar = (EKEventStore *)v11;

    objc_storeStrong((id *)&v10->_delegate, a3);
    v13 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    v15 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke;
    v24[3] = &unk_24D3FC690;
    v16 = v9;
    v25 = v16;
    v17 = v10;
    v26 = v17;
    v18 = (void (**)(void))MEMORY[0x2199EC2D0](v24);
    v18[2]();
    objc_msgSend(v16, "addUpdateHandler:", v18);
    out_token = 0;
    dispatch_get_global_queue(-2, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke_49;
    v21[3] = &unk_24D3FB748;
    v22 = v17;
    notify_register_dispatch("com.apple.powerui.calendar.test", &out_token, v19, v21);

  }
  return v10;
}

void __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  double v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "doubleFactorForName:", CFSTR("calendarSignalBuffer"));
  if (v2 > 1.0)
    kBufferBeforeFirstCalendarEvent = *(_QWORD *)&v2;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = kBufferBeforeFirstCalendarEvent;
    _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEFAULT, "Event Buffer: %lf", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "doubleFactorForName:", CFSTR("calendarSignalBufferShort"));
  if (v4 > 1.0)
    kBufferBeforeFirstCalendarEventShort = *(_QWORD *)&v4;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = kBufferBeforeFirstCalendarEventShort;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Short Event Buffer: %lf", (uint8_t *)&v6, 0xCu);
  }
}

id __74__PowerUICalendarSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Got notification", v4, 2u);
  }

  return (id)objc_msgSend(*(id *)(a1 + 32), "requiredFullChargeDate");
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:trialManager:withContext:", v3, 0, 0);

  return v4;
}

+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:trialManager:withContext:", v9, v8, v7);

  return v10;
}

- (unint64_t)signalID
{
  return 3;
}

- (void)startMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sourceInformationChangedNotification_, *MEMORY[0x24BDC7420], 0);

}

- (void)sourceInformationChangedNotification:(id)a3
{
  id v4;

  -[PowerUICalendarSignalMonitor requiredFullChargeDate](self, "requiredFullChargeDate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PowerUISignalMonitorDelegate monitor:maySuggestNewFullChargeDeadline:](self->_delegate, "monitor:maySuggestNewFullChargeDeadline:", self, v4);

}

- (void)stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDC7420], 0);

}

- (id)upcomingEventIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:](self->_calendar, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v4, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUICalendarSignalMonitor calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventObjectIDsMatchingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nextFlightEventWithEventIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  os_log_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  void *v26;
  void *v27;
  id v28;
  os_log_t log;
  NSObject *loga;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v9 = v7;
    log = 0;
    v10 = *(_QWORD *)v32;
    *(_QWORD *)&v8 = 138412546;
    v25 = v8;
    v28 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          if ((objc_msgSend(v13, "isAllDay") & 1) == 0)
          {
            objc_msgSend(v13, "suggestionInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(MEMORY[0x24BE285F0], "eventMetadataFromEKEvent:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "categoryDescription");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "localizedCaseInsensitiveContainsString:", CFSTR("flight"));

              if (v17
                && (objc_msgSend(v13, "startDate"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v18, "timeIntervalSinceDate:", v5),
                    v20 = v19,
                    v18,
                    v20 < 0.0))
              {
                v21 = (os_log_t)v13;

                -[NSObject startDate](v21, "startDate");
                v22 = objc_claimAutoreleasedReturnValue();

                v23 = self->_log;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  loga = v23;
                  -[NSObject startDate](v21, "startDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject endDate](v21, "endDate");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v25;
                  v36 = v27;
                  v37 = 2112;
                  v38 = v26;
                  _os_log_impl(&dword_215A71000, loga, OS_LOG_TYPE_DEFAULT, "Found flight from %@-%@", buf, 0x16u);

                }
              }
              else
              {
                v22 = (uint64_t)v5;
                v21 = log;
              }

              v5 = (void *)v22;
              log = v21;
              v6 = v28;
            }
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v9);
  }
  else
  {
    log = 0;
  }

  return log;
}

- (BOOL)isEventEligible:(id)a3 AtTime:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    if (v10 > 2073600.0 || objc_msgSend(v5, "status") == 3)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v6);
      v7 = v12 < 0.0;

    }
  }

  return !v7;
}

- (id)nextRelevantDeadlineWithEventIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSObject *log;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeManager manager](PowerUISmartChargeManager, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastAcquiredLocation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  v47 = v7;
  if (v8)
  {
    v10 = v8;
    v49 = 0;
    v11 = *(_QWORD *)v52;
    *(_QWORD *)&v9 = 138412546;
    v44 = v9;
    v48 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v7);
        -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), v44);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if (-[PowerUICalendarSignalMonitor isEventEligible:AtTime:](self, "isEventEligible:AtTime:", v14, v5))
          {
            objc_msgSend(v14, "startDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeIntervalSinceDate:", v5);
            v17 = v16;

            if (v17 >= 0.0)
            {
              v19 = kBufferBeforeFirstCalendarEvent;
              if (*(double *)&kBufferBeforeFirstCalendarEvent > *(double *)&kBufferBeforeFirstCalendarEventShort)
              {
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                {
                  v33 = log;
                  objc_msgSend(v14, "title");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "preferredLocation");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "geoLocation");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v44;
                  v56 = v34;
                  v57 = 2112;
                  v58 = *(double *)&v35;
                  _os_log_debug_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);

                }
                if (v46)
                {
                  objc_msgSend(v14, "preferredLocation");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "geoLocation");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                  {
                    objc_msgSend(v14, "preferredLocation");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "geoLocation");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "distanceFromLocation:", v24);
                    v26 = v25;

                    v27 = self->_log;
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      v36 = v27;
                      objc_msgSend(v14, "title");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v44;
                      v56 = v37;
                      v57 = 2048;
                      v58 = v26;
                      _os_log_debug_impl(&dword_215A71000, v36, OS_LOG_TYPE_DEBUG, "%@ is %fm away", buf, 0x16u);

                    }
                    if (v26 < 2000.0)
                      v19 = kBufferBeforeFirstCalendarEventShort;
                  }
                }
              }
              objc_msgSend(v14, "startDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v14, "endDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = kBufferBeforeFirstCalendarEvent;
            }
            objc_msgSend(v18, "dateByAddingTimeInterval:", -*(double *)&v19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "timeIntervalSinceDate:", v50);
            if (v29 < 0.0)
            {
              v30 = v14;

              v31 = v5;
              v32 = v28;

              v49 = v30;
              v50 = v32;
              v5 = v31;
              v7 = v47;
            }
            v11 = v48;

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v10);
  }
  else
  {
    v49 = 0;
  }

  v38 = self->_log;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    objc_msgSend(v49, "startDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "endDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v56 = v40;
    v57 = 2112;
    v58 = *(double *)&v41;
    v59 = 2112;
    v60 = v50;
    _os_log_impl(&dword_215A71000, v39, OS_LOG_TYPE_DEFAULT, "Found upcoming event: %@-%@, requiring full charge by %@", buf, 0x20u);

  }
  v42 = v50;

  return v42;
}

- (id)requiredFullChargeDate
{
  void *v3;
  void *v4;
  NSObject *log;
  uint64_t v6;
  void *v7;
  uint8_t v9[16];

  -[PowerUICalendarSignalMonitor upcomingEventIDs](self, "upcomingEventIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUICalendarSignalMonitor nextFlightEventWithEventIDs:](self, "nextFlightEventWithEventIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Upcoming or recent flight; forcing immediate charge",
        v9,
        2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PowerUICalendarSignalMonitor nextRelevantDeadlineWithEventIDs:](self, "nextRelevantDeadlineWithEventIDs:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)detectedSignals
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUICalendarSignalMonitor upcomingEventIDs](self, "upcomingEventIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (-[PowerUICalendarSignalMonitor isEventEligible:AtTime:](self, "isEventEligible:AtTime:", v11, v3))
          {
            objc_msgSend(v11, "startDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v12);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (EKEventStore)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
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
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
