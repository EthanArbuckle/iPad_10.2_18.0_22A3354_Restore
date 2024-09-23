@implementation PLPhotoAnalysisTestService

- (PLPhotoAnalysisTestService)initWithServiceProvider:(id)a3
{
  id v5;
  PLPhotoAnalysisTestService *v6;
  PLPhotoAnalysisTestService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisTestService;
  v6 = -[PLPhotoAnalysisTestService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
    atomic_store(0, &v7->_operationID);
  }

  return v7;
}

- (id)performGetString
{
  unint64_t *p_operationID;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__202;
  v13 = __Block_byref_object_dispose__203;
  v14 = 0;
  p_operationID = &self->_operationID;
  do
    v3 = __ldaxr(p_operationID);
  while (__stlxr(v3 + 1, p_operationID));
  -[PLPhotoAnalysisServiceProvider testService](self->_serviceProvider, "testService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_208);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLPhotoAnalysisTestService_performGetString__block_invoke_2;
  v8[3] = &unk_1E365FA48;
  v8[4] = &v9;
  objc_msgSend(v5, "performGetStringWithOperationID:reply:", v3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (unint64_t)performAsyncLongOperationWithReply:(id)a3
{
  id v4;
  unint64_t *p_operationID;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  p_operationID = &self->_operationID;
  do
    v6 = __ldaxr(p_operationID);
  while (__stlxr(v6 + 1, p_operationID));
  -[PLPhotoAnalysisServiceProvider testService](self->_serviceProvider, "testService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke;
  v15[3] = &unk_1E3676858;
  v9 = v4;
  v16 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke_2;
  v13[3] = &unk_1E365F9E0;
  v14 = v9;
  v11 = v9;
  objc_msgSend(v10, "performLongOperationWithOperationID:reply:", v6, v13);

  return v6;
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[PLPhotoAnalysisServiceProvider testService](self->_serviceProvider, "testService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v16[3] = &unk_1E3674E40;
  v17 = v6;
  v10 = v7;
  v18 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v14[3] = &unk_1E366FEF8;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "cancelOperationsWithIdentifiers:reply:", v11, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

void __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__PLPhotoAnalysisTestService_performGetString__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
