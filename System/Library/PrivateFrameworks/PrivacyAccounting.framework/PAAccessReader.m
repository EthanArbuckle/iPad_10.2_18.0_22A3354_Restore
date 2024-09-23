@implementation PAAccessReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_instance_2;
}

void __32__PAAccessReader_sharedInstance__block_invoke()
{
  PAAccessReader *v0;
  void *v1;

  v0 = -[PAAccessReader initWithQueue:]([PAAccessReader alloc], "initWithQueue:", 0);
  v1 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v0;

}

- (PAAccessReader)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  PAAccessReader *v6;
  PAAccessReader *v7;

  v4 = a3;
  if (_os_feature_enabled_impl())
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.privacyaccountingd"), 4096);
  else
    v5 = 0;
  v6 = -[PAAccessReader initWithConnection:queue:](self, "initWithConnection:queue:", v5, v4);
  v7 = v6;
  if (v6)
    -[NSXPCConnection resume](v6->_connection, "resume");

  return v7;
}

- (BOOL)loggingEnabled
{
  PAAccessReader *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[PAAccessReader lockedEnsureSandboxExtensionWithError:](v2, "lockedEnsureSandboxExtensionWithError:", 0);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PAAccessReader setEnabledStateForLoggingEnabled:](self, "setEnabledStateForLoggingEnabled:");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoggingEnabled:", v3);

}

+ (id)fileNameForExport
{
  void *v2;
  const __CFAllocator *v3;
  __CFDateFormatter *v4;
  CFAbsoluteTime Current;
  __CFString *StringWithAbsoluteTime;
  void *v7;

  if (fileNameForExport_onceToken[0] != -1)
    dispatch_once(fileNameForExport_onceToken, &__block_literal_global_19);
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = (__CFDateFormatter *)fileNameForExport_formatter;
  Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v3, v4, Current);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("App_Privacy_Report_v%ld_%@.ndjson"), 4, StringWithAbsoluteTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __35__PAAccessReader_fileNameForExport__block_invoke()
{
  fileNameForExport_formatter = (uint64_t)CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFDateFormatterSetFormat((CFDateFormatterRef)fileNameForExport_formatter, CFSTR("yyyy-MM-dd'T'HH_mm_ss"));
}

+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "exportFromPublisher:toStream:withCancellationToken:error:", a3, a4, 0, a5);
}

+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 withCancellationToken:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke;
  v33[3] = &unk_1E4FA5010;
  v34 = v13;
  v25 = v14;
  v26 = 3221225472;
  v27 = __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_28;
  v28 = &unk_1E4FA5038;
  v15 = v11;
  v29 = v15;
  v16 = v34;
  v30 = v16;
  v17 = v12;
  v31 = v17;
  v18 = v10;
  v32 = v18;
  v19 = (id)objc_msgSend(v9, "sinkWithCompletion:shouldContinue:", v33, &v25);
  v20 = objc_msgSend(v16, "count", v25, v26, v27, v28);
  if (a6 && v20)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2F70];
    v36[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 13, v22);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = objc_msgSend(v16, "count") == 0;

  return v23;
}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    logger_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_cold_1(v3, v4);

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

BOOL __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v30;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85B5DA4]();
  if (objc_msgSend(*(id *)(a1 + 32), "cancelled"))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 15, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v3, "timestamp");
    v12 = v11;
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timestampAdjustment");
    v15 = v12 + v14;
    v16 = *(id *)(a1 + 48);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setFormatOptions:", 3955);
    objc_msgSend(v17, "setTimeZone:", v16);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("timeStamp"));
    v20 = *(void **)(a1 + 56);
    v30 = 0;
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 2, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22
      && (v24 = objc_retainAutorelease(v22),
          v25 = v21,
          LODWORD(v24) = writeBytesToStream(v25, objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"), &v30),
          v25,
          (_DWORD)v24))
    {
      v26 = v25;
      v7 = writeBytesToStream(v26, objc_msgSend(CFSTR("\n"), "UTF8String"), objc_msgSend(CFSTR("\n"), "lengthOfBytesUsingEncoding:", 4), &v30);

    }
    else
    {
      v7 = 0;
    }

    v27 = v30;
    if (!v7)
    {
      logger_0();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_28_cold_1((uint64_t)v10, (uint64_t)v27, v28);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v27);
    }

  }
  objc_autoreleasePoolPop(v4);

  return v7;
}

