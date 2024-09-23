@implementation PPTopicReadOnlyServerRequestHandler

- (PPTopicReadOnlyServerRequestHandler)init
{
  PPTopicReadOnlyServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPTopicReadOnlyServerRequestHandler;
  v2 = -[PPTopicReadOnlyServerRequestHandler init](&v6, sel_init);
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

- (void)rankedTopicsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSString *clientProcessName;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    v18 = a4;
    v19 = 2112;
    v20 = clientProcessName;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E7E1ED88;
  v14[4] = self;
  v16 = a4;
  v10 = v6;
  v15 = v10;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    objc_msgSend(v10, "customizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v18 = a4;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);

  }
}

- (void)topicRecordsWithQuery:(id)a3 queryId:(unint64_t)a4
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
  PPTopicReadOnlyServerRequestHandler *v16;
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E7E1ED88;
  v10 = v6;
  v16 = self;
  v17 = a4;
  v15 = v10;
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
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);

  }
}

- (void)topicExtractionsFromText:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSString *clientProcessName;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v10;
  NSObject *v11;
  NSString *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  PPTopicReadOnlyServerRequestHandler *v16;
  unint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  uint64_t v23;
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke;
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
    v13 = objc_msgSend(v10, "length");
    *(_DWORD *)buf = 134218498;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    v22 = 2048;
    v23 = v13;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText queryId:%llu process:%@ text size:%tu", buf, 0x20u);
  }

}

- (void)scoresForTopicMapping:(id)a3 query:(id)a4 queryId:(unint64_t)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSString *clientProcessName;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v14;
  id v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PPTopicReadOnlyServerRequestHandler *v22;
  unint64_t v23;
  SEL v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    v26 = a5;
    v27 = 2112;
    v28 = clientProcessName;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke;
  v19[3] = &unk_1E7E1A1D0;
  v14 = v9;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  v22 = self;
  v23 = a5;
  v24 = a2;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v19);
  pp_xpc_server_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_clientProcessName;
    objc_msgSend(v15, "customizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v26 = a5;
    v27 = 2112;
    v28 = v17;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping queryId:%llu process:%@ mappingId:%@ query:%@", buf, 0x2Au);

  }
}

- (void)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  NSString *clientProcessName;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSString *v31;
  id v32;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  pp_xpc_server_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138412290;
    v34 = clientProcessName;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: unmapMappedTopicIdentifier process:%@", buf, 0xCu);
  }

  pp_topics_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  pp_topics_signpost_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PPTopicReadOnlyServer.unmapMappedTopicIdentifier", ", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v17, "unmapMappedTopicIdentifier:mappingIdentifier:error:", v8, v9, &v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v32;

  pp_topics_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v21, OS_SIGNPOST_INTERVAL_END, v14, "PPTopicReadOnlyServer.unmapMappedTopicIdentifier", ", buf, 2u);
  }

  if (v18 || !v19)
  {
    if (v18)
    {
      v26 = (void *)objc_opt_class();
      v27 = self->_clientProcessName;
      +[PPTopicAllowlist sharedInstance](PPTopicAllowlist, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "filterQIDDictionary:withAllowlistOfProcess:allowlist:", v18, v27, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      pp_xpc_server_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: received nil unmapped dictionary.", buf, 2u);
      }

      objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
      v25 = (void *)MEMORY[0x1E0C9AA70];
    }
    v10[2](v10, v25, 0);
    pp_xpc_server_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_clientProcessName;
      *(_DWORD *)buf = 138412546;
      v34 = v31;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: unmapMappedTopicIdentifier process:%@ mappingIdentifier:%@", buf, 0x16u);
    }

  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v37 = CFSTR("PPServerSideErrorInfoKey");
    objc_msgSend(v19, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v24);

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v25);
  }

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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: registerFeedback", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PPTopicReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke;
  v10[3] = &unk_1E7E1D5C8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "registerFeedback:completion:", v6, v10);

}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerUniversalSearchSpotlightFeedback:completion:", v6, v5);

}

