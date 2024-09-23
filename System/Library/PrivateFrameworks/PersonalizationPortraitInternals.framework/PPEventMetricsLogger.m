@implementation PPEventMetricsLogger

- (PPEventMetricsLogger)init
{
  PPEventMetricsLogger *v2;
  PPEventMetricsLogger *v3;
  NSString *path;
  uint64_t v5;
  NSMutableArray *loggedInteractionsSummary;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *interactionsWriteQueue;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_source_t v13;
  OS_dispatch_source *persistenceTimerSource;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;
  pthread_mutexattr_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PPEventMetricsLogger;
  v2 = -[PPEventMetricsLogger init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    path = v2->_path;
    v2->_path = 0;

    v5 = objc_opt_new();
    loggedInteractionsSummary = v3->_loggedInteractionsSummary;
    v3->_loggedInteractionsSummary = (NSMutableArray *)v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.suggestd.pp-interactions-write-queue", v7);
    interactionsWriteQueue = v3->_interactionsWriteQueue;
    v3->_interactionsWriteQueue = (OS_dispatch_queue *)v8;

    v20.__sig = 0;
    *(_QWORD *)v20.__opaque = 0;
    pthread_mutexattr_init(&v20);
    pthread_mutexattr_settype(&v20, 2);
    pthread_mutex_init(&v3->_lock, &v20);
    pthread_mutexattr_destroy(&v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("pp-rtc-persist", v11);

    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
    persistenceTimerSource = v3->_persistenceTimerSource;
    v3->_persistenceTimerSource = (OS_dispatch_source *)v13;

    v20.__sig = 0;
    objc_initWeak((id *)&v20, v3);
    v15 = v3->_persistenceTimerSource;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __28__PPEventMetricsLogger_init__block_invoke;
    v17[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v18, (id *)&v20);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_resume((dispatch_object_t)v3->_persistenceTimerSource);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)&v20);

  }
  return v3;
}

- (PPEventMetricsLogger)initWithFileName:(id)a3
{
  id v5;
  PPEventMetricsLogger *v6;
  PPEventMetricsLogger *v7;

  v5 = a3;
  v6 = -[PPEventMetricsLogger init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (BOOL)storeToDisk
{
  NSObject *v3;
  NSString *path;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  char v7;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  pp_events_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    v9 = 138412290;
    v10 = path;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: Persisting some logs to disk! path: %@", (uint8_t *)&v9, 0xCu);
  }

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "writeToFile:atomically:", self->_path, 0);
  pthread_mutex_unlock(p_lock);

  return v7;
}

- (id)_createRTCReporting
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CFAbsoluteTimeGetCurrent());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D83888];
  v13[0] = *MEMORY[0x1E0D83880];
  v13[1] = v3;
  v14[0] = &unk_1E7E59288;
  v14[1] = &unk_1E7E592A0;
  v4 = *MEMORY[0x1E0D83870];
  v13[2] = *MEMORY[0x1E0D838A8];
  v13[3] = v4;
  v14[2] = v2;
  v14[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D838B8];
  v11[0] = *MEMORY[0x1E0D838B0];
  v11[1] = v6;
  v12[0] = CFSTR("Suggestions");
  v12[1] = CFSTR("com.apple.PersonalizationPortrait");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D83848]);
  v9 = (void *)objc_msgSend(v8, "initWithSessionInfo:userInfo:frameworksToCheck:", v5, v7, MEMORY[0x1E0C9AA60]);

  return v9;
}

