@implementation SUCoreEventReporter

+ (id)initSharedReporterStoringToPath:(id)a3
{
  return (id)objc_msgSend(a1, "_sharedReporter:withAccessControl:", a3, 1);
}

+ (id)sharedReporter
{
  return (id)objc_msgSend(a1, "_sharedReporter:withAccessControl:", 0, 1);
}

+ (id)_sharedReporter:(id)a3 withAccessControl:(int64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke;
  v10[3] = &unk_1E611C180;
  v11 = v5;
  v12 = a4;
  v6 = _sharedReporter_withAccessControl__reporterOnce;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&_sharedReporter_withAccessControl__reporterOnce, v10);
  v8 = (id)_sharedReporter_withAccessControl__reporter;

  return v8;
}

void __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = -[SUCoreEventReporter initStoringToPath:withAccessControl:]([SUCoreEventReporter alloc], "initStoringToPath:withAccessControl:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)_sharedReporter_withAccessControl__reporter;
  _sharedReporter_withAccessControl__reporter = (uint64_t)v1;

}

- (id)initStoringToPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[SUCoreEventReporter initStoringToPath:withAccessControl:]([SUCoreEventReporter alloc], "initStoringToPath:withAccessControl:", v4, 1);

  return v5;
}

- (id)initStoringToPath:(id)a3 withAccessControl:(int64_t)a4
{
  id v6;
  SUCoreEventReporter *v7;
  SUCoreEventReporter *v8;
  NSMutableArray *awaitingRetry;
  NSURL *splunkURL;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *splunkStateQueue;
  void *v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  id v23;
  void *v24;
  void *v25;
  NSURLSessionConfiguration *inProcessConfig;
  NSOperationQueue *inProcessOperationQueue;
  NSURLSession *inProcessSession;
  SUCoreEventReporterDelegate *reporterDelegate;
  uint64_t v30;
  NSString *storeToPath;
  uint64_t v32;
  void *persistedStatePath;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  SUCorePersistedState *v42;
  SUCorePersistedState *activeEventsState;
  SUCoreEvent *lastErrorEvent;
  NSMutableDictionary *eventExtensions;
  id onceIdleCompletion;
  void *v47;
  NSObject *v48;
  NSString *v49;
  __CFString *v50;
  objc_super v52;
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SUCoreEventReporter;
  v7 = -[SUCoreEventReporter init](&v52, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_13;
  awaitingRetry = v7->_awaitingRetry;
  v7->_awaitingRetry = 0;

  splunkURL = v8->_splunkURL;
  v8->_splunkURL = 0;

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SUCore sharedCore](SUCore, "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commonDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease((id)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@"), v13, CFSTR("core.splunk.state")));
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create(v15, v16);
  splunkStateQueue = v8->_splunkStateQueue;
  v8->_splunkStateQueue = (OS_dispatch_queue *)v17;

  if (!v8->_splunkStateQueue)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v20 = objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString commonDomain](v22, "commonDomain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("unable to create dispatch queue domain(%@.%@)"), v24, CFSTR("core.splunk.state"));
    -[NSObject trackError:forReason:withResult:withError:](v20, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] INIT"), v25, 8100, 0);

    goto LABEL_6;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oslog");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "commonDomain");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v22;
    v55 = 2114;
    v56 = CFSTR("core.splunk.state");
    _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)", buf, 0x16u);

LABEL_6:
  }

  inProcessConfig = v8->_inProcessConfig;
  v8->_inProcessConfig = 0;

  inProcessOperationQueue = v8->_inProcessOperationQueue;
  v8->_inProcessOperationQueue = 0;

  inProcessSession = v8->_inProcessSession;
  v8->_inProcessSession = 0;

  reporterDelegate = v8->_reporterDelegate;
  v8->_reporterDelegate = 0;

  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/RecorderSplunkRecords"));
    v30 = objc_claimAutoreleasedReturnValue();
    storeToPath = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v30;

    v8->_accessControl = a4;
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/EventReporterPersistedState"));
    v32 = objc_claimAutoreleasedReturnValue();
    persistedStatePath = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v32;
  }
  else
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "commonFilesystemBaseDir");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByAppendingPathComponent:", CFSTR("/RecorderSplunkRecords"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v36;

    v8->_accessControl = a4;
    +[SUCore sharedCore](SUCore, "sharedCore");
    persistedStatePath = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(persistedStatePath, "commonFilesystemBaseDir");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("/EventReporterPersistedState"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v39;

  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v8->_persistedStatePath, CFSTR("SUCoreEventReporterState.state"));
  v42 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]([SUCorePersistedState alloc], "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v8->_splunkStateQueue, v41, CFSTR("1.0"));
  activeEventsState = v8->_activeEventsState;
  v8->_activeEventsState = v42;

  lastErrorEvent = v8->_lastErrorEvent;
  v8->_lastErrorEvent = 0;

  *(_WORD *)&v8->_splunkAccessCreated = 0;
  eventExtensions = v8->_eventExtensions;
  v8->_eventExtensions = 0;

  v8->_activeSendTaskCount = 0;
  v8->_dropEventsOnSendFailure = 0;
  onceIdleCompletion = v8->_onceIdleCompletion;
  v8->_onceIdleCompletion = 0;

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "oslog");
  v48 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v8->_storeToPath;
    +[SUCoreEventReporter accessControlSummary:](SUCoreEventReporter, "accessControlSummary:", v8->_accessControl);
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v49;
    v55 = 2114;
    v56 = v50;
    _os_log_impl(&dword_1B05B8000, v48, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] INIT(v1.0) | storing to path: %{public}@, access control: %{public}@", buf, 0x16u);

  }
LABEL_13:

  return v8;
}

+ (void)augmentEvent:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_errorDomainAbbreviation:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = (__CFString *)v9;
    else
      v10 = CFSTR("NoDomain");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %ld"), v10, objc_msgSend(v7, "code"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v7);
    if (v11)
      objc_msgSend(v13, "setSafeObject:forKey:", v11, CFSTR("result"));
    if (v12)
      objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("failureReason"));
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
  }

}

+ (id)buildSplunkServerURLFromBase:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%d/%@"), v3, 2, CFSTR("psr_ota"));
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)accessControlSummary:(int64_t)a3
{
  char v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = CFSTR("Y");
  if ((v3 & 1) == 0)
    v5 = CFSTR("N");
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("|NVRAM Allowed:%@"), v5);
  objc_msgSend(&stru_1E611E1C8, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)eventForEventString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("purge")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightScan")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightDownload")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightPersonalize")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightFDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightWakeup")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("preflightPrerequisiteCheck")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("prepareStarted")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("prepareFinished")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("applyStarted")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("applyFinished")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CryptegraftStarted")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CryptegraftFinshed")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("updateFinished")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)sendEvent:(id)a3
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:](self, "sendEvent:toServerURL:returningFinalEventDictionary:", a3, 0, 0);
}

