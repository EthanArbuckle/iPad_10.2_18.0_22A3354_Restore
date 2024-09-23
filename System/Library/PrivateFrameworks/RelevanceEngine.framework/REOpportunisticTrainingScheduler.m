@implementation REOpportunisticTrainingScheduler

- (REOpportunisticTrainingScheduler)init
{
  REOpportunisticTrainingScheduler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_xpc_object *v6;
  OS_xpc_object *criteria;
  uint64_t v8;
  NSMutableArray *blocks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)REOpportunisticTrainingScheduler;
  v2 = -[REOpportunisticTrainingScheduler init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.RelevanceEngine.REOpportunisticTrainingScheduler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    criteria = v2->_criteria;
    v2->_criteria = v6;

    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x24BDAC6E8], 1);
    xpc_dictionary_set_int64(v2->_criteria, (const char *)*MEMORY[0x24BDAC5D8], 600);
    xpc_dictionary_set_int64(v2->_criteria, (const char *)*MEMORY[0x24BDAC5B8], 300);
    xpc_dictionary_set_string(v2->_criteria, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    blocks = v2->_blocks;
    v2->_blocks = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[REOpportunisticTrainingScheduler _queue_unschedule](self, "_queue_unschedule");
  v3.receiver = self;
  v3.super_class = (Class)REOpportunisticTrainingScheduler;
  -[REOpportunisticTrainingScheduler dealloc](&v3, sel_dealloc);
}

- (void)performTask:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke;
    v7[3] = &unk_24CF8AA78;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __48__REOpportunisticTrainingScheduler_performTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  _BYTE *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  _QWORD handler[4];
  id v10;
  id buf[2];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)MEMORY[0x2199B2434](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  v5 = *(_BYTE **)(a1 + 32);
  if (v4 < 0x64)
  {
    if (!v5[32])
    {
      RELogForDomain(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "Scheduled training scheduler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *(id *)(a1 + 32));
      v7 = (const char *)REOpportunisticTrainingSchedulerActivityName;
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke_12;
      handler[3] = &unk_24CF909F0;
      objc_copyWeak(&v10, buf);
      xpc_activity_register(v7, v8, handler);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    objc_msgSend(v5, "_performAllTasks");
    objc_msgSend(*(id *)(a1 + 32), "_queue_unschedule");
  }
}

void __48__REOpportunisticTrainingScheduler_performTask___block_invoke_12(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _QWORD *WeakRetained;
  xpc_activity_state_t state;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  _xpc_activity_s *v10;
  _QWORD *v11;
  uint8_t buf[4];
  xpc_activity_state_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state = xpc_activity_get_state(v3);
    RELogForDomain(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = state;
      _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "Training scheduler fired with state %ld", buf, 0xCu);
    }

    if (!xpc_activity_set_state(v3, 4))
    {
      RELogForDomain(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2132F7000, v7, OS_LOG_TYPE_INFO, "Unable to continue training schedule activity", buf, 2u);
      }

    }
    v8 = WeakRetained[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke_13;
    v9[3] = &unk_24CF8AB18;
    v10 = v3;
    v11 = WeakRetained;
    dispatch_async(v8, v9);

  }
}

uint64_t __48__REOpportunisticTrainingScheduler_performTask___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    RELogForDomain(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "Unable to finish training schedule activity", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_performAllTasks");
  return objc_msgSend(*(id *)(a1 + 40), "_queue_unschedule");
}

- (void)_performAllTasks
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_blocks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_blocks, "removeAllObjects", (_QWORD)v8);
}

- (void)_queue_unschedule
{
  if (self->_scheduled)
  {
    xpc_activity_unregister((const char *)REOpportunisticTrainingSchedulerActivityName);
    self->_scheduled = 0;
  }
}

- (void)cancelPendindTasks
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__REOpportunisticTrainingScheduler_cancelPendindTasks__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__REOpportunisticTrainingScheduler_cancelPendindTasks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unschedule");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end
