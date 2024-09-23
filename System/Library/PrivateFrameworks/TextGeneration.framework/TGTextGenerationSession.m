@implementation TGTextGenerationSession

+ (id)workQueue
{
  if (workQueue_onceToken != -1)
    dispatch_once(&workQueue_onceToken, &__block_literal_global_0);
  return (id)workQueue_workQueue;
}

void __36__TGTextGenerationSession_workQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.text-generation", 0);
  v1 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v0;

  v2 = workQueue_workQueue;
  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

+ (id)defaultTextGeneration
{
  if (defaultTextGeneration_onceToken != -1)
    dispatch_once(&defaultTextGeneration_onceToken, &__block_literal_global_2_0);
  return (id)defaultTextGeneration_textGeneration;
}

uint64_t __48__TGTextGenerationSession_defaultTextGeneration__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v0 = (void *)getTGITextGenerationInferenceClass_softClass;
  v11 = getTGITextGenerationInferenceClass_softClass;
  if (!getTGITextGenerationInferenceClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getTGITextGenerationInferenceClass_block_invoke;
    v7[3] = &unk_251978AB8;
    v7[4] = &v8;
    __getTGITextGenerationInferenceClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v8, 8);
  v2 = [v1 alloc];
  +[TGTextGenerationSession workQueue](TGTextGenerationSession, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithWorkQueue:", v3);
  v5 = (void *)defaultTextGeneration_textGeneration;
  defaultTextGeneration_textGeneration = v4;

  return objc_msgSend((id)defaultTextGeneration_textGeneration, "start");
}

- (TGTextGenerationSession)init
{
  void *v3;
  void *v4;
  TGTextGenerationSession *v5;

  +[TGTextGenerationConfiguration defaultConfiguration](TGTextGenerationConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTextGeneration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TGTextGenerationSession initWithConfiguration:textGeneration:](self, "initWithConfiguration:textGeneration:", v3, v4);

  return v5;
}

- (TGTextGenerationSession)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  TGTextGenerationSession *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultTextGeneration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TGTextGenerationSession initWithConfiguration:textGeneration:](self, "initWithConfiguration:textGeneration:", v4, v5);

  return v6;
}

- (TGTextGenerationSession)initWithConfiguration:(id)a3 textGeneration:(id)a4
{
  id v6;
  id v7;
  TGTextGenerationSession *v8;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  TGTextGenerationConfiguration *configuration;
  uint64_t v13;
  NSUUID *uuid;
  uint64_t v15;
  NSMutableDictionary *callbackByExecutionUUID;
  uint64_t v17;
  NSMutableDictionary *operationByExecutionUUID;
  uint64_t v19;
  NSMutableDictionary *outputStreamByExecutionUUID;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TGTextGenerationSession;
  v8 = -[TGTextGenerationSession init](&v22, sel_init);
  if (v8)
  {
    +[TGTextGenerationSession workQueue](TGTextGenerationSession, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (TGTextGenerationConfiguration *)v11;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v8->_textGeneration, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    callbackByExecutionUUID = v8->_callbackByExecutionUUID;
    v8->_callbackByExecutionUUID = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    operationByExecutionUUID = v8->_operationByExecutionUUID;
    v8->_operationByExecutionUUID = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    outputStreamByExecutionUUID = v8->_outputStreamByExecutionUUID;
    v8->_outputStreamByExecutionUUID = (NSMutableDictionary *)v19;

  }
  return v8;
}

- (void)createTgdSessionSync
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TGTextGenerationSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TGTextGenerationSession tgdSession](self, "tgdSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[TGTextGenerationSession textGeneration](self, "textGeneration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TGTextGenerationSession uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TGTextGenerationSession configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createSessionWithUUID:configuration:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TGTextGenerationSession setTgdSession:](self, "setTgdSession:", v8);

    -[TGTextGenerationSession tgdSession](self, "tgdSession");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
}

