@implementation PPContactServerRequestHandler

- (PPContactServerRequestHandler)init
{
  void *v3;
  PPContactServerRequestHandler *v4;

  +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPContactServerRequestHandler initWithStore:](self, "initWithStore:", v3);

  return v4;
}

- (PPContactServerRequestHandler)initWithStore:(id)a3
{
  id v5;
  PPContactServerRequestHandler *v6;
  PPXPCServerPipelinedBatchQueryManager *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPContactServerRequestHandler;
  v6 = -[PPContactServerRequestHandler init](&v10, sel_init);
  if (v6)
  {
    v7 = -[PPXPCServerPipelinedBatchQueryManager initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:]([PPXPCServerPipelinedBatchQueryManager alloc], "initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:", 2, 10000000000, 4);
    queryManager = v6->_queryManager;
    v6->_queryManager = v7;

    objc_storeStrong((id *)&v6->_store, a3);
    atomic_store(0, (unsigned __int8 *)&v6->_isTerminated);
  }

  return v6;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)setIsTerminated
{
  atomic_store(1u, (unsigned __int8 *)&self->_isTerminated);
}

- (void)unblockPendingQueries
{
  -[PPXPCServerPipelinedBatchQueryManager unblockPendingQueries](self->_queryManager, "unblockPendingQueries");
}

- (void)rankedContactsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: rankedContactsWithQuery:%@ queryId:%llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (void)upcomingRelevantContactsForQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queryManager = self->_queryManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke;
  v9[3] = &unk_1E7E1ED88;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v9);

}

- (void)contactHandlesForTopics:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = objc_msgSend(v6, "count");
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactHandlesForTopics:%tu queryId:%llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (void)contactHandlesForSource:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "documentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactHandlesForSource:%@ queryId:%llu", buf, 0x16u);

  }
  queryManager = self->_queryManager;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke;
  v11[3] = &unk_1E7E1ED88;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v11);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPContactServer: registerFeedback", v9, 2u);
  }

  -[PPLocalContactStore registerFeedback:completion:](self->_store, "registerFeedback:completion:", v7, v6);
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPContactServer: feedbackDisambiguationResultWithChoicesIdentifiers", buf, 2u);
  }

  queryManager = self->_queryManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __119__PPContactServerRequestHandler_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke;
  v16[3] = &unk_1E7E1D000;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v16);

}

- (void)contactNameRecordsForClient:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordsForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  PPLocalContactStore *store;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordChangesForClient: %@", buf, 0xCu);
  }

  pp_contacts_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_contacts_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPContactServer.contactNameRecordChangesForClient", ", buf, 2u);
  }

  store = self->_store;
  v22 = 0;
  -[PPLocalContactStore contactNameRecordChangesForClient:error:](store, "contactNameRecordChangesForClient:error:", v6, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  pp_contacts_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPContactServer.contactNameRecordChangesForClient", ", buf, 2u);
  }

  if (v14)
  {
    v7[2](v7, v14, 0);
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = CFSTR("PPServerSideErrorInfoKey");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v15);
    v24 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v20);

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v21);
  }

}

- (void)contactNameRecordChangesForClient:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactServer: contactNameRecordChangesForClient: %@ queryId: %llu", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke;
  v10[3] = &unk_1E7E1ED88;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v10);

}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

void __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactNameRecordChangesForClient", ", buf, 2u);
  }

  v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  v33 = 0;
  objc_msgSend(v7, "contactNameRecordChangesForClient:error:", v6, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;
  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactNameRecordChangesForClient", ", buf, 2u);
  }

  if (v8)
  {
    v34 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 0;
    v13 = *(void **)(a1[4] + 16);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-contactNameRecordChangesForClient"), a1[5]);
    v15 = a1[6];
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_2;
    v26[3] = &unk_1E7E1D4F0;
    v17 = v12;
    v27 = v17;
    v28 = buf;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_3;
    v23[3] = &unk_1E7E1D538;
    v18 = a1[6];
    v24 = a1[4];
    v25 = v18;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_5;
    v22[3] = &unk_1E7E1D560;
    v22[4] = v24;
    v22[5] = v18;
    objc_msgSend(v13, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v14, v15, v26, v23, v22);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35 = CFSTR("PPServerSideErrorInfoKey");
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
    v36[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v21);

    objc_msgSend(*(id *)(a1[4] + 8), "contactNameRecordChangesBatch:isLast:error:queryId:completion:", 0, 1, v17, a1[6], &__block_literal_global_103_14888);
  }

}

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactNameRecordChangesBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_107);
}