- (void)cachePath:(id)a3
{
  void (**v3)(id, void *, id);
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v3 = (void (**)(id, void *, id))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: cachePath", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "cachePath:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)topicCacheSandboxExtensionToken:(id)a3
{
  void (**v3)(id, void *, id);
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v3 = (void (**)(id, void *, id))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicCacheSandboxExtensionToken", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "topicCacheSandboxExtensionToken:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v3[2](v3, v6, v7);
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

uint64_t __67__PPTopicReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke(_QWORD *a1)
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
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  __int128 *p_buf;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  __int128 buf;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  pp_topics_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_topics_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.scoresForTopicMapping", ", (uint8_t *)&buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = a1[5];
  v35 = 0;
  objc_msgSend(v6, "scoresForTopicMapping:query:error:clientProcessName:", v7, v8, &v35, *(_QWORD *)(a1[6] + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;

  pp_topics_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.scoresForTopicMapping", ", (uint8_t *)&buf, 2u);
  }

  if (v10)
  {
    pp_xpc_server_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1[6] + 8), "scoredMappedTopicBatch:isLast:error:queryId:completion:", 0, 1, v10, a1[7], &__block_literal_global_162);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(v9, "count"));
    v15 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2;
    v33[3] = &unk_1E7E1FAB8;
    v16 = v14;
    v34 = v16;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v33);
    pp_xpc_server_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v9, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x2020000000;
    v38 = 0;
    v19 = *(void **)(a1[6] + 16);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-scoresForTopicMapping"), *(_QWORD *)(a1[6] + 24));
    v21 = a1[7];
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_167;
    v28[3] = &unk_1E7E1A188;
    v22 = v16;
    v23 = a1[8];
    p_buf = &buf;
    v32 = v23;
    v24 = a1[6];
    v25 = a1[7];
    v29 = v22;
    v30 = v24;
    v26[5] = v25;
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2_173;
    v27[3] = &unk_1E7E1D538;
    v27[4] = v24;
    v27[5] = v25;
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_4;
    v26[3] = &unk_1E7E1D560;
    v26[4] = v24;
    objc_msgSend(v19, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v20, v21, v28, v27, v26);

    _Block_object_dispose(&buf, 8);
  }

}

