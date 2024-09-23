@implementation PPTopicReadOnlyClient

- (PPTopicReadOnlyClient)init
{
  PPTopicReadOnlyClient *v2;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PPXPCClientHelper *v25;
  PPXPCClientHelper *clientHelper;
  PPXPCClientPipelinedBatchQueryManager *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PPTopicReadOnlyClient;
  v2 = -[PPTopicReadOnlyClient init](&v38, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BA68);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE014538);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x18D7805AC]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_topicBatch_isLast_error_queryId_completion_, 0, 0);

    v9 = (void *)MEMORY[0x18D7805AC]();
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_topicRecordBatch_isLast_error_queryId_completion_, 0, 0);

    v13 = (void *)MEMORY[0x18D7805AC]();
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_topicExtractionsFromTextBatch_isLast_error_queryId_completion_, 0, 0);

    v17 = (void *)MEMORY[0x18D7805AC]();
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_scoredMappedTopicBatch_isLast_error_queryId_completion_, 0, 0);

    location = 0;
    objc_initWeak(&location, v2);
    v22 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __29__PPTopicReadOnlyClient_init__block_invoke;
    v35[3] = &unk_1E226B998;
    objc_copyWeak(&v36, &location);
    v23 = (void *)MEMORY[0x18D780768](v35);
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __29__PPTopicReadOnlyClient_init__block_invoke_78;
    v33[3] = &unk_1E226B998;
    objc_copyWeak(&v34, &location);
    v24 = (void *)MEMORY[0x18D780768](v33);
    v25 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"), v3, v4, v2, v23, v24);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v25;

    v27 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PPXPCClientPipelinedBatchQueryManager initWithName:](v27, "initWithName:", v29);
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v30;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("connection to %@ was unexpectedly terminated"), CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"));
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D68];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 5, v6);

  -[PPXPCClientPipelinedBatchQueryManager cancelPendingQueriesWithError:](self->_queryManager, "cancelPendingQueriesWithError:", v7);
}

- (void)topicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("topicBatch"), a3, a4, a5, a6, a7);
}

- (void)topicRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("topicRecordBatch"), a3, a4, a5, a6, a7);
}

- (void)topicExtractionsFromTextBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("topicExtractionsFromTextBatch"), a3, a4, a5, a6, a7);
}

- (void)scoredMappedTopicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  -[PPXPCClientPipelinedBatchQueryManager handleReplyWithName:batch:isLast:error:queryId:completion:](self->_queryManager, "handleReplyWithName:batch:isLast:error:queryId:completion:", CFSTR("scoredMappedTopicBatch"), a3, a4, a5, a6, a7);
}

- (id)_remoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)rankedTopicsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
  v19[2] = __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E226B9C0;
  v19[4] = self;
  v20 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E226B9E8;
  v17 = v9;
  v18 = v10;
  v16 = CFSTR("rankedTopicsWithQuery");
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("rankedTopicsWithQuery"), a4, v19, v15);

  return (char)a4;
}

- (BOOL)topicRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
  v19[2] = __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E226B9C0;
  v19[4] = self;
  v20 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E226B9E8;
  v17 = v9;
  v18 = v10;
  v16 = CFSTR("topicRecordsWithQuery");
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("topicRecordsWithQuery"), a4, v19, v15);

  return (char)a4;
}

- (BOOL)topicExtractionsFromText:(id)a3 error:(id *)a4 handleBatch:(id)a5
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
  v19[2] = __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke;
  v19[3] = &unk_1E226B9C0;
  v19[4] = self;
  v20 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E226B9E8;
  v17 = v9;
  v18 = v10;
  v16 = CFSTR("topicExtractionsForText");
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("topicExtractionsForText"), a4, v19, v15);

  return (char)a4;
}

