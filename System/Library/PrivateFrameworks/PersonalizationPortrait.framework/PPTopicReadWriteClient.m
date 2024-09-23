@implementation PPTopicReadWriteClient

- (PPTopicReadWriteClient)init
{
  PPTopicReadWriteClient *v2;
  PPXPCClientHelper *v3;
  void *v4;
  uint64_t v5;
  PPXPCClientHelper *clientHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPTopicReadWriteClient;
  v2 = -[PPTopicReadWriteClient init](&v8, sel_init);
  if (v2)
  {
    v3 = [PPXPCClientHelper alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01B948);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:](v3, "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"), v4, 0, 0, &__block_literal_global_504, &__block_literal_global_58);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;

  }
  return v2;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PPXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4
{
  void (**v6)(id, void *, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
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
  char v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = (void (**)(id, void *, void *))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__498;
  v30 = __Block_byref_object_dispose__499;
  v7 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__PPTopicReadWriteClient__doSyncCallWithError_syncCall___block_invoke;
  v25[3] = &unk_1E226BEA8;
  v25[4] = &v26;
  v8 = (void *)MEMORY[0x18D780768](v25);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__498;
  v19 = __Block_byref_object_dispose__499;
  v20 = 0;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __56__PPTopicReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2;
  v14[3] = &unk_1E226BED0;
  v14[4] = &v21;
  v14[5] = &v15;
  v9 = (void *)MEMORY[0x18D780768](v14);
  -[PPTopicReadWriteClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10, v9);

  v11 = (void *)v27[5];
  if (v11)
  {
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    v12 = *((_BYTE *)v22 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5
{
  void (**v8)(id, void *, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = (void (**)(id, void *, void *))a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__498;
  v36 = __Block_byref_object_dispose__499;
  v9 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __77__PPTopicReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke;
  v31[3] = &unk_1E226BEA8;
  v31[4] = &v32;
  v10 = (void *)MEMORY[0x18D780768](v31);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__498;
  v25 = __Block_byref_object_dispose__499;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __77__PPTopicReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2;
  v16[3] = &unk_1E226BEF8;
  v16[4] = &v27;
  v16[5] = &v21;
  v16[6] = &v17;
  v11 = (void *)MEMORY[0x18D780768](v16);
  -[PPTopicReadWriteClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12, v11);

  if (a4)
    *a4 = v18[3];
  v13 = (void *)v33[5];
  if (v13)
  {
    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v14 = *((_BYTE *)v28 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);

  return v14;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  double v28;
  BOOL v29;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __112__PPTopicReadWriteClient_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error___block_invoke;
  v23[3] = &unk_1E2269BB0;
  v24 = v16;
  v25 = v17;
  v29 = a6;
  v28 = a7;
  v26 = v18;
  v27 = a5;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  LOBYTE(a9) = -[PPTopicReadWriteClient _doSyncCallWithError:syncCall:](self, "_doSyncCallWithError:syncCall:", a9, v23);

  return (char)a9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke;
  v15[3] = &unk_1E2269BD8;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  LOBYTE(a6) = -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a6, a5, v15);

  return (char)a6;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke;
  v15[3] = &unk_1E2269BD8;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  LOBYTE(a6) = -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a6, a5, v15);

  return (char)a6;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_deletedCount_error___block_invoke;
  v11[3] = &unk_1E2269C00;
  v12 = v8;
  v9 = v8;
  LOBYTE(a5) = -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a5, a4, v11);

  return (char)a5;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PPTopicReadWriteClient_deleteAllTopicsWithTopicId_deletedCount_error___block_invoke;
  v11[3] = &unk_1E2269C00;
  v12 = v8;
  v9 = v8;
  LOBYTE(a5) = -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a5, a4, v11);

  return (char)a5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_deletedCount_error___block_invoke;
  v19[3] = &unk_1E2269C28;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  LOBYTE(a7) = -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a7, a6, v19);

  return (char)a7;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  return -[PPTopicReadWriteClient _doSyncCallWithError:syncCall:](self, "_doSyncCallWithError:syncCall:", a3, &__block_literal_global_65);
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return -[PPTopicReadWriteClient _doDeletionSyncCallWithError:deletedCount:syncCall:](self, "_doDeletionSyncCallWithError:deletedCount:syncCall:", a3, a4, &__block_literal_global_66);
}

- (BOOL)computeAndCacheTopicScores:(id *)a3
{
  return -[PPTopicReadWriteClient _doSyncCallWithError:syncCall:](self, "_doSyncCallWithError:syncCall:", a3, &__block_literal_global_67);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

uint64_t __53__PPTopicReadWriteClient_computeAndCacheTopicScores___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "computeAndCacheTopicScores:");
}

uint64_t __54__PPTopicReadWriteClient_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearWithCompletion:");
}

uint64_t __45__PPTopicReadWriteClient_cloudSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncWithCompletion:");
}

uint64_t __106__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_deletedCount_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:completion:", a1[4], a1[5], a1[6], a3);
}

uint64_t __72__PPTopicReadWriteClient_deleteAllTopicsWithTopicId_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteAllTopicsWithTopicId:completion:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __84__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteAllTopicsFromSourcesWithBundleId:completion:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __93__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteAllTopicsFromSourcesWithBundleId:groupIds:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

uint64_t __96__PPTopicReadWriteClient_deleteAllTopicsFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteAllTopicsFromSourcesWithBundleId:documentIds:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

uint64_t __112__PPTopicReadWriteClient_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), a3, *(double *)(a1 + 64));
}

void __77__PPTopicReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__PPTopicReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2(_QWORD *a1, char a2, uint64_t a3, id obj)
{
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v7 = obj;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;

}

void __56__PPTopicReadWriteClient__doSyncCallWithError_syncCall___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__PPTopicReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PPTopicReadWriteClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_527 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_527, block);
  return (id)sharedInstance__pasExprOnceResult_528;
}

void __40__PPTopicReadWriteClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_528;
  sharedInstance__pasExprOnceResult_528 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