void __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_167(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  void *v9;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32)
    v7 = 50;
  else
    v7 = v4 - v5;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PPTopicReadOnlyServer.m"), 327, CFSTR("Batch size should never be odd"));

  }
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v5, v7);
  *a2 = v6 < 0x33;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v7;
  return result;
}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2_173(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scoredMappedTopicBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_174);
}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scoredMappedTopicBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke(_QWORD *a1)
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
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  __int128 *p_buf;
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  pp_topics_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_topics_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.topicExtractionsFromText", ", (uint8_t *)&buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = *(_QWORD *)(a1[5] + 24);
  v28 = 0;
  objc_msgSend(v6, "topicExtractionsFromText:clientProcessName:error:", v7, v8, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;

  pp_topics_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.topicExtractionsFromText", ", (uint8_t *)&buf, 2u);
  }

  pp_xpc_server_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1[5] + 8), "topicExtractionsFromTextBatch:isLast:error:queryId:completion:", 0, 1, v10, a1[6], &__block_literal_global_156);
  }
  else
  {
    if (v14)
    {
      v15 = objc_msgSend(v9, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x2020000000;
    v31 = 0;
    v16 = *(void **)(a1[5] + 16);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-topicExtractionsFromText"), *(_QWORD *)(a1[5] + 24));
    v18 = a1[6];
    v19 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_159;
    v25[3] = &unk_1E7E1D4F0;
    v26 = v9;
    p_buf = &buf;
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_2;
    v22[3] = &unk_1E7E1D538;
    v20 = a1[6];
    v23 = a1[5];
    v24 = v20;
    v21[0] = v19;
    v21[1] = 3221225472;
    v21[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_4;
    v21[3] = &unk_1E7E1D560;
    v21[4] = v23;
    v21[5] = v20;
    objc_msgSend(v16, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v17, v18, v25, v22, v21);

    _Block_object_dispose(&buf, 8);
  }

}

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_159(uint64_t a1, BOOL *a2)
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

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicExtractionsFromTextBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_160);
}

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicExtractionsFromTextBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[4];
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _BYTE *v36;
  id v37;
  _BYTE buf[24];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  pp_topics_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_topics_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.topicRecordsWithQuery", ", buf, 2u);
  }

  v6 = objc_msgSend(*(id *)(a1 + 32), "limit");
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v7, "setLimit:", -1);
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v8, "topicRecordsWithQuery:error:", v7, &v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v37;

  pp_topics_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.topicRecordsWithQuery", ", buf, 2u);
  }

  if (v9)
  {
    v13 = (void *)objc_opt_class();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    +[PPTopicAllowlist sharedInstance](PPTopicAllowlist, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterTopicRecordsNotInAllowlist:withAllowlistOfProcess:allowlist:", v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") > v6)
    {
      objc_msgSend(v16, "subarrayWithRange:", 0, v6);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    pp_xpc_server_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery returned an error: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "topicRecordBatch:isLast:error:queryId:completion:", 0, 1, v10, *(_QWORD *)(a1 + 48), &__block_literal_global_150);
    }
    else
    {
      if (v19)
      {
        v23 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery returned %tu results", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v39 = 0;
      v24 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-topicRecordsWithQuery"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
      v26 = *(_QWORD *)(a1 + 48);
      v27 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_153;
      v34[3] = &unk_1E7E1D4F0;
      v28 = v16;
      v35 = v28;
      v36 = buf;
      v31[0] = v27;
      v31[1] = 3221225472;
      v31[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_2;
      v31[3] = &unk_1E7E1D538;
      v29 = *(_QWORD *)(a1 + 48);
      v32 = *(_QWORD *)(a1 + 40);
      v33 = v29;
      v30[0] = v27;
      v30[1] = 3221225472;
      v30[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_4;
      v30[3] = &unk_1E7E1D560;
      v30[4] = v32;
      v30[5] = v29;
      objc_msgSend(v24, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v25, v26, v34, v31, v30);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    pp_xpc_server_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 48);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      v39 = v10;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@ returned nil result with error: %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "topicRecordBatch:isLast:error:queryId:completion:", 0, 1, v10, *(_QWORD *)(a1 + 48), &__block_literal_global_148_12456);
  }

}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_153(uint64_t a1, BOOL *a2)
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

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicRecordBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_154_12460);
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicRecordBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

void __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[4];
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  _BYTE *v44;
  id v45;
  _BYTE buf[24];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  pp_topics_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_topics_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.rankedTopicsWithQuery", ", buf, 2u);
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", CFSTR("Apple Store")))
    goto LABEL_37;
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "checking client blocklist on behalf of Apple Store", buf, 2u);
  }

  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.store.Jolly"));

  if (v8)
  {
    pp_xpc_server_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "refusing connection from Apple Store due to client blocklist", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", 0, 1, 0, *(_QWORD *)(a1 + 48), &__block_literal_global_12470);
  }
  else
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", CFSTR("pptool")))
      goto LABEL_18;