- (BOOL)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  PPXPCClientPipelinedBatchQueryManager *queryManager;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  SEL v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  queryManager = self->_queryManager;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke;
  v26[3] = &unk_1E226B970;
  v26[4] = self;
  v27 = v11;
  v28 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E226AAF0;
  v23 = a2;
  v24 = v14;
  v25 = v15;
  v21[4] = self;
  v22 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  LOBYTE(a5) = -[PPXPCClientPipelinedBatchQueryManager syncExecuteQueryWithName:error:queryInitializer:handleBatch:](queryManager, "syncExecuteQueryWithName:error:queryInitializer:handleBatch:", CFSTR("scoresForTopicMapping"), a5, v26, v21);

  return (char)a5;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4029;
  v35 = __Block_byref_object_dispose__4030;
  v10 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke;
  v30[3] = &unk_1E226BEA8;
  v30[4] = &v31;
  v11 = (void *)MEMORY[0x18D780768](v30);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4029;
  v28 = __Block_byref_object_dispose__4030;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4029;
  v22 = __Block_byref_object_dispose__4030;
  v23 = 0;
  -[PPTopicReadOnlyClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke_2;
  v17[3] = &unk_1E226AB18;
  v17[4] = &v24;
  v17[5] = &v18;
  objc_msgSend(v12, "unmapMappedTopicIdentifier:mappingIdentifier:completion:", v8, v9, v17);

  if (a5)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  if (a5 && (v14 = (void *)v32[5]) != 0)
  {
    v15 = 0;
    *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    v15 = (id)v25[5];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPTopicReadOnlyClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v7, v6);

}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPTopicReadOnlyClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerUniversalSearchSpotlightFeedback:completion:", v7, v6);

}

- (id)cachePath:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4029;
  v30 = __Block_byref_object_dispose__4030;
  v5 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __35__PPTopicReadOnlyClient_cachePath___block_invoke;
  v25[3] = &unk_1E226BEA8;
  v25[4] = &v26;
  v6 = (void *)MEMORY[0x18D780768](v25, a2);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4029;
  v23 = __Block_byref_object_dispose__4030;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4029;
  v17 = __Block_byref_object_dispose__4030;
  v18 = 0;
  -[PPTopicReadOnlyClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __35__PPTopicReadOnlyClient_cachePath___block_invoke_2;
  v12[3] = &unk_1E226AB40;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v7, "cachePath:", v12);

  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  if (a3 && (v9 = (void *)v27[5]) != 0)
  {
    v10 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4029;
  v30 = __Block_byref_object_dispose__4030;
  v5 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke;
  v25[3] = &unk_1E226BEA8;
  v25[4] = &v26;
  v6 = (void *)MEMORY[0x18D780768](v25, a2);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4029;
  v23 = __Block_byref_object_dispose__4030;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4029;
  v17 = __Block_byref_object_dispose__4030;
  v18 = 0;
  -[PPTopicReadOnlyClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke_2;
  v12[3] = &unk_1E226AB40;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v7, "topicCacheSandboxExtensionToken:", v12);

  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  if (a3 && (v9 = (void *)v27[5]) != 0)
  {
    v10 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __35__PPTopicReadOnlyClient_cachePath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__PPTopicReadOnlyClient_cachePath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoresForTopicMapping:query:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

}

void __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "count") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PPTopicReadOnlyClient.m"), 213, CFSTR("scoresForTopicMapping unexpectedly received batch size with odd length"));

  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)objc_msgSend(v11, "count") >> 1);
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v4 = 1;
    do
    {
      v5 = (void *)MEMORY[0x18D7805AC]();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v4 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PPTopicReadOnlyClient.m"), 220, CFSTR("scoresForTopicMapping unexpectedly received incorrectly typed batch content"));

      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, v7);
      objc_msgSend(v3, "addObject:", v8);

      objc_autoreleasePoolPop(v5);
      v4 += 2;
    }
    while (v4 < objc_msgSend(v11, "count"));
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicExtractionsFromText:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicRecordsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankedTopicsWithQuery:queryId:", *(_QWORD *)(a1 + 40), a2);

}

void __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke_2(_QWORD *a1, void *a2)
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

void __29__PPTopicReadOnlyClient_init__block_invoke(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly");
    _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unblockPendingQueries");

}

void __29__PPTopicReadOnlyClient_init__block_invoke_78(uint64_t a1)
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
    v5 = CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly");
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
  block[2] = __39__PPTopicReadOnlyClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12_4093 != -1)
    dispatch_once(&sharedInstance__pasOnceToken12_4093, block);
  return (id)sharedInstance__pasExprOnceResult_4094;
}

void __39__PPTopicReadOnlyClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4094;
  sharedInstance__pasExprOnceResult_4094 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