uint64_t __75__PPContactServerRequestHandler_contactNameRecordChangesForClient_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactNameRecordChangesBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[5];
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  _QWORD block[5];
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  os_signpost_id_t v42;
  _QWORD aBlock[4];
  NSObject *v44;
  NSObject *v45;
  uint8_t buf[16];

  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactNameRecordsForClient", ", buf, 2u);
  }

  v6 = dispatch_semaphore_create(0);
  v7 = dispatch_semaphore_create(50);
  aBlock[0] = MEMORY[0x1E0C809B0];
  v8 = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_84;
  aBlock[3] = &unk_1E7E1FCE8;
  v9 = v6;
  v44 = v9;
  v10 = v7;
  v45 = v10;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PPContactServer.contactNameRecordsForClient");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0D815F0]);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(v13, "initWithGuardedData:", v14);

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_2;
  block[3] = &unk_1E7E1B190;
  v16 = (void *)a1[5];
  block[4] = a1[4];
  v37 = v16;
  v17 = v11;
  v41 = v17;
  v18 = v10;
  v38 = v18;
  v19 = v15;
  v39 = v19;
  v20 = v9;
  v40 = v20;
  v42 = v3;
  dispatch_async(v12, block);
  v21 = *(void **)(a1[4] + 16);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-contactNameRecordsForClient"), a1[5]);
  v23 = a1[6];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_96;
  v31[3] = &unk_1E7E1B1E0;
  v24 = a1[4];
  v34 = v18;
  v35 = v17;
  v31[4] = v24;
  v32 = v20;
  v33 = v19;
  v29[5] = v23;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_98;
  v30[3] = &unk_1E7E1D538;
  v30[4] = v24;
  v30[5] = v23;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3_101;
  v29[3] = &unk_1E7E1D560;
  v29[4] = v24;
  v25 = v18;
  v26 = v19;
  v27 = v20;
  v28 = v17;
  objc_msgSend(v21, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v22, v23, v31, v30, v29);

}

intptr_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_84(uint64_t a1)
{
  unsigned int v2;
  intptr_t result;

  v2 = 0;
  do
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  while (v2++ < 0x32);
  return result;
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, _BYTE *);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3;
  v13 = &unk_1E7E1B128;
  v14 = v2;
  v18 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  LOBYTE(v4) = objc_msgSend(v4, "iterContactNameRecordsForClient:error:block:", v3, &v19, &v10);
  v5 = v19;
  if ((v4 & 1) == 0)
  {
    pp_xpc_server_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPContactRecordResultBuffer: iterContactNameRecordsForClient: failed with error: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "runWithLockAcquired:", &__block_literal_global_93, v10, v11, v12, v13, v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PPContactServer.contactNameRecordsForClient", ", buf, 2u);
  }

}

