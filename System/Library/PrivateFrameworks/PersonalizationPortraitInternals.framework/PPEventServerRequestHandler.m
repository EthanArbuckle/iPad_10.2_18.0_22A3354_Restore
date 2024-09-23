@implementation PPEventServerRequestHandler

- (PPEventServerRequestHandler)init
{
  PPEventServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPEventServerRequestHandler;
  v2 = -[PPEventServerRequestHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PPXPCServerPipelinedBatchQueryManager initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:]([PPXPCServerPipelinedBatchQueryManager alloc], "initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:", 2, 10000000000, 4);
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;

  }
  return v2;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)unblockPendingQueries
{
  -[PPXPCServerPipelinedBatchQueryManager unblockPendingQueries](self->_queryManager, "unblockPendingQueries");
}

- (void)eventNameRecordsForClient:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[4];
  id v11;
  PPEventServerRequestHandler *v12;
  unint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: eventNameRecordsForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (void)resolveEventNameRecordChanges:(id)a3 client:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PPEventServerRequestHandler *v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPEventServer: eventNameRecordChangesForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke;
  v14[3] = &unk_1E7E1E8F0;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a5;
  v12 = v9;
  v13 = v8;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);

}

- (void)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 queryId:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  dispatch_block_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  PPEventServerRequestHandler *v21;
  unint64_t v22;
  int v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  pp_xpc_server_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: enqueue eventHighlightsFrom:%@ to:%@ queryId:%llu", buf, 0x20u);
  }

  if (eventHighlightsFrom_to_options_queryId___pasOnceToken17 != -1)
    dispatch_once(&eventHighlightsFrom_to_options_queryId___pasOnceToken17, &__block_literal_global_59_17628);
  v13 = (void *)eventHighlightsFrom_to_options_queryId___pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2;
  block[3] = &unk_1E7E1CAE0;
  v19 = v10;
  v20 = v11;
  v23 = a5;
  v21 = self;
  v22 = a6;
  v14 = v11;
  v15 = v10;
  v16 = v13;
  v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[PPXPCServerPipelinedBatchQueryManager waitForBlockWithRequestThrottle:](self->_queryManager, "waitForBlockWithRequestThrottle:", v17);
  dispatch_async(v16, v17);

}

- (void)scoredEventsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[4];
  id v11;
  PPEventServerRequestHandler *v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: scoredEvents queryId: %llu", buf, 0xCu);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPEventServer: logEventInteractionForEventWithEventIdentifier", v10, 2u);
  }

  +[PPEventMetricsLogger defaultLogger](PPEventMetricsLogger, "defaultLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventInteractionForEventWithEventIdentifier:interface:actionType:", v7, v6, v5);

}

- (void)interactionSummaryMetricsWithQueryId:(unint64_t)a3
{
  NSObject *v5;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  pp_xpc_server_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPEventServer: interactionSummaryMetrics queryId: %llu", buf, 0xCu);
  }

  queryManager = self->_queryManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke;
  v7[3] = &unk_1E7E1DAD0;
  v7[4] = self;
  v7[5] = a3;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v7);
}

- (void)sendRTCLogsWithWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v3 = a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPEventServer: sendRTCLogs", buf, 2u);
  }

  +[PPEventMetricsLogger defaultLogger](PPEventMetricsLogger, "defaultLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PPEventServerRequestHandler_sendRTCLogsWithWithCompletion___block_invoke;
  v7[3] = &unk_1E7E1CB48;
  v8 = 0;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "sendRTCLogsWithCompletion:", v7);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPEventServer: registerFeedback", v9, 2u);
  }

  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v6, v5);

}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

uint64_t __61__PPEventServerRequestHandler_sendRTCLogsWithWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    pp_xpc_server_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C392E000, v2, OS_LOG_TYPE_ERROR, "sendRTCLogsWithCompletion unexpectedly failed: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  +[PPEventMetricsLogger defaultLogger](PPEventMetricsLogger, "defaultLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggedInteractionsSummaryMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_2;
  v13[3] = &unk_1E7E1D4F0;
  v7 = v3;
  v14 = v7;
  v15 = v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_3;
  v10[3] = &unk_1E7E1D538;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_5;
  v9[3] = &unk_1E7E1D560;
  v9[4] = v11;
  v9[5] = v8;
  objc_msgSend(v5, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("interactionSummaryMetrics"), v4, v13, v10, v9);

  _Block_object_dispose(v16, 8);
}

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4)
    v7 = 500;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "interactionSummaryMetricsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_73_17620);
}

