@implementation PPContactClient

- (PPContactClient)init
{
  PPContactClient *v2;
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
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  PPXPCClientHelper *v24;
  PPXPCClientHelper *clientHelper;
  PPXPCClientPipelinedBatchQueryManager *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PPContactClient;
  v2 = -[PPContactClient init](&v37, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BAC8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE015190);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_rankedContactsBatch_isLast_error_queryId_completion_, 0, 0);

    v9 = (void *)MEMORY[0x18D7805AC]();
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_upcomingRelevantContactsBatch_isLast_error_queryId_completion_, 0, 0);

    v13 = (void *)MEMORY[0x18D7805AC]();
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_contactNameRecordBatch_isLast_error_queryId_completion_, 0, 0);

    v17 = (void *)MEMORY[0x18D7805AC]();
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = objc_opt_class();
    v20 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_contactNameRecordChangesBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v21 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __23__PPContactClient_init__block_invoke;
    v34[3] = &unk_1E226B998;
    objc_copyWeak(&v35, &location);
    v22 = (void *)MEMORY[0x18D780768](v34);
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __23__PPContactClient_init__block_invoke_76;
    v32[3] = &unk_1E226B998;
    objc_copyWeak(&v33, &location);
    v23 = (void *)MEMORY[0x18D780768](v32);
    v24 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"), v3, v4, v2, v22, v23);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v24;

    v26 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v26, "initWithName:", v28);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"));
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

- (BOOL)rankedContactsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "rankedContactsWithQuery called", buf, 2u);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("rankedContactsWithQuery");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedContactsWithQuery"), a4, v21, v17);

  return v15;
}

- (BOOL)contactHandlesForTopics:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "contactHandlesForTopics called", buf, 2u);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("contactHandlesForTopics");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("contactHandlesForTopics"), a4, v21, v17);

  return v15;
}

- (BOOL)contactHandlesForSource:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "contactHandlesForSource called", buf, 2u);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("contactHandlesForSource");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("contactHandlesForSource"), a4, v21, v17);

  return v15;
}

- (void)rankedContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "rankedContactsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("rankedContactsBatch"), v14, v9, v13, a6, v12);
}

- (void)contactHandlesForTopicsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "contactHandlesForTopicsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("contactHandlesForTopicsBatch"), v14, v9, v13, a6, v12);
}

- (void)contactHandlesForSourceBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "contactHandlesForSourceBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("contactHandlesForSourceBatch"), v14, v9, v13, a6, v12);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  pp_xpc_client_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v12, 0xCu);

  }
  -[PPContactClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerFeedback:completion:", v8, v7);

}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  pp_xpc_client_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_DEBUG, "feedbackDisambiguationResultWithContactChoices called", v13, 2u);
  }

  -[PPContactClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feedbackDisambiguationResultWithChoicesIdentifiers:chosenContactIdentifier:completion:", v10, v9, v8);

}

- (BOOL)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "upcomingRelevantContactsForQuery called", buf, 2u);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("upcomingRelevantContactsForQuery");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("upcomingRelevantContactsForQuery"), a4, v21, v17);

  return v15;
}

- (void)upcomingRelevantContactsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "upcomingRelevantContactsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("upcomingRelevantContactsBatch"), v14, v9, v13, a6, v12);
}

- (BOOL)contactNameRecordsForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "contactNameRecordsForClient:%@ called", buf, 0xCu);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("contactNameRecordsWithError");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("contactNameRecordsWithError"), a4, v21, v17);

  return v15;
}

- (void)contactNameRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "contactNameRecordBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("contactNameRecordBatch"), v14, v9, v13, a6, v12);
}

- (void)contactNameRecordChangesForClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pp_xpc_client_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_debug_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesForClient:%@ called", (uint8_t *)&v10, 0xCu);
  }

  -[PPContactClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactNameRecordChangesForClient:completion:", v6, v7);

}

- (BOOL)contactNameRecordChangesForClient:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
    _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesForClient:%@ called", buf, 0xCu);
  }

  v11 = objc_opt_class();
  queryManager = self->_queryManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke;
  v21[3] = &unk_1E226B9C0;
  v21[4] = self;
  v22 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke_2;
  v17[3] = &unk_1E226B9E8;
  v19 = v9;
  v20 = v11;
  v18 = CFSTR("contactNameRecordChangesForClient");
  v13 = v9;
  v14 = v8;
  v15 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("contactNameRecordChangesForClient"), a4, v21, v17);

  return v15;
}

- (void)contactNameRecordChangesBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "contactNameRecordChangesBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("contactNameRecordChangesBatch"), v14, v9, v13, a6, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactNameRecordChangesForClient:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __71__PPContactClient_contactNameRecordChangesForClient_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactNameRecordsForClient:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __65__PPContactClient_contactNameRecordsForClient_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "upcomingRelevantContactsForQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __70__PPContactClient_upcomingRelevantContactsForQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactHandlesForSource:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __61__PPContactClient_contactHandlesForSource_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactHandlesForTopics:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __61__PPContactClient_contactHandlesForTopics_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedContactsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __61__PPContactClient_rankedContactsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __23__PPContactClient_init__block_invoke(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Contact");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __23__PPContactClient_init__block_invoke_76(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Contact");
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
  block[2] = __33__PPContactClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12_4731 != -1)
    dispatch_once(&sharedInstance__pasOnceToken12_4731, block);
  return (id)sharedInstance__pasExprOnceResult_4732;
}

void __33__PPContactClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4732;
  sharedInstance__pasExprOnceResult_4732 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