- (BOOL)sendEvent:(id)a3 returningFinalEventDictionary:(id *)a4
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:](self, "sendEvent:toServerURL:returningFinalEventDictionary:", a3, 0, a4);
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:](self, "sendEvent:toServerURL:returningFinalEventDictionary:", a3, a4, 0);
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4 returningFinalEventDictionary:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  char v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke;
  block[3] = &unk_1E611C1A8;
  block[4] = self;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = &v27;
  v20 = &v21;
  dispatch_sync(v11, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v14 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke(uint64_t a1)
{
  SUCoreEvent *v2;
  uint64_t v3;
  void *v4;
  SUCoreEvent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  SUCoreEvent *v13;

  objc_msgSend(*(id *)(a1 + 32), "_determineEventExtensions");
  v2 = [SUCoreEvent alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "eventExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreEvent initWithEventDictionary:extendingWith:reportingToServer:](v2, "initWithEventDictionary:extendingWith:reportingToServer:", v3, v4, *(_QWORD *)(a1 + 48));

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    -[SUCoreEvent allFields](v5, "allFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "splunkStateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2;
    v12[3] = &unk_1E611BF60;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    dispatch_async(v10, v12);

  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND"), CFSTR("failed to create core event from provided event information"), 8100, 0);

  }
}

uint64_t __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreEvent:", *(_QWORD *)(a1 + 40));
}

- (id)sendEventReturningAugmented:(id)a3 toServerURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke;
  v14[3] = &unk_1E611C1D0;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = &v18;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke(uint64_t a1)
{
  SUCoreEvent *v2;
  uint64_t v3;
  void *v4;
  SUCoreEvent *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  SUCoreEvent *v12;

  objc_msgSend(*(id *)(a1 + 32), "_determineEventExtensions");
  v2 = [SUCoreEvent alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "eventExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreEvent initWithEventDictionary:extendingWith:reportingToServer:](v2, "initWithEventDictionary:extendingWith:reportingToServer:", v3, v4, *(_QWORD *)(a1 + 48));

  if (v5)
  {
    -[SUCoreEvent getAugmentedEvent](v5, "getAugmentedEvent");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "splunkStateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2;
    v11[3] = &unk_1E611BF60;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    dispatch_async(v9, v11);

  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND_RETURNING_AUGMENTED"), CFSTR("failed to create core event from provided event information"), 8100, 0);

  }
}

uint64_t __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreEvent:", *(_QWORD *)(a1 + 40));
}

- (void)dropOnSendFailure:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SUCoreEventReporter_dropOnSendFailure___block_invoke;
  v6[3] = &unk_1E611C1F8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __41__SUCoreEventReporter_dropOnSendFailure___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "dropEventsOnSendFailure");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDropEventsOnSendFailure:", v3 != 0);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "dropEventsOnSendFailure");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1B05B8000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] CONFIG | dropEventsOnSendFailure=%{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)flushEvent
{
  NSObject *v3;
  _QWORD block[5];

  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreEventReporter_flushEvent__block_invoke;
  block[3] = &unk_1E611BF88;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __33__SUCoreEventReporter_flushEvent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_splunkAccessSetup");
  objc_msgSend(*(id *)(a1 + 32), "lastErrorEvent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "lastErrorEvent"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "changedSinceReported"),
        v4,
        v3,
        v5))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] FLUSH | sending last error event", buf, 2u);
    }

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "lastErrorEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sendCoreEvents:secondEvent:", v9, 0);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] FLUSH | sending first awaiting retry", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendFirstAwaitingRetry");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setLastErrorEvent:", 0);
}

