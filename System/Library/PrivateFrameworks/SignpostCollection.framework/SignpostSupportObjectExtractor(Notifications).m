@implementation SignpostSupportObjectExtractor(Notifications)

- (uint64_t)processNotificationsWithIntervalTimeoutInSeconds:()Notifications errorOut:
{
  return objc_msgSend(a1, "processNotificationsWithIntervalTimeoutInSeconds:shouldCalculateAnimationFramerate:targetQueue:errorOut:", a3, 1, 0, a4);
}

- (void)_processStreamedOSLogEventProxy:()Notifications shouldCalculateFramerate:
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[6];
  char v33;
  unsigned __int8 v34;

  v6 = a3;
  v7 = (void *)MEMORY[0x212BF7FF4]();
  objc_msgSend(a1, "cachedTimebaseRatio");
  if (v8 == 0.0)
    objc_msgSend(a1, "setCachedTimebaseRatio:", (double)(unint64_t)objc_msgSend(v6, "continuousNanosecondsSinceBoot")/ (double)(unint64_t)objc_msgSend(v6, "machContinuousTimestamp"));
  if (objc_msgSend(v6, "type") == 1024
    && (objc_msgSend(a1, "logMessageProcessingBlock"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v34 = 0;
    v10 = objc_msgSend(v6, "processIdentifier");
    v11 = objc_msgSend(v6, "creatorProcessUniqueIdentifier");
    objc_msgSend(v6, "process");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subsystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(a1, "_shouldBuildEventWithPid:uniquePid:processName:subsystem:category:shouldReport:", v10, v11, v12, v13, v14, &v34);

    if ((_DWORD)v10)
    {
      v15 = objc_alloc(MEMORY[0x24BE90678]);
      objc_msgSend(a1, "cachedTimebaseRatio");
      v16 = (void *)objc_msgSend(v15, "initWithOSLogEventProxy:timebaseRatio:", v6);
      if (!v16 || (objc_msgSend(a1, "_processSignpostSupportLogMessage:", v16) & 1) != 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if (objc_msgSend(v6, "type") == 1536)
  {
    if (objc_msgSend(a1, "_hasSignpostProcessingBlock"))
    {
      v34 = 0;
      v17 = objc_msgSend(v6, "processIdentifier");
      v18 = objc_msgSend(v6, "creatorProcessUniqueIdentifier");
      objc_msgSend(v6, "process");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subsystem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(a1, "_shouldBuildEventWithPid:uniquePid:processName:subsystem:category:shouldReport:", v17, v18, v19, v20, v21, &v34);

      if ((_DWORD)v17)
      {
        do
          v22 = __ldaxr(&_processStreamedOSLogEventProxy_shouldCalculateFramerate__nextSerialNumber);
        while (__stlxr(v22 + 1, &_processStreamedOSLogEventProxy_shouldCalculateFramerate__nextSerialNumber));
        v23 = objc_msgSend(a1, "_isTrackingIntervals");
        v24 = v23;
        v25 = v23 & a4;
        v26 = objc_alloc(MEMORY[0x24BE90670]);
        objc_msgSend(a1, "cachedTimebaseRatio");
        v28 = v27;
        v29 = objc_msgSend(a1, "shouldComposeMetadataString");
        v30 = objc_msgSend(a1, "_notificationTimeout");
        objc_msgSend(a1, "notificationProcessingQueue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = 3221225472;
        v32[2] = __106__SignpostSupportObjectExtractor_Notifications___processStreamedOSLogEventProxy_shouldCalculateFramerate___block_invoke;
        v32[3] = &unk_24CE7A438;
        v33 = v24;
        v32[4] = a1;
        v32[5] = v22;
        v32[0] = MEMORY[0x24BDAC760];
        v16 = (void *)objc_msgSend(v26, "initWithOSLogEventProxy:timebaseRatio:shouldCompose:serialNumber:shouldCollectFrameInfo:timeoutInSec:timeoutHandlingQueue:timeoutHandlingBlock:", v6, v29, v22, v25, v30, v31, v28, v32);

        if ((objc_msgSend(a1, "_processSignpostEvent:shouldReport:", v16, v34) & 1) != 0)
          goto LABEL_15;
LABEL_14:
        objc_msgSend(a1, "stopProcessing");
LABEL_15:

      }
    }
  }
  objc_autoreleasePoolPop(v7);

}

- (BOOL)processNotificationsWithIntervalTimeoutInSeconds:()Notifications shouldCalculateAnimationFramerate:targetQueue:errorOut:
{
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  dispatch_queue_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  char v41;
  id location;
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v10 = a5;
  objc_msgSend(a1, "_processingStarting");
  if ((objc_msgSend(a1, "_hasProcessingBlock") & 1) != 0)
  {
    objc_msgSend(a1, "set_shouldStopProcessing:", 0);
    objc_msgSend(a1, "set_notificationTimeout:", a3);
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy_;
    v52 = __Block_byref_object_dispose_;
    v53 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 1;
    objc_msgSend(MEMORY[0x24BE60C68], "liveLocalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke;
    v43[3] = &unk_24CE7A460;
    v43[5] = &v48;
    v43[6] = a6;
    v43[4] = &v44;
    objc_msgSend(v11, "prepareWithCompletionHandler:", v43);
    v13 = *((_BYTE *)v45 + 24) != 0;
    if (*((_BYTE *)v45 + 24))
    {
      objc_initWeak(&location, a1);
      v14 = objc_alloc(MEMORY[0x24BE60C70]);
      v15 = (void *)objc_msgSend(v14, "initWithLiveSource:", v49[5]);
      objc_msgSend(a1, "set_liveStream:", v15);

      if (v10)
      {
        objc_msgSend(a1, "setNotificationProcessingQueue:", v10);
      }
      else
      {
        v16 = dispatch_queue_create("SignpostSupportObjectExtractor notification processing queue", 0);
        objc_msgSend(a1, "setNotificationProcessingQueue:", v16);

      }
      objc_msgSend(a1, "notificationProcessingQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_liveStream");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setQueue:", v17);

      objc_msgSend(a1, "_liveStream");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_2;
      v39[3] = &unk_24CE7A488;
      objc_copyWeak(&v40, &location);
      v41 = a4;
      objc_msgSend(v19, "setEventHandler:", v39);

      objc_msgSend(a1, "_liveStream");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v12;
      v37[1] = 3221225472;
      v37[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_3;
      v37[3] = &unk_24CE7A4B0;
      objc_copyWeak(&v38, &location);
      objc_msgSend(v20, "setInvalidationHandler:", v37);

      objc_msgSend(a1, "_liveStream");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFlags:", objc_msgSend(v21, "flags") | 4);

      objc_msgSend(a1, "_liveStream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFlags:", objc_msgSend(v22, "flags") | 0x90);

      if (objc_msgSend(a1, "_hasSignpostProcessingBlock"))
      {
        objc_msgSend(a1, "_liveStream");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFlags:", objc_msgSend(v23, "flags") | 0x20);

      }
      objc_msgSend(a1, "logMessageProcessingBlock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_liveStream");
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFlags:", objc_msgSend(v25, "flags") | 1);

        objc_msgSend(a1, "_liveStream");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFlags:", objc_msgSend(v26, "flags") | 2);
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFlags:", objc_msgSend(v27, "flags") | 0x200);

        objc_msgSend(a1, "_liveStream");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFlags:", objc_msgSend(v26, "flags") | 0x100);
      }

      v32 = v12;
      v33 = 3221225472;
      v34 = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_4;
      v35 = &unk_24CE7A4D8;
      objc_copyWeak(&v36, &location);
      objc_msgSend(a1, "set_stopProcessingBlock:", &v32);
      objc_msgSend(a1, "_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:", 1, v32, v33, v34, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_liveStream");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFilterPredicate:", v28);

      objc_msgSend(a1, "_liveStream");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activate");

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 8, CFSTR("No processing blocks specified"));
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
