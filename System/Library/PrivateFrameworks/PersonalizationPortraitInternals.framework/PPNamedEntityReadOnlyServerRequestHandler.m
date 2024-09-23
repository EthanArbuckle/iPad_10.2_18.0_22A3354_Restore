@implementation PPNamedEntityReadOnlyServerRequestHandler

- (PPNamedEntityReadOnlyServerRequestHandler)init
{
  PPNamedEntityReadOnlyServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPNamedEntityReadOnlyServerRequestHandler;
  v2 = -[PPNamedEntityReadOnlyServerRequestHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PPXPCServerPipelinedBatchQueryManager initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:]([PPXPCServerPipelinedBatchQueryManager alloc], "initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:", 2, 10000000000, 4);
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;

  }
  return v2;
}

- (void)unblockPendingQueries
{
  -[PPXPCServerPipelinedBatchQueryManager unblockPendingQueries](self->_queryManager, "unblockPendingQueries");
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)rankedNamedEntitiesWithQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSString *clientProcessName;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  PPNamedEntityReadOnlyServerRequestHandler *v16;
  unint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    v19 = a4;
    v20 = 2112;
    v21 = clientProcessName;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E7E1ED88;
  v10 = v6;
  v15 = v10;
  v16 = self;
  v17 = a4;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    objc_msgSend(v10, "customizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);

  }
}

- (void)namedEntityRecordsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSString *clientProcessName;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  PPNamedEntityReadOnlyServerRequestHandler *v16;
  unint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    v19 = a4;
    v20 = 2112;
    v21 = clientProcessName;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E7E1ED88;
  v10 = v6;
  v15 = v10;
  v16 = self;
  v17 = a4;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    objc_msgSend(v10, "customizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);

  }
}

- (void)mapItemForPlaceName:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, id);
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[8];
  id v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v5 = (void (**)(id, void *, id))a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: mapItemForPlaceName", buf, 2u);
  }

  pp_entities_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_entities_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPNamedEntityReadOnlyServer.mapItemForPlaceName", ", v19, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v12, "mapItemForPlaceName:error:", v6, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v18;
  pp_entities_signpost_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v16, OS_SIGNPOST_INTERVAL_END, v9, "PPNamedEntityReadOnlyServer.mapItemForPlaceName", ", v17, 2u);
  }

  v5[2](v5, v13, v14);
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: registerFeedback", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PPNamedEntityReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke;
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

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setBundleIdResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

uint64_t __73__PPNamedEntityReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke(_QWORD *a1)
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
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
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
  __int128 *p_buf;
  id v27;
  __int128 buf;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  pp_entities_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_entities_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPNamedEntityReadOnlyServer.namedEntityRecordsWithQuery", ", (uint8_t *)&buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v27 = 0;
  objc_msgSend(v6, "namedEntityRecordsWithQuery:error:", v7, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;

  pp_entities_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPNamedEntityReadOnlyServer.namedEntityRecordsWithQuery", ", (uint8_t *)&buf, 2u);
  }

  pp_xpc_server_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1[5] + 8), "namedEntityRecordBatch:isLast:error:queryId:completion:", 0, 1, v9, a1[6], &__block_literal_global_118_18789);
  }
  else
  {
    if (v13)
    {
      v14 = objc_msgSend(v8, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: namedEntityRecordsWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v30 = 0;
    v15 = *(void **)(a1[5] + 16);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-namedEntityRecordsWithQuery"), *(_QWORD *)(a1[5] + 24));
    v17 = a1[6];
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_121;
    v24[3] = &unk_1E7E1D4F0;
    v25 = v8;
    p_buf = &buf;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_2;
    v21[3] = &unk_1E7E1D538;
    v19 = a1[6];
    v22 = a1[5];
    v23 = v19;
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_4;
    v20[3] = &unk_1E7E1D560;
    v20[4] = v22;
    v20[5] = v19;
    objc_msgSend(v15, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v16, v17, v24, v21, v20);

    _Block_object_dispose(&buf, 8);
  }

}

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_121(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32)
    v7 = 50;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "namedEntityRecordBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_122);
}

uint64_t __81__PPNamedEntityReadOnlyServerRequestHandler_namedEntityRecordsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "namedEntityRecordBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  id v26;
  __int128 buf;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  pp_entities_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_entities_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPNamedEntityReadOnlyServer.rankedNamedEntitiesWithQuery", ", (uint8_t *)&buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v6, "rankedNamedEntitiesWithQuery:error:clientProcessName:", a1[4], &v26, *(_QWORD *)(a1[5] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;

  pp_entities_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v10, OS_SIGNPOST_INTERVAL_END, v3, "PPNamedEntityReadOnlyServer.rankedNamedEntitiesWithQuery", ", (uint8_t *)&buf, 2u);
  }

  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      v13 = objc_msgSend(v7, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x2020000000;
    v29 = 0;
    v14 = *(void **)(a1[5] + 16);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-rankedNamedEntitiesWithQuery"), *(_QWORD *)(a1[5] + 24));
    v16 = a1[6];
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_112;
    v23[3] = &unk_1E7E1D4F0;
    v24 = v7;
    p_buf = &buf;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_2;
    v20[3] = &unk_1E7E1D538;
    v18 = a1[6];
    v21 = a1[5];
    v22 = v18;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_4;
    v19[3] = &unk_1E7E1D560;
    v19[4] = v21;
    v19[5] = v18;
    objc_msgSend(v14, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v15, v16, v23, v20, v19);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v12)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadOnlyServer: rankedNamedEntitiesWithQuery returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1[5] + 8), "namedEntityBatch:isLast:error:queryId:completion:", 0, 1, v8, a1[6], &__block_literal_global_18801);
  }

}

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_112(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32)
    v7 = 50;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "namedEntityBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_114_18804);
}

uint64_t __82__PPNamedEntityReadOnlyServerRequestHandler_rankedNamedEntitiesWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "namedEntityBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

@end
