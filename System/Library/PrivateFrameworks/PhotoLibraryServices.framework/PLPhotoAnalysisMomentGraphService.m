@implementation PLPhotoAnalysisMomentGraphService

- (PLPhotoAnalysisMomentGraphService)initWithServiceProvider:(id)a3
{
  id v5;
  PLPhotoAnalysisMomentGraphService *v6;
  PLPhotoAnalysisMomentGraphService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisMomentGraphService;
  v6 = -[PLPhotoAnalysisMomentGraphService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceProvider, a3);

  return v7;
}

- (void)performGraphRebuildWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __74__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performGraphRebuildWithOptions:reply:", v8, v14);

}

- (void)performGraphIncrementalUpdateWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __84__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performGraphIncrementalUpdateWithOptions:reply:", v8, v14);

}

- (void)performMemoryNodesRebuildForCategory:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __80__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_reply___block_invoke_2;
  v12[3] = &unk_1E3676858;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "performMemoryNodesRebuildForCategory:reply:", a3, v12);

}

- (void)performLocalMemoryEventElectionWithElectionMode:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __91__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performLocalMemoryEventElectionWithElectionMode:reply:", v8, v14);

}

- (void)performLocalMemoryEnrichmentForUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke_2;
  v14[3] = &unk_1E36687E8;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performLocalMemoryEnrichmentForUUIDs:reply:", v8, v14);

}

- (void)performLocalMemoryEnrichmentForMemoryCategory:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke_2;
  v12[3] = &unk_1E36687E8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "performLocalMemoryEnrichmentForMemoryCategory:reply:", a3, v12);

}

- (id)graphStatusWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  PLPhotosKnowledgeGraphAvailabilityStatus *v7;
  PLPhotosKnowledgeGraphAvailabilityStatus *v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__202;
  v22 = __Block_byref_object_dispose__203;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__202;
  v16 = __Block_byref_object_dispose__203;
  v17 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v12;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke_2;
  v10[3] = &unk_1E3676830;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "requestGraphStatusWithReply:", v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  if (v19[5])
  {
    v7 = [PLPhotosKnowledgeGraphAvailabilityStatus alloc];
    v8 = -[PLPhotosKnowledgeGraphAvailabilityStatus initWithDictionary:](v7, "initWithDictionary:", v19[5]);
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)requestZeroKeywordsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__202;
  v24 = __Block_byref_object_dispose__203;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__202;
  v18 = __Block_byref_object_dispose__203;
  v19 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __74__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "requestZeroKeywordsWithOptions:reply:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestSynonymsDictionariesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__202;
  v21 = __Block_byref_object_dispose__203;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__202;
  v15 = __Block_byref_object_dispose__203;
  v16 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithError___block_invoke;
  v10[3] = &unk_1E36767E0;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __74__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithError___block_invoke_2;
  v9[3] = &unk_1E3676830;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "requestSynonymsDictionariesWithReply:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (id)requestGraphSearchMetadataWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__202;
  v24 = __Block_byref_object_dispose__203;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__202;
  v18 = __Block_byref_object_dispose__203;
  v19 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __81__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "requestGraphSearchMetadataWithOptions:reply:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestSearchIndexKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__202;
  v26 = __Block_byref_object_dispose__203;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__202;
  v20 = __Block_byref_object_dispose__203;
  v21 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v16;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __100__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v11, "requestSearchIndexKeywordsForAssetCollectionUUIDs:ofType:reply:", v8, a4, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v17[5]);
  v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)requestAssetSearchKeywordsForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__202;
  v26 = __Block_byref_object_dispose__203;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__202;
  v20 = __Block_byref_object_dispose__203;
  v21 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v16;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __100__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v11, "requestAssetSearchKeywordsForAssetCollectionUUIDs:ofType:reply:", v8, a4, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v17[5]);
  v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
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

  v7 = a5;
  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__202;
  v28 = __Block_byref_object_dispose__203;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__202;
  v22 = __Block_byref_object_dispose__203;
  v23 = 0;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __129__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v18;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __129__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_error___block_invoke_2;
  v16[3] = &unk_1E3676830;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v13, "requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:ofType:isFullAnalysis:reply:", v10, a4, v7, v16);

  if (a6)
    *a6 = objc_retainAutorelease((id)v19[5]);
  v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (void)performGraphSearchEntityRankingDonationWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __86__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithReply___block_invoke_2;
  v10[3] = &unk_1E3676858;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "performGraphSearchEntityRankingDonationWithReply:", v10);

}