LABEL_37:
    pp_xpc_server_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "checking client blocklist on behalf of pptool", buf, 2u);
    }

    v11 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.proactive.PersonalizationPortrait.pptool"));

    if (v12)
    {
      pp_xpc_server_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "refusing connection from pptool due to client blocklist", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", 0, 1, 0, *(_QWORD *)(a1 + 48), &__block_literal_global_132);
    }
    else
    {
LABEL_18:
      v14 = objc_msgSend(*(id *)(a1 + 40), "limit");
      v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(v15, "setLimit:", -1);
      +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v16, "rankedTopicsWithQuery:error:clientProcessName:", v15, &v45, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v45;

      pp_topics_signpost_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C392E000, v20, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.rankedTopicsWithQuery", ", buf, 2u);
      }

      if (v17)
      {
        v21 = (void *)objc_opt_class();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        +[PPTopicAllowlist sharedInstance](PPTopicAllowlist, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "filterScoredTopicsNotInAllowlist:withAllowlistOfProcess:allowlist:", v17, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "count") > v14)
        {
          objc_msgSend(v24, "subarrayWithRange:", 0, v14);
          v25 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v25;
        }
        pp_xpc_server_log_handle();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v27)
          {
            v28 = objc_msgSend(v24, "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v28;
            _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery returned %tu results", buf, 0xCu);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v47 = 0;
          v29 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-rankedTopicsWithQuery"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
          v31 = *(_QWORD *)(a1 + 48);
          v32 = MEMORY[0x1E0C809B0];
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_142;
          v42[3] = &unk_1E7E1D4F0;
          v33 = v24;
          v43 = v33;
          v44 = buf;
          v39[0] = v32;
          v39[1] = 3221225472;
          v39[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_2;
          v39[3] = &unk_1E7E1D538;
          v34 = *(_QWORD *)(a1 + 48);
          v40 = *(_QWORD *)(a1 + 32);
          v41 = v34;
          v38[0] = v32;
          v38[1] = 3221225472;
          v38[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_4;
          v38[3] = &unk_1E7E1D560;
          v38[4] = v40;
          v38[5] = v34;
          objc_msgSend(v29, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", v30, v31, v42, v39, v38);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v27)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v18;
            _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery returned an error: %@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", 0, 1, v18, *(_QWORD *)(a1 + 48), &__block_literal_global_138);
        }
      }
      else
      {
        pp_xpc_server_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *(_QWORD *)(a1 + 48);
          v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 2112;
          v47 = v18;
          _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEFAULT, "rankedTopicsWithQuery queryId:%llu process:%@ returned nil result with error: %@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", 0, 1, v18, *(_QWORD *)(a1 + 48), &__block_literal_global_135);
      }

    }
  }
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_142(uint64_t a1, BOOL *a2)
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

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_144);
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topicBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

+ (id)filterScoredTopicsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v7, "count") && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      objc_msgSend(v9, "indicesOfAllowedTopicsInScoredTopicArray:clientProcess:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      if (v12 >= objc_msgSend(v7, "count"))
      {
        v16 = v7;
      }
      else
      {
        v13 = objc_msgSend(v7, "count");
        v14 = objc_msgSend(v11, "count");
        pp_topics_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 134218498;
          v19 = v13 - v14;
          v20 = 2048;
          v21 = objc_msgSend(v7, "count");
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu scored topic due to allowlist for client process \"%@\", (uint8_t *)&v18, 0x20u);
        }

        objc_msgSend(v7, "objectsAtIndexes:", v11);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v16;

    }
    else
    {
      v10 = v7;
    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)filterTopicRecordsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v7, "count") && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      objc_msgSend(v9, "indicesOfAllowedTopicsInRecordArray:clientProcess:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      if (v12 >= objc_msgSend(v7, "count"))
      {
        v16 = v7;
      }
      else
      {
        v13 = objc_msgSend(v7, "count");
        v14 = objc_msgSend(v11, "count");
        pp_topics_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 134218498;
          v19 = v13 - v14;
          v20 = 2048;
          v21 = objc_msgSend(v7, "count");
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu topic records due to allowance policy for client process \"%@\", (uint8_t *)&v18, 0x20u);
        }

        objc_msgSend(v7, "objectsAtIndexes:", v11);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v16;

    }
    else
    {
      v10 = v7;
    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)filterQIDDictionary:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v7, "count") && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      objc_msgSend(v9, "filterTopicDictionary:clientProcess:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v13 = objc_msgSend(v7, "count");
      v14 = v7;
      if (v12 < v13)
      {
        v15 = objc_msgSend(v7, "count");
        v16 = objc_msgSend(v11, "count");
        pp_topics_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134218498;
          v20 = v15 - v16;
          v21 = 2048;
          v22 = objc_msgSend(v7, "count");
          v23 = 2112;
          v24 = v8;
          _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu qid records from mapping due to allowlist for client process \"%@\", (uint8_t *)&v19, 0x20u);
        }

        v14 = v11;
      }
      v10 = v14;

    }
    else
    {
      v10 = v7;
    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

@end
