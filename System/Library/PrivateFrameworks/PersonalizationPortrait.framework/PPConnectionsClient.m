@implementation PPConnectionsClient

- (PPConnectionsClient)init
{
  PPConnectionsClient *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PPXPCClientHelper *v12;
  PPXPCClientHelper *clientHelper;
  PPXPCClientPipelinedBatchQueryManager *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PPConnectionsClient;
  v2 = -[PPConnectionsClient init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BB28);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0153F0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_recentLocationsBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __27__PPConnectionsClient_init__block_invoke;
    v22[3] = &unk_1E226B998;
    objc_copyWeak(&v23, &location);
    v10 = (void *)MEMORY[0x18D780768](v22);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __27__PPConnectionsClient_init__block_invoke_55;
    v20[3] = &unk_1E226B998;
    objc_copyWeak(&v21, &location);
    v11 = (void *)MEMORY[0x18D780768](v20);
    v12 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Connections"), v3, v4, v2, v10, v11);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v12;

    v14 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v14, "initWithName:", v16);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.Connections"));
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

- (BOOL)recentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 handleBatch:(id)a6
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
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  pp_xpc_client_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    _os_log_debug_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_DEBUG, "recentLocationDonationsSinceDate: %@ client: %@ called", buf, 0x16u);
  }

  v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke;
  v25[3] = &unk_1E226B970;
  v25[4] = self;
  v26 = v10;
  v27 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E226B9E8;
  v23 = v12;
  v24 = v14;
  v22 = CFSTR("recentLocationDonationsSinceDate");
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("recentLocationDonationsSinceDate"), a5, v25, v21);

  return v19;
}

- (BOOL)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 handleBatch:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v28[4];
  __CFString *v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  pp_xpc_client_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v39 = a3;
    v40 = 2112;
    v41 = v15;
    v42 = 2048;
    v43 = a5;
    _os_log_debug_impl(&dword_18BE3A000, v19, OS_LOG_TYPE_DEBUG, "recentLocationsForConsumer: %lu criteria: %@ limit: %lu called", buf, 0x20u);
  }

  v20 = objc_opt_class();
  queryManager = self->_queryManager;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke;
  v32[3] = &unk_1E226AD88;
  v32[4] = self;
  v33 = v15;
  v36 = a3;
  v37 = a5;
  v34 = v16;
  v35 = v17;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke_2;
  v28[3] = &unk_1E226B9E8;
  v30 = v18;
  v31 = v20;
  v29 = CFSTR("recentLocationsForConsumer");
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("recentLocationsForConsumer"), a8, v32, v28);

  return v26;
}

- (void)recentLocationsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "recentLocationsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("recentLocationsBatch"), v14, v9, v13, a6, v12);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPConnectionsClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentLocationsForConsumer:criteria:limit:explanationSet:client:queryId:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);

}

void __105__PPConnectionsClient_recentLocationsForConsumer_criteria_limit_explanationSet_client_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentLocationDonationsSinceDate:client:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

void __81__PPConnectionsClient_recentLocationDonationsSinceDate_client_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __27__PPConnectionsClient_init__block_invoke(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Connections");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __27__PPConnectionsClient_init__block_invoke_55(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Connections");
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
  block[2] = __37__PPConnectionsClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_4797 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_4797, block);
  return (id)sharedInstance__pasExprOnceResult_4798;
}

void __37__PPConnectionsClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4798;
  sharedInstance__pasExprOnceResult_4798 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