- (void)sendRTCLogsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  PPEventMetricsLogger *v15;
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  _BYTE *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _BYTE buf[24];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  pp_events_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: Sending privacy-aware suggestions log over the network", buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  -[PPEventMetricsLogger logsToSend](self, "logsToSend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&self->_lock);
  v7 = objc_msgSend(v6, "count") == 0;
  pp_events_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: No RTC logs to send this time. Skipping.", buf, 2u);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: Selected logs (%lu): %@", buf, 0x16u);
    }

    -[PPEventMetricsLogger _createRTCReporting](self, "_createRTCReporting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v23 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__PPEventMetricsLogger_sendRTCLogsWithCompletion___block_invoke;
    v13[3] = &unk_1E7E16400;
    v17 = v4;
    v14 = v6;
    v15 = self;
    v11 = v10;
    v16 = v11;
    v18 = buf;
    v19 = v20;
    objc_msgSend(v11, "startConfigurationWithCompletionHandler:", v13);

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (PPEventMetricsLogger)initWithCoder:(id)a3
{
  id v4;
  PPEventMetricsLogger *v5;
  uint64_t v6;
  NSString *path;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *loggedInteractionsSummary;
  void *v21;
  double v22;
  double v23;

  v4 = a3;
  v5 = -[PPEventMetricsLogger init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("loggedInteractionsSummary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (NSMutableArray *)objc_opt_new();
    loggedInteractionsSummary = v5->_loggedInteractionsSummary;
    v5->_loggedInteractionsSummary = v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeCreationDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v5->_storeCreationDate = v22;

    if (v5->_storeCreationDate == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v5->_storeCreationDate = v23;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggedInteractionsSummary, CFSTR("loggedInteractionsSummary"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_storeCreationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("storeCreationDate"));

  pthread_mutex_unlock(p_lock);
}

- (void)updateAndScheduleDiskWrite
{
  NSObject *v3;
  NSObject *v4;
  NSObject *persistenceTimerSource;
  dispatch_time_t v6;
  uint8_t v7[16];
  uint8_t buf[16];

  pp_events_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: updating and scheduling disk write", buf, 2u);
  }

  pp_events_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: updating and scheduling disk write for real", v7, 2u);
  }

  persistenceTimerSource = self->_persistenceTimerSource;
  v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(persistenceTimerSource, v6, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
}

- (void)logNewInteractionSummaryWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_events_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: log new interaction summary: %@", (uint8_t *)&v6, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_loggedInteractionsSummary, "addObject:", v4);
  pthread_mutex_unlock(&self->_lock);
  -[PPEventMetricsLogger updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");

}

- (id)eventsAndExtraordinaryEventsDictFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setDay:", -7);
    objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "eventHighlightsFrom:to:options:", v6, v3, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
      {
        v11 = v10;
        LODWORD(v12) = 0;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v9);
            v12 = v12
                + objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "isExtraordinary", (_QWORD)v19);
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v23[0] = CFSTR("eventHighlightsCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("ekEventsCount");
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v9, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v4;
        v28 = 2112;
        v29 = v5;
        v30 = 2112;
        v31 = v3;
        _os_log_fault_impl(&dword_1C392E000, v9, OS_LOG_TYPE_FAULT, "eventsAndExtraordinaryEventsDictFromDate failed to get startDate from c:%@ add:%@ d:%@", buf, 0x20u);
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)resetLogs
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableArray *v4;
  NSMutableArray *loggedInteractionsSummary;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = (NSMutableArray *)objc_opt_new();
  loggedInteractionsSummary = self->_loggedInteractionsSummary;
  self->_loggedInteractionsSummary = v4;

  pthread_mutex_unlock(p_lock);
  return -[PPEventMetricsLogger storeToDisk](self, "storeToDisk");
}

- (double)_storeAge
{
  _opaque_pthread_mutex_t *p_lock;
  double v4;
  double v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 - self->_storeCreationDate;
  pthread_mutex_unlock(p_lock);
  return v5;
}

- (BOOL)_removeInteractionsSummaryLogsFromLogsAndResetStoreAge:(id)a3
{
  id v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_storeCreationDate = v5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableArray removeObject:](self->_loggedInteractionsSummary, "removeObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  pthread_mutex_unlock(&self->_lock);
  v11 = -[PPEventMetricsLogger storeToDisk](self, "storeToDisk");

  return v11;
}

- (id)logsToSend
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _opaque_pthread_mutex_t *p_lock;
  id v14;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v14 = (id)objc_opt_new();
  if (-[NSMutableArray count](self->_loggedInteractionsSummary, "count"))
  {
    v3 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v3, p_lock);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryLog"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPEventMetricsLogger _descriptionForPPRTCCategory:](self, "_descriptionForPPRTCCategory:", 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
        break;
      v7 = (void *)objc_opt_new();
      -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("expirationDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "compare:", v9);

      if (v10 == 1)
      {
        v11 = objc_alloc(MEMORY[0x1E0C99E08]);
        -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v11, "initWithDictionary:copyItems:", v4, 1);
        objc_msgSend(v14, "addObject:", v5);
LABEL_7:

      }
      if (++v3 >= (unint64_t)-[NSMutableArray count](self->_loggedInteractionsSummary, "count"))
        goto LABEL_9;
    }

    goto LABEL_7;
  }
