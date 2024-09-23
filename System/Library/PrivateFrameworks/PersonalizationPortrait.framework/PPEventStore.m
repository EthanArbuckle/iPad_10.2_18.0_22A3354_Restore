@implementation PPEventStore

- (PPEventStore)init
{
  PPEventStore *v2;
  PPRecordMonitoringHelper *v3;
  PPRecordMonitoringHelper *monitoringHelper;
  PPClientFeedbackHelper *v5;
  PPClientFeedbackHelper *clientFeedbackHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPEventStore;
  v2 = -[PPEventStore init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PPRecordMonitoringHelper initWithName:]([PPRecordMonitoringHelper alloc], "initWithName:", CFSTR("EventStore"));
    monitoringHelper = v2->_monitoringHelper;
    v2->_monitoringHelper = v3;

    v5 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v5;

  }
  return v2;
}

- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a3;
  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PPEventStore_iterEventNameRecordsForClient_error_block___block_invoke;
  v12[3] = &unk_1E226C1F0;
  v13 = v7;
  v10 = v7;
  LOBYTE(a4) = objc_msgSend(v9, "eventNameRecordsForClient:error:handleBatch:", v8, a4, v12);

  return (char)a4;
}

- (id)_recordGenerator
{
  return &__block_literal_global_4176;
}

- (void)_sendChangesToDelegates:(id)a3
{
  id v4;
  PPRecordMonitoringHelper *monitoringHelper;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  monitoringHelper = self->_monitoringHelper;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PPEventStore__sendChangesToDelegates___block_invoke;
  v8[3] = &unk_1E226AC38;
  v9 = v4;
  v6 = v4;
  -[PPEventStore _recordGenerator](self, "_recordGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPRecordMonitoringHelper sendChangesToDelegatesWithChangeGenerator:recordGenerator:](monitoringHelper, "sendChangesToDelegatesWithChangeGenerator:recordGenerator:", v8, v7);

}

- (void)_loadEventNameRecordsWithDelegate:(id)a3
{
  PPRecordMonitoringHelper *monitoringHelper;
  id v5;
  id v6;

  monitoringHelper = self->_monitoringHelper;
  v5 = a3;
  -[PPEventStore _recordGenerator](self, "_recordGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PPRecordMonitoringHelper loadRecordsWithDelegate:recordGenerator:](monitoringHelper, "loadRecordsWithDelegate:recordGenerator:", v5, v6);

}

- (BOOL)loadEventNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v5;
  PPRecordMonitoringHelper *monitoringHelper;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  location = 0;
  objc_initWeak(&location, self);
  monitoringHelper = self->_monitoringHelper;
  -[PPEventStore _recordGenerator](self, "_recordGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke;
  v9[3] = &unk_1E226B998;
  objc_copyWeak(&v10, &location);
  LOBYTE(monitoringHelper) = -[PPRecordMonitoringHelper loadRecordsAndMonitorChangesWithDelegate:recordGenerator:notificationRegistrationBlock:](monitoringHelper, "loadRecordsAndMonitorChangesWithDelegate:recordGenerator:notificationRegistrationBlock:", v5, v7, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)monitoringHelper;
}

- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 block:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  char v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v9 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  pp_events_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_18BE3A000, v14, OS_LOG_TYPE_DEFAULT, "loadEventHighlights from: %@ to: %@", buf, 0x16u);
  }

  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__PPEventStore_iterEventHighlightsFrom_to_options_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v13;
  v16 = v13;
  v17 = objc_msgSend(v15, "eventHighlightsFrom:to:options:error:handleBatch:", v11, v12, v9, a6, v19);

  return v17;
}

- (BOOL)iterDailyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 252, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHour:", 23);
  objc_msgSend(v11, "setMinute:", 59);
  objc_msgSend(v11, "setSecond:", 59);
  objc_msgSend(v10, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    LOBYTE(a4) = -[PPEventStore iterEventHighlightsFrom:to:options:error:block:](self, "iterEventHighlightsFrom:to:options:error:block:", v9, v12, v6, a4, v8);
  }
  else
  {
    pp_events_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_error_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_ERROR, "failed to get endOfDay from %@", buf, 0xCu);
    }

    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("PPErrorInfoKey");
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to get endOfDay from %@"), v11);
      v19 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 12, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)iterWeeklyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  double v16;

  v6 = *(_QWORD *)&a3;
  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = a5;
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0.0;
  objc_msgSend(v10, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v15, &v16, v11);
  v12 = v15;
  objc_msgSend(v12, "dateByAddingTimeInterval:", v16 + -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PPEventStore iterEventHighlightsFrom:to:options:error:block:](self, "iterEventHighlightsFrom:to:options:error:block:", v11, v13, v6, a4, v9);

  return (char)a4;
}

- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 error:(id *)a5 block:(id)a6
{
  return -[PPEventStore iterEventHighlightsFrom:to:options:error:block:](self, "iterEventHighlightsFrom:to:options:error:block:", a3, a4, 0, a5, a6);
}