uint64_t __68__PPEventServerRequestHandler_interactionSummaryMetricsWithQueryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "interactionSummaryMetricsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scoredEventsWithQuery:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v3, "count");
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPScoredEvents from PPEventStore: %lu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = a1[6];
  v6 = *(void **)(a1[5] + 16);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_68;
  v14[3] = &unk_1E7E1D4F0;
  v8 = v3;
  v15 = v8;
  p_buf = &buf;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_2;
  v11[3] = &unk_1E7E1D538;
  v9 = a1[6];
  v12 = a1[5];
  v13 = v9;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_4;
  v10[3] = &unk_1E7E1D560;
  v10[4] = v12;
  v10[5] = v9;
  objc_msgSend(v6, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("scoredEvents"), v5, v14, v11, v10);

  _Block_object_dispose(&buf, 8);
}

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_68(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4)
    v7 = 500;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scoredEventsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_69_17626);
}

uint64_t __61__PPEventServerRequestHandler_scoredEventsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scoredEventsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  pp_events_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_events_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.eventHighlights", ", (uint8_t *)&buf, 2u);
  }

  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventHighlightsFrom:to:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pp_events_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v9, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.eventHighlights", ", (uint8_t *)&buf, 2u);
  }

  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(v7, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPEventHighlights from PPEventStore: %lu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x2020000000;
  v26 = 0;
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_63;
  v21[3] = &unk_1E7E1D4F0;
  v14 = v7;
  v22 = v14;
  p_buf = &buf;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2_64;
  v18[3] = &unk_1E7E1D538;
  v15 = *(_QWORD *)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = v15;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_4;
  v17[3] = &unk_1E7E1D560;
  v17[4] = v19;
  v17[5] = v15;
  objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("eventHighlights"), v11, v21, v18, v17);

  _Block_object_dispose(&buf, 8);
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_63(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4)
    v7 = 500;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_2_64(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventHighlightsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_65_17636);
}

uint64_t __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventHighlightsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __70__PPEventServerRequestHandler_eventHighlightsFrom_to_options_queryId___block_invoke()
{
  void *v0;
  dispatch_workloop_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = dispatch_workloop_create("eventHighlightsFromTo");
  v2 = (void *)eventHighlightsFrom_to_options_queryId___pasExprOnceResult;
  eventHighlightsFrom_to_options_queryId___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  pp_events_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_events_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.resolveEventNameRecordChanges", ", buf, 2u);
  }

  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = a1[5];
  v29 = 0;
  objc_msgSend(v6, "resolveEventNameRecordChanges:client:error:", v7, v8, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;

  pp_events_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.resolveEventNameRecordChanges", ", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(*(id *)(a1[6] + 8), "eventNameRecordChangesBatch:isLast:error:queryId:completion:", 0, 1, v10, a1[7], &__block_literal_global_55);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x2020000000;
    v28 = 0;
    v13 = *(void **)(a1[6] + 16);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-eventNameRecordChangesForClient"), a1[5]);
    v15 = a1[7];
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_2;
    v22[3] = &unk_1E7E1D4F0;
    v23 = v9;
    v24 = buf;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_3;
    v19[3] = &unk_1E7E1D538;
    v17 = a1[7];
    v20 = a1[6];
    v21 = v17;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_5;
    v18[3] = &unk_1E7E1D560;
    v18[4] = v20;
    v18[5] = v17;
    objc_msgSend(v13, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v14, v15, v22, v19, v18);

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4)
    v7 = 500;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventNameRecordChangesBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_58_17645);
}

uint64_t __76__PPEventServerRequestHandler_resolveEventNameRecordChanges_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventNameRecordChangesBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  pp_events_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_events_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPEventServer.eventNameRecordsForClient", ", buf, 2u);
  }

  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v28 = 0;
  objc_msgSend(v6, "eventNameRecordsForClient:error:", v7, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  pp_events_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPEventServer.eventNameRecordsForClient", ", buf, 2u);
  }

  if (v9)
  {
    objc_msgSend(*(id *)(a1[5] + 8), "eventNameRecordBatch:isLast:error:queryId:completion:", 0, 1, v9, a1[6], &__block_literal_global_17652);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x2020000000;
    v27 = 0;
    v12 = *(void **)(a1[5] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-eventNameRecordsForClient"), a1[4]);
    v14 = a1[6];
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_2;
    v21[3] = &unk_1E7E1D4F0;
    v22 = v8;
    v23 = buf;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_3;
    v18[3] = &unk_1E7E1D538;
    v16 = a1[6];
    v19 = a1[5];
    v20 = v16;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_5;
    v17[3] = &unk_1E7E1D560;
    v17[4] = v19;
    v17[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v21, v18, v17);

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4)
    v7 = 500;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventNameRecordBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_50_17654);
}

uint64_t __65__PPEventServerRequestHandler_eventNameRecordsForClient_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventNameRecordBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

@end