- (int64_t)currentAccessControl
{
  NSObject *v3;
  NSObject *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SUCoreEventReporter_currentAccessControl__block_invoke;
  v7[3] = &unk_1E611BFB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __43__SUCoreEventReporter_currentAccessControl__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessControl");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)indicateOnceIdle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke;
  v7[3] = &unk_1E611C248;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "onceIdleCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildError:underlying:description:", 8117, 0, CFSTR("indicateOnceIdle completion when older completion in place - issuing error to older completion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "onceIdleCompletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOnceIdleCompletion:", 0);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2;
    v14 = &unk_1E611C220;
    v15 = v4;
    v16 = v5;
    v8 = v4;
    v9 = v5;
    dispatch_async(v7, &v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "setOnceIdleCompletion:", *(_QWORD *)(a1 + 40), v11, v12, v13, v14);
  return objc_msgSend(*(id *)(a1 + 32), "_checkWhetherIdle:", CFSTR("indicate once idle"));
}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_splunkAccessSetup
{
  NSObject *v3;
  void *v4;
  SUCoreEventReporterDelegate *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SUCoreEventReporter splunkAccessCreated](self, "splunkAccessCreated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUCoreEventReporterDelegate initWithReporter:]([SUCoreEventReporterDelegate alloc], "initWithReporter:", self);
    -[SUCoreEventReporter setReporterDelegate:](self, "setReporterDelegate:", v5);

    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter setInProcessConfig:](self, "setInProcessConfig:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[SUCoreEventReporter setInProcessOperationQueue:](self, "setInProcessOperationQueue:", v7);

    -[SUCoreEventReporter inProcessOperationQueue](self, "inProcessOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxConcurrentOperationCount:", 1);

    v9 = (void *)MEMORY[0x1E0CB39F0];
    -[SUCoreEventReporter inProcessConfig](self, "inProcessConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter reporterDelegate](self, "reporterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter inProcessOperationQueue](self, "inProcessOperationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionWithConfiguration:delegate:delegateQueue:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter setInProcessSession:](self, "setInProcessSession:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://xp.apple.com/report/2/psr_ota"));
    -[SUCoreEventReporter setSplunkURL:](self, "setSplunkURL:", v14);

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreEventReporter splunkURL](self, "splunkURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SETUP | default Splunk URL: %{public}@", buf, 0xCu);

    }
    -[SUCoreEventReporter storeToPath](self, "storeToPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v19 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v36);
    v20 = v36;

    if ((v19 & 1) == 0 && (!v20 || objc_msgSend(v20, "code") != 17))
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreEventReporter storeToPath](self, "storeToPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("failed to create store-to directory: %@"), v23);
      objc_msgSend(v21, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SETUP"), v24, objc_msgSend(v20, "code"), v20);

    }
    -[SUCoreEventReporter persistedStatePath](self, "persistedStatePath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v26 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v35);
    v27 = v35;

    if ((v26 & 1) == 0 && (!v27 || objc_msgSend(v27, "code") != 17))
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreEventReporter persistedStatePath](self, "persistedStatePath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("failed to create persisted-state directory: %@"), v30);
      objc_msgSend(v28, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SETUP"), v31, objc_msgSend(v27, "code"), v27);

    }
    -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "loadPersistedState");

    v33 = -[SUCoreEventReporter _newExistingFileUUIDs](self, "_newExistingFileUUIDs");
    -[SUCoreEventReporter _alignPersistedStateWithExistingFileUUIDs:](self, "_alignPersistedStateWithExistingFileUUIDs:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreEventReporter _synchronizeWithNSURLSessionExpecting:](self, "_synchronizeWithNSURLSessionExpecting:", v34);
    -[SUCoreEventReporter setSplunkAccessCreated:](self, "setSplunkAccessCreated:", 1);

  }
}

- (void)_determineEventExtensions
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *eventExtensions;
  void *v8;
  id v9;

  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SUCoreEventReporter eventExtensionsDetermined](self, "eventExtensionsDetermined"))
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UpdateMetrics"));
    objc_msgSend(v9, "stringForKey:", CFSTR("Context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 0;
    }
    else if ((-[SUCoreEventReporter accessControl](self, "accessControl") & 1) == 0
           || (-[SUCoreEventReporter _buildContextFromNVRAMBootArgs](self, "_buildContextFromNVRAMBootArgs"),
               (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_11:
      -[SUCoreEventReporter setEventExtensionsDetermined:](self, "setEventExtensionsDetermined:", 1);

      return;
    }
    v6 = (NSMutableDictionary *)objc_opt_new();
    eventExtensions = self->_eventExtensions;
    self->_eventExtensions = v6;

    if (v4)
      v8 = v4;
    else
      v8 = v5;
    -[NSMutableDictionary setSafeObject:forKey:](self->_eventExtensions, "setSafeObject:forKey:", v8, CFSTR("context"));

    goto LABEL_11;
  }
}

- (id)_buildContextFromNVRAMBootArgs
{
  NSObject *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  void *CFProperty;
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (!v3)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] BUILD"), CFSTR("unable to read NVRAM variables - unable to get registry entry for IODeviceTree:/options"), 8104, 0);

    return 0;
  }
  v4 = v3;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("boot-args"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  IOObjectRelease(v4);
  if (!CFProperty)
    goto LABEL_23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", CFProperty, 4);
    if (!v6)
      goto LABEL_23;
LABEL_9:
    v22 = v6;
    v23 = CFProperty;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (!v12)
          {
            if (objc_msgSend(v15, "count") == 2)
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("BATS_TESTPLAN_ID"));

              v12 = 0;
              if (v18)
              {
                v19 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("BATS_TESTPLAN_ID_%@"), v20);

              }
            }
            else
            {
              v12 = 0;
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    CFProperty = v23;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = CFProperty;
    goto LABEL_9;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] BUILD"), CFSTR("NVRAM boot-args exist but format unknown - ignored"), 8103, 0);

LABEL_23:
  v12 = 0;
LABEL_26:

  return v12;
}

- (void)_adoptLastErrorEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "allFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSafeObject:forKey:", CFSTR("false"), CFSTR("sameErrorSignature"));

  -[SUCoreEventReporter setLastErrorEvent:](self, "setLastErrorEvent:", v5);
}

- (void)_sendCoreEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter _splunkAccessSetup](self, "_splunkAccessSetup");
  objc_msgSend(v4, "allFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackLastReportedUUID:", v7);

  }
  if (objc_msgSend(v4, "isSuccess"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating successful operation]", buf, 2u);
    }

    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "changedSinceReported");

    if (v12)
    {
      -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[SUCoreEventReporter setLastErrorEvent:](self, "setLastErrorEvent:", 0);
    goto LABEL_25;
  }
  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B05B8000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating error when no last error]", v26, 2u);
    }

    -[SUCoreEventReporter _adoptLastErrorEvent:](self, "_adoptLastErrorEvent:", v4);
    goto LABEL_18;
  }
  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "isEqualErrorEvent:", v15);

  if (v16)
  {
    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "incrementErrorCount");

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | not sending event [event indicating error matching last reported]", v28, 2u);
    }

    v4 = 0;
LABEL_18:
    v13 = 0;
    goto LABEL_25;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1B05B8000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating error that is different than last reported]", v27, 2u);
  }

  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "changedSinceReported");

  if (v25)
  {
    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[SUCoreEventReporter _adoptLastErrorEvent:](self, "_adoptLastErrorEvent:", v4);
LABEL_25:
  -[SUCoreEventReporter _sendCoreEvents:secondEvent:](self, "_sendCoreEvents:secondEvent:", v13, v4);

}

