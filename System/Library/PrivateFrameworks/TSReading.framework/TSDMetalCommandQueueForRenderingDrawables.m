@implementation TSDMetalCommandQueueForRenderingDrawables

void __TSDMetalCommandQueueForRenderingDrawables_block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSDMetalCommandQueueForRenderingDrawables_sCommandQueueDictionary;
  TSDMetalCommandQueueForRenderingDrawables_sCommandQueueDictionary = v0;

  v2 = dispatch_queue_create("com.apple.iwork.TSDMetalDrawableCommandQueueAccessingQueue", 0);
  v3 = (void *)TSDMetalCommandQueueForRenderingDrawables_sCommandQueueAcessingQueue;
  TSDMetalCommandQueueForRenderingDrawables_sCommandQueueAcessingQueue = (uint64_t)v2;

}

void __TSDMetalCommandQueueForRenderingDrawables_block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)TSDMetalCommandQueueForRenderingDrawables_sCommandQueueDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "registryID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "newCommandQueue");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = (void *)TSDMetalCommandQueueForRenderingDrawables_sCommandQueueDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "registryID"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
}

@end
