@implementation SignpostSupportObjectExtractor

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  switch(a2)
  {
    case 3:
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("OSLogEventStream failed due to invalid position");
      break;
    case 2:
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("OSLogEventStream failed due to backlog");
      break;
    case 1:
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("OSLogEventStream failed due to disconnected unrecoverably");
      break;
    default:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_9;
  }
  objc_msgSend(v6, "stringWithFormat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithCode:description:", 5, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_processingCompleted:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setProcessedEventCount:", objc_msgSend(*(id *)(a1 + 32), "processedEventCount") + 1);
  if ((objc_msgSend(v5, "type") & 0xFFFFFFFFFFFFFDFFLL) == 0x400)
  {
    if (*(_QWORD *)(a1 + 40)
      && (v4 = objc_msgSend(v5, "unixDate"),
          (double)*(int *)(v4 + 8) / 1000000.0 + (double)*(uint64_t *)v4 > *(double *)(a1 + 56))
      || (objc_msgSend(*(id *)(a1 + 32), "_processOSLogEventProxy:", v5),
          objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessing")))
    {
      objc_msgSend(WeakRetained, "invalidate");
    }
  }

}

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __106__SignpostSupportObjectExtractor_Notifications___processStreamedOSLogEventProxy_shouldCalculateFramerate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  char v11;
  id location;

  objc_initWeak(&location, a2);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = objc_loadWeakRetained(&location);

    if (v3)
    {
      v4 = objc_loadWeakRetained(&location);
      objc_msgSend(*(id *)(a1 + 32), "intervalBuilder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "matchingEventForEvent:removeIfFound:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (objc_msgSend(v6, "serialNumber") == *(_QWORD *)(a1 + 40))
        {
          objc_msgSend(*(id *)(a1 + 32), "intervalBuilder");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (id)objc_msgSend(v7, "matchingEventForEvent:removeIfFound:", v4, 1);

          objc_msgSend(*(id *)(a1 + 32), "timedOutBeginEventProcessingBlock");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(*(id *)(a1 + 32), "timedOutBeginEventProcessingBlock");
            v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v11 = ((uint64_t (**)(_QWORD, void *))v10)[2](v10, v6);

            if ((v11 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 32), "_processingCompleted:", 0);
          }
        }
      }

    }
  }
  objc_destroyWeak(&location);
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (a3)
  {
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_processStreamedOSLogEventProxy:shouldCalculateFramerate:", v4, *(unsigned __int8 *)(a1 + 40));

}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  const __CFString *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  v4 = CFSTR("Disconnected from log stream");
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      v4 = CFSTR("Source too backlogged to continue");
      goto LABEL_9;
    case 3:
      v4 = CFSTR("Bad position in stream");
      goto LABEL_9;
    case 4:
      objc_msgSend(WeakRetained, "_processingCompleted:", 0, CFSTR("Disconnected from log stream"));
      goto LABEL_10;
    case 5:
      v4 = CFSTR("Reached end of stream");
      goto LABEL_9;
    case 6:
      v4 = CFSTR("Unsupported request");
      goto LABEL_9;
    case 7:
      v4 = CFSTR("Insufficient permissions");
      goto LABEL_9;
    default:
      v4 = CFSTR("Unknown error");
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 6, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_processingCompleted:", v5);

LABEL_10:
      return;
  }
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_liveStream");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

  objc_msgSend(WeakRetained, "set_liveStream:", 0);
}

uint64_t __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke()
{
  NSObject *v0;

  _signpostcollection_debug_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_cold_1(v0);

  return 1;
}

void __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(_QWORD *)(a1 + 40))
      **(_QWORD **)(a1 + 40) = (id)objc_msgSend(v6, "copy");
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

uint64_t __101__SignpostSupportObjectExtractor_TraceReading___processTraceFileWithPath_startDate_endDate_errorOut___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  FILE *v12;
  id v13;
  id v15;

  v2 = ktrace_chunk_tag();
  if (!*(_BYTE *)(a1 + 40))
  {
    if (!*(_BYTE *)(a1 + 41))
      return 1;
    if (v2 == 20987)
      goto LABEL_12;
    v3 = 36873;
LABEL_11:
    if (v2 == v3)
      goto LABEL_12;
    return 1;
  }
  if (!*(_BYTE *)(a1 + 41))
  {
    if (v2 == 36872)
      goto LABEL_12;
    v3 = 20985;
    goto LABEL_11;
  }
  if ((v2 - 36872) >= 2 && v2 != 20985)
  {
    v3 = 20987;
    goto LABEL_11;
  }
LABEL_12:
  v4 = ktrace_chunk_size();
  v5 = ktrace_chunk_map_data();
  if (!v5)
    return 1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v5, v4, 0);
  if (v6
    && ((v7 = *(void **)(a1 + 32),
         v15 = 0,
         v8 = objc_msgSend(v7, "processSerializedObjectsFromData:errorOut:", v6, &v15),
         v9 = v15,
         v10 = v9,
         !v8)
     || v9))
  {
    v12 = (FILE *)*MEMORY[0x24BDAC8D8];
    if (v9)
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v12, "ERROR: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

    }
    else
    {
      fprintf(v12, "ERROR: %s\n", "Unknown");
    }

    v11 = 0;
  }
  else
  {
    v11 = 1;
    v10 = v6;
  }
  ktrace_chunk_unmap_data();

  return v11;
}

void __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212A37000, log, OS_LOG_TYPE_DEBUG, "Upgrade confirmation requested.", v1, 2u);
}

@end
