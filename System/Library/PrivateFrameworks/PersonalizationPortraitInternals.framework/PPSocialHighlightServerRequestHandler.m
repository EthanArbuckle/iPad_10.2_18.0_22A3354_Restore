@implementation PPSocialHighlightServerRequestHandler

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (PPSocialHighlightServerRequestHandler)init
{
  PPSocialHighlightServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSocialHighlightServerRequestHandler;
  v2 = -[PPSocialHighlightServerRequestHandler init](&v6, sel_init);
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

- (void)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  dispatch_block_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  PPSocialHighlightServerRequestHandler *v21;
  unint64_t v22;
  unint64_t v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  qos_class_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  pp_xpc_server_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v25 = a3;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2048;
    v31 = a6;
    v32 = 1024;
    v33 = qos_class_self();
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: enqueue rankedHighlightsWithLimit: %tu client: '%@' variant: '%@' queryId: %llu qos: %du", buf, 0x30u);
  }

  if (rankedHighlightsWithLimit_client_variant_queryId___pasOnceToken3 != -1)
    dispatch_once(&rankedHighlightsWithLimit_client_variant_queryId___pasOnceToken3, &__block_literal_global_223);
  v13 = (void *)rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2;
  block[3] = &unk_1E7E1A1D0;
  v19 = v10;
  v20 = v11;
  v22 = a3;
  v23 = a6;
  v21 = self;
  v14 = v11;
  v15 = v10;
  v16 = v13;
  v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[PPXPCServerPipelinedBatchQueryManager waitForBlockWithRequestThrottle:](self->_queryManager, "waitForBlockWithRequestThrottle:", v17);
  dispatch_async(v16, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

void __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  id v31;
  _BYTE buf[24];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  qos_class_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  pp_xpc_server_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[7];
    v6 = a1[8];
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2112;
    v33 = v4;
    v34 = 2048;
    v35 = v6;
    v36 = 1024;
    v37 = qos_class_self();
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: execute rankedHighlightsWithLimit: %tu client: '%@' variant: '%@' queryId: %llu qos: %du", buf, 0x30u);
  }

  pp_social_highlights_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_social_highlights_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Server.rankedHighlightsWithLimit", ", buf, 2u);
  }

  +[PPLocalSocialHighlightStore defaultStore](PPLocalSocialHighlightStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = a1[5];
  v14 = a1[7];
  v15 = *(_QWORD *)(a1[6] + 32);
  v31 = 0;
  objc_msgSend(v11, "rankedHighlightsWithLimit:client:variant:applicationIdentifiers:error:", v14, v12, v13, v15, &v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v31;

  pp_social_highlights_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_END, v8, "Server.rankedHighlightsWithLimit", " enableTelemetry=YES ", buf, 2u);
  }

  if (v17)
  {
    objc_msgSend(*(id *)(a1[6] + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", 0, 1, v17, a1[8], &__block_literal_global_44);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 0;
    v20 = *(void **)(a1[6] + 16);
    v21 = a1[8];
    v22 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2_47;
    v28[3] = &unk_1E7E1D4F0;
    v29 = v16;
    v30 = buf;
    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_3;
    v25[3] = &unk_1E7E1D538;
    v23 = a1[8];
    v26 = a1[6];
    v27 = v23;
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_5;
    v24[3] = &unk_1E7E1D560;
    v24[4] = v26;
    v24[5] = v23;
    objc_msgSend(v20, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("rankedHighlightsWithLimit"), v21, v28, v25, v24);

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

- (void)unblockPendingQueries
{
  -[PPXPCServerPipelinedBatchQueryManager unblockPendingQueries](self->_queryManager, "unblockPendingQueries");
}

- (void)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  NSArray *applicationIdentifiers;
  id v11;
  NSArray *v12;
  NSArray *v13;
  id v14;

  applicationIdentifiers = self->_applicationIdentifiers;
  v11 = a5;
  v14 = a4;
  v12 = (NSArray *)-[NSArray mutableCopy](applicationIdentifiers, "mutableCopy");
  -[NSArray addObject:](v12, "addObject:", CFSTR("portraitCollaborations"));
  v13 = self->_applicationIdentifiers;
  self->_applicationIdentifiers = v12;

  -[PPSocialHighlightServerRequestHandler rankedHighlightsWithLimit:client:variant:queryId:](self, "rankedHighlightsWithLimit:client:variant:queryId:", a3, v14, v11, a6);
}

- (void)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  PPSocialHighlightServerRequestHandler *v22;
  unint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  pp_xpc_server_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = objc_msgSend(v10, "count");
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: rankedHighlightsForSyncedItems: %tu client: '%@' queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke;
  v18[3] = &unk_1E7E1D2B0;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = self;
  v23 = a6;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v18);

}

