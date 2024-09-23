@implementation PPEventClient

- (PPEventClient)init
{
  PPEventClient *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PPXPCClientHelper *v28;
  PPXPCClientHelper *clientHelper;
  PPXPCClientPipelinedBatchQueryManager *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PPEventClient;
  v2 = -[PPEventClient init](&v41, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01B8E8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE00ED20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_eventNameRecordBatch_isLast_error_queryId_completion_, 0, 0);

    v9 = (void *)MEMORY[0x18D7805AC]();
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_eventNameRecordChangesBatch_isLast_error_queryId_completion_, 0, 0);

    v13 = (void *)MEMORY[0x18D7805AC]();
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_eventHighlightsBatch_isLast_error_queryId_completion_, 0, 0);

    v18 = (void *)MEMORY[0x18D7805AC]();
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = (void *)objc_msgSend(v19, "initWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_scoredEventsBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v25 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __21__PPEventClient_init__block_invoke;
    v38[3] = &unk_1E226B998;
    objc_copyWeak(&v39, &location);
    v26 = (void *)MEMORY[0x18D780768](v38);
    v36[0] = v25;
    v36[1] = 3221225472;
    v36[2] = __21__PPEventClient_init__block_invoke_83;
    v36[3] = &unk_1E226B998;
    objc_copyWeak(&v37, &location);
    v27 = (void *)MEMORY[0x18D780768](v36);
    v28 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Event"), v3, v4, v2, v26, v27);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v28;

    v30 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v30, "initWithName:", v32);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v33;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)_unblockPendingQueries
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.Event"));
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D68];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 5, v6);

  -[PPXPCClientPipelinedBatchQueryManager cancelPendingQueriesWithError:](self->_queryManager, "cancelPendingQueriesWithError:", v7);
}

- (id)_remoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (BOOL)eventNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  pp_xpc_client_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "eventNameRecordsForClient:%@ called", buf, 0xCu);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("eventNameRecordsWithError");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("eventNameRecordsWithError"), a4, v21, v17);

  return v15;
}

- (void)eventNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "eventNameRecordBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("eventNameRecordBatch"), v14, v9, v13, a6, v12);
}

- (BOOL)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  pp_xpc_client_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    _os_log_debug_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_DEBUG, "eventNameRecordChangesForClient:%@ called", buf, 0xCu);
  }

  v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke;
  v25[3] = &unk_1E226B970;
  v25[4] = self;
  v26 = v10;
  v27 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E226B9E8;
  v23 = v12;
  v24 = v14;
  v22 = CFSTR("eventNameRecordChangesWithError");
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("eventNameRecordChangesWithError"), a5, v25, v21);

  return v19;
}

- (void)eventNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "eventNameRecordChangesBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("eventNameRecordChangesBatch"), v14, v9, v13, a6, v12);
}

- (BOOL)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v23[4];
  __CFString *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  int v30;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a7;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "eventHighlights called", buf, 2u);
  }

  v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke;
  v27[3] = &unk_1E2269B40;
  v27[4] = self;
  v28 = v12;
  v29 = v13;
  v30 = a5;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E226B9E8;
  v25 = v14;
  v26 = v16;
  v24 = CFSTR("eventHighlights");
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("eventHighlights"), a6, v27, v23);

  return v21;
}

- (void)eventHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "eventHighlightsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("eventHighlightsBatch"), v14, v9, v13, a6, v12);
}

- (BOOL)scoredEventsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  pp_xpc_client_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "scoredEvents called", buf, 2u);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("scoredEvents");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("scoredEvents"), a4, v21, v17);

  return v15;
}

- (void)scoredEventsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "suggestedEventsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("scoredEventsBatch"), v14, v9, v13, a6, v12);
}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PPEventClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventInteractionForEventWithEventIdentifier:interface:actionType:", v8, v6, v5);

}

- (BOOL)interactionSummaryMetricsWithError:(id *)a3 handleBatch:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  uint8_t buf[16];

  v6 = a4;
  pp_xpc_client_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "interactionSummaryMetricsWithError called", buf, 2u);
  }

  v8 = objc_opt_class();
  queryManager = self->_queryManager;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke;
  v17[3] = &unk_1E2269B68;
  v17[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke_2;
  v13[3] = &unk_1E226B9E8;
  v15 = v6;
  v16 = v8;
  v14 = CFSTR("interactionSummaryMetrics");
  v10 = v6;
  v11 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("interactionSummaryMetrics"), a3, v17, v13);

  return v11;
}

- (void)interactionSummaryMetricsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  pp_xpc_client_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "interactionSummaryMetrics batch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("interactionSummaryMetricsBatch"), v14, v9, v13, a6, v12);
}

- (BOOL)sendRTCLogsWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__384;
  v27 = __Block_byref_object_dispose__385;
  v5 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__PPEventClient_sendRTCLogsWithError___block_invoke;
  v22[3] = &unk_1E226BEA8;
  v22[4] = &v23;
  v6 = (void *)MEMORY[0x18D780768](v22, a2);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__384;
  v16 = __Block_byref_object_dispose__385;
  v17 = 0;
  -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __38__PPEventClient_sendRTCLogsWithError___block_invoke_2;
  v11[3] = &unk_1E226BED0;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v7, "sendRTCLogsWithWithCompletion:", v11);

  v8 = (void *)v24[5];
  if (v8)
  {
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a3)
  {
    v8 = (void *)v13[5];
LABEL_6:
    *a3 = objc_retainAutorelease(v8);
  }
LABEL_7:
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPEventClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __38__PPEventClient_sendRTCLogsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __38__PPEventClient_sendRTCLogsWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactionSummaryMetricsWithQueryId:", a2);

}

void __64__PPEventClient_interactionSummaryMetricsWithError_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:forQueryName:hasExpectedContainedType:](PPXPCClientPipelinedBatchQueryManager, "assertBatch:forQueryName:hasExpectedContainedType:", v5, v3, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoredEventsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __57__PPEventClient_scoredEventsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:forQueryName:hasExpectedContainedType:](PPXPCClientPipelinedBatchQueryManager, "assertBatch:forQueryName:hasExpectedContainedType:", v5, v3, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventHighlightsFrom:to:options:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), a2);

}

void __66__PPEventClient_eventHighlightsFrom_to_options_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:forQueryName:hasExpectedContainedType:](PPXPCClientPipelinedBatchQueryManager, "assertBatch:forQueryName:hasExpectedContainedType:", v5, v3, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolveEventNameRecordChanges:client:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

void __72__PPEventClient_resolveEventNameRecordChanges_client_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:forQueryName:hasExpectedContainedType:](PPXPCClientPipelinedBatchQueryManager, "assertBatch:forQueryName:hasExpectedContainedType:", v5, v3, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventNameRecordsForClient:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __61__PPEventClient_eventNameRecordsForClient_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[6];
  v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:forQueryName:hasExpectedContainedType:](PPXPCClientPipelinedBatchQueryManager, "assertBatch:forQueryName:hasExpectedContainedType:", v5, v3, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __21__PPEventClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_xpc_client_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Event");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __21__PPEventClient_init__block_invoke_83(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_xpc_client_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Event");
    _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PPEventClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12 != -1)
    dispatch_once(&sharedInstance__pasOnceToken12, block);
  return (id)sharedInstance__pasExprOnceResult_418;
}

void __31__PPEventClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_418;
  sharedInstance__pasExprOnceResult_418 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
