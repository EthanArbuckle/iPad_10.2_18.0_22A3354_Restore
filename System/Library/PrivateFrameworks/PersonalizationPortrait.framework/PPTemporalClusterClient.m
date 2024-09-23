@implementation PPTemporalClusterClient

- (PPTemporalClusterClient)init
{
  PPTemporalClusterClient *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  void *context;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PPTemporalClusterClient;
  v2 = -[PPTemporalClusterClient init](&v31, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BC48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE016720);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x18D7805AC]();
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(context);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_rankedTemporalClusterBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __31__PPTemporalClusterClient_init__block_invoke;
    v28[3] = &unk_1E226B998;
    objc_copyWeak(&v29, &location);
    v14 = (void *)MEMORY[0x18D780768](v28);
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __31__PPTemporalClusterClient_init__block_invoke_53;
    v26[3] = &unk_1E226B998;
    objc_copyWeak(&v27, &location);
    v15 = (void *)MEMORY[0x18D780768](v26);
    v16 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"), v25, v3, v2, v14, v15);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v16;

    v18 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v18, "initWithName:", v20);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"));
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

- (BOOL)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 handleBatch:(id)a6
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
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  pp_temporal_clusters_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_DEBUG, "rankedTemporalClustersForStartDate called", buf, 2u);
  }

  v14 = objc_opt_class();
  queryManager = self->_queryManager;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke;
  v25[3] = &unk_1E226B970;
  v25[4] = self;
  v26 = v10;
  v27 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E226B9E8;
  v23 = v12;
  v24 = v14;
  v22 = CFSTR("rankedTemporalClustersForStartDate");
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedTemporalClustersForStartDate"), a5, v25, v21);

  return v19;
}

- (void)rankedTemporalClusterBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
  pp_temporal_clusters_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "rankedTemporalClusterBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("rankedTemporalClusterBatch"), v14, v9, v13, a6, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedTemporalClustersForStartDate:endDate:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

void __88__PPTemporalClusterClient_rankedTemporalClustersForStartDate_endDate_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __31__PPTemporalClusterClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_temporal_clusters_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __31__PPTemporalClusterClient_init__block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_temporal_clusters_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster");
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
  block[2] = __41__PPTemporalClusterClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_5934 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_5934, block);
  return (id)sharedInstance__pasExprOnceResult_5935;
}

void __41__PPTemporalClusterClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5935;
  sharedInstance__pasExprOnceResult_5935 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
