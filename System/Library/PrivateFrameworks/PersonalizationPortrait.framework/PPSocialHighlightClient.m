@implementation PPSocialHighlightClient

- (void)rankedHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
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
  pp_social_highlights_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "rankedHighlightsBatch called", v16, 2u);
  }

  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("rankedHighlightsBatch"), v14, v9, v13, a6, v12);
}

void __41__PPSocialHighlightClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2749;
  sharedInstance__pasExprOnceResult_2749 = v1;

  objc_autoreleasePoolPop(v0);
}

- (PPSocialHighlightClient)init
{
  PPSocialHighlightClient *v2;
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
  v25.super_class = (Class)PPSocialHighlightClient;
  v2 = -[PPSocialHighlightClient init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01B9A8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE012670);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_rankedHighlightsBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __31__PPSocialHighlightClient_init__block_invoke;
    v22[3] = &unk_1E226B998;
    objc_copyWeak(&v23, &location);
    v10 = (void *)MEMORY[0x18D780768](v22);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __31__PPSocialHighlightClient_init__block_invoke_63;
    v20[3] = &unk_1E226B998;
    objc_copyWeak(&v21, &location);
    v11 = (void *)MEMORY[0x18D780768](v20);
    v12 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight"), v3, v4, v2, v10, v11);
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

- (BOOL)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
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
  unint64_t v30;
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a7;
  pp_social_highlights_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "rankedHighlightsWithLimit called", buf, 2u);
  }

  v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke;
  v27[3] = &unk_1E226A5E8;
  v27[4] = self;
  v28 = v12;
  v29 = v13;
  v30 = a3;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E226B9E8;
  v25 = v14;
  v26 = v16;
  v24 = CFSTR("rankedHighlightsWithLimit");
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedHighlightsWithLimit"), a6, v27, v23);

  return v21;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PPSocialHighlightClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  return (id)sharedInstance__pasExprOnceResult_2749;
}

void __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedHighlightsWithLimit:client:variant:queryId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

- (id)_remoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

void __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __31__PPSocialHighlightClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_social_highlights_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight"));
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D68];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 5, v6);

  -[PPXPCClientPipelinedBatchQueryManager cancelPendingQueriesWithError:](self->_queryManager, "cancelPendingQueriesWithError:", v7);
}

- (id)_internalRemoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (double)decayInterval
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  pp_social_highlights_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v3, OS_LOG_TYPE_DEBUG, "decayInterval called", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2697;
  v26 = __Block_byref_object_dispose__2698;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2697;
  v20 = __Block_byref_object_dispose__2698;
  v4 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__PPSocialHighlightClient_decayInterval__block_invoke;
  v15[3] = &unk_1E226BEA8;
  v15[4] = &v16;
  v5 = (void *)MEMORY[0x18D780768](v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __40__PPSocialHighlightClient_decayInterval__block_invoke_2;
  v14[3] = &unk_1E226A5C0;
  v14[4] = buf;
  v14[5] = &v16;
  v6 = (void *)MEMORY[0x18D780768](v14);
  -[PPSocialHighlightClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decayIntervalWithCompletion:", v6);

  v8 = (void *)*((_QWORD *)v23 + 5);
  if (v8)
    goto LABEL_7;
  pp_social_highlights_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v13 = v17[5];
    *(_DWORD *)v28 = 138412290;
    v29 = v13;
    _os_log_error_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_ERROR, "PPSocialHighlightClient: failed to fetch decay interval: %@", v28, 0xCu);
  }

  v8 = (void *)*((_QWORD *)v23 + 5);
  if (v8)
  {
LABEL_7:
    objc_msgSend(v8, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 31536000.0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v11;
}

- (BOOL)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
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
  unint64_t v30;
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a7;
  pp_social_highlights_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "rankedCollaborationsWithLimit called", buf, 2u);
  }

  v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke;
  v27[3] = &unk_1E226A5E8;
  v27[4] = self;
  v28 = v12;
  v29 = v13;
  v30 = a3;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E226B9E8;
  v25 = v14;
  v26 = v16;
  v24 = CFSTR("rankedCollaborationsWithLimit");
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedCollaborationsWithLimit"), a6, v27, v23);

  return v21;
}

- (BOOL)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  _QWORD v25[4];
  __CFString *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  pp_social_highlights_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEBUG, "rankedHighlightsForSyncedItems called", buf, 2u);
  }

  v17 = objc_opt_class();
  queryManager = self->_queryManager;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke;
  v29[3] = &unk_1E226A610;
  v29[4] = self;
  v30 = v12;
  v31 = v13;
  v32 = v14;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke_2;
  v25[3] = &unk_1E226B9E8;
  v27 = v15;
  v28 = v17;
  v26 = CFSTR("rankedHighlightsForSyncedItems");
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedHighlightsForSyncedItems"), a6, v29, v25);

  return v23;
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2697;
  v25 = __Block_byref_object_dispose__2698;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2697;
  v19 = __Block_byref_object_dispose__2698;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke;
  v14[3] = &unk_1E226A848;
  v14[4] = &v21;
  v14[5] = &v15;
  v8 = (void *)MEMORY[0x18D780768](v14);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E226A638;
  v13[4] = &v21;
  v13[5] = &v15;
  v9 = (void *)MEMORY[0x18D780768](v13);
  -[PPSocialHighlightClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributionForIdentifier:completion:", v6, v9);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  pp_social_highlights_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v12;
    v22 = 2048;
    v23 = a4;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEFAULT, "Received feedback for highlight: %@ with type: %lu from client: '%@' variant: '%@'", (uint8_t *)&v20, 0x2Au);
  }

  if (v15)
    v17 = v15;
  else
    v17 = &__block_literal_global_2696;
  v18 = (void *)MEMORY[0x18D780768](v17);

  -[PPSocialHighlightClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "feedbackForHighlight:type:client:variant:completion:", v12, a4, v13, v14, v18);

}

- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  pp_social_highlights_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v12;
    v22 = 2048;
    v23 = a4;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEFAULT, "Received feedback for attribution: %@ with type: %lu from client: '%@' variant: '%@'", (uint8_t *)&v20, 0x2Au);
  }

  if (v15)
    v17 = v15;
  else
    v17 = &__block_literal_global_88;
  v18 = (void *)MEMORY[0x18D780768](v17);

  -[PPSocialHighlightClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "feedbackForAttribution:type:client:variant:completion:", v12, a4, v13, v14, v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedHighlightsForSyncedItems:client:variant:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);

}

void __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_internalRemoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedCollaborationsWithLimit:client:variant:queryId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

void __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __40__PPSocialHighlightClient_decayInterval__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__PPSocialHighlightClient_decayInterval__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __31__PPSocialHighlightClient_init__block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_social_highlights_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight");
    _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

@end
