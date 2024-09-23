@implementation PPLocationReadOnlyClient

- (PPLocationReadOnlyClient)init
{
  PPLocationReadOnlyClient *v2;
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
  uint64_t v13;
  void *v14;
  void *v15;
  PPXPCClientHelper *v16;
  PPXPCClientHelper *clientHelper;
  PPXPCClientPipelinedBatchQueryManager *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PPLocationReadOnlyClient;
  v2 = -[PPLocationReadOnlyClient init](&v29, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BCA8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE016838);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_locationBatch_isLast_error_queryId_completion_, 0, 0);

    v9 = (void *)MEMORY[0x18D7805AC]();
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_locationRecordBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __32__PPLocationReadOnlyClient_init__block_invoke;
    v26[3] = &unk_1E226B998;
    objc_copyWeak(&v27, &location);
    v14 = (void *)MEMORY[0x18D780768](v26);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __32__PPLocationReadOnlyClient_init__block_invoke_56;
    v24[3] = &unk_1E226B998;
    objc_copyWeak(&v25, &location);
    v15 = (void *)MEMORY[0x18D780768](v24);
    v16 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readOnly"), v3, v4, v2, v14, v15);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v16;

    v18 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v18, "initWithName:", v20);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readOnly"));
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D68];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 5, v6);

  -[PPXPCClientPipelinedBatchQueryManager cancelPendingQueriesWithError:](self->_queryManager, "cancelPendingQueriesWithError:", v7);
}

- (void)locationBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("locationBatch"), a3, a4, a5, a6, a7);
}

- (void)locationRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("locationRecordBatch"), a3, a4, a5, a6, a7);
}

- (id)_remoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)rankedLocationsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v12;
  id v13;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E226B9C0;
  v19[4] = self;
  v20 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E226B9E8;
  v17 = v9;
  v18 = v10;
  v16 = CFSTR("rankedLocationsWithQuery");
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedLocationsWithQuery"), a4, v19, v15);

  return (char)a4;
}

- (BOOL)locationRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v12;
  id v13;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E226B9C0;
  v19[4] = self;
  v20 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E226B9E8;
  v17 = v9;
  v18 = v10;
  v16 = CFSTR("locationRecordsWithQuery");
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("locationRecordsWithQuery"), a4, v19, v15);

  return (char)a4;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPLocationReadOnlyClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationRecordsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __71__PPLocationReadOnlyClient_locationRecordsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedLocationsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __71__PPLocationReadOnlyClient_rankedLocationsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __32__PPLocationReadOnlyClient_init__block_invoke(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readOnly");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __32__PPLocationReadOnlyClient_init__block_invoke_56(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readOnly");
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
  block[2] = __42__PPLocationReadOnlyClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8_6000 != -1)
    dispatch_once(&sharedInstance__pasOnceToken8_6000, block);
  return (id)sharedInstance__pasExprOnceResult_6001;
}

void __42__PPLocationReadOnlyClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6001;
  sharedInstance__pasExprOnceResult_6001 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
