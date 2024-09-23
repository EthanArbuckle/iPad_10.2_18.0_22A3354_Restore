@implementation PLFSEventAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLFSEventAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20 = CFSTR("LogFile");
  v18[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v16[0] = *MEMORY[0x1E0D80318];
  v16[1] = v2;
  v17[0] = &unk_1EA1DABD8;
  v17[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("FileType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("FilePath");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLFSEventAgent)init
{
  PLFSEventAgent *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLFSEventAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  __FSEventStream *stream;
  objc_super v4;

  -[PLFSEventAgent stopMonitoring](self, "stopMonitoring");
  stream = self->_stream;
  if (stream)
    CFRelease(stream);
  v4.receiver = self;
  v4.super_class = (Class)PLFSEventAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

- (void)stopMonitoring
{
  __FSEventStream *stream;
  __CFRunLoop *Current;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  FSEventStreamStop(self->_stream);
  stream = self->_stream;
  Current = CFRunLoopGetCurrent();
  FSEventStreamUnscheduleFromRunLoop(stream, Current, (CFStringRef)*MEMORY[0x1E0C9B280]);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __32__PLFSEventAgent_stopMonitoring__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (stopMonitoring_defaultOnce != -1)
      dispatch_once(&stopMonitoring_defaultOnce, &block);
    if (stopMonitoring_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopped monitoring paths %@"), &unk_1EA1DC898, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLFSEventAgent stopMonitoring]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 133);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __32__PLFSEventAgent_stopMonitoring__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMonitoring_classDebugEnabled = result;
  return result;
}

- (void)startMonitoring
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PLFSEventAgent_startMonitoring__block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __33__PLFSEventAgent_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  __FSEventStream *v9;
  __CFRunLoop *Current;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLFSEventAgent_startMonitoring__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StartMonitoring paths: %@"), &unk_1EA1DC8B0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLFSEventAgent startMonitoring]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 137);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "stream"))
  {
    v9 = (__FSEventStream *)objc_msgSend(*(id *)(a1 + 32), "stream");
    Current = CFRunLoopGetCurrent();
    FSEventStreamScheduleWithRunLoop(v9, Current, (CFStringRef)*MEMORY[0x1E0C9B280]);
    if (!FSEventStreamStart((FSEventStreamRef)objc_msgSend(*(id *)(a1 + 32), "stream")))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v11 = objc_opt_class();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __33__PLFSEventAgent_startMonitoring__block_invoke_35;
        v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v18[4] = v11;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_33 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_33, v18);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_34)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to start monitoring fsevents."));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLFSEventAgent startMonitoring]_block_invoke_2");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 141);

          PLLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
    }
  }
}

uint64_t __33__PLFSEventAgent_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0 = result;
  return result;
}

uint64_t __33__PLFSEventAgent_startMonitoring__block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_34 = result;
  return result;
}

- (void)registerforFSEventNotification
{
  __FSEventStream *v3;
  NSObject *v4;
  _QWORD v5[5];
  FSEventStreamContext context;

  context.version = 0;
  context.info = self;
  context.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
  context.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
  context.copyDescription = (CFAllocatorCopyDescriptionCallBack)MEMORY[0x1E0C98350];
  v3 = FSEventStreamCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (FSEventStreamCallback)fsEventsHandler, &context, (CFArrayRef)&unk_1EA1DC8C8, 0xFFFFFFFFFFFFFFFFLL, 1.0, 0x11u);
  self->_stream = v3;
  if (v3)
  {
    dispatch_get_global_queue(2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__PLFSEventAgent_registerforFSEventNotification__block_invoke;
    v5[3] = &unk_1EA16D040;
    v5[4] = self;
    dispatch_sync(v4, v5);

  }
}

uint64_t __48__PLFSEventAgent_registerforFSEventNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startMonitoring");
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D80098]);
  dispatch_get_global_queue(-32768, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithWorkQueue:withRegistration:withBlock:", v4, &unk_1EA1D9D68, &__block_literal_global_24);
  -[PLFSEventAgent setFileListResponder:](self, "setFileListResponder:", v5);

  -[PLFSEventAgent registerforFSEventNotification](self, "registerforFSEventNotification");
}

id __42__PLFSEventAgent_initOperatorDependancies__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Received log files request from %d, %@"), a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLFSEventAgent initOperatorDependancies]_block_invoke");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 168);

  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D80058], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generateMSSSubmissionWithPayload:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)addLogFileNameEntry:(BOOL)a3 withType:(id)a4 withName:(id)a5
{
  _BOOL4 v6;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v8 = *MEMORY[0x1E0D80380];
  v9 = a5;
  v10 = a4;
  +[PLOperator entryKeyForType:andName:](PLFSEventAgent, "entryKeyForType:andName:", v8, CFSTR("LogFile"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  if (v6)
  {
    v12 = (void *)objc_msgSend(v11, "initWithEntryKey:", v15);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("timestampEnd"));
  }
  else
  {
    v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withDate:", v15, 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("timestampEnd"));

    v12 = 0;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("FileType"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("FilePath"));
  -[PLOperator logEntry:](self, "logEntry:", v12);

}

- (void)logLogFileName:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  id *v31;
  id v32;
  id *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  _QWORD block[5];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (logLogFileName_withName__defaultOnce != -1)
        dispatch_once(&logLogFileName_withName__defaultOnce, block);
      if (logLogFileName_withName__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logLogFileName(%@, %@)\n"), v6, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLFSEventAgent logLogFileName:withName:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 197);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") == 4)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("XXXXXX"));

    }
    else
    {
      v18 = 0;
    }
    +[PLOperator entryKeyForType:andName:](PLFSEventAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("LogFile"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("FileType"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastEntryForKey:withFilters:", v19, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[PLFSEventAgent addLogFileNameEntry:withType:withName:](self, "addLogFileNameEntry:withType:withName:", v18, v6, v8);
      v25 = v16;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("FilePath"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v19;
    if (objc_msgSend(v25, "count") == 4)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("XXXXXX"));

    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if ((_DWORD)v18)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("FilePath"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v8, "isEqualToString:", v29);

        if (v30)
        {
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke_64;
          v44[3] = &unk_1EA16D948;
          v31 = &v45;
          v32 = v23;
          v33 = &v46;
          v45 = v32;
          v46 = v28;
          v34 = v28;
          -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v32, v44);
LABEL_24:

LABEL_26:
          v19 = v39;
          goto LABEL_27;
        }
      }
      else
      {
        objc_msgSend(v23, "entryDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v28, "compare:", v35);

        if (v36 == 1)
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke_2;
          v40[3] = &unk_1EA16DCE0;
          v31 = &v41;
          v37 = v23;
          v33 = &v42;
          v41 = v37;
          v42 = v28;
          v43 = v8;
          v38 = v28;
          -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v37, v40);

          goto LABEL_24;
        }
      }
    }
    -[PLFSEventAgent addLogFileNameEntry:withType:withName:](self, "addLogFileNameEntry:withType:withName:", v18, v6, v8);
    goto LABEL_26;
  }
LABEL_28:

}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logLogFileName_withName__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEntryDate:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("FilePath"));
}

- (PLXPCResponderOperatorComposition)fileListResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileListResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileListResponder, 0);
}

@end
