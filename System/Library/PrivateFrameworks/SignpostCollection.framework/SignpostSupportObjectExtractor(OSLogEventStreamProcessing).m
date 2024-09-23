@implementation SignpostSupportObjectExtractor(OSLogEventStreamProcessing)

- (uint64_t)_processLogEventStream:()OSLogEventStreamProcessing startDate:endDate:errorOut:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[7];
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];
  id v33;
  id v34[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_processingStarting");
  objc_msgSend(v8, "setFlags:", 404);
  if (objc_msgSend(a1, "_hasSignpostProcessingBlock"))
    objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x20);
  objc_msgSend(a1, "logMessageProcessingBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "flags");
  if (v11)
  {
    objc_msgSend(v8, "setFlags:", v12 | 1);
    v13 = objc_msgSend(v8, "flags") | 2;
  }
  else
  {
    v13 = v12 | 0x200;
  }
  objc_msgSend(v8, "setFlags:", v13);
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSince1970");
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_initWeak(&location, v8);
  v16 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke;
  v32[3] = &unk_24CE7A660;
  objc_copyWeak(v34, &location);
  v32[4] = a1;
  v17 = v10;
  v33 = v17;
  v34[1] = v15;
  objc_msgSend(v8, "setEventHandler:", v32);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = 0;
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2;
  v25[3] = &unk_24CE7A688;
  v25[5] = v26;
  v25[6] = &v28;
  v25[4] = a1;
  objc_msgSend(v8, "setInvalidationHandler:", v25);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2;
  v23[3] = &unk_24CE7A4D8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(a1, "set_stopProcessingBlock:", v23);
  objc_msgSend(a1, "_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilterPredicate:", v18);

  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "activateStreamFromDate:", v19);
  if (!v9)

  objc_msgSend(a1, "completionSemaphore");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

  v21 = *((unsigned __int8 *)v29 + 24);
  objc_destroyWeak(&v24);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

  return v21;
}

- (void)_processOSLogEventProxy:()OSLogEventStreamProcessing
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t (**v14)(void);
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  unsigned __int8 v31;
  char v32;

  v4 = a3;
  v5 = (void *)MEMORY[0x212BF7FF4]();
  objc_msgSend(a1, "cachedTimebaseRatio");
  if (v6 == 0.0)
    objc_msgSend(a1, "setCachedTimebaseRatio:", (double)(unint64_t)objc_msgSend(v4, "continuousNanosecondsSinceBoot")/ (double)(unint64_t)objc_msgSend(v4, "machContinuousTimestamp"));
  if ((objc_msgSend(v4, "type") & 0xFFFFFFFFFFFFFDFFLL) == 0x400)
  {
    objc_msgSend(v4, "bootUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "currentBootUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(a1, "setCurrentBootUUID:", v7);
    objc_msgSend(a1, "currentBootUUID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 && (void *)v9 != v7 && (objc_msgSend(v7, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(a1, "intervalBuilder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dropAccumulatedState");

      _signpostcollection_debug_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SignpostSupportObjectExtractor(OSLogEventStreamProcessing) _processOSLogEventProxy:].cold.1(v12);

      objc_msgSend(a1, "deviceRebootProcessingBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(a1, "deviceRebootProcessingBlock");
        v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v15 = v14[2]();

        if ((v15 & 1) == 0)
        {
          objc_msgSend(a1, "stopProcessing");
          goto LABEL_27;
        }
      }
      objc_msgSend(a1, "setCurrentBootUUID:", v7);
    }
    if (objc_msgSend(v4, "type") == 1024
      && (objc_msgSend(a1, "logMessageProcessingBlock"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      v32 = 0;
      v17 = objc_msgSend(v4, "processIdentifier");
      v18 = objc_msgSend(v4, "creatorProcessUniqueIdentifier");
      objc_msgSend(v4, "process");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subsystem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "category");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(a1, "_shouldBuildEventWithPid:uniquePid:processName:subsystem:category:shouldReport:", v17, v18, v19, v20, v21, &v32);

      if (!(_DWORD)v17)
      {
LABEL_27:

        goto LABEL_28;
      }
      v22 = objc_alloc(MEMORY[0x24BE90678]);
      objc_msgSend(a1, "cachedTimebaseRatio");
      v23 = (void *)objc_msgSend(v22, "initWithOSLogEventProxy:timebaseRatio:", v4);
      if (!v23 || (objc_msgSend(a1, "_processSignpostSupportLogMessage:", v23) & 1) != 0)
      {
LABEL_20:

        goto LABEL_27;
      }
    }
    else
    {
      if (objc_msgSend(v4, "type") != 1536)
        goto LABEL_27;
      if (!objc_msgSend(a1, "_hasSignpostProcessingBlock"))
        goto LABEL_27;
      v31 = 0;
      v24 = objc_msgSend(v4, "processIdentifier");
      v25 = objc_msgSend(v4, "creatorProcessUniqueIdentifier");
      objc_msgSend(v4, "process");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subsystem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "category");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(a1, "_shouldBuildEventWithPid:uniquePid:processName:subsystem:category:shouldReport:", v24, v25, v26, v27, v28, &v31);

      if (!(_DWORD)v24)
        goto LABEL_27;
      v29 = objc_alloc(MEMORY[0x24BE90658]);
      objc_msgSend(a1, "cachedTimebaseRatio");
      v23 = (void *)objc_msgSend(v29, "initWithOSLogEventProxy:timebaseRatio:shouldCompose:", v4, objc_msgSend(a1, "shouldComposeMetadataString"), v30);
      if ((objc_msgSend(a1, "_processSignpostEvent:shouldReport:", v23, v31) & 1) != 0)
        goto LABEL_20;
    }
    objc_msgSend(a1, "stopProcessing");
    goto LABEL_20;
  }
LABEL_28:
  objc_autoreleasePoolPop(v5);

}

- (void)_processOSLogEventProxy:()OSLogEventStreamProcessing .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212A37000, log, OS_LOG_TYPE_DEBUG, "Dropping state due to change in boot UUID", v1, 2u);
}

@end