- (void)_sendCoreEvents:(id)a3 secondEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[16];

  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_opt_new();
  if (v6 && v7)
  {
    objc_msgSend(v6, "reportedUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportedUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:](self, "_sendSplunkEvents:forEventUUID:toServerURL:", v9, v10, v11);
    v15 = (void *)objc_opt_new();

    objc_msgSend(v7, "allFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:](self, "_sendSplunkEvents:forEventUUID:toServerURL:", v15, v12, v13);
    v9 = v15;
    goto LABEL_9;
  }
  if (v6)
  {
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    v19 = v6;
LABEL_8:
    objc_msgSend(v19, "reportedUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:](self, "_sendSplunkEvents:forEventUUID:toServerURL:", v9, v21, v17);

    goto LABEL_9;
  }
  if (v7)
  {
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v20);

    v19 = v7;
    goto LABEL_8;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1B05B8000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | send events with nothing to send", v24, 2u);
  }

LABEL_9:
}

- (void)_sendSplunkEvents:(id)a3 forEventUUID:(id)a4 toServerURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = -[SUCoreEventReporter _newScrubbedEvents:](self, "_newScrubbedEvents:", v10);
  if (v8)
  {
    v13 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && v12
    && v13
    && v16
    && (-[SUCoreEventReporter inProcessSession](self, "inProcessSession"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    v33[0] = CFSTR("clientId");
    v33[1] = CFSTR("events");
    v34[0] = v13;
    v34[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getJSONDataFromPayload:withFileUUID:forEventUUID:](self, "_getJSONDataFromPayload:withFileUUID:forEventUUID:", v18, v16, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[SUCoreEventReporter _storeJSONData:withFileUUID:forEventUUID:](self, "_storeJSONData:withFileUUID:forEventUUID:", v19, v16, v13);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v26 = (void *)v20;
        objc_msgSend(v9, "dataRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreEventReporter _storeServerURLMetadata:toFileUUID:](self, "_storeServerURLMetadata:toFileUUID:", v21, v16);

        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "oslog");
        v23 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v13;
          v29 = 2114;
          v30 = v16;
          v31 = 2114;
          v32 = v18;
          _os_log_impl(&dword_1B05B8000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | sending [UUID: %{public}@] file: %{public}@ payload: %{public}@", buf, 0x20u);
        }

        -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:](self, "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:", v26, v16, v13, v9);
        +[SUCoreSplunkHistory logEventUUID:](SUCoreSplunkHistory, "logEventUUID:", v13);

      }
    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing required event resources [UUID: %@]"), v13);
    objc_msgSend(v24, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND"), v25, 8101, 0);

    v18 = 0;
    v19 = 0;
  }

}

- (void)_uploadFromFile:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5 toServerURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  SUCoreEventReporterActive *v17;
  SUCoreEventReporterActive *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = objc_retainAutorelease(v10);
  +[SUCore getFileMetadata:forKey:](SUCore, "getFileMetadata:forKey:", objc_msgSend(v15, "fileSystemRepresentation"), CFSTR("SUCoreEventReporterServerURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v11);
  v17 = (SUCoreEventReporterActive *)objc_claimAutoreleasedReturnValue();
  v35 = v15;
  if (v17)
  {
    v18 = v17;
    -[SUCoreEventReporterActive setAttemptedSendCount:](v17, "setAttemptedSendCount:", -[SUCoreEventReporterActive attemptedSendCount](v17, "attemptedSendCount") + 1);
    if (-[SUCoreEventReporterActive attemptedSendCount](v18, "attemptedSendCount") >= 9)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreEventReporterActive summary](v18, "summary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v11;
        v38 = 2114;
        v39 = v21;
        _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | dropping event with fileUUID:%{public}@ - too many send attempts | active:%{public}@", buf, 0x16u);

      }
      -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:](self, "_removeFileUUID:loggingError:forReason:", v11, 1, CFSTR("too many send attempts"));
      goto LABEL_20;
    }
  }
  else
  {
    v18 = -[SUCoreEventReporterActive initWithServerURL:]([SUCoreEventReporterActive alloc], "initWithServerURL:", v13);
    -[SUCoreEventReporterActive setAttemptedSendCount:](v18, "setAttemptedSendCount:", -[SUCoreEventReporterActive attemptedSendCount](v18, "attemptedSendCount") + 1);
  }
  -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v18, v11);
  v34 = v16;
  if (v16)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
    if (v22)
    {
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v22);
      if (v23)
        goto LABEL_13;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = v13;
LABEL_13:
  -[SUCoreEventReporter _getSplunkRequestForURL:](self, "_getSplunkRequestForURL:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    v33 = v13;
    v26 = v12;
    -[SUCoreEventReporter inProcessSession](self, "inProcessSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uploadTaskWithRequest:fromFile:", v25, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[SUCoreEventReporter _incrementActiveSendCount:](self, "_incrementActiveSendCount:", CFSTR("uploading"));
      objc_msgSend(v28, "setTaskDescription:", v11);
      objc_msgSend(v28, "resume");

      v12 = v26;
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create NSURL session task [UUID: %@] file: %@"), v26, v11);
      objc_msgSend(v31, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] QUEUED"), v32, 8101, 0);

      v12 = v26;
      -[SUCoreEventReporter _awaitRetryingFileUUID:](self, "_awaitRetryingFileUUID:", v11);

    }
    v13 = v33;
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create request to reach server [UUID: %@] file: %@"), v12, v11);
    objc_msgSend(v29, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] QUEUED"), v30, 8101, 0);

    -[SUCoreEventReporter _awaitRetryingFileUUID:](self, "_awaitRetryingFileUUID:", v11);
  }
  v16 = v34;
LABEL_20:

}

- (void)_sendInterruptedFromStorage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0C99E98];
          -[SUCoreEventReporter storeToPath](self, "storeToPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathComponent:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fileURLWithPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "oslog");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "summary");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v11;
            v28 = 2114;
            v29 = v19;
            _os_log_impl(&dword_1B05B8000, v18, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | retrying (recovered from storage), re-sending fileUUID:%{public}@ | active:%{public}@", buf, 0x16u);

          }
          -[SUCoreEventReporter splunkURL](self, "splunkURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:](self, "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:", v15, v11, 0, v20);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v8);
    }

    v4 = v21;
  }

}

- (void)_sendAllAwaitingRetry
{
  NSObject *v3;

  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  while (-[SUCoreEventReporter _sendFirstAwaitingRetry](self, "_sendFirstAwaitingRetry"))
    ;
}

- (BOOL)_sendFirstAwaitingRetry
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  _BYTE v24[18];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 67109376;
      *(_DWORD *)v24 = v11;
      *(_WORD *)&v24[4] = 2048;
      *(_QWORD *)&v24[6] = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | sending first awaiting retry - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)&v23, 0x12u);

    }
    if (v7)
    {
      v13 = (void *)MEMORY[0x1E0C99E98];
      -[SUCoreEventReporter storeToPath](self, "storeToPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "summary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        *(_QWORD *)v24 = v7;
        *(_WORD *)&v24[8] = 2114;
        *(_QWORD *)&v24[10] = v20;
        _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | retrying, re-sending fileUUID:%{public}@ | active:%{public}@", (uint8_t *)&v23, 0x16u);

      }
      -[SUCoreEventReporter splunkURL](self, "splunkURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:](self, "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:", v16, v7, 0, v21);

    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] UPLOADING"), CFSTR("unable to load fileUUID from awaiting retry array"), 8103, 0);
    }

  }
  return v5 != 0;
}

- (void)_awaitRetryingFileUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    -[SUCoreEventReporter setAwaitingRetry:](self, "setAwaitingRetry:", v7);

  }
  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 0x11)
  {
    do
    {
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectAtIndex:", 0);

      if (v12)
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("too many awaiting retry - not reporting file: %@"), v12);
        objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v15, 8108, 0);

        -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:](self, "_removeFileUUID:loggingError:forReason:", v12, 1, CFSTR("too many waiting retry"));
      }

      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v17 > 0x10);
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "oslog");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109376;
    v23 = v20;
    v24 = 2048;
    v25 = objc_msgSend(v21, "count");
    _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | awaiting retrying - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x12u);

  }
}