- (void)attributionForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: attributionForIdentifier: %@", buf, 0xCu);
  }

  pp_social_highlights_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_social_highlights_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Server.attributionForIdentifier", ", buf, 2u);
  }

  +[PPLocalSocialHighlightStore defaultStore](PPLocalSocialHighlightStore, "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v12, "attributionForIdentifier:error:", v5, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  pp_social_highlights_signpost_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v16, OS_SIGNPOST_INTERVAL_END, v9, "Server.attributionForIdentifier", " enableTelemetry=YES ", buf, 2u);
  }

  if (v13)
  {
    v6[2](v6, v13, 0);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = CFSTR("PPServerSideErrorInfoKey");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v14);
    v23 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v19);

    ((void (**)(id, void *, void *))v6)[2](v6, 0, v20);
  }

}

- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, uint64_t, _QWORD))a7;
  pp_xpc_server_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v33 = v11;
    v34 = 2048;
    v35 = a4;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: feedbackForHighlight: %@ type: %lu client: '%@' variant: '%@'", buf, 0x2Au);
  }

  pp_social_highlights_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  pp_social_highlights_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Server.feedbackForHighlight", ", buf, 2u);
  }

  +[PPLocalSocialHighlightStore defaultStore](PPLocalSocialHighlightStore, "defaultStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v21 = objc_msgSend(v20, "feedbackForHighlight:type:client:variant:error:", v11, a4, v12, v13, &v29);
  v22 = v29;

  pp_social_highlights_signpost_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v24, OS_SIGNPOST_INTERVAL_END, v17, "Server.feedbackForHighlight", " enableTelemetry=YES ", buf, 2u);
  }

  if ((v21 & 1) != 0)
  {
    v14[2](v14, 1, 0);
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = CFSTR("PPServerSideErrorInfoKey");
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v22);
    v31 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v27);

    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v28);
  }

}

- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, uint64_t, _QWORD))a7;
  pp_xpc_server_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v33 = v11;
    v34 = 2048;
    v35 = a4;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: feedbackForAttribution: %@ type: %lu client: '%@' variant: '%@'", buf, 0x2Au);
  }

  pp_social_highlights_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  pp_social_highlights_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Server.feedbackForAttribution", ", buf, 2u);
  }

  +[PPLocalSocialHighlightStore defaultStore](PPLocalSocialHighlightStore, "defaultStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v21 = objc_msgSend(v20, "feedbackForAttribution:type:client:variant:error:", v11, a4, v12, v13, &v29);
  v22 = v29;

  pp_social_highlights_signpost_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v24, OS_SIGNPOST_INTERVAL_END, v17, "Server.feedbackForAttribution", " enableTelemetry=YES ", buf, 2u);
  }

  if ((v21 & 1) != 0)
  {
    v14[2](v14, 1, 0);
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = CFSTR("PPServerSideErrorInfoKey");
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v22);
    v31 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("PPServerSideErrorDomain"), 1, v27);

    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v28);
  }

}

- (void)decayIntervalWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, double);
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void (**)(id, _QWORD, double))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: decayInterval", buf, 2u);
  }

  pp_social_highlights_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  pp_social_highlights_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Server.decayInterval", ", v15, 2u);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "socialHighlightDecayInterval");
  v11 = v10;

  pp_social_highlights_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v6, "Server.decayInterval", " enableTelemetry=YES ", v14, 2u);
  }

  v3[2](v3, 0, v11);
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

void __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke(_QWORD *a1)
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  pp_social_highlights_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_social_highlights_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Server.rankedHighlightsForSyncedItems", ", buf, 2u);
  }

  +[PPLocalSocialHighlightStore defaultStore](PPLocalSocialHighlightStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = *(_QWORD *)(a1[7] + 32);
  v30 = 0;
  objc_msgSend(v6, "rankedHighlightsForSyncedItems:client:variant:applicationIdentifiers:error:", v7, v8, v9, v10, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v30;

  pp_social_highlights_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v3, "Server.rankedHighlightsForSyncedItems", " enableTelemetry=YES ", buf, 2u);
  }

  if (v12)
  {
    objc_msgSend(*(id *)(a1[7] + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", 0, 1, v12, a1[8], &__block_literal_global_53);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x2020000000;
    v29 = 0;
    v15 = a1[8];
    v16 = *(void **)(a1[7] + 16);
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_2;
    v23[3] = &unk_1E7E1D4F0;
    v24 = v11;
    v25 = buf;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_3;
    v20[3] = &unk_1E7E1D538;
    v18 = a1[8];
    v21 = a1[7];
    v22 = v18;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_5;
    v19[3] = &unk_1E7E1D560;
    v19[4] = v21;
    v19[5] = v18;
    objc_msgSend(v16, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("rankedHighlightsForSyncedItems"), v15, v23, v20, v19);

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
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

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_56);
}

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2_47(uint64_t a1, BOOL *a2)
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

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedHighlightsBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_49);
}

void __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke()
{
  void *v0;
  dispatch_workloop_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = dispatch_workloop_create("rankedHighlightsWithLimit");
  v2 = (void *)rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult;
  rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
