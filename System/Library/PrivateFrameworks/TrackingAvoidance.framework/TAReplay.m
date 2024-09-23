@implementation TAReplay

- (TAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5 settings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TAReplay *v14;
  TAReplay *v15;
  TATrackingAvoidanceService *v16;
  TATrackingAvoidanceService *service;
  TAAnalyticsManager *v18;
  TAAnalyticsManagerSettings *v19;
  uint64_t v20;
  TAAnalyticsManager *analyticsManager;
  OSLogPersistence *v22;
  OSLogPersistence *persistence;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OSActivityStream *v29;
  OSActivityStream *stream;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  objc_super v45;
  _QWORD v46[3];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v45.receiver = self;
  v45.super_class = (Class)TAReplay;
  v14 = -[TAReplay init](&v45, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_outputPath, a4);
    objc_storeStrong((id *)&v15->_inputPersistencePath, a5);
    v16 = -[TATrackingAvoidanceService initWithSettings:]([TATrackingAvoidanceService alloc], "initWithSettings:", v13);
    service = v15->_service;
    v15->_service = v16;

    v18 = [TAAnalyticsManager alloc];
    v19 = -[TAAnalyticsManagerSettings initWithEnableSubmissionOrDefault:andSettingsVersion:]([TAAnalyticsManagerSettings alloc], "initWithEnableSubmissionOrDefault:andSettingsVersion:", &unk_24D824F80, 1);
    v20 = -[TAAnalyticsManager initWithSettings:](v18, "initWithSettings:", v19);
    analyticsManager = v15->_analyticsManager;
    v15->_analyticsManager = (TAAnalyticsManager *)v20;

    -[TATrackingAvoidanceService addObserver:](v15->_service, "addObserver:", v15->_analyticsManager);
    v22 = (OSLogPersistence *)objc_alloc_init(MEMORY[0x24BE60C88]);
    persistence = v15->_persistence;
    v15->_persistence = v22;

    -[OSLogPersistence setLogArchive:](v15->_persistence, "setLogArchive:", v10);
    -[OSLogPersistence setOptions:](v15->_persistence, "setOptions:", 3);
    -[OSLogPersistence setDelegate:](v15->_persistence, "setDelegate:", v15);
    v44 = v10;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("process == 'locationd'"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("subsystem == 'com.apple.tracking-avoidance'"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("category == 'Events'"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD14C0];
    v47[0] = v42;
    v47[1] = v24;
    v47[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
    v43 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogPersistence setPredicate:](v15->_persistence, "setPredicate:", v28);

    v29 = (OSActivityStream *)objc_alloc_init(MEMORY[0x24BE60C58]);
    stream = v15->_stream;
    v15->_stream = v29;

    -[OSActivityStream setDelegate:](v15->_stream, "setDelegate:", v15);
    -[OSActivityStream setDeviceDelegate:](v15->_stream, "setDeviceDelegate:", v15);
    -[OSActivityStream setOptions:](v15->_stream, "setOptions:", 772);
    v31 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v32 = v13;
    v33 = v12;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateWithFormat:", CFSTR("processID == %d"), objc_msgSend(v34, "processIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("subsystem == 'com.apple.tracking-avoidance'"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("category == 'Status'"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x24BDD14C0];
    v46[0] = v35;
    v46[1] = v36;
    v46[2] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "andPredicateWithSubpredicates:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSActivityStream setPredicate:](v15->_stream, "setPredicate:", v40);

    v10 = v44;
    v12 = v33;
    v13 = v32;

    v11 = v43;
  }

  return v15;
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

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  outputPath = self->_outputPath;
  if (outputPath)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", outputPath, &v37);
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

- (TAReplay)replayWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURL *outputPath;
  void *v13;
  OS_dispatch_semaphore *v14;
  OS_dispatch_semaphore *streamWait;
  NSObject *v16;
  dispatch_time_t v17;
  OS_dispatch_semaphore *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  TATrackingAvoidanceService *service;
  void *v27;
  TATrackingAvoidanceService *v28;
  void *v29;
  OS_dispatch_semaphore *v30;
  OS_dispatch_semaphore *persistenceWait;
  NSObject *v32;
  dispatch_time_t v33;
  OS_dispatch_semaphore *v34;
  OS_dispatch_semaphore *v35;
  OS_dispatch_semaphore *v36;
  NSObject *v37;
  dispatch_time_t v38;
  OS_dispatch_semaphore *v39;
  TAReplay *result;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionWithLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionWithLocale:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Replaying with\nStartDate: %@\nEndDate: %@"), v9, v11);

  outputPath = self->_outputPath;
  if (outputPath)
  {
    -[NSURL absoluteString](outputPath, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Writing output to: %@"), v13);

  }
  v14 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  streamWait = self->_streamWait;
  self->_streamWait = v14;

  -[OSActivityStream start](self->_stream, "start");
  v16 = self->_streamWait;
  v17 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    NSLog(CFSTR("STREAM START TIMEOUT"));
  }
  else
  {
    v18 = self->_streamWait;
    self->_streamWait = 0;

    if (self->_inputPersistencePath)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDBCF20];
      v42[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v22, v19, &v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v41;
      v25 = v24;
      if (v24)
      {
        NSLog(CFSTR("Error: failed to deserialize persistence store: %@"), v24);
      }
      else
      {
        NSLog(CFSTR("Bootstrapping onto store"));
        service = self->_service;
        objc_msgSend(v23, "visitState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[TATrackingAvoidanceService bootstrapVisitState:](service, "bootstrapVisitState:", v27);

        v28 = self->_service;
        objc_msgSend(v23, "deviceRecord");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TATrackingAvoidanceService bootstrapDeviceRecord:](v28, "bootstrapDeviceRecord:", v29);

      }
    }
    v30 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    persistenceWait = self->_persistenceWait;
    self->_persistenceWait = v30;

    -[OSLogPersistence fetchFromStartDate:toEndDate:](self->_persistence, "fetchFromStartDate:toEndDate:", v6, v7);
    v32 = self->_persistenceWait;
    v33 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v32, v33))
      NSLog(CFSTR("REPLAY TIMEOUT"));
    v34 = self->_persistenceWait;
    self->_persistenceWait = 0;

    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 1.0);
    v35 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v36 = self->_streamWait;
    self->_streamWait = v35;

    -[OSActivityStream stop](self->_stream, "stop");
    v37 = self->_streamWait;
    v38 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v37, v38))
      NSLog(CFSTR("STREAM STOP TIMEOUT"));
    v39 = self->_streamWait;
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
  _QWORD v15[15];

  v15[14] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), &stru_24D815B48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D815B48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
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
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  v13 = v12;
  if (v12)
    NSLog(CFSTR("ERROR DESERIALIZING EVENT: %@"), v12);
  else
    -[TATrackingAvoidanceService ingestTAEvent:](self->_service, "ingestTAEvent:", v11);

}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  NSLog(CFSTR("Got activity events from log archive"));
  if (v8)
  {
    NSLog(CFSTR("Error in replaying logarchive: %@"), v8);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "eventMessage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAReplay replaySingleEventLogString:](self, "replaySingleEventLogString:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  return v8 == 0;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  NSObject *persistenceWait;

  NSLog(CFSTR("Finished fetching events from log archive"), a2, a3, a4);
  persistenceWait = self->_persistenceWait;
  if (persistenceWait)
    dispatch_semaphore_signal(persistenceWait);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_inputPersistencePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_streamWait, 0);
  objc_storeStrong((id *)&self->_persistenceWait, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
