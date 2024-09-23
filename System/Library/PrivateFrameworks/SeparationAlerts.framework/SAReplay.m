@implementation SAReplay

- (SAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  SAReplay *v11;
  SAReplay *v12;
  SAAnalytics *v13;
  SAAnalyticsSettings *v14;
  uint64_t v15;
  SAAnalytics *analytics;
  SAService *v17;
  SAService *service;
  OSLogPersistence *v19;
  OSLogPersistence *persistence;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  OSActivityStream *v27;
  OSActivityStream *stream;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  NSMutableArray *eventOrder;
  NSMutableDictionary *v39;
  NSMutableDictionary *eventMessages;
  id v42;
  id v43;
  objc_super v44;
  _QWORD v45[3];
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)SAReplay;
  v11 = -[SAReplay init](&v44, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outputPath, a4);
    objc_storeStrong((id *)&v12->_inputPersistencePath, a5);
    v13 = [SAAnalytics alloc];
    v14 = -[SAAnalyticsSettings initWithEnableSubmission:]([SAAnalyticsSettings alloc], "initWithEnableSubmission:", 0);
    v15 = -[SAAnalytics initWithSettings:](v13, "initWithSettings:", v14);
    analytics = v12->_analytics;
    v12->_analytics = (SAAnalytics *)v15;

    v17 = -[SAService initWithAnalytics:isReplay:audioAccessoryManager:]([SAService alloc], "initWithAnalytics:isReplay:audioAccessoryManager:", v12->_analytics, 1, 0);
    service = v12->_service;
    v12->_service = v17;

    v19 = (OSLogPersistence *)objc_alloc_init(MEMORY[0x1E0D446A8]);
    persistence = v12->_persistence;
    v12->_persistence = v19;

    -[OSLogPersistence setLogArchive:](v12->_persistence, "setLogArchive:", v8);
    -[OSLogPersistence setOptions:](v12->_persistence, "setOptions:", 3);
    -[OSLogPersistence setDelegate:](v12->_persistence, "setDelegate:", v12);
    v43 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("process == 'locationd'"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subsystem == 'com.apple.TrackingAvoidance'"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("category == 'SeparationAlertsEvents'"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3528];
    v46[0] = v21;
    v46[1] = v22;
    v46[2] = v23;
    v42 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogPersistence setPredicate:](v12->_persistence, "setPredicate:", v26);

    v27 = (OSActivityStream *)objc_alloc_init(MEMORY[0x1E0D44660]);
    stream = v12->_stream;
    v12->_stream = v27;

    -[OSActivityStream setDelegate:](v12->_stream, "setDelegate:", v12);
    -[OSActivityStream setDeviceDelegate:](v12->_stream, "setDeviceDelegate:", v12);
    -[OSActivityStream setOptions:](v12->_stream, "setOptions:", 772);
    v29 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "predicateWithFormat:", CFSTR("processID == %d"), objc_msgSend(v30, "processIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subsystem == 'com.apple.TrackingAvoidance'"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("category == 'SeparationAlerts'"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0CB3528];
    v45[0] = v31;
    v45[1] = v32;
    v45[2] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "andPredicateWithSubpredicates:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSActivityStream setPredicate:](v12->_stream, "setPredicate:", v36);

    v9 = v43;
    v10 = v42;
    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventOrder = v12->_eventOrder;
    v12->_eventOrder = v37;

    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventMessages = v12->_eventMessages;
    v12->_eventMessages = v39;

  }
  return v12;
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSURL *outputPath;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  outputPath = self->_outputPath;
  if (outputPath)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", outputPath, &v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v37;
    if (v11)
    {
      v12 = v11;
      NSLog(CFSTR("Error writing replay result to file"));

      v13 = 0;
      v10 = v12;
    }
    else
    {
      v28 = v6;
      objc_msgSend(v10, "seekToEndOfFile");
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = v8;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "eventMessage");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAppendingString:", CFSTR("\n"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "dataUsingEncoding:", 4);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "writeData:", v26);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v21);
      }

      objc_msgSend(v10, "closeFile");
      v13 = 1;
      v6 = v28;
    }

  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "eventMessage");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          NSLog(CFSTR("ReplayStatus: %s\n"), objc_msgSend(v18, "UTF8String"));

        }
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v15);
    }
    v13 = 1;
  }

  return v13;
}

- (void)streamDidStop:(id)a3
{
  NSObject *streamWait;

  NSLog(CFSTR("Log stream stopped"), a2, a3);
  streamWait = self->_streamWait;
  if (streamWait)
    dispatch_semaphore_signal(streamWait);
}

- (void)streamDidStart:(id)a3
{
  NSObject *streamWait;

  NSLog(CFSTR("Log stream started"), a2, a3);
  streamWait = self->_streamWait;
  if (streamWait)
    dispatch_semaphore_signal(streamWait);
}

- (void)streamDidFail:(id)a3 error:(id)a4
{
  NSLog(CFSTR("Stream error: %@"), a2, a3, a4);
}

- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7
{
  if (!a6)
    objc_msgSend(a3, "setDevice:", a5, a4);
  return 1;
}

