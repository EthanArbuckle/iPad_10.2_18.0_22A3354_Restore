@implementation RCBlockScheduler

- (RCBlockScheduler)init
{
  id v2;
  uint64_t v3;
  void *v4;
  dispatch_group_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RCBlockScheduler;
  v2 = -[RCBlockScheduler init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_group_create();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = dispatch_queue_create(0, 0);
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 3));
    v10 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v9;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v2 + 4), &__block_literal_global_8);
    *((_BYTE *)v2 + 56) = 1;
  }
  return (RCBlockScheduler *)v2;
}

- (void)suspend
{
  if (!self->_suspended)
  {
    dispatch_suspend((dispatch_object_t)self->_timer);
    self->_suspended = 1;
  }
}

- (void)resume
{
  if (self->_suspended)
  {
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_suspended = 0;
  }
}

- (void)scheduleBlock:(id)a3
{
  id v4;
  NSObject *schedulerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke;
  v7[3] = &unk_1E769CC78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(schedulerQueue, v7);

}

void __34__RCBlockScheduler_scheduleBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  dispatch_time_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  id v40;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)MEMORY[0x1C3B76918](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 48))
  {
    v5 = *(id *)(v4 + 72);
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__6;
    v39[4] = __Block_byref_object_dispose__6;
    v40 = (id)MEMORY[0x1C3B76918](*(_QWORD *)(a1 + 40));
    v7 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_1;
    v37[3] = &unk_1E769BF30;
    v8 = v6;
    v38 = v8;
    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_2;
    v34[3] = &unk_1E769CC00;
    v35 = (id)MEMORY[0x1C3B76918](v37);
    v36 = v39;
    v9 = v35;
    v10 = (void *)MEMORY[0x1C3B76918](v34);
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_3;
    v33[3] = &unk_1E769BF30;
    v33[4] = *(_QWORD *)(a1 + 32);
    v11 = (void *)MEMORY[0x1C3B76918](v33);
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_4;
    v28[3] = &unk_1E769CC28;
    v28[4] = *(_QWORD *)(a1 + 32);
    v29 = v8;
    v30 = v5;
    v31 = v10;
    v32 = v11;
    v12 = v11;
    v13 = v10;
    v14 = v5;
    v15 = v8;
    v16 = (void *)MEMORY[0x1C3B76918](v28);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 32);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_5;
    v25[3] = &unk_1E769CC50;
    v26 = v16;
    v27 = v39;
    v25[4] = v17;
    v19 = v16;
    dispatch_source_set_event_handler(v18, v25);
    v20 = MEMORY[0x1C3B76918](v12);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 48);
    *(_QWORD *)(v21 + 48) = v20;

    v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v24 = dispatch_time(0, 0);
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0);

    _Block_object_dispose(v39, 8);
  }
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_1(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __34__RCBlockScheduler_scheduleBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_time_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  v3 = dispatch_time(*(_QWORD *)(v1 + 40), (uint64_t)(*(double *)(v1 + 64) * 1000000000.0));
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = dispatch_time(0, 0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  dispatch_async(*(dispatch_queue_t *)(a1 + 48), *(dispatch_block_t *)(a1 + 56));
  dispatch_group_notify(*(dispatch_group_t *)(a1 + 40), *(dispatch_queue_t *)(a1 + 48), *(dispatch_block_t *)(a1 + 64));
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 8), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(v5 + 8), "removeObjectAtIndex:", 0);
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    dispatch_source_set_timer(*(dispatch_source_t *)(a1[4] + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_schedulerBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_schedulerQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