- (id)publisherForReportWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() + -604800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAAccessReader publisherForAllSince:until:reversed:error:](self, "publisherForAllSince:until:reversed:error:", v5, 0, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PAAccessPublisherPipelines accessPublisherWithoutOutOfProcessPickerAccesses:](PAAccessPublisherPipelines, "accessPublisherWithoutOutOfProcessPickerAccesses:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[PAAccessPublisherPipelines accessPublisherWithoutUnknownCategoryAccesses:](PAAccessPublisherPipelines, "accessPublisherWithoutUnknownCategoryAccesses:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PAAccessPublisherPipelines accessPublisherWithoutHiddenOrMissingApps:](PAAccessPublisherPipelines, "accessPublisherWithoutHiddenOrMissingApps:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PAAccessPublisherPipelines accessRecordsFromPublisher:reversed:](PAAccessPublisherPipelines, "accessRecordsFromPublisher:reversed:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)publisherForAll
{
  return -[PAAccessReader publisherForAllSince:error:](self, "publisherForAllSince:error:", 0, 0.0);
}

- (id)publisherForAllSince:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAAccessReader publisherForAllSince:until:reversed:error:](self, "publisherForAllSince:until:reversed:error:", v6, 0, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)publisherForAllSince:(id)a3 until:(id)a4 reversed:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  id v26;
  id v27;
  _QWORD v28[4];
  BOOL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[PAAccessReader getOrCreateStreamsWithError:](self, "getOrCreateStreamsWithError:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v26 = v11;
    v27 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      if (v7)
        v19 = v11;
      else
        v19 = v27;
      if (v7)
        v20 = v27;
      else
        v20 = v11;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v19, v20, 0, 0, v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

    v23 = objc_alloc(MEMORY[0x1E0D02468]);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __60__PAAccessReader_publisherForAllSince_until_reversed_error___block_invoke;
    v28[3] = &__block_descriptor_33_e39_q24__0__BMStoreEvent_8__BMStoreEvent_16l;
    v29 = v7;
    v24 = (void *)objc_msgSend(v23, "initWithPublishers:comparator:", v14, v28);

    v11 = v26;
    v10 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __60__PAAccessReader_publisherForAllSince_until_reversed_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "timestamp");
  v8 = v7;
  objc_msgSend(v6, "timestamp");
  if (v8 <= v9)
  {
    objc_msgSend(v5, "timestamp");
    v13 = v12;
    objc_msgSend(v6, "timestamp");
    if (v13 >= v14)
    {
      v15 = 0;
      goto LABEL_9;
    }
    v10 = *(_BYTE *)(a1 + 32) == 0;
    v11 = -1;
  }
  else
  {
    v10 = *(_BYTE *)(a1 + 32) == 0;
    v11 = 1;
  }
  if (v10)
    v15 = v11;
  else
    v15 = -v11;
LABEL_9:

  return v15;
}

- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4
{
  return -[PAAccessReader initWithConnection:queue:enablementChangedNotificationName:](self, "initWithConnection:queue:enablementChangedNotificationName:", a3, a4, CFSTR("com.apple.PrivacyAccounting.toggled"));
}

- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5
{
  id v9;
  dispatch_queue_t v10;
  PAAccessReader *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  NSObject *queue;
  int *p_enablementChangedNotificationToken;
  uint32_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v25;
  _QWORD handler[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (dispatch_queue_t)a4;
  v25 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PAAccessReader;
  v11 = -[PAAccessReader init](&v31, sel_init);
  if (v11)
  {
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v10)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(21, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create_with_target_V2("com.apple.privacyaccounting.PAAccessReader", v12, v13);

    }
    objc_storeStrong((id *)&v11->_queue, v10);
    objc_msgSend(v9, "_setQueue:", v11->_queue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE80FD48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRemoteObjectInterface:", v14);
    objc_initWeak(&location, v11);
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke;
    v28[3] = &unk_1E4FA4C50;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v28);
    objc_storeStrong((id *)&v11->_connection, a3);
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_enabledState = 0;
    v16 = objc_retainAutorelease(v25);
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    queue = v11->_queue;
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke_101;
    handler[3] = &unk_1E4FA4FC0;
    objc_copyWeak(&v27, &location);
    p_enablementChangedNotificationToken = &v11->_enablementChangedNotificationToken;
    v20 = notify_register_dispatch(v17, &v11->_enablementChangedNotificationToken, queue, handler);
    logger_0();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PAAccessReader initWithConnection:queue:enablementChangedNotificationName:].cold.1((uint64_t)v16, v20, v22);

      *p_enablementChangedNotificationToken = -1;
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = *p_enablementChangedNotificationToken;
        *(_DWORD *)buf = 138543618;
        v33 = v16;
        v34 = 1024;
        v35 = v23;
        _os_log_impl(&dword_1A5DE1000, v22, OS_LOG_TYPE_INFO, "Registered for %{public}@ notifications with token=%d", buf, 0x12u);
      }

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  logger_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A5DE1000, v2, OS_LOG_TYPE_INFO, "XPC connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEnabledStateForLoggingEnabled:", 0);

}

