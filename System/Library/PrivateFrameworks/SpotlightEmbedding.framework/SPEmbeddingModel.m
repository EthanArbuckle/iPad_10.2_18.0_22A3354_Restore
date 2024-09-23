@implementation SPEmbeddingModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

- (void)preheatWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[SPEmbeddingModel deviceSupportsEmbedding](self, "deviceSupportsEmbedding"))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke;
    v7[3] = &unk_2518FE5E0;
    v7[4] = self;
    v8 = v4;
    v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
    dispatch_async(queue, v6);

  }
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__SPEmbeddingModel_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __23__SPEmbeddingModel_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.spotlightembedding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

void __34__SPEmbeddingModel_sharedInstance__block_invoke()
{
  SPEmbeddingModel *v0;
  void *v1;

  v0 = objc_alloc_init(SPEmbeddingModel);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (SPEmbeddingModel)init
{
  SPEmbeddingModel *v2;
  SPEmbeddingModel *v3;
  MADService *service;
  NSMutableDictionary *requestIDs;
  NSMutableDictionary *queryIDs;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SPEmbeddingModel;
  v2 = -[SPEmbeddingModel init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    service = v2->_service;
    v2->_service = 0;

    requestIDs = v3->_requestIDs;
    v3->_requestIDs = 0;

    queryIDs = v3->_queryIDs;
    v3->_queryIDs = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.SpotlightEmbedding.queue", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (void)_initModel
{
  MADService *v3;
  MADService *service;
  NSMutableDictionary *v5;
  NSMutableDictionary *requestIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *queryIDs;

  if (!self->_service)
  {
    objc_msgSend(MEMORY[0x24BE642C0], "service");
    v3 = (MADService *)objc_claimAutoreleasedReturnValue();
    service = self->_service;
    self->_service = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    requestIDs = self->_requestIDs;
    self->_requestIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    queryIDs = self->_queryIDs;
    self->_queryIDs = v7;

  }
}

+ (unint64_t)version
{
  return objc_msgSend(MEMORY[0x24BE64208], "getUnifiedEmbeddingVersion");
}

- (BOOL)deviceSupportsEmbedding
{
  if (getDeviceSupported_onceToken != -1)
    dispatch_once(&getDeviceSupported_onceToken, &__block_literal_global_78);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[SPEmbeddingModel deviceSupportsEmbedding].cold.1();
  return getDeviceSupported_gDeviceSupported;
}

- (void)clear
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__SPEmbeddingModel_clear__block_invoke;
  block[3] = &unk_2518FE590;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__25__SPEmbeddingModel_clear__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    objc_msgSend(result, "cancelAllRequests");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  }
  return result;
}

void __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  qos_class_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v10 = qos_class_self();
    _os_log_impl(&dword_24795D000, v2, OS_LOG_TYPE_INFO, "preheat request as QOS (%d)", buf, 8u);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE642C8]);
  objc_msgSend(*(id *)(a1 + 32), "_initModel");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke_9;
  v6[3] = &unk_2518FE5B8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "prewarmTextRequests:completionHandler:", v5, v6);

}

void __49__SPEmbeddingModel_preheatWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Text embedding model preheat failed, error: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8003, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

- (void)clearQueryID:(int64_t)a3 requestID:(int)a4
{
  NSObject *queue;
  _QWORD block[6];
  int v9;

  if (-[SPEmbeddingModel deviceSupportsEmbedding](self, "deviceSupportsEmbedding")
    && a4 != -1
    && (a3 & 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFFFLL)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__SPEmbeddingModel_clearQueryID_requestID___block_invoke;
    block[3] = &unk_2518FE608;
    v9 = a4;
    block[4] = self;
    block[5] = a3;
    dispatch_async(queue, block);
  }
}