- (id)_newExistingFileUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to get existing files error: %@"), v6);
    objc_msgSend(v7, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SYNC"), v8, objc_msgSend(v6, "code"), v6);

  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    if (v9)
      goto LABEL_5;
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SYNC"), CFSTR("failed to copy existing files array"), 8105, 0);
  }

  v9 = 0;
LABEL_5:

  return v9;
}

- (void)_synchronizeWithNSURLSessionExpecting:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | getAllTasksWithCompletionHandler... | synchronizing with NSURLSession to determine in-flight events", buf, 2u);
  }

  -[SUCoreEventReporter inProcessSession](self, "inProcessSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke;
  v9[3] = &unk_1E611C298;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "getAllTasksWithCompletionHandler:", v9);

}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "splunkStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2;
  block[3] = &unk_1E611C270;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2(id *a1)
{
  id *v1;
  __CFString *v2;
  id v3;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  __CFString *v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  __int128 v33;
  NSObject *v34;
  __CFString *v35;
  uint8_t v36;
  char v37[15];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v1 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)objc_msgSend(a1[4], "copy");
  v3 = v1[5];
  v4 = 0x1E611B000uLL;
  if (v3 && objc_msgSend(v3, "count"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v1[5], "count");
      v8 = objc_msgSend(v1[5], "count");
      v9 = CFSTR("s");
      if (v8 == 1)
        v9 = &stru_1E611E1C8;
      *(_DWORD *)buf = 134218242;
      v43 = v7;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | %lu in-flight event%@", buf, 0x16u);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = v1[5];
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v39;
      *(_QWORD *)&v12 = 138543618;
      v33 = v12;
      v34 = v10;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "taskDescription", v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v1[6], "_activeEventForFileUUID:", v17);
            v18 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v1[4], "containsObject:", v17))
            {
              switch(objc_msgSend(v16, "state"))
              {
                case 0:
                  objc_msgSend(v1[6], "_synchonizeDiscoveredRunning:forActiveEvent:withFileUUIDsToRetry:", v16, v18, v2);
                  v19 = objc_claimAutoreleasedReturnValue();
                  break;
                case 1:
                  objc_msgSend(v1[6], "_synchonizeDiscoveredSuspended:forActiveEvent:withFileUUIDsToRetry:", v16, v18, v2);
                  v19 = objc_claimAutoreleasedReturnValue();
                  break;
                case 2:
                  objc_msgSend(v1[6], "_synchonizeDiscoveredCanceling:forActiveEvent:withFileUUIDsToRetry:", v16, v18, v2);
                  v19 = objc_claimAutoreleasedReturnValue();
                  break;
                case 3:
                  objc_msgSend(v1[6], "_synchonizeDiscoveredCompleted:forActiveEvent:withFileUUIDsToRetry:", v16, v18, v2);
                  v19 = objc_claimAutoreleasedReturnValue();
                  break;
                default:
                  objc_msgSend(v1[6], "_synchonizeDiscoveredUnknown:forActiveEvent:withFileUUIDsToRetry:", v16, v18, v2);
                  v19 = objc_claimAutoreleasedReturnValue();
                  break;
              }
              v22 = v2;
              v2 = (__CFString *)v19;
            }
            else
            {
              v21 = v1;
              v35 = v2;
              +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", objc_msgSend(v16, "state"));
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v23 = v4;
              objc_msgSend(*(id *)(v4 + 2624), "sharedLogger");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "oslog");
              v25 = objc_claimAutoreleasedReturnValue();

              v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
              if (v18)
              {
                if (v26)
                {
                  -[NSObject summary](v18, "summary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v43 = (uint64_t)v17;
                  v44 = 2114;
                  v45 = v22;
                  v46 = 2114;
                  v47 = v27;
                  _os_log_error_impl(&dword_1B05B8000, v25, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public}@ - no longer on the filesystem | active:%{public}@", buf, 0x20u);

                }
                objc_msgSend(v21[6], "_removeActiveEventForFileUUID:", v17);
              }
              else
              {
                if (v26)
                {
                  *(_DWORD *)buf = v33;
                  v43 = (uint64_t)v17;
                  v44 = 2114;
                  v45 = v22;
                  _os_log_error_impl(&dword_1B05B8000, v25, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public}@ - no longer on the filesystem", buf, 0x16u);
                }

              }
              v4 = v23;
              v1 = v21;
              v10 = v34;
              v2 = v35;
            }

          }
          else
          {
            objc_msgSend(*(id *)(v4 + 2624), "sharedLogger");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "oslog");
            v18 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1(&v36, v37, v18);
          }

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v13);
    }
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | no in-flight events", buf, 2u);
    }
  }

  if (v2 && -[__CFString count](v2, "count"))
  {
    objc_msgSend(*(id *)(v4 + 2624), "sharedLogger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "oslog");
    v30 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v30, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | retrying events discovered on the filesystem", buf, 2u);
    }

    objc_msgSend(v1[6], "_sendInterruptedFromStorage:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 2624), "sharedLogger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "oslog");
    v32 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v32, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | no events to retry", buf, 2u);
    }

  }
}

- (id)_synchonizeDiscoveredRunning:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "taskDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "state");

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v8, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - continuing | active:%{public}@", (uint8_t *)&v21, 0x20u);

    }
    objc_msgSend(v8, "setDiscoveredRunningCount:", objc_msgSend(v8, "discoveredRunningCount") + 1);
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v8, v12);
  }
  else
  {
    if (v17)
    {
      v21 = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }

    -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredSuspended:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "taskDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", objc_msgSend(v8, "state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v16)
    {
      objc_msgSend(v9, "summary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1B05B8000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - resuming | active:%{public}@", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v9, "setDiscoveredSuspendedCount:", objc_msgSend(v9, "discoveredSuspendedCount") + 1);
    objc_msgSend(v8, "resume");
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v9, v12);
  }
  else
  {
    if (v16)
    {
      v20 = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_1B05B8000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v20, 0x16u);
    }

    -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v18;
  }

  return v10;
}