- (SAReplay)replayWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *outputPath;
  void *v12;
  OS_dispatch_semaphore *v13;
  OS_dispatch_semaphore *streamWait;
  NSObject *v15;
  dispatch_time_t v16;
  OS_dispatch_semaphore *v17;
  OS_dispatch_semaphore *v18;
  OS_dispatch_semaphore *persistenceWait;
  NSObject *v20;
  dispatch_time_t v21;
  OS_dispatch_semaphore *v22;
  OS_dispatch_semaphore *v23;
  OS_dispatch_semaphore *v24;
  NSObject *v25;
  dispatch_time_t v26;
  OS_dispatch_semaphore *v27;
  SAReplay *result;
  id v29;

  v29 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "descriptionWithLocale:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionWithLocale:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Replaying with\nStartDate: %@\nEndDate: %@"), v8, v10);

  outputPath = self->_outputPath;
  if (outputPath)
  {
    -[NSURL absoluteString](outputPath, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Writing output to: %@"), v12);

  }
  v13 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  streamWait = self->_streamWait;
  self->_streamWait = v13;

  -[OSActivityStream start](self->_stream, "start");
  v15 = self->_streamWait;
  v16 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    NSLog(CFSTR("STREAM START TIMEOUT"));
  }
  else
  {
    v17 = self->_streamWait;
    self->_streamWait = 0;

    v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    persistenceWait = self->_persistenceWait;
    self->_persistenceWait = v18;

    -[OSLogPersistence fetchFromStartDate:toEndDate:](self->_persistence, "fetchFromStartDate:toEndDate:", v29, v6);
    v20 = self->_persistenceWait;
    v21 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v20, v21))
      NSLog(CFSTR("REPLAY TIMEOUT"));
    v22 = self->_persistenceWait;
    self->_persistenceWait = 0;

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
    v23 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v24 = self->_streamWait;
    self->_streamWait = v23;

    -[OSActivityStream stop](self->_stream, "stop");
    v25 = self->_streamWait;
    v26 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v25, v26))
      NSLog(CFSTR("STREAM STOP TIMEOUT"));
    v27 = self->_streamWait;
    self->_streamWait = 0;

  }
  return result;
}

- (void)replaySingleEventLogString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[20];

  v15[19] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), &stru_1E83D18B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E83D18B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  v15[6] = objc_opt_class();
  v15[7] = objc_opt_class();
  v15[8] = objc_opt_class();
  v15[9] = objc_opt_class();
  v15[10] = objc_opt_class();
  v15[11] = objc_opt_class();
  v15[12] = objc_opt_class();
  v15[13] = objc_opt_class();
  v15[14] = objc_opt_class();
  v15[15] = objc_opt_class();
  v15[16] = objc_opt_class();
  v15[17] = objc_opt_class();
  v15[18] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  v13 = v12;
  if (v12)
    NSLog(CFSTR("ERROR DESERIALIZING EVENT: %@"), v12);
  else
    -[SAService ingestTAEvent:](self->_service, "ingestTAEvent:", v11);

}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *eventMessages;
  id v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  NSLog(CFSTR("Got activity events from log archive"));
  if (v8)
  {
    NSLog(CFSTR("Error in replaying logarchive: %@"), v8);
  }
  else
  {
    v22 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v13, "eventMessage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[SALoggingUtilities extractUniqueIdentifierFromMessage:](SALoggingUtilities, "extractUniqueIdentifierFromMessage:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_eventMessages, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[NSMutableDictionary objectForKey:](self->_eventMessages, "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "eventMessage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v18);
          }
          else
          {
            -[NSMutableArray addObject:](self->_eventOrder, "addObject:", v15);
            eventMessages = self->_eventMessages;
            v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v13, "eventMessage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v20, "initWithObjects:", v17, 0);
            -[NSMutableDictionary setObject:forKey:](eventMessages, "setObject:forKey:", v18, v15);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v8 = 0;
    v7 = v22;
  }

  return v8 == 0;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  NSObject *persistenceWait;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Finished fetching events from log archive"), a2, a3, a4);
  persistenceWait = self->_persistenceWait;
  if (persistenceWait)
    dispatch_semaphore_signal(persistenceWait);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_eventOrder;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        NSLog(CFSTR("replaying:%@"), v11);
        -[NSMutableDictionary objectForKey:](self->_eventMessages, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SALoggingUtilities extractEventFromMessages:](SALoggingUtilities, "extractEventFromMessages:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          -[SAService ingestTAEvent:](self->_service, "ingestTAEvent:", v13);
        else
          NSLog(CFSTR("Could not replay event %@"), v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (NSMutableDictionary)eventMessages
{
  return self->_eventMessages;
}

- (void)setEventMessages:(id)a3
{
  objc_storeStrong((id *)&self->_eventMessages, a3);
}

- (NSMutableArray)eventOrder
{
  return self->_eventOrder;
}

- (void)setEventOrder:(id)a3
{
  objc_storeStrong((id *)&self->_eventOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventOrder, 0);
  objc_storeStrong((id *)&self->_eventMessages, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_inputPersistencePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_streamWait, 0);
  objc_storeStrong((id *)&self->_persistenceWait, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