void __43__SPEmbeddingModel_clearQueryID_requestID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", v4);

    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)cancelQueryID:(int64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = -[SPEmbeddingModel deviceSupportsEmbedding](self, "deviceSupportsEmbedding");
  if ((~a3 & 0x7FFFFFFFFFFFFFFFLL) != 0 && v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v10 = a3;
      _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_INFO, "cancelQueryID QID (%ld)", buf, 0xCu);
    }

    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__SPEmbeddingModel_cancelQueryID___block_invoke;
    v8[3] = &unk_2518FE630;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(queue, v8);
  }
}

void __34__SPEmbeddingModel_cancelQueryID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 24);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = objc_msgSend(v5, "intValue");
        v8 = *(_QWORD *)(a1 + 40);
        v12[0] = 67109376;
        v12[1] = v7;
        v13 = 2048;
        v14 = v8;
        _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_INFO, "cancelQueryID RID (%d) QID (%ld)", (uint8_t *)v12, 0x12u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelRequestID:", objc_msgSend(v5, "intValue"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v5);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v11);

    }
  }
}

- (void)cancelRequestID:(int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = -[SPEmbeddingModel deviceSupportsEmbedding](self, "deviceSupportsEmbedding");
  if (a3 != -1 && v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v11 = a3;
      _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_INFO, "cancelRequestID RID (%d)", buf, 8u);
    }

    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__SPEmbeddingModel_cancelRequestID___block_invoke;
    v8[3] = &unk_2518FE658;
    v8[4] = self;
    v9 = a3;
    dispatch_async(queue, v8);
  }
}

void __36__SPEmbeddingModel_cancelRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "cancelRequestID:", *(unsigned int *)(a1 + 40));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_DWORD *)(a1 + 40);
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 1024;
      v12 = objc_msgSend(v5, "intValue");
      _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_INFO, "cancelRequestID RID (%d) QID (%d)", (uint8_t *)v10, 0xEu);
    }

    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v5);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
}

- (id)_processTextInputs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type");
        switch(v14)
        {
          case 3:
            objc_msgSend(v13, "attributedString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPEmbeddingModel _processAttributedString:](self, "_processAttributedString:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            break;
          case 2:
            objc_msgSend(v13, "tokenIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPEmbeddingModel _processTokenIDs:](self, "_processTokenIDs:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            break;
          case 1:
            objc_msgSend(v13, "text");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPEmbeddingModel _processText:](self, "_processText:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            if (a4)
            {
              v22 = (void *)MEMORY[0x24BDD1540];
              v31 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid input format (%lu)"), objc_msgSend(v13, "type"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v23;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8004, v24);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v20 = 0;
            goto LABEL_19;
        }
        v17 = (void *)v16;

        if (!v17)
        {
          if (a4)
          {
            v18 = (void *)MEMORY[0x24BDD1540];
            v29 = *MEMORY[0x24BDD0FC8];
            v30 = CFSTR("Processing text input failed");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8004, v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_18;
        }
        objc_msgSend(v7, "addObject:", v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v20;
}

- (id)_processText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BE642D8]);
    objc_msgSend(v7, "addText:", v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_24795D000, v8, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as text is empty", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_processTokenIDs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE642D8]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_2518FF1F0);

      if (v7)
        objc_msgSend(v5, "removeObjectAtIndex:", 0);
    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToNumber:", &unk_2518FF1F0);

      if (v9)
        objc_msgSend(v5, "removeLastObject");
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTokenIDs:", v10);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24795D000, v11, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as token IDs are empty", v13, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)_processAttributedString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t v45[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)v45 = 0;
    v46 = v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3010000000;
    v43 = 0;
    v44 = 0;
    v42 = &unk_247962C9E;
    v5 = objc_msgSend(v3, "length");
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __45__SPEmbeddingModel__processAttributedString___block_invoke;
    v38[3] = &unk_2518FE6A8;
    v38[4] = v45;
    v38[5] = &v39;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v38);
    v6 = objc_alloc_init(MEMORY[0x24BE642D8]);
    if (!*((_QWORD *)v46 + 5))
    {
      objc_msgSend(v4, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addText:", v7);

    }
    v8 = v40[5];
    if (v8 == objc_msgSend(v4, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24795D000, v9, OS_LOG_TYPE_INFO, "**Warning** Skipping embedding generation as query only contains person", buf, 2u);
      }

      v10 = 0;
      goto LABEL_30;
    }
    v12 = v40[4];
    if (!v12)
    {
LABEL_19:
      v22 = objc_alloc(MEMORY[0x24BDD1880]);
      v23 = (void *)objc_msgSend(v22, "initWithUUIDString:", *((_QWORD *)v46 + 5));
      objc_msgSend(v6, "addEntityUUID:", v23);

      objc_msgSend((id)objc_opt_class(), "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24795D000, v24, OS_LOG_TYPE_INFO, "Found person uuid from the query", buf, 2u);
      }

      v25 = objc_msgSend(v4, "length");
      v26 = v40[5] + v40[4];
      v27 = v25 - v26;
      if (v25 - v26 < 1)
        goto LABEL_29;
      objc_msgSend(v4, "string");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "substringWithRange:", v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v31, "length"))
      {
        objc_msgSend(v6, "addText:", v31);
        objc_msgSend((id)objc_opt_class(), "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = objc_msgSend(v29, "length");
          *(_DWORD *)buf = 134217984;
          v52 = v33;
          v34 = "Found postString with %lu characters";
          v35 = v32;
          v36 = 12;
LABEL_27:
          _os_log_impl(&dword_24795D000, v35, OS_LOG_TYPE_INFO, v34, buf, v36);
        }
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v34 = "**Warning** postString is empty";
          v35 = v32;
          v36 = 2;
          goto LABEL_27;
        }
      }