- (id)_synchonizeDiscoveredCanceling:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "taskDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "state");

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v8, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - awaiting didCompleteWithError | active:%{public}@", (uint8_t *)&v21, 0x20u);

    }
    objc_msgSend(v8, "setDiscoveredCancelingCount:", objc_msgSend(v8, "discoveredCancelingCount") + 1);
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v8, v12);
  }
  else
  {
    if (v17)
    {
      v21 = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }

    -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredCompleted:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "taskDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", objc_msgSend(v8, "state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v9, "setFailedSendCount:", objc_msgSend(v9, "failedSendCount") + 1);
      v15 = objc_msgSend(v9, "failedSendCount");
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15 <= 7)
      {
        if (v18)
        {
          objc_msgSend(v9, "summary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543874;
          v30 = v12;
          v31 = 2114;
          v32 = v13;
          v33 = 2114;
          v34 = v19;
          _os_log_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - will retry | active:%{public}@", (uint8_t *)&v29, 0x20u);

        }
        -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v9, v12);
        goto LABEL_17;
      }
      if (v18)
      {
        objc_msgSend(v9, "summary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v12;
        v31 = 2114;
        v32 = v13;
        v33 = 2114;
        v34 = v26;
        _os_log_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - dropping | active:%{public}@", (uint8_t *)&v29, 0x20u);

      }
      -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v12);
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "summary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v12;
        v31 = 2114;
        v32 = v13;
        v33 = 2114;
        v34 = v25;
        _os_log_impl(&dword_1B05B8000, v24, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [SUCCESS] - considering done | active:%{public}@", (uint8_t *)&v29, 0x20u);

      }
    }
    -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);
    v27 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v27;
LABEL_17:

    goto LABEL_18;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "oslog");
  v21 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543618;
    v30 = v12;
    v31 = 2114;
    v32 = v13;
    _os_log_impl(&dword_1B05B8000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v29, 0x16u);
  }

  -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);
  v22 = objc_claimAutoreleasedReturnValue();

  -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:](self, "_removeFileUUID:loggingError:forReason:", v12, 1, CFSTR("synchonize discovered Completed"));
  v10 = (id)v22;
LABEL_18:

  return v10;
}

- (id)_synchonizeDiscoveredUnknown:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "taskDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "state");

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v8, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - dropping | active:%{public}@", (uint8_t *)&v21, 0x20u);

    }
    -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v12);
  }
  else
  {
    if (v17)
    {
      v21 = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }

  }
  -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_alignPersistedStateWithExistingFileUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = v4;
  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("ActiveEventsState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke;
  v19 = &unk_1E611C2C0;
  v10 = v6;
  v20 = v10;
  v21 = v9;
  v11 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v16);
  -[SUCoreEventReporter activeEventsState](self, "activeEventsState", v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistDictionary:forKey:", v11, CFSTR("ActiveEventsState"));

  v13 = v21;
  v14 = v10;

  return v14;
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v5;
    v8 = -[SUCoreEventReporterActive initFromArchivedData:]([SUCoreEventReporterActive alloc], "initFromArchivedData:", v6);
    v9 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        objc_msgSend(v8, "summary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v7;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - on filesystem and persisted | active:%{public}@", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setSafeObject:forKey:", v6, v7);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v8, "summary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v7;
        v20 = 2114;
        v21 = v17;
        _os_log_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - no longer on filesystem, dropping | active:%{public}@", (uint8_t *)&v18, 0x16u);

      }
    }

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1(v7, v15, v16);
  }

}

- (id)_removeFileUUID:(id)a3 fromFilesToRetry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v7;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count") && objc_msgSend(v10, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v12))
        break;

      if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_9;
    }
    objc_msgSend(v10, "removeObjectAtIndex:", v11);

  }
LABEL_9:

  return v10;
}

- (id)_activeEventForFileUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("ActiveEventsState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v7, "safeObjectForKey:ofClass:", v4, objc_opt_class()),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = -[SUCoreEventReporterActive initFromArchivedData:]([SUCoreEventReporterActive alloc], "initFromArchivedData:", v8);

    if (v10)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "summary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v4;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_1B05B8000, v12, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] ACTIVE | found active event for fileUUID:%{public}@ | activeEvent:%{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateActiveEvent:(id)a3 forFileUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryForKey:", CFSTR("ActiveEventsState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "toArchivedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSafeObject:forKey:", v12, v7);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistDictionary:forKey:", v11, CFSTR("ActiveEventsState"));

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "summary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_1B05B8000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] ACTIVE | updated active event for fileUUID:%{public}@ | activeEvent:%{public}@", (uint8_t *)&v17, 0x16u);

  }
}

- (void)_removeActiveEventForFileUUID:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("ActiveEventsState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    objc_msgSend(v7, "removeObjectForKey:", v9);
    -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistDictionary:forKey:", v7, CFSTR("ActiveEventsState"));

  }
}

- (id)_getSplunkServerURL:(id)a3
{
  void *v4;

  objc_msgSend(a3, "serverURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SUCoreEventReporter splunkURL](self, "splunkURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_getSplunkRequestForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_newScrubbedEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4 && (v5 = (void *)objc_opt_new()) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SUCoreEventReporter__newScrubbedEvents___block_invoke;
    v8[3] = &unk_1E611C2E8;
    v8[4] = self;
    v6 = v5;
    v9 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __42__SUCoreEventReporter__newScrubbedEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_copyEscapeStringsForEventData:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_copyEscapeStringsForEventData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  id v24;

  v3 = (void *)MEMORY[0x1E0CB3780];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("%\\"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v7);

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithRange:", 0, 127);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formIntersectionWithCharacterSet:", v9);

  objc_msgSend(v4, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsForKeys:notFoundMarker:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke;
  v22 = &unk_1E611C310;
  v23 = v13;
  v24 = v8;
  v14 = v8;
  v15 = v13;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v19);
  v16 = objc_alloc(MEMORY[0x1E0C99D80]);
  v17 = (void *)objc_msgSend(v16, "initWithObjects:forKeys:", v15, v10, v19, v20, v21, v22);

  return v17;
}

void __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  *a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v9);

  }
}

+ (id)_errorDomainAbbreviation:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors")) & 1) != 0)
  {
    v4 = CFSTR("SUS");
LABEL_15:

    goto LABEL_16;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("SUControllerError")) & 1) != 0)
  {
    v4 = CFSTR("SUC");
    goto LABEL_15;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("SUBError")) & 1) != 0)
  {
    v4 = CFSTR("SUB");
    goto LABEL_15;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("BridgeOSSoftwareUpdateError")) & 1) != 0)
  {
    v4 = CFSTR("BSU");
    goto LABEL_15;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("MobileSoftwareUpdateErrorDomain")) & 1) != 0)
  {
    v4 = CFSTR("MSU");
    goto LABEL_15;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("ASError")) & 1) != 0)
  {
    v4 = CFSTR("AS");
    goto LABEL_15;
  }
  v4 = v3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("MobileAssetError")))
  {
    v4 = CFSTR("MA");
    goto LABEL_15;
  }
LABEL_16:

  return v4;
}

