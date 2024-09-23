@implementation PLPhotoAnalysisExecutiveService

- (PLPhotoAnalysisExecutiveService)initWithServiceProvider:(id)a3
{
  id v5;
  PLPhotoAnalysisExecutiveService *v6;
  PLPhotoAnalysisExecutiveService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisExecutiveService;
  v6 = -[PLPhotoAnalysisExecutiveService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
    atomic_store(0, &v7->_operationID);
  }

  return v7;
}

- (void)performOnDemandTaskWithName:(id)a3 reply:(id)a4
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
  -[PLPhotoAnalysisServiceProvider executiveService](serviceProvider, "executiveService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performOnDemandTaskWithName:reply:", v8, v14);

}

- (void)performOnDemandTasksForScenario:(id)a3 reply:(id)a4
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
  -[PLPhotoAnalysisServiceProvider executiveService](serviceProvider, "executiveService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke;
  v16[3] = &unk_1E3676858;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke_2;
  v14[3] = &unk_1E3676858;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performOnDemandTasksForScenario:reply:", v8, v14);

}

- (void)requestAnalysisStatusWithReply:(id)a3
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
  -[PLPhotoAnalysisServiceProvider executiveService](self->_serviceProvider, "executiveService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke_2;
  v10[3] = &unk_1E3676880;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestAnalysisStatusWithReply:", v10);

}

- (void)requestActivityStatusWithReply:(id)a3
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
  -[PLPhotoAnalysisServiceProvider executiveService](self->_serviceProvider, "executiveService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke_2;
  v10[3] = &unk_1E3676880;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestActivityStatusWithReply:", v10);

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
  -[PLPhotoAnalysisServiceProvider executiveService](self->_serviceProvider, "executiveService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v16[3] = &unk_1E3674E40;
  v17 = v6;
  v10 = v7;
  v18 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v14[3] = &unk_1E366FEF8;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "cancelOperationsWithIdentifiers:reply:", v11, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

void __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
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

uint64_t __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