LABEL_29:
      v10 = v6;
LABEL_30:

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v45, 8);

      goto LABEL_31;
    }
    objc_msgSend(v4, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringWithRange:", 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v6, "addText:", v16);
      objc_msgSend((id)objc_opt_class(), "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v16, "length");
        *(_DWORD *)buf = 134217984;
        v52 = v18;
        v19 = "Found preString with %lu characters";
        v20 = v17;
        v21 = 12;
LABEL_17:
        _os_log_impl(&dword_24795D000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "**Warning** preString is empty";
        v20 = v17;
        v21 = 2;
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_24795D000, v11, OS_LOG_TYPE_INFO, "**Warning** Skipping personalized embedding generation as attributed query is empty", v45, 2u);
  }

  v10 = 0;
LABEL_31:

  return v10;
}

uint64_t __45__SPEmbeddingModel__processAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SPEmbeddingModel__processAttributedString___block_invoke_2;
  v5[3] = &unk_2518FE680;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = a3;
  v8 = a4;
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __45__SPEmbeddingModel__processAttributedString___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("kMDItemPhotosPeoplePersonIdentifiers")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(_OWORD *)(a1 + 48);
      *a4 = 1;
    }
  }

}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 error:(id *)a7
{
  return -[SPEmbeddingModel generateEmbeddingForTextInputs:extendedContextLength:queryID:timeout:workCost:error:](self, "generateEmbeddingForTextInputs:extendedContextLength:queryID:timeout:workCost:error:", a3, a4, a5, a6, 0, a7);
}