id __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_96(uint64_t a1, _BYTE *a2)
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  _BYTE *v18;
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = (void *)objc_opt_new();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
  if ((v5 & 1) != 0)
  {
    pp_xpc_server_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPContactRecordResultBuffer: batchGenerator terminated.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
LABEL_3:
    if ((unint64_t)objc_msgSend(v4, "count") > 0x31 || *((_BYTE *)v21 + 24))
    {
      v12 = v4;
      goto LABEL_16;
    }
    do
    {
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", *(_QWORD *)(a1 + 40), 1.0) != 1)
      {
        v8 = *(void **)(a1 + 48);
        v14[0] = v6;
        v14[1] = 3221225472;
        v14[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_97;
        v14[3] = &unk_1E7E1B1B8;
        v17 = &v20;
        v18 = a2;
        v15 = v4;
        v16 = *(id *)(a1 + 56);
        objc_msgSend(v8, "runWithLockAcquired:", v14);

        goto LABEL_3;
      }
      v7 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
    }
    while ((v7 & 1) == 0);
    pp_xpc_server_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_INFO, "PPContactRecordResultBuffer: batchGenerator terminated while waiting on semaphore.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  *a2 = 1;
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_16:
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_98(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactNameRecordBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_100_14906);
}

uint64_t __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3_101(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactNameRecordBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "loadingComplete") & 1) != 0)
  {
    objc_msgSend(v3, "records");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    **(_BYTE **)(a1 + 56) = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    **(_BYTE **)(a1 + 56) = 0;
  }
  objc_msgSend(v3, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v3, "records");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "records");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v8, "clientCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    pp_xpc_server_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "count");
      v15 = 134217984;
      v16 = v14;
      _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: batchGenerator: clientRecords = %tu", (uint8_t *)&v15, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    pp_xpc_server_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 67109120;
      LODWORD(v16) = objc_msgSend(v3, "loadingComplete");
      _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: batchGenerator: buffer empty, loadingComplete: %d", (uint8_t *)&v15, 8u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
  if ((v6 & 1) == 0)
  {
    do
    {
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", *(_QWORD *)(a1 + 40), 1.0) != 1)
      {
        v10 = *(void **)(a1 + 48);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_89;
        v11[3] = &unk_1E7E1B100;
        v12 = v5;
        v13 = *(id *)(a1 + 56);
        objc_msgSend(v10, "runWithLockAcquired:", v11);

        goto LABEL_11;
      }
      v7 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
    }
    while ((v7 & 1) == 0);
    pp_xpc_server_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v9 = "PPContactRecordResultBuffer: iterContactNameRecordsForClient terminated while waiting on semaphore.";
    goto LABEL_8;
  }
  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v9 = "PPContactRecordResultBuffer: iterContactNameRecordsForClient terminated.";
LABEL_8:
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
  }
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  *a3 = 1;
LABEL_11:

}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_92(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(a2, "setLoadingComplete:", 1);
  pp_xpc_server_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: loading is complete.", v3, 2u);
  }

}

void __69__PPContactServerRequestHandler_contactNameRecordsForClient_queryId___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  pp_xpc_server_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "records");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134217984;
    v8 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPContactRecordResultBuffer: loading: record.count = %tu", (uint8_t *)&v7, 0xCu);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __119__PPContactServerRequestHandler_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 32), "feedbackDisambiguationResultWithChoicesIdentifiers:chosenContactIdentifier:", a1[5], a1[6]);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactHandlesForSource", ", buf, 2u);
  }

  v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  v32 = 0;
  objc_msgSend(v7, "contactHandlesForSource:error:", v6, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactHandlesForSource", ", buf, 2u);
  }

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = *(void **)(a1[4] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-contactHandlesForSource"), *(_QWORD *)(a1[4] + 40));
    v14 = a1[6];
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_2;
    v25[3] = &unk_1E7E1D4F0;
    v26 = v8;
    v27 = buf;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_3;
    v22[3] = &unk_1E7E1D538;
    v16 = a1[6];
    v23 = a1[4];
    v24 = v16;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_5;
    v21[3] = &unk_1E7E1D560;
    v21[4] = v23;
    v21[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v25, v22, v21);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = CFSTR("PPServerSideErrorInfoKey");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
    v34[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v19);

    objc_msgSend(*(id *)(a1[4] + 8), "contactHandlesForSourceBatch:isLast:error:queryId:completion:", 0, 1, v20, a1[6], &__block_literal_global_80);
  }

}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactHandlesForSourceBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_83_14931);
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForSource_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactHandlesForSourceBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.contactHandlesForTopics", ", buf, 2u);
  }

  v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  v33 = 0;
  objc_msgSend(v7, "contactHandlesForTopics:error:", v6, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;
  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.contactHandlesForTopics", ", buf, 2u);
  }

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 0;
    v12 = *(void **)(a1[4] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-contactHandlesForTopics"), *(_QWORD *)(a1[4] + 40));
    v14 = a1[6];
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_2;
    v26[3] = &unk_1E7E1D4F0;
    v27 = v8;
    v28 = buf;
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_3;
    v23[3] = &unk_1E7E1D538;
    v16 = a1[6];
    v24 = a1[4];
    v25 = v16;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_5;
    v22[3] = &unk_1E7E1D560;
    v22[4] = v24;
    v22[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v26, v23, v22);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = (void *)MEMORY[0x1C3BD6630]();
    v34 = CFSTR("PPServerSideErrorInfoKey");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
    v35[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v18);
    v21 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v20);

    objc_msgSend(*(id *)(a1[4] + 8), "contactHandlesForTopicsBatch:isLast:error:queryId:completion:", 0, 1, v21, a1[6], &__block_literal_global_75_14938);
  }

}