LABEL_9:
  pthread_mutex_unlock(p_lock);
  return v14;
}

- (id)allowedLogFromLog:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("eventIdentifier"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("expirationDate"));
  return v3;
}

- (void)logEventInteractionForEventHighlight:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t v27[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "eventIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PPEventMetricsLogger _incrementInteractionForEventIdentifier:interface:actionType:](self, "_incrementInteractionForEventIdentifier:interface:actionType:", v9, v6, v5))
  {

LABEL_8:
    pp_events_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: No endDate for event", v27, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  objc_msgSend(v8, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_opt_new();
    v15 = +[PPEventMetricsLogger numberOfDaysBetweenDate:andDate:](PPEventMetricsLogger, "numberOfDaysBetweenDate:andDate:", v14, v11);

    if (v15 >= 366)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setYear:", 1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_opt_new();
      objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v16, v18, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v19;
    }
  }
  -[PPEventMetricsLogger _interactionAttributesForEventHighlight:](self, "_interactionAttributesForEventHighlight:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  -[PPEventMetricsLogger _descriptionForPPRTCCategory:](self, "_descriptionForPPRTCCategory:", 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("categoryLog"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, CFSTR("expirationDate"));
  v23 = (void *)objc_opt_new();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("creationDate"));

  objc_msgSend(v8, "eventIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("eventIdentifier"));

  -[PPEventMetricsLogger _interactionKeyForInterface:actionType:](self, "_interactionKeyForInterface:actionType:", v6, v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E7E592B8, v25);

  -[PPEventMetricsLogger logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v21);
LABEL_11:

}

- (BOOL)_incrementInteractionForEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSMutableArray *loggedInteractionsSummary;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PPEventMetricsLogger _interactionKeyForInterface:actionType:](self, "_interactionKeyForInterface:actionType:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pp_events_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412546;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: log and increment interaction key: %@, for eventIdentifier: %@", (uint8_t *)&v24, 0x16u);
  }

  pthread_mutex_lock(&self->_lock);
  if (-[NSMutableArray count](self->_loggedInteractionsSummary, "count"))
  {
    v11 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v8);

      loggedInteractionsSummary = self->_loggedInteractionsSummary;
      if (v14)
        break;
      if (++v11 >= (unint64_t)-[NSMutableArray count](loggedInteractionsSummary, "count"))
        goto LABEL_7;
    }
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableArray objectAtIndexedSubscript:](loggedInteractionsSummary, "objectAtIndexedSubscript:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v9);

    pthread_mutex_unlock(&self->_lock);
    -[PPEventMetricsLogger updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");
    v17 = 1;
  }
  else
  {
LABEL_7:
    pthread_mutex_unlock(&self->_lock);
    pp_events_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: can't find eventIdentifier in loggedInteractionsSummary dictionary", (uint8_t *)&v24, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)_interactionAttributesForEventHighlight:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%@]"), v7, CFSTR("rankingFeatures"));
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPEventMetricsLogger _descriptionForInterface:](self, "_descriptionForInterface:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEventMetricsLogger _descriptionForActionType:](self, "_descriptionForActionType:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@_%@"), v8, v9);

  return v10;
}

- (id)_descriptionForInterface:(unsigned __int16)a3
{
  if (a3 > 0xAu)
    return CFSTR("unknown");
  else
    return off_1E7E16420[a3];
}

- (id)_descriptionForActionType:(unsigned __int16)a3
{
  if (a3 > 4u)
    return CFSTR("unknown");
  else
    return off_1E7E16478[a3];
}

- (id)_descriptionForPPRTCCategory:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 1) > 0xAu)
    return CFSTR("unknown");
  else
    return off_1E7E164A0[(unsigned __int16)(a3 + 1)];
}