- (void)requestContextInfoWithConfigurationAsData:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __85__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_reply___block_invoke_2;
  v14[3] = &unk_1E365FA20;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "requestContextInfoWithConfigurationAsData:reply:", v8, v14);

}

- (void)requestExtendedTokenCollectionWithQueryTokensAsData:(id)a3 assetUUIDs:(id)a4 momentUUIDByAssetUUID:(id)a5 reply:(id)a6
{
  id v10;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a6;
  serviceProvider = self->_serviceProvider;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __128__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionWithQueryTokensAsData_assetUUIDs_momentUUIDByAssetUUID_reply___block_invoke;
  v22[3] = &unk_1E3676858;
  v17 = v10;
  v23 = v17;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __128__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionWithQueryTokensAsData_assetUUIDs_momentUUIDByAssetUUID_reply___block_invoke_2;
  v20[3] = &unk_1E365FA20;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "requestExtendedTokenCollectionWithQueryTokensAsData:assetUUIDs:momentUUIDByAssetUUID:reply:", v14, v13, v12, v20);

}

- (void)requestMeaningsForMomentUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __73__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_reply___block_invoke_2;
  v14[3] = &unk_1E3676880;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "requestMeaningsForMomentUUIDs:reply:", v8, v14);

}

- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 momentUUIDByAssetUUID:(id)a4 extendedTokenCollectionAsData:(id)a5 configurationAsData:(id)a6 reply:(id)a7
{
  id v12;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v12 = a7;
  serviceProvider = self->_serviceProvider;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __150__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_reply___block_invoke;
  v25[3] = &unk_1E3676858;
  v20 = v12;
  v26 = v20;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __150__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_reply___block_invoke_2;
  v23[3] = &unk_1E365FA20;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v21, "requestPersonalTraitsForAssetUUIDs:momentUUIDByAssetUUID:extendedTokenCollectionAsData:configurationAsData:reply:", v17, v16, v15, v14, v23);

}

- (void)requestPersonalEventAssetsForQueryTokenAsData:(id)a3 associatedPersonUUID:(id)a4 scopedAssetUUIDs:(id)a5 momentUUIDByAssetUUID:(id)a6 retrievalResultsByQueryTokenAsData:(id)a7 reply:(id)a8
{
  id v14;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v14 = a8;
  serviceProvider = self->_serviceProvider;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __184__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_reply___block_invoke;
  v28[3] = &unk_1E3676858;
  v23 = v14;
  v29 = v23;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __184__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_reply___block_invoke_2;
  v26[3] = &unk_1E365FA20;
  v27 = v23;
  v25 = v23;
  objc_msgSend(v24, "requestPersonalEventAssetsForQueryTokenAsData:associatedPersonUUID:scopedAssetUUIDs:momentUUIDByAssetUUID:retrievalResultsByQueryTokenAsData:reply:", v20, v19, v18, v17, v16, v26);

}

- (void)requestPersonalTraitsForHighlightUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __82__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_reply___block_invoke_2;
  v14[3] = &unk_1E36687E8;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "requestPersonalTraitsForHighlightUUIDs:reply:", v8, v14);

}

- (void)requestPersonalTraitsForAssetUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __78__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_reply___block_invoke_2;
  v14[3] = &unk_1E36687E8;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "requestPersonalTraitsForAssetUUIDs:reply:", v8, v14);

}

- (void)performPromptSuggestionCachingWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __77__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithReply___block_invoke_2;
  v10[3] = &unk_1E3676858;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "performPromptSuggestionCachingWithReply:", v10);

}

- (void)fetchUnvalidatedPromptSuggestionsWithFetchLimit:(int64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke_2;
  v12[3] = &unk_1E365FA20;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "fetchUnvalidatedPromptSuggestionsWithFetchLimit:reply:", a3, v12);

}