- (id)_getJSONDataFromPayload:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v7))
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (!v10)
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to serialize data into JSON [UUID: %@] file: %@"), v9, v8);
      if (v11)
        v14 = objc_msgSend(v11, "code");
      else
        v14 = 8106;
      objc_msgSend(v12, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v13, v14, v11);

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("encountered invalid JSON payload [UUID: %@] file: %@"), v9, v8);
    objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v16, 8107, 0);

    v10 = 0;
  }

  return v10;
}

- (id)_storeJSONData:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1E0C99E98];
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v25 = 0;
    v16 = objc_msgSend(v8, "writeToURL:options:error:", v15, 1, &v25);
    v17 = v25;
    v18 = v17;
    if (!v16 || v17)
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to write JSON data to file [UUID: %@] file: %@"), v10, v9);
      if (v18)
        v21 = objc_msgSend(v18, "code");
      else
        v21 = 8109;
      objc_msgSend(v19, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v20, v21, v18);

      -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:](self, "_removeFileUUID:loggingError:forReason:", v9, 0, CFSTR("failed to write JSON data"));
      v15 = 0;
    }

  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to form JSON data file [UUID: %@] file: %@"), v10, v9);
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v23, 8100, 0);

    v15 = 0;
  }

  return v15;
}

- (BOOL)_storeServerURLMetadata:(id)a3 toFileUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1E0C99E98];
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to create file: %@ for attaching of serverURL metadata"), v7);
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v15, 8100, 0);
    v13 = 0;
    goto LABEL_5;
  }
  v13 = +[SUCore setFileMetadata:forKey:value:](SUCore, "setFileMetadata:forKey:value:", objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"), CFSTR("SUCoreEventReporterServerURL"), v6);
  if (!v13)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to add serverURL metadata to file: %@"), v7);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] DROP"), v15, 8109, 0);
LABEL_5:

  }
  return v13;
}

- (void)_removeFileUUID:(id)a3 loggingError:(BOOL)a4 forReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v14 = objc_msgSend(v13, "removeItemAtPath:error:", v12, &v19);
  v15 = v19;

  if ((v14 & 1) == 0 && v6)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ - could not remove event file: %@"), v9, v12);
    if (v15)
      v18 = objc_msgSend(v15, "code");
    else
      v18 = 8110;
    objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] REMOVE"), v17, v18, v15);

  }
  -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v8);

}

- (void)_incrementActiveSendCount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") <= 127)
  {
    -[SUCoreEventReporter setActiveSendTaskCount:](self, "setActiveSendTaskCount:", -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") + 1);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v4;
      v12 = 1024;
      v13 = v8;
      v14 = 2048;
      v15 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | %{public}@ - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)&v10, 0x1Cu);

    }
  }

}

- (void)_decrementActiveSendCount
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") >= 1)
  {
    -[SUCoreEventReporter setActiveSendTaskCount:](self, "setActiveSendTaskCount:", -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") - 1);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109376;
      v8[1] = v6;
      v9 = 2048;
      v10 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1B05B8000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | decrement active - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)v8, 0x12u);

    }
  }
}

- (void)_checkWhetherIdle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount"))
  {
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {

    }
    else
    {
      -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "oslog");
        v14 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
          -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v23 = v4;
          v24 = 1024;
          v25 = v15;
          v26 = 2048;
          v27 = objc_msgSend(v16, "count");
          _os_log_impl(&dword_1B05B8000, v14, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | now idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x1Cu);

        }
        -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreEventReporter setOnceIdleCompletion:](self, "setOnceIdleCompletion:", 0);
        +[SUCore sharedCore](SUCore, "sharedCore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "completionQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__SUCoreEventReporter__checkWhetherIdle___block_invoke;
        block[3] = &unk_1E611C338;
        v21 = v17;
        v9 = v17;
        dispatch_async(v19, block);

        goto LABEL_11;
      }
    }
  }
  -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v4;
      v24 = 1024;
      v25 = v10;
      v26 = 2048;
      v27 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | not idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x1Cu);

    }
LABEL_11:

  }
}

uint64_t __41__SUCoreEventReporter__checkWhetherIdle___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleSendFinishedWithFileUUID:(id)a3 sendSucceeded:(BOOL)a4 withStatusCode:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke;
  block[3] = &unk_1E611C360;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

uint64_t __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_decrementActiveSendCount");
  if (!*(_QWORD *)(a1 + 40))
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = CFSTR("succeeded");
    if (!*(_BYTE *)(a1 + 64))
      v9 = CFSTR("failed");
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("callback [send %@ (status=%ld)] without file UUID - event file may be left on filesystem"), v9, *(_QWORD *)(a1 + 56));
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      v12 = objc_msgSend(v11, "code");
      v13 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v13 = 0;
      v12 = *(_QWORD *)(a1 + 56);
    }
    objc_msgSend(v7, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND_FINISHED"), v10, v12, v13);

    goto LABEL_35;
  }
  v2 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 64))
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to send event (status=%ld) validated file: %@"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    if (v2)
    {
      v16 = objc_msgSend(*(id *)(a1 + 48), "code");
      v17 = *(_QWORD *)(a1 + 48);
      v18 = v14;
      v19 = v15;
    }
    else
    {
      v18 = v14;
      v19 = v15;
      v16 = 8202;
      v17 = 0;
    }
    objc_msgSend(v18, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND_FINISHED"), v19, v16, v17);

    objc_msgSend(*(id *)(a1 + 32), "_activeEventForFileUUID:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "dropEventsOnSendFailure"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "summary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v30;
        v46 = 2114;
        v47 = v31;
        _os_log_impl(&dword_1B05B8000, v29, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (dropped) | active:%{public}@", buf, 0x16u);

      }
      v32 = *(void **)(a1 + 32);
      v33 = *(_QWORD *)(a1 + 40);
      v34 = CFSTR("dropping on failed send");
    }
    else
    {
      objc_msgSend(v7, "setFailedSendCount:", objc_msgSend(v7, "failedSendCount") + 1);
      v35 = objc_msgSend(v7, "failedSendCount");
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "oslog");
      v37 = objc_claimAutoreleasedReturnValue();

      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v35 <= 7)
      {
        if (v38)
        {
          v39 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v7, "summary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v39;
          v46 = 2114;
          v47 = v40;
          _os_log_impl(&dword_1B05B8000, v37, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (will retry) | active:%{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_updateActiveEvent:forFileUUID:", v7, *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "_awaitRetryingFileUUID:", *(_QWORD *)(a1 + 40));
        goto LABEL_35;
      }
      if (v38)
      {
        v41 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "summary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v41;
        v46 = 2114;
        v47 = v42;
        _os_log_impl(&dword_1B05B8000, v37, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (max retries) | active:%{public}@", buf, 0x16u);

      }
      v32 = *(void **)(a1 + 32);
      v33 = *(_QWORD *)(a1 + 40);
      v34 = CFSTR("dropping on failed send (max retries)");
    }
    objc_msgSend(v32, "_removeFileUUID:loggingError:forReason:", v33, 1, v34);
    objc_msgSend(*(id *)(a1 + 32), "_sendFirstAwaitingRetry");
LABEL_35:

    return objc_msgSend(*(id *)(a1 + 32), "_checkWhetherIdle:", CFSTR("send finished"));
  }
  if (!v2 && *(_QWORD *)(a1 + 56) == 200)
    goto LABEL_19;
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = objc_msgSend(v4, "code");
    v6 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    v6 = 0;
    v5 = *(_QWORD *)(a1 + 56);
  }
  objc_msgSend(v3, "trackAnomaly:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND_FINISHED"), CFSTR("callback where send considered successful yet may not have been [completely sent]"), v5, v6);

  if (*(_QWORD *)(a1 + 48))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v45 = v22;
      v46 = 2114;
      v47 = v23;
      v48 = 2114;
      v49 = v24;
      _os_log_impl(&dword_1B05B8000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | SUCCESS (with error) | sent event (status=%ld) validated file: %{public}@, error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
LABEL_19:
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 56);
      v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v45 = v26;
      v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_1B05B8000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | SUCCESS | sent event (status=%ld) validated file: %{public}@", buf, 0x16u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_removeFileUUID:loggingError:forReason:", *(_QWORD *)(a1 + 40), 1, CFSTR("send finished"));
  objc_msgSend(*(id *)(a1 + 32), "_sendAllAwaitingRetry");
  return objc_msgSend(*(id *)(a1 + 32), "_checkWhetherIdle:", CFSTR("send finished"));
}

