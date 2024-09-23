@implementation RETrainingSimulationClient

- (RETrainingSimulationClient)initWithServiceName:(id)a3 delegate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  RETrainingSimulationClient *v10;

  v6 = (objc_class *)MEMORY[0x24BDD1988];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithServiceName:", v8);

  v10 = -[RETrainingSimulationClient initWithConnection:delegate:](self, "initWithConnection:delegate:", v9, v7);
  return v10;
}

- (RETrainingSimulationClient)initWithTargetProcessName:(id)a3 delegate:(id)a4
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  RETrainingSimulationClient *v11;

  v7 = (__CFString *)a3;
  v8 = a4;
  RETrainingSimulationMachServiceForProcessName(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v9, 0);
  v11 = -[RETrainingSimulationClient initWithConnection:delegate:](self, "initWithConnection:delegate:", v10, v8);

  if (v11)
    objc_storeStrong((id *)&v11->_targetProcessName, a3);

  return v11;
}

- (RETrainingSimulationClient)initWithConnection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  RETrainingSimulationClient *v9;
  RETrainingSimulationClient *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSXPCConnection *connection;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  NSXPCConnection *v17;
  uint64_t v18;
  NSXPCConnection *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RETrainingSimulationClient;
  v9 = -[RETrainingSimulationClient init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = dispatch_queue_create("com.apple.RelevanceEngine.TrainingSimulationClient", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_connection, a3);
    connection = v10->_connection;
    RETrainingSimulationServerInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v14);

    v15 = v10->_connection;
    RETrainingSimulationClientInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v15, "setExportedInterface:", v16);

    -[NSXPCConnection setExportedObject:](v10->_connection, "setExportedObject:", v10);
    objc_initWeak(&location, v10);
    v17 = v10->_connection;
    v18 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke;
    v23[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInterruptionHandler:](v17, "setInterruptionHandler:", v23);
    v19 = v10->_connection;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke_2;
    v21[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v19, "setInvalidationHandler:", v21);
    -[NSXPCConnection resume](v10->_connection, "resume");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterruption");

}

void __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RETrainingSimulationClient;
  -[RETrainingSimulationClient dealloc](&v3, sel_dealloc);
}

- (void)_handleInterruption
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__RETrainingSimulationClient__handleInterruption__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RETrainingSimulationClient__handleInterruption__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;

  RELogForDomain(10);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trainingSimulationClientWasInterrupted:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_handleInvalidation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__RETrainingSimulationClient__handleInvalidation__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RETrainingSimulationClient__handleInvalidation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  RELogForDomain(10);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__RETrainingSimulationClient__handleInvalidation__block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trainingSimulationClientWasInvalidated:", *(_QWORD *)(a1 + 32));

  }
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke;
  v13[3] = &unk_24CF8F798;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke_2;
  v12[3] = &unk_24CF8F798;
  v12[4] = &v14;
  objc_msgSend(v10, "relevanceEngine:createElementFromDescription:completion:", v6, v7, v12);
  if (v15[5])
  {
    RELogForDomain(10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient relevanceEngine:createElementFromDescription:].cold.1();

  }
  _Block_object_dispose(&v14, 8);

}

void __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSXPCConnection *connection;
  void *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__23;
  v20[3] = __Block_byref_object_dispose__23;
  v21 = 0;
  v11 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke;
  v18[3] = &unk_24CF8F798;
  v18[4] = &v19;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke_2;
  v17[3] = &unk_24CF8F798;
  v17[4] = &v19;
  objc_msgSend(v13, "relevanceEngine:performCommand:withOptions:completion:", v8, v9, v10, v17);
  if (*(_QWORD *)(v20[0] + 40))
  {
    RELogForDomain(10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient relevanceEngine:performCommand:withOptions:].cold.1((uint64_t)v9, (uint64_t)v20, v14);

    v15 = *(_QWORD *)(v20[0] + 40) == 0;
  }
  else
  {
    v15 = 1;
  }

  _Block_object_dispose(&v19, 8);
  return v15;
}

void __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)availableRelevanceEngines
{
  uint64_t v2;
  NSXPCConnection *connection;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23;
  v14 = __Block_byref_object_dispose__23;
  v15 = 0;
  v2 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke;
  v9[3] = &unk_24CF8F798;
  v9[4] = &v10;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke_2;
  v8[3] = &unk_24CF8F7C0;
  v8[4] = &v16;
  v8[5] = &v10;
  objc_msgSend(v4, "availableRelevanceEngines:", v8);
  if (v11[5])
  {
    RELogForDomain(10);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v6 = (id)v17[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  NSObject *v11;
  char v12;
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
  char v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke;
  v15[3] = &unk_24CF8F798;
  v15[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke_2;
  v14[3] = &unk_24CF8F7E8;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v10, "relevanceEngine:runActionOfElementWithDescription1:completion:", v6, v7, v14);
  if (v17[5])
  {
    RELogForDomain(10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v12 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)fetchAllElementIdentifiersInRelevanceEngine:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
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

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke;
  v12[3] = &unk_24CF8F798;
  v12[4] = &v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke_2;
  v11[3] = &unk_24CF8F7C0;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "fetchAllElementIdentifiersInRelevanceEngine:completion:", v4, v11);
  if (v14[5])
  {
    RELogForDomain(10);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)fetchAllElementsInRelevanceEngine:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
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

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke;
  v12[3] = &unk_24CF8F798;
  v12[4] = &v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke_2;
  v11[3] = &unk_24CF8F7C0;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "fetchAllElementsInRelevanceEngine:completion:", v4, v11);
  if (v14[5])
  {
    RELogForDomain(10);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)diagnosticLogFileForRelevanceEngine:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
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

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke;
  v12[3] = &unk_24CF8F798;
  v12[4] = &v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke_2;
  v11[3] = &unk_24CF8F810;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "gatherDiagnosticLogsForRelevanceEngine:completion:", v4, v11);
  if (v14[5])
  {
    RELogForDomain(10);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", a2, 0, 0, 0, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[5];
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

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v8 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke;
  v15[3] = &unk_24CF8F798;
  v15[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke_2;
  v14[3] = &unk_24CF8F838;
  v14[4] = &v22;
  objc_msgSend(v10, "relevanceEngine:encodedObjectAtPath:completion:", v6, v7, v14);
  if (v17[5])
  {
    RELogForDomain(10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RETrainingSimulationClient availableRelevanceEngines].cold.1();

  }
  v12 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)availableRelevanceEnginesDidChange
{
  void *v3;
  char v4;
  id v5;

  -[RETrainingSimulationClient delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[RETrainingSimulationClient delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableRelevanceEnginesDidChangeForTrainingSimulationClient:", self);

  }
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (RETrainingSimulationClientDelegate)delegate
{
  return (RETrainingSimulationClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetProcessName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Training Simulation connection (%@) was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__RETrainingSimulationClient__handleInvalidation__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Training Simulation connection (%@) was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)relevanceEngine:createElementFromDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to create element: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)relevanceEngine:(uint64_t)a1 performCommand:(uint64_t)a2 withOptions:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "Unable to perform command %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)availableRelevanceEngines
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to access engines: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