void __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke_101(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  logger_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1A5DE1000, v4, OS_LOG_TYPE_INFO, "Received enablement changed notification with token=%d", (uint8_t *)v6, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleEnabledChangeNotification");

}

- (void)handleEnabledChangeNotification
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PAAccessReader_handleEnabledChangeNotification__block_invoke;
  v4[3] = &unk_1E4FA5080;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "loggingEnabledWithReply:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__PAAccessReader_handleEnabledChangeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEnabledStateForLoggingEnabled:", a2);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  notify_cancel(self->_enablementChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PAAccessReader;
  -[PAAccessReader dealloc](&v3, sel_dealloc);
}

- (id)requestSandboxExtensionWithError:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  connection = self->_connection;
  if (connection)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v5 = MEMORY[0x1E0C809B0];
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke;
    v10[3] = &unk_1E4FA50A8;
    v10[4] = &v11;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke_2;
    v9[3] = &unk_1E4FA50D0;
    v9[4] = &v11;
    v9[5] = &v17;
    objc_msgSend(v6, "requestSandboxExtensionForStoreBasePathWithReply:", v9);

    if (a3)
      *a3 = objc_retainAutorelease((id)v12[5]);
    v7 = (id)v18[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 1, 0);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  PAAccessReaderSandboxExtension *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    v11 = [PAAccessReaderSandboxExtension alloc];
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v12 + 40);
    v13 = -[PAAccessReaderSandboxExtension initWithToken:forPath:error:](v11, "initWithToken:forPath:error:", v9, v10, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (id)getOrCreateStreamsWithError:(id *)a3
{
  NSArray *streams;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *p_streams;
  NSArray *v22;
  os_unfair_lock_t lock;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[PAAccessReader lockedEnsureSandboxExtensionWithError:](self, "lockedEnsureSandboxExtensionWithError:", a3))
  {
    streams = self->_streams;
    if (streams)
    {
      v6 = streams;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0D024C0];
      -[PAAccessReaderSandboxExtension path](self->_sandboxExtension, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "newPrivateStreamDefaultConfigurationWithStoreBasePath:protectionClass:", v8, 2);

      +[PAAccess allAccessClasses](PAAccess, "allAccessClasses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
            v17 = objc_alloc(MEMORY[0x1E0D02790]);
            objc_msgSend(v16, "eventStreamIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v17, "initWithPrivateStreamIdentifier:storeConfig:", v18, v9);

            objc_msgSend(v11, "addObject:", v19);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v20 = objc_msgSend(v11, "copy");
      v22 = self->_streams;
      p_streams = (id *)&self->_streams;
      *p_streams = (id)v20;

      v6 = (NSArray *)*p_streams;
    }
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(lock);
  return v6;
}

- (void)setEnabledStateForLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PAAccessReader lockedSetEnabledStateForLoggingEnabled:](self, "lockedSetEnabledStateForLoggingEnabled:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3
{
  void *v5;
  char v6;
  NSObject *queue;
  _QWORD block[4];
  id v9;
  BOOL v10;
  id location;

  os_unfair_lock_assert_owner(&self->_lock);
  -[PAAccessReader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PAAccessReader_lockedNotifyDidSetLoggingEnabled___block_invoke;
    block[3] = &unk_1E4FA4F70;
    objc_copyWeak(&v9, &location);
    v10 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __51__PAAccessReader_lockedNotifyDidSetLoggingEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reader:didSetLoggingEnabled:", WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

- (void)exportToFileHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, void *);
  NSXPCConnection *connection;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PAAccessReader_exportToFileHandle_completion___block_invoke;
  aBlock[3] = &unk_1E4FA4C98;
  v8 = v7;
  v13 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exportToFileHandle:reply:", v6, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11);
  }

}

uint64_t __48__PAAccessReader_exportToFileHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)lockedEnsureSandboxExtensionWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v17;
  id v18;

  os_unfair_lock_assert_owner(&self->_lock);
  -[PAAccessReader lockedAssertValidEnabledState](self, "lockedAssertValidEnabledState");
  switch(self->_enabledState)
  {
    case 0:
      v18 = 0;
      -[PAAccessReader requestSandboxExtensionWithError:](self, "requestSandboxExtensionWithError:", &v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v18;
      v7 = v6;
      v8 = v5 != 0;
      if (v5)
        goto LABEL_9;
      v9 = v6;
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PAErrorDomain")) & 1) != 0)
      {
        if (objc_msgSend(v9, "code") == 2)
        {

LABEL_21:
          v15 = 3;
LABEL_23:
          self->_enabledState = v15;
          goto LABEL_24;
        }
        v14 = objc_msgSend(v9, "code");

        if (v14 == 9)
          goto LABEL_21;
      }
      else
      {

      }
      v15 = 1;
      goto LABEL_23;
    case 1:
      goto LABEL_8;
    case 2:
      if (self->_sandboxExtension)
        return 1;
LABEL_8:
      v17 = 0;
      -[PAAccessReader requestSandboxExtensionWithError:](self, "requestSandboxExtensionWithError:", &v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v7 = v11;
      v8 = v5 != 0;
      if (v5)
      {
LABEL_9:
        -[PAAccessReader lockedSetEnabledStateForLoggingEnabled:](self, "lockedSetEnabledStateForLoggingEnabled:", 1);
        objc_storeStrong((id *)&self->_sandboxExtension, v5);
        goto LABEL_26;
      }
      v9 = v11;
      objc_msgSend(v9, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PAErrorDomain")) & 1) == 0)
      {

        goto LABEL_24;
      }
      if (objc_msgSend(v9, "code") == 2)
      {

      }
      else
      {
        v13 = objc_msgSend(v9, "code");

        if (v13 != 9)
          goto LABEL_24;
      }
      -[PAAccessReader lockedSetEnabledStateForLoggingEnabled:](self, "lockedSetEnabledStateForLoggingEnabled:", 0);
LABEL_24:
      if (a3)
        *a3 = objc_retainAutorelease(v9);
LABEL_26:

      return v8;
    case 3:
      if (!a3)
        return 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 2, 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v8;
    default:
      return 0;
  }
}

- (void)lockedSetEnabledStateForLoggingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PAAccessReader *v5;
  uint64_t v6;
  char v7;
  PAAccessReaderSandboxExtension *sandboxExtension;
  NSArray *streams;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PAAccessReader lockedAssertValidEnabledState](self, "lockedAssertValidEnabledState");
  switch(self->_enabledState)
  {
    case 0:
      if (v3)
        v7 = 2;
      else
        v7 = 3;
      self->_enabledState = v7;
      break;
    case 1:
    case 3:
      if (v3)
      {
        self->_enabledState = 2;
        v5 = self;
        v6 = 1;
        goto LABEL_11;
      }
      break;
    case 2:
      if (!v3)
      {
        self->_enabledState = 3;
        sandboxExtension = self->_sandboxExtension;
        self->_sandboxExtension = 0;

        streams = self->_streams;
        self->_streams = 0;

        v5 = self;
        v6 = 0;
LABEL_11:
        -[PAAccessReader lockedNotifyDidSetLoggingEnabled:](v5, "lockedNotifyDidSetLoggingEnabled:", v6);
      }
      break;
    default:
      return;
  }
}

- (PAAccessReaderDelegate)delegate
{
  return (PAAccessReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
}

- (id)_accessRecordsForReportFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  void (*v15)(_BYTE *, uint64_t);
  _BYTE v17[16];

  v5 = sub_1A5DFF884();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = &v17[-v12];
  sub_1A5DFF878();
  sub_1A5DFF878();
  v14 = (void *)sub_1A5DFCC94((uint64_t)v13, (uint64_t)v10);
  v15 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v15(v10, v5);
  v15(v13, v5);
  return v14;
}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A5DE1000, a2, OS_LOG_TYPE_ERROR, "Export publisher completed with error=%{public}@", (uint8_t *)&v4, 0xCu);

}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_28_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1A5DE1000, log, OS_LOG_TYPE_ERROR, "Failed to export entry=%@ with error=%{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithConnection:(uint64_t)a1 queue:(int)a2 enablementChangedNotificationName:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A5DE1000, log, OS_LOG_TYPE_ERROR, "Failed to register for %{public}@ notifications with code=%u", (uint8_t *)&v3, 0x12u);
}

@end