- (void)requestPrewarmQueryAnnotatorForOriginatorPID:(int64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[PLPhotoAnalysisServiceProvider momentGraphService](self->_serviceProvider, "momentGraphService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __88__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_reply___block_invoke_2;
  v12[3] = &unk_1E3676858;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "requestPrewarmQueryAnnotatorForOriginatorPID:reply:", a3, v12);

}

- (void)requestQueryAnnotationForQuery:(id)a3 originatorPID:(int64_t)a4 reply:(id)a5
{
  id v8;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  serviceProvider = self->_serviceProvider;
  v10 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __88__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_reply___block_invoke_2;
  v16[3] = &unk_1E365FA20;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "requestQueryAnnotationForQuery:originatorPID:reply:", v10, a4, v16);

}

- (void)requestLocationRetrievalResultsWithQueryTokenAsData:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __95__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_reply___block_invoke_2;
  v14[3] = &unk_1E365FA20;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "requestLocationRetrievalResultsWithQueryTokenAsData:reply:", v8, v14);

}

- (void)generateMagicSlotSuggestionsForDate:(id)a3 reply:(id)a4
{
  id v6;
  PLPhotoAnalysisServiceProvider *serviceProvider;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  serviceProvider = self->_serviceProvider;
  v8 = a3;
  -[PLPhotoAnalysisServiceProvider momentGraphService](serviceProvider, "momentGraphService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsForDate_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsForDate_reply___block_invoke_2;
  v14[3] = &unk_1E36768D0;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "generateMagicSlotSuggestionsForDate:reply:", v8, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

uint64_t __79__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsForDate_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisMomentGraphService_generateMagicSlotSuggestionsForDate_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PLPhotoAnalysisMomentGraphService_requestLocationRetrievalResultsWithQueryTokenAsData_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisMomentGraphService_requestQueryAnnotationForQuery_originatorPID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisMomentGraphService_requestPrewarmQueryAnnotatorForOriginatorPID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_fetchUnvalidatedPromptSuggestionsWithFetchLimit_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PLPhotoAnalysisMomentGraphService_performPromptSuggestionCachingWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForHighlightUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __184__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __184__PLPhotoAnalysisMomentGraphService_requestPersonalEventAssetsForQueryTokenAsData_associatedPersonUUID_scopedAssetUUIDs_momentUUIDByAssetUUID_retrievalResultsByQueryTokenAsData_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __150__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __150__PLPhotoAnalysisMomentGraphService_requestPersonalTraitsForAssetUUIDs_momentUUIDByAssetUUID_extendedTokenCollectionAsData_configurationAsData_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisMomentGraphService_requestMeaningsForMomentUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionWithQueryTokensAsData_assetUUIDs_momentUUIDByAssetUUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__PLPhotoAnalysisMomentGraphService_requestExtendedTokenCollectionWithQueryTokensAsData_assetUUIDs_momentUUIDByAssetUUID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisMomentGraphService_requestContextInfoWithConfigurationAsData_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__PLPhotoAnalysisMomentGraphService_performGraphSearchEntityRankingDonationWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __129__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __129__PLPhotoAnalysisMomentGraphService_requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs_ofType_isFullAnalysis_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __100__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __100__PLPhotoAnalysisMomentGraphService_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __100__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __100__PLPhotoAnalysisMomentGraphService_requestSearchIndexKeywordsForAssetCollectionUUIDs_ofType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __81__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__PLPhotoAnalysisMomentGraphService_requestGraphSearchMetadataWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __74__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisMomentGraphService_requestSynonymsDictionariesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __74__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisMomentGraphService_requestZeroKeywordsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__PLPhotoAnalysisMomentGraphService_graphStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForMemoryCategory_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performLocalMemoryEnrichmentForUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisMomentGraphService_performLocalMemoryEventElectionWithElectionMode_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PLPhotoAnalysisMomentGraphService_performMemoryNodesRebuildForCategory_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PLPhotoAnalysisMomentGraphService_performGraphIncrementalUpdateWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PLPhotoAnalysisMomentGraphService_performGraphRebuildWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