- (id)generateEmbeddingForTextInputs:(id)a3 extendedContextLength:(BOOL)a4 queryID:(int64_t)a5 timeout:(int64_t)a6 workCost:(int64_t *)a7 error:(id *)a8
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_block_t v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *queue;
  _QWORD block[5];
  NSObject *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  int64_t *v39;
  int64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  unsigned int *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  if (-[SPEmbeddingModel deviceSupportsEmbedding](self, "deviceSupportsEmbedding"))
  {
    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      v16 = v15;
      -[SPEmbeddingModel _processTextInputs:error:](self, "_processTextInputs:error:", v14, a8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") != v16)
      {
        v26 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      v57 = 0;
      v48 = 0;
      v49 = (unsigned int *)&v48;
      v50 = 0x2020000000;
      v51 = -1;
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy_;
      v46 = __Block_byref_object_dispose_;
      v47 = 0;
      v18 = dispatch_group_create();
      dispatch_group_enter(v18);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __104__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_queryID_timeout_workCost_error___block_invoke;
      block[3] = &unk_2518FE6F8;
      block[4] = self;
      v37 = a5;
      v41 = a4;
      v19 = v18;
      v32 = v19;
      v33 = v17;
      v34 = &v42;
      v38 = v16;
      v39 = a7;
      v40 = a6;
      v35 = &v52;
      v36 = &v48;
      v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(queue, v20);

      if (a6)
      {
        v21 = dispatch_time(0, 1000000 * a6);
        if (dispatch_group_wait(v19, v21))
        {
          v22 = atomic_load(v49 + 6);
          -[SPEmbeddingModel cancelRequestID:](self, "cancelRequestID:", v22);
          if (a8)
          {
            v23 = (void *)MEMORY[0x24BDD1540];
            v58 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Text embedding generation timeout (timeout=%lums)"), a6);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8007, v25);
            *a8 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_14;
        }
      }
      else
      {
        dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      }
      v27 = atomic_load(v49 + 6);
      -[SPEmbeddingModel clearQueryID:requestID:](self, "clearQueryID:requestID:", a5, v27);
      v28 = (void *)v43[5];
      if (!v28)
      {
        v26 = (id)v53[5];
        goto LABEL_16;
      }
      if (a8)
      {
        v26 = 0;
        *a8 = objc_retainAutorelease(v28);
LABEL_16:

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);

        goto LABEL_17;
      }
LABEL_14:
      v26 = 0;
      goto LABEL_16;
    }
  }
  v26 = 0;
LABEL_18:

  return v26;
}

