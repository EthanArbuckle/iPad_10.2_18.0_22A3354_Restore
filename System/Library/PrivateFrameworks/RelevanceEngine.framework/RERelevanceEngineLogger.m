@implementation RERelevanceEngineLogger

- (void)addLoggable:(id)a3
{
  -[REObserverStore addObserver:](self->_loggables, "addObserver:", a3);
}

- (RERelevanceEngineLogger)init
{
  RERelevanceEngineLogger *v2;
  uint64_t v3;
  REObserverStore *loggables;
  uint64_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RERelevanceEngineLogger;
  v2 = -[RERelevanceEngineLogger init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    loggables = v2->_loggables;
    v2->_loggables = (REObserverStore *)v3;

    RECreateSharedQueue(CFSTR("DiagnosticLogs"));
    v5 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)enumerateLoggables:(id)a3
{
  id v4;
  REObserverStore *loggables;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  loggables = self->_loggables;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__RERelevanceEngineLogger_enumerateLoggables___block_invoke;
  v7[3] = &unk_24CF91350;
  v8 = v4;
  v6 = v4;
  -[REObserverStore enumerateObserversWithBlock:](loggables, "enumerateObserversWithBlock:", v7);

}

uint64_t __46__RERelevanceEngineLogger_enumerateLoggables___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectLogs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *queue;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  RERelevanceEngineLogger *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  id v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke;
  v33[3] = &unk_24CF8B250;
  v10 = v8;
  v34 = v10;
  -[RERelevanceEngineLogger enumerateLoggables:](self, "enumerateLoggables:", v33);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__30;
  v31 = __Block_byref_object_dispose__30;
  v32 = 0;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_17;
  v21[3] = &unk_24CF913A0;
  v25 = v6;
  v26 = &v27;
  v23 = self;
  v24 = v7;
  v22 = v10;
  v11 = v6;
  v12 = v7;
  v13 = v10;
  v14 = (void *)MEMORY[0x2199B2434](v21);
  v15 = MEMORY[0x2199B2434]();
  v16 = (void *)v28[5];
  v28[5] = v15;

  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_5;
  block[3] = &unk_24CF8B1B0;
  v20 = v14;
  v18 = v14;
  dispatch_async(queue, block);

  _Block_object_dispose(&v27, 8);
}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
    v3 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_2;
    v12[3] = &unk_24CF91378;
    v4 = v2;
    v13 = v4;
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v14 = v5;
    v15 = v6;
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = v3;
      v10[1] = 3221225472;
      v10[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_3;
      v10[3] = &unk_24CF8AE78;
      v10[4] = *(_QWORD *)(a1 + 40);
      v11 = v7;
      objc_msgSend(v4, "collectLoggableState:", v10);

    }
    else
    {
      v7[2](v7, 0);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  RELogHeader(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
  REVerboseDescriptionForExportedObject(*(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendString:", v8);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();

}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_4;
  v7[3] = &unk_24CF8B2E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeLoggable:(id)a3
{
  -[REObserverStore removeObserver:](self->_loggables, "removeObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggables, 0);
}

@end
