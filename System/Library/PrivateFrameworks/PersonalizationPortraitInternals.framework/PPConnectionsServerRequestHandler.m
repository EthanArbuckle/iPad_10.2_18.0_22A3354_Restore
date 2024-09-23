@implementation PPConnectionsServerRequestHandler

- (PPConnectionsServerRequestHandler)init
{
  PPConnectionsServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsServerRequestHandler;
  v2 = -[PPConnectionsServerRequestHandler init](&v6, sel_init);
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

- (void)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PPConnectionsServerRequestHandler *v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = a5;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: recentLocationDonationsSinceDate: %@ client: %@ queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke;
  v14[3] = &unk_1E7E1E8F0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a5;
  v12 = v9;
  v13 = v8;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);

}

- (void)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 queryId:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PPConnectionsServerRequestHandler *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  pp_xpc_server_log_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v31 = a3;
    v32 = 2112;
    v33 = v14;
    v34 = 2048;
    v35 = a5;
    _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: recentLocationsForConsumer: %lu criteria: %@ limit: %lu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke;
  v22[3] = &unk_1E7E1AF60;
  v27 = a3;
  v28 = a5;
  v23 = v14;
  v24 = v15;
  v29 = a8;
  v25 = self;
  v26 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v22);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPConnectionsServer: registerFeedback", buf, 2u);
  }

  +[PPLocalConnectionsStore defaultStore](PPLocalConnectionsStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PPConnectionsServerRequestHandler_registerFeedback_completion___block_invoke;
  v10[3] = &unk_1E7E1D5C8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "registerFeedback:completion:", v6, v10);

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

uint64_t __65__PPConnectionsServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  pp_connections_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_connections_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsServer.recentLocationsForConsumer", ", buf, 2u);
  }

  +[PPLocalConnectionsStore defaultStore](PPLocalConnectionsStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[8];
  v8 = a1[9];
  v9 = a1[4];
  v10 = a1[5];
  v31 = 0;
  objc_msgSend(v6, "recentLocationsForConsumer:criteria:limit:explanationSet:timeout:error:", v7, v9, v8, v10, 3000000000, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;

  pp_connections_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsServer.recentLocationsForConsumer", ", buf, 2u);
  }

  if (v11)
  {
    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x2020000000;
    v30 = 0;
    v15 = *(void **)(a1[6] + 16);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-recentLocationsForConsumer"), a1[7]);
    v17 = a1[10];
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_2;
    v24[3] = &unk_1E7E1D4F0;
    v25 = v11;
    v26 = buf;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_3;
    v21[3] = &unk_1E7E1D538;
    v19 = a1[10];
    v22 = a1[6];
    v23 = v19;
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_5;
    v20[3] = &unk_1E7E1D560;
    v20[4] = v22;
    v20[5] = v19;
    objc_msgSend(v15, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v16, v17, v24, v21, v20);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1[6] + 8), "recentLocationsBatch:isLast:error:queryId:completion:", 0, 1, v12, a1[10], &__block_literal_global_49_14575);
  }

}

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recentLocationsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_52_14578);
}

uint64_t __109__PPConnectionsServerRequestHandler_recentLocationsForConsumer_criteria_limit_explanationSet_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recentLocationsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke(_QWORD *a1)
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

  pp_connections_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_connections_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsServer.recentLocationDonationsSinceDate", ", buf, 2u);
  }

  +[PPLocalConnectionsStore defaultStore](PPLocalConnectionsStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v28 = 0;
  objc_msgSend(v6, "recentLocationDonationsSinceDate:error:", v7, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  pp_connections_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsServer.recentLocationDonationsSinceDate", ", buf, 2u);
  }

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x2020000000;
    v27 = 0;
    v12 = *(void **)(a1[5] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-recentLocationDonationsSinceDate"), a1[6]);
    v14 = a1[7];
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_2;
    v21[3] = &unk_1E7E1D4F0;
    v22 = v8;
    v23 = buf;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_3;
    v18[3] = &unk_1E7E1D538;
    v16 = a1[7];
    v19 = a1[5];
    v20 = v16;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_5;
    v17[3] = &unk_1E7E1D560;
    v17[4] = v19;
    v17[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v21, v18, v17);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1[5] + 8), "recentLocationsBatch:isLast:error:queryId:completion:", 0, 1, v9, a1[7], &__block_literal_global_14585);
  }

}

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recentLocationsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_44_14587);
}

uint64_t __85__PPConnectionsServerRequestHandler_recentLocationDonationsSinceDate_client_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recentLocationsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

@end