- (id)loggedInteractionsSummaryMetrics
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_loggedInteractionsSummary, "copy");
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  pp_events_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger going away now", buf, 2u);
  }

  pthread_mutex_destroy(&self->_lock);
  dispatch_source_cancel((dispatch_source_t)self->_persistenceTimerSource);
  v4.receiver = self;
  v4.super_class = (Class)PPEventMetricsLogger;
  -[PPEventMetricsLogger dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsWriteQueue, 0);
  objc_storeStrong((id *)&self->_persistenceTimerSource, 0);
  objc_storeStrong((id *)&self->_loggedInteractionsSummary, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

uint64_t __50__PPEventMetricsLogger_sendRTCLogsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t (*v23)(void);
  NSObject *v24;
  __int128 v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = *(id *)(a1 + 32);
    v29 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (!v29)
      goto LABEL_22;
    v30 = 0;
    v5 = *(_QWORD *)v34;
    *(_QWORD *)&v4 = 138412290;
    v26 = v4;
    v27 = *(_QWORD *)v34;
    v28 = v3;
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(v7, "mutableCopy", v26);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("expirationDate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "eventsAndExtraordinaryEventsDictFromDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v8, "addEntriesFromDictionary:", v11);
        objc_msgSend(*(id *)(a1 + 40), "allowedLogFromLog:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 48);
        v32 = 0;
        v14 = objc_msgSend(v13, "sendMessageWithCategory:type:payload:error:", 8, 0, v12, &v32);
        v15 = v32;
        if ((v14 & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          if ((v30 & 1) != 0)
          {
            v30 = 1;
            goto LABEL_20;
          }
          v37 = CFSTR("storeAge");
          v17 = (void *)MEMORY[0x1E0CB37E8];
          v18 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "_storeAge");
          objc_msgSend(v17, "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v19;
          v30 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v15;
          LOBYTE(v18) = objc_msgSend(v18, "sendMessageWithCategory:type:payload:error:", 2, 0, v20, &v31);
          v21 = v31;

          if ((v18 & 1) != 0)
          {
            v15 = v21;
            v5 = v27;
            v3 = v28;
            goto LABEL_20;
          }
          pp_default_log_handle();
          v16 = objc_claimAutoreleasedReturnValue();
          v5 = v27;
          v3 = v28;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v40 = v21;
            _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to send logs for storeAge: %@", buf, 0xCu);
          }
          v30 = 1;
          v15 = v21;
        }
        else
        {
          pp_default_log_handle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v40 = v15;
            _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to send logs: %@", buf, 0xCu);
          }
        }

LABEL_20:
      }
      v29 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (!v29)
      {
LABEL_22:

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "flushMessages");
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
          {
            objc_msgSend(*(id *)(a1 + 40), "_removeInteractionsSummaryLogsFromLogsAndResetStoreAge:", *(_QWORD *)(a1 + 32));
          }
          else
          {
            pp_default_log_handle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to flush logs", buf, 2u);
            }

          }
        }
        v23 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        return v23();
      }
    }
  }
  pp_events_log_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPEventMetricsLogger: No RTC backends found, no logs will be sent at this time.", buf, 2u);
  }

  v23 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  return v23();
}

void __28__PPEventMetricsLogger_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "storeToDisk");

}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1)
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_3460);
  return (id)defaultLogger_sharedLogger;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "day");
  return v11;
}

void __37__PPEventMetricsLogger_defaultLogger__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  PPEventMetricsLogger *v13;
  void *v14;
  uint8_t v15[48];
  uint8_t buf[16];

  +[PPPaths topDirectory](PPPaths, "topDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("pp-privacyAwareLogging.ser"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileSize");

    if (v5)
    {
      pp_events_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Attempt to read stored logs", buf, 2u);
      }

      v7 = objc_alloc(MEMORY[0x1E0CB3710]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initForReadingFromData:error:", v8, 0);

      objc_msgSend(v9, "setDecodingFailurePolicy:", 0);
      objc_msgSend(v9, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)defaultLogger_sharedLogger;
      defaultLogger_sharedLogger = v10;

      goto LABEL_10;
    }
  }
  else
  {

  }
  pp_events_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "New logging store", v15, 2u);
  }

  v13 = -[PPEventMetricsLogger initWithFileName:]([PPEventMetricsLogger alloc], "initWithFileName:", v1);
  v14 = (void *)defaultLogger_sharedLogger;
  defaultLogger_sharedLogger = (uint64_t)v13;

LABEL_10:
}

@end
