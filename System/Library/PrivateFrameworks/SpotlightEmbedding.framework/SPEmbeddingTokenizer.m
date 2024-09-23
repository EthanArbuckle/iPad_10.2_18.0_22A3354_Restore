@implementation SPEmbeddingTokenizer

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SPEmbeddingTokenizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __27__SPEmbeddingTokenizer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.spotlightembedding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_sSharedInstance_0;
}

void __38__SPEmbeddingTokenizer_sharedInstance__block_invoke()
{
  SPEmbeddingTokenizer *v0;
  void *v1;

  v0 = objc_alloc_init(SPEmbeddingTokenizer);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

- (SPEmbeddingTokenizer)init
{
  SPEmbeddingTokenizer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPEmbeddingTokenizer;
  v2 = -[SPEmbeddingTokenizer init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SpotlightEmbedding.SPEmbeddingTokenizer.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)initTokenizer
{
  CSUTokenizer *v3;
  id v4;
  CSUTokenizer *tokenizer;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!self->_tokenizer)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BE282A8], "TokenizerForRevision:error:", objc_msgSend(MEMORY[0x24BE642D8], "csuTokenizerRevision"), &v7);
    v3 = (CSUTokenizer *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    tokenizer = self->_tokenizer;
    self->_tokenizer = v3;

    if (v4 || !self->_tokenizer)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_24795D000, v6, OS_LOG_TYPE_ERROR, "CSU tokenizer initialization failed with error %@", buf, 0xCu);
      }

    }
  }
}

- (id)getTokenIDsForText:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SPEmbeddingTokenizer_getTokenIDsForText___block_invoke;
  block[3] = &unk_2518FE760;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_sync(queue, v7);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__SPEmbeddingTokenizer_getTokenIDsForText___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "initTokenizer");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "getTokenIDsForText:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)getTokensForText:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SPEmbeddingTokenizer_getTokensForText___block_invoke;
  block[3] = &unk_2518FE760;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_sync(queue, v7);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__SPEmbeddingTokenizer_getTokensForText___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "initTokenizer");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "getTokensForText:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (unint64_t)maxTokenLength
{
  NSObject *queue;
  dispatch_block_t v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__SPEmbeddingTokenizer_maxTokenLength__block_invoke;
  v6[3] = &unk_2518FE788;
  v6[4] = self;
  v6[5] = &v7;
  v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v6);
  dispatch_sync(queue, v3);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__38__SPEmbeddingTokenizer_maxTokenLength__block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "initTokenizer");
  result = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    result = (void *)objc_msgSend(result, "maxTokenLength");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)clear
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SPEmbeddingTokenizer_clear__block_invoke;
  block[3] = &unk_2518FE590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__SPEmbeddingTokenizer_clear__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end