- (id)executionUUIDForOperation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TGTextGenerationSession operationByExecutionUUID](self, "operationByExecutionUUID", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[TGTextGenerationSession operationByExecutionUUID](self, "operationByExecutionUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          v14 = v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)enqueueOperationSync:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TGTextGenerationSession createTgdSessionSync](self, "createTgdSessionSync");
  -[TGTextGenerationSession tgdSession](self, "tgdSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueOperation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)executeOperation:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "copy");
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__TGTextGenerationSession_executeOperation_callback___block_invoke;
  v13[3] = &unk_251978A40;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __53__TGTextGenerationSession_executeOperation_callback___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "executionUUIDForOperation:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _nlpDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 17, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enqueueOperationSync:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

    v14 = (void *)MEMORY[0x24959670C](*(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "callbackByExecutionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

  }
}

- (void)enqueueOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TGTextGenerationSession_enqueueOperation___block_invoke;
  block[3] = &unk_251978A68;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

void __44__TGTextGenerationSession_enqueueOperation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "executionUUIDForOperation:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _nlpDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enqueueOperationSync:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

  }
}

- (void)cancelOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__TGTextGenerationSession_cancelOperation___block_invoke;
  v7[3] = &unk_251978A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__TGTextGenerationSession_cancelOperation___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "executionUUIDForOperation:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "tgdSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelOperationWithExecutionUUID:", v3);

  }
  else
  {
    _nlpDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__TGTextGenerationSession_cancelOperation___block_invoke_cold_1(v2, v5);

  }
}

- (void)operation:(id)a3 didUpdateOutputStream:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__TGTextGenerationSession_operation_didUpdateOutputStream___block_invoke;
  block[3] = &unk_251978A68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __59__TGTextGenerationSession_operation_didUpdateOutputStream___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "session:operation:didUpdateOutputStream:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)didStartOperationWithExecutionUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__TGTextGenerationSession_didStartOperationWithExecutionUUID___block_invoke;
  v7[3] = &unk_251978A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__TGTextGenerationSession_didStartOperationWithExecutionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    v3 = v7;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "session:didStartOperation:", *(_QWORD *)(a1 + 32), v7);

      v3 = v7;
    }
  }

}

- (void)operationWithExecutionUUID:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__TGTextGenerationSession_operationWithExecutionUUID_didFailWithError___block_invoke;
  block[3] = &unk_251978A68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __71__TGTextGenerationSession_operationWithExecutionUUID_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "callbackByExecutionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "callbackByExecutionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session:didFailOperation:error:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 48));

    }
  }

}

- (void)operationWithExecutionUUID:(id)a3 didFinishWithOutputs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__TGTextGenerationSession_operationWithExecutionUUID_didFinishWithOutputs___block_invoke;
  block[3] = &unk_251978A68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __75__TGTextGenerationSession_operationWithExecutionUUID_didFinishWithOutputs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "callbackByExecutionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "callbackByExecutionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session:didFinishOperation:outputs:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 48));

    }
  }

}

- (void)operationWithExecutionUUID:(id)a3 didStreamOutput:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TGTextGenerationSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__TGTextGenerationSession_operationWithExecutionUUID_didStreamOutput___block_invoke;
  block[3] = &unk_251978A68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __70__TGTextGenerationSession_operationWithExecutionUUID_didStreamOutput___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  TGTextGenerationOutputStream *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "operationByExecutionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (TGTextGenerationOutputStream *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v4 = objc_alloc_init(TGTextGenerationOutputStream);
      objc_msgSend(*(id *)(a1 + 32), "outputStreamByExecutionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

    }
    -[TGTextGenerationOutputStream addOutput:](v4, "addOutput:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "session:operation:didUpdateOutputStream:", *(_QWORD *)(a1 + 32), v9, v4);

    }
  }

}

- (TGTextGenerationSessionDelegate)delegate
{
  return (TGTextGenerationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TGTextGenerationConfiguration)configuration
{
  return (TGTextGenerationConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (TGITextGenerationInference)textGeneration
{
  return (TGITextGenerationInference *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceSession)tgdSession
{
  return (TGITextGenerationInferenceSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTgdSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)callbackByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)operationByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)outputStreamByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_outputStreamByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_operationByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_callbackByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_tgdSession, 0);
  objc_storeStrong((id *)&self->_textGeneration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_247FA3000, a1, a3, "Identical operation is already enqueued", a5, a6, a7, a8, 0);
}

void __43__TGTextGenerationSession_cancelOperation___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_247FA3000, a2, OS_LOG_TYPE_ERROR, "Cannot cancel operation since the operation was not enqueued: %@", (uint8_t *)&v3, 0xCu);
}

@end