- (void)handleSendFinishedInvalidFileUUID:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SUCoreEventReporter *v14;

  v6 = a3;
  v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke;
  block[3] = &unk_1E611C270;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("send callback fileUUID invalid (%@) - event file may be left on filesystem"), *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = objc_msgSend(v4, "code");
    v6 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v6 = 0;
    v5 = 8204;
  }
  objc_msgSend(v2, "trackError:forReason:withResult:withError:", CFSTR("[EVENT_REPORTER] SEND_FINISHED"), v3, v5, v6);

  objc_msgSend(*(id *)(a1 + 48), "_decrementActiveSendCount");
  return objc_msgSend(*(id *)(a1 + 48), "_checkWhetherIdle:", CFSTR("send finished with invalid file UUID"));
}

+ (id)_nsURLSessionTaskNameForState:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return off_1E611C380[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSURLSessionTaskState(%d)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)awaitingRetry
{
  return self->_awaitingRetry;
}

- (void)setAwaitingRetry:(id)a3
{
  objc_storeStrong((id *)&self->_awaitingRetry, a3);
}

- (NSURL)splunkURL
{
  return self->_splunkURL;
}

- (void)setSplunkURL:(id)a3
{
  objc_storeStrong((id *)&self->_splunkURL, a3);
}

- (OS_dispatch_queue)splunkStateQueue
{
  return self->_splunkStateQueue;
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessConfig, a3);
}

- (NSOperationQueue)inProcessOperationQueue
{
  return self->_inProcessOperationQueue;
}

- (void)setInProcessOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessOperationQueue, a3);
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessSession, a3);
}

- (SUCoreEventReporterDelegate)reporterDelegate
{
  return self->_reporterDelegate;
}

- (void)setReporterDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_reporterDelegate, a3);
}

- (NSString)storeToPath
{
  return self->_storeToPath;
}

- (void)setStoreToPath:(id)a3
{
  objc_storeStrong((id *)&self->_storeToPath, a3);
}

- (NSString)persistedStatePath
{
  return self->_persistedStatePath;
}

- (void)setPersistedStatePath:(id)a3
{
  objc_storeStrong((id *)&self->_persistedStatePath, a3);
}

- (int64_t)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(int64_t)a3
{
  self->_accessControl = a3;
}

- (SUCorePersistedState)activeEventsState
{
  return self->_activeEventsState;
}

- (void)setActiveEventsState:(id)a3
{
  objc_storeStrong((id *)&self->_activeEventsState, a3);
}

- (SUCoreEvent)lastErrorEvent
{
  return self->_lastErrorEvent;
}

- (void)setLastErrorEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastErrorEvent, a3);
}

- (BOOL)splunkAccessCreated
{
  return self->_splunkAccessCreated;
}

- (void)setSplunkAccessCreated:(BOOL)a3
{
  self->_splunkAccessCreated = a3;
}

- (BOOL)eventExtensionsDetermined
{
  return self->_eventExtensionsDetermined;
}

- (void)setEventExtensionsDetermined:(BOOL)a3
{
  self->_eventExtensionsDetermined = a3;
}

- (NSMutableDictionary)eventExtensions
{
  return self->_eventExtensions;
}

- (void)setEventExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_eventExtensions, a3);
}

- (int)activeSendTaskCount
{
  return self->_activeSendTaskCount;
}

- (void)setActiveSendTaskCount:(int)a3
{
  self->_activeSendTaskCount = a3;
}

- (BOOL)dropEventsOnSendFailure
{
  return self->_dropEventsOnSendFailure;
}

- (void)setDropEventsOnSendFailure:(BOOL)a3
{
  self->_dropEventsOnSendFailure = a3;
}

- (id)onceIdleCompletion
{
  return self->_onceIdleCompletion;
}

- (void)setOnceIdleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onceIdleCompletion, 0);
  objc_storeStrong((id *)&self->_eventExtensions, 0);
  objc_storeStrong((id *)&self->_lastErrorEvent, 0);
  objc_storeStrong((id *)&self->_activeEventsState, 0);
  objc_storeStrong((id *)&self->_persistedStatePath, 0);
  objc_storeStrong((id *)&self->_storeToPath, 0);
  objc_storeStrong((id *)&self->_reporterDelegate, 0);
  objc_storeStrong((id *)&self->_inProcessSession, 0);
  objc_storeStrong((id *)&self->_inProcessOperationQueue, 0);
  objc_storeStrong((id *)&self->_inProcessConfig, 0);
  objc_storeStrong((id *)&self->_splunkStateQueue, 0);
  objc_storeStrong((id *)&self->_splunkURL, 0);
  objc_storeStrong((id *)&self->_awaitingRetry, 0);
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_1B05B8000, a3, (uint64_t)a3, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task without appropriate description", a1);
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1B05B8000, a1, a3, "[EVENT_REPORTER] SYNCHRONIZING | aligning encountered invalid key=value, dropped", v3);
}

@end
