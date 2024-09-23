@implementation PPMetricsDispatcher

void __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "concatenatedTreatmentNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_stringBackedByUTF8CString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("activeTreatments"));

  objc_msgSend(*(id *)(a1 + 40), "_pas_stringBackedByUTF8CString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

void __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  dispatch_block_t v17;
  uint64_t v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  if (!kPPActiveTreatmentsKey_block_invoke_previousLogging)
  {
    v2 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_pas_proxyArrayWithObject:repetitions:", v3, 20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)kPPActiveTreatmentsKey_block_invoke_previousLogging;
    kPPActiveTreatmentsKey_block_invoke_previousLogging = v5;

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend((id)kPPActiveTreatmentsKey_block_invoke_previousLogging, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8;
    v10 = -v8;

    if (v9 >= -0.5)
      v11 = v10;
    else
      v11 = 0.5;
    v12 = v11 <= 0.0;
    v13 = 0.5 - v11;
    if (v12)
      v14 = 0.5;
    else
      v14 = v13;
  }
  else
  {
    v14 = 0.0;
  }
  objc_msgSend((id)kPPActiveTreatmentsKey_block_invoke_previousLogging, "removeObjectAtIndex:", 0);
  v15 = (void *)kPPActiveTreatmentsKey_block_invoke_previousLogging;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke_2;
  v25 = &unk_1E7E1FCE8;
  v26 = *(id *)(a1 + 32);
  v27 = *(id *)(a1 + 40);
  v17 = dispatch_block_create((dispatch_block_flags_t)0, &v22);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  if (v14 <= 0.0)
  {
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue", v22, v23, v24, v25, v26);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v21, *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    if (v14 <= 9223372040.0)
      v20 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    else
      v20 = -1;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue", v22, v23, v24, v25, v26);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v20, v21, *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

+ (void)logPayloadForEvent:(id)a3 payload:(id)a4 inBackground:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *(*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -172800.0);
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastTreatmentUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || objc_msgSend(v11, "compare:", v9) != 1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__14807;
    v22 = __Block_byref_object_dispose__14808;
    v23 = 0;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke;
    v13[3] = &unk_1E7E1AFC8;
    v17 = v5;
    v16 = &v18;
    v14 = v8;
    v15 = v7;
    dispatch_sync(v12, v13);

    if (v5)
      dispatch_block_wait((dispatch_block_t)v19[5], 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(&v18, 8);
  }

}

@end