- (BOOL)iterDailyEventHighlightsError:(id *)a3 block:(id)a4
{
  return -[PPEventStore iterDailyEventHighlightsWithOptions:error:block:](self, "iterDailyEventHighlightsWithOptions:error:block:", 0, a3, a4);
}

- (BOOL)iterWeeklyEventHighlightsError:(id *)a3 block:(id)a4
{
  return -[PPEventStore iterWeeklyEventHighlightsWithOptions:error:block:](self, "iterWeeklyEventHighlightsWithOptions:error:block:", 0, a3, a4);
}

- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a3;
  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PPEventStore_iterScoredEventsWithQuery_error_block___block_invoke;
  v12[3] = &unk_1E226C1F0;
  v13 = v7;
  v10 = v7;
  LOBYTE(a4) = objc_msgSend(v9, "scoredEventsWithQuery:error:handleBatch:", v8, a4, v12);

  return (char)a4;
}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventInteractionForEventWithEventIdentifier:interface:actionType:", v7, v6, v5);

}

- (BOOL)interactionSummaryMetricsError:(id *)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PPEventStore_interactionSummaryMetricsError_block___block_invoke;
  v9[3] = &unk_1E226C1F0;
  v10 = v5;
  v7 = v5;
  LOBYTE(a3) = objc_msgSend(v6, "interactionSummaryMetricsWithError:handleBatch:", a3, v9);

  return (char)a3;
}

- (BOOL)sendRTCLogsWithError:(id *)a3
{
  void *v4;

  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "sendRTCLogsWithError:", a3);

  return (char)a3;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventStore.m"), 282, CFSTR("You cannot send mapped feedback on events. Please use PPFeedback to create the feedback for events."));

  }
  -[PPEventStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventStore.m"), 283, CFSTR("The clientIdentifier property must be set on the %@ in order to send feedback."), v17);

  }
  -[PPEventStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__PPEventStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E226C218;
  v18[4] = self;
  v19 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v18);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  PPClientFeedbackHelper *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_clientFeedbackHelper;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

void __44__PPEventStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v5)
  {
    pp_events_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __53__PPEventStore_interactionSummaryMetricsError_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __54__PPEventStore_iterScoredEventsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  pp_events_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_INFO, "Getting into callback on client", buf, 2u);
  }

  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v9)
            goto LABEL_6;
          break;
        }
      }
    }

  }
}

void __63__PPEventStore_iterEventHighlightsFrom_to_options_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  pp_events_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_INFO, "Getting into callback on client", buf, 2u);
  }

  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v9)
            goto LABEL_6;
          break;
        }
      }
    }

  }
}

void __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2;
  v3[3] = &unk_1E226AC60;
  objc_copyWeak(&v4, v1);
  +[PPNotificationManager addEventKitObserverForLifetimeOfObject:block:](PPNotificationManager, "addEventKitObserverForLifetimeOfObject:block:", WeakRetained, v3);

  objc_destroyWeak(&v4);
}

void __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3;
    v7[3] = &unk_1E226AD38;
    v8 = v3;
    v9 = v5;
    objc_msgSend(v6, "handleChangeNotificationWithName:afterDelaySeconds:handler:", CFSTR("Events"), v7, 1.0);

  }
}

uint64_t __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pp_events_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_DEFAULT, "_sendChangesToDelegates Events observation block being called with %tu changes", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendChangesToDelegates:", *(_QWORD *)(a1 + 32));
}

id __40__PPEventStore__sendChangesToDelegates___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__PPEventStore__sendChangesToDelegates___block_invoke_3;
    v14[3] = &unk_1E226AC10;
    v10 = v6;
    v15 = v10;
    objc_msgSend(v8, "resolveEventNameRecordChanges:client:error:handleBatch:", v7, v9, &v16, v14);
    v11 = v16;

    if (v11)
    {
      pp_events_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_error_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_ERROR, "resolveEventNameRecordChanges returned error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (a3)
      *a3 = 1;
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __40__PPEventStore__sendChangesToDelegates___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

uint64_t __40__PPEventStore__sendChangesToDelegates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changedObjectID");
}

id __32__PPEventStore__recordGenerator__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4177;
  v15 = __Block_byref_object_dispose__4178;
  v16 = 0;
  v16 = (id)objc_opt_new();
  +[PPEventClient sharedInstance](PPEventClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__PPEventStore__recordGenerator__block_invoke_8;
  v9[3] = &unk_1E226ABA8;
  v9[4] = &v11;
  objc_msgSend(v3, "eventNameRecordsForClient:error:handleBatch:", v4, &v10, v9);
  v5 = v10;

  if (v5)
  {
    pp_events_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v2;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_ERROR, "error during eventNameRecordsForClient for delegate %@: %@", buf, 0x16u);
    }

  }
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __32__PPEventStore__recordGenerator__block_invoke_8(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (!*a3)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "addObjectsFromArray:", a2);
  return result;
}

void __58__PPEventStore_iterEventNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