void __104__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_queryID_timeout_workCost_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  qos_class_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  dispatch_time_t v36;
  __int128 v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  _DWORD v41[7];

  *(_QWORD *)&v41[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = qos_class_self();
    v4 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 67109376;
    v41[0] = v3;
    LOWORD(v41[1]) = 2048;
    *(_QWORD *)((char *)&v41[1] + 2) = v4;
    _os_log_impl(&dword_24795D000, v2, OS_LOG_TYPE_INFO, "madrequest as QOS (%d) QID (%ld)", buf, 0x12u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BE642C8]);
  if (+[SPEmbeddingModel version](SPEmbeddingModel, "version") == 4
    || +[SPEmbeddingModel version](SPEmbeddingModel, "version") == 5)
  {
    objc_msgSend(v5, "setVersion:", +[SPEmbeddingModel version](SPEmbeddingModel, "version"));
    objc_msgSend(v5, "setComputeThreshold:", 1);
  }
  objc_msgSend(v5, "setExtendedContextLength:", *(unsigned __int8 *)(a1 + 112));
  if (*(_BYTE *)(a1 + 112) && (*(_QWORD *)(a1 + 80) | 0x8000000000000000) != 0xFFFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v41 = v7;
      _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_INFO, "extended context length enabled QID (%ld)", buf, 0xCu);
    }

  }
  v39 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_initModel");
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(_QWORD *)(a1 + 48);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __104__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_queryID_timeout_workCost_error___block_invoke_31;
  v30[3] = &unk_2518FE6D0;
  v35 = *(_QWORD *)(a1 + 88);
  v12 = v5;
  v34 = *(_OWORD *)(a1 + 56);
  v36 = v9;
  v37 = *(_OWORD *)(a1 + 96);
  v38 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v31 = v12;
  v32 = v13;
  v33 = v14;
  v15 = objc_msgSend(v10, "performRequests:textInputs:completionHandler:", v8, v11, v30);
  atomic_store(v15, (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v16 = *(_QWORD *)(a1 + 80);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 != -1 && v15 != -1)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 80);
      v19 = atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      *(_DWORD *)buf = 67109376;
      v41[0] = v19;
      LOWORD(v41[1]) = 2048;
      *(_QWORD *)((char *)&v41[1] + 2) = v18;
      _os_log_impl(&dword_24795D000, v17, OS_LOG_TYPE_INFO, "generateEmbeddingForTextInputs RID (%d) QID (%ld)", buf, 0x12u);
    }

    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v21 = (void *)MEMORY[0x24BDD16E0];
    v22 = atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(v21, "numberWithInt:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 80));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v23, v24);

    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 80));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD16E0];
    v28 = atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(v27, "numberWithInt:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, v29);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __104__SPEmbeddingModel_generateEmbeddingForTextInputs_extendedContextLength_queryID_timeout_workCost_error___block_invoke_31(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  SPEmbeddingResult *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  dispatch_time_t v39;
  _QWORD *v40;
  dispatch_time_t v41;
  NSObject *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  SPEmbeddingResult *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  dispatch_time_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v49 = a2;
  if (a2 == -1
    || v5
    || (v7 = *(_QWORD *)(a1 + 72),
        objc_msgSend(*(id *)(a1 + 32), "embeddingResults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 != v9))
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BDD0FC8];
    v33 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "embeddingResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Text embedding generation failed (%lu results): %@"), objc_msgSend(v10, "count"), v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8005, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;
LABEL_17:

  }
  else
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "embeddingResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v52)
    {
      obj = v10;
      v51 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v55 != v51)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (!v12
            || (objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "embedding"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v13, "data"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                !v14))
          {
            v45 = (void *)MEMORY[0x24BDD1540];
            v64 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Text embedding generation result is empty"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v34;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpotlightEmbedding.EmbeddingModelError"), -8006, v35);
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v38 = *(void **)(v47 + 40);
            *(_QWORD *)(v47 + 40) = v46;
            v6 = 0;
            v10 = obj;
            goto LABEL_17;
          }
          v53 = [SPEmbeddingResult alloc];
          v15 = +[SPEmbeddingModel version](SPEmbeddingModel, "version");
          objc_msgSend(v12, "embedding");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "embedding");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "type");
          objc_msgSend(v12, "scale");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = v21;
          objc_msgSend(v12, "bias");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          LODWORD(v25) = v24;
          LODWORD(v26) = v22;
          v27 = -[SPEmbeddingResult initWithVersion:data:type:scale:bias:](v53, "initWithVersion:data:type:scale:bias:", v15, v17, v19, v26, v25);

          v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (!v28)
          {
            v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 72));
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v31 = *(void **)(v30 + 40);
            *(_QWORD *)(v30 + 40) = v29;

            v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          }
          objc_msgSend(v28, "addObject:", v27);

        }
        v10 = obj;
        v6 = 0;
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        if (v52)
          continue;
        break;
      }
    }
  }

  v39 = dispatch_time(0, 0);
  v40 = *(_QWORD **)(a1 + 88);
  v41 = v39 - *(_QWORD *)(a1 + 80);
  if (v40 && !*(_QWORD *)(a1 + 96))
    *v40 += v41;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    if ((*(_QWORD *)(a1 + 104) | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
        *(_DWORD *)buf = 134218496;
        v59 = v43;
        v60 = 2048;
        v61 = v41;
        v62 = 1024;
        v63 = v49;
        v44 = "Successfully generated %lu text embeddings (time=%lld) RID (%d)";
LABEL_29:
        _os_log_impl(&dword_24795D000, v42, OS_LOG_TYPE_INFO, v44, buf, 0x1Cu);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v48 = *(_QWORD *)(a1 + 104);
        *(_DWORD *)buf = 134218496;
        v59 = v48;
        v60 = 2048;
        v61 = v41;
        v62 = 1024;
        v63 = v49;
        v44 = "qid=%ld - Successfully generated a text embedding (time=%lld) RID (%d)";
        goto LABEL_29;
      }
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryIDs, 0);
  objc_storeStrong((id *)&self->_requestIDs, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)deviceSupportsEmbedding
{
  const __CFString *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (getDeviceSupported_gDeviceSupported)
    v0 = CFSTR("supported");
  else
    v0 = CFSTR("unsupported");
  v1 = 138412290;
  v2 = v0;
  _os_log_debug_impl(&dword_24795D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Embedding generation %@ on this device", (uint8_t *)&v1, 0xCu);
}

@end
