@implementation WBSPeriodicActivityScheduler

void __62__WBSPeriodicActivityScheduler__scheduleActivityWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v3 = fmin(*(double *)(a1 + 40) * 0.5, 3600.0);
    objc_msgSend(*(id *)(v1 + 40), "invalidate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v8, *(_QWORD *)(a1 + 32), sel__timerDidFire_, 0, 0, 0.0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setTolerance:", v3);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *MEMORY[0x1E0C99860]);

  }
}

- (WBSPeriodicActivityScheduler)initWithInterval:(double)a3 minimumDelay:(double)a4 lastFireDate:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  WBSPeriodicActivityScheduler *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  id block;
  double v17;
  double v18;
  double v19;
  double v20;
  WBSPeriodicActivityScheduler *v21;
  objc_super v23;

  v10 = a5;
  v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WBSPeriodicActivityScheduler;
  v12 = -[WBSPeriodicActivityScheduler init](&v23, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.SafariShared.WBSPeriodicActivityScheduler", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_interval = a3;
    v15 = MEMORY[0x1A8599ED0](v11);
    block = v12->_block;
    v12->_block = (id)v15;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "timeIntervalSinceNow");
    v18 = v17 + a3;
    v19 = 0.0;
    if (v18 > 0.0)
    {
      objc_msgSend(v10, "timeIntervalSinceNow", 0.0);
      v19 = v20 + a3;
    }
    if (v19 < a4)
      v19 = a4;
    -[WBSPeriodicActivityScheduler _scheduleActivityWithInterval:](v12, "_scheduleActivityWithInterval:", v19);
    v21 = v12;
  }

  return v12;
}

- (void)_scheduleActivityWithInterval:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__WBSPeriodicActivityScheduler__scheduleActivityWithInterval___block_invoke;
  v4[3] = &unk_1E4B2A910;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (WBSPeriodicActivityScheduler)init
{

  return 0;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WBSPeriodicActivityScheduler_invalidate__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__WBSPeriodicActivityScheduler_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
}

- (void)_performActivity
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSPeriodicActivityScheduler__performActivity__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __48__WBSPeriodicActivityScheduler__performActivity__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleActivityWithInterval:", *(double *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
