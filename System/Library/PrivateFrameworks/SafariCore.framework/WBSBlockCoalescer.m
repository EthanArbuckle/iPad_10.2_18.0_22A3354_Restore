@implementation WBSBlockCoalescer

- (WBSBlockCoalescer)initWithMinimumTimeIntervalBeforeExecution:(double)a3 queue:(id)a4
{
  NSObject *v6;
  WBSBlockCoalescer *v7;
  WBSBlockCoalescer *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  WBSBlockCoalescer *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSBlockCoalescer;
  v7 = -[WBSBlockCoalescer init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_minimumTimeIntervalBeforeExecution = a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.BlockCoalescer.%p"), v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    dispatch_set_target_queue((dispatch_object_t)v8->_queue, v6);
    v12 = v8;

  }
  return v8;
}

- (void)scheduleBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WBSBlockCoalescer_scheduleBlock___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __35__WBSBlockCoalescer_scheduleBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  dispatch_block_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    dispatch_block_cancel(v2);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __35__WBSBlockCoalescer_scheduleBlock___block_invoke_2;
  v10 = &unk_1E649B910;
  v3 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v7);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchBlock", v7, v8, v9, v10);
}

void __35__WBSBlockCoalescer_scheduleBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void)_dispatchBlock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSBlockCoalescer__dispatchBlock__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

void __35__WBSBlockCoalescer__dispatchBlock__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 24))
  {
    v3 = dispatch_time(0, (uint64_t)(*(double *)(v1 + 8) * 1000000000.0));
    dispatch_after(v3, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), *(dispatch_block_t *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