id __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32)
    v7 = 50;
  else
    v7 = v4 - v5;
  v8 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  *a2 = v6 < 0x33;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return v9;
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactHandlesForTopicsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_78);
}

uint64_t __65__PPContactServerRequestHandler_contactHandlesForTopics_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contactHandlesForTopicsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.upcomingRelevantContactsForQuery", ", buf, 2u);
  }

  v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  v32 = 0;
  objc_msgSend(v7, "upcomingRelevantContactsForQuery:error:", v6, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.upcomingRelevantContactsForQuery", ", buf, 2u);
  }

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = *(void **)(a1[4] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-upcomingRelevantContactsForQuery"), *(_QWORD *)(a1[4] + 40));
    v14 = a1[6];
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_2;
    v25[3] = &unk_1E7E1D4F0;
    v26 = v8;
    v27 = buf;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_3;
    v22[3] = &unk_1E7E1D538;
    v16 = a1[6];
    v23 = a1[4];
    v24 = v16;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_5;
    v21[3] = &unk_1E7E1D560;
    v21[4] = v23;
    v21[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v25, v22, v21);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = CFSTR("PPServerSideErrorInfoKey");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
    v34[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v19);

    objc_msgSend(*(id *)(a1[4] + 8), "upcomingRelevantContactsBatch:isLast:error:queryId:completion:", 0, 1, v20, a1[6], &__block_literal_global_70_14945);
  }

}

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "upcomingRelevantContactsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_73);
}

uint64_t __74__PPContactServerRequestHandler_upcomingRelevantContactsForQuery_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "upcomingRelevantContactsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactServer.rankedContactsWithQuery", ", buf, 2u);
  }

  v6 = a1[5];
  v7 = *(void **)(a1[4] + 32);
  v32 = 0;
  objc_msgSend(v7, "rankedContactsWithQuery:error:", v6, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPContactServer.rankedContactsWithQuery", ", buf, 2u);
  }

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = *(void **)(a1[4] + 16);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-rankedContactsWithQuery"), *(_QWORD *)(a1[4] + 40));
    v14 = a1[6];
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_2;
    v25[3] = &unk_1E7E1D4F0;
    v26 = v8;
    v27 = buf;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_3;
    v22[3] = &unk_1E7E1D538;
    v16 = a1[6];
    v23 = a1[4];
    v24 = v16;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_5;
    v21[3] = &unk_1E7E1D560;
    v21[4] = v23;
    v21[5] = v16;
    objc_msgSend(v12, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v13, v14, v25, v22, v21);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = CFSTR("PPServerSideErrorInfoKey");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
    v34[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v19);

    objc_msgSend(*(id *)(a1[4] + 8), "rankedContactsBatch:isLast:error:queryId:completion:", 0, 1, v20, a1[6], &__block_literal_global_14953);
  }

}

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedContactsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_65_14955);
}

uint64_t __65__PPContactServerRequestHandler_rankedContactsWithQuery_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedContactsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

@end
