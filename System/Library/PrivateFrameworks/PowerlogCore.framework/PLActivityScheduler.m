@implementation PLActivityScheduler

void __55__PLActivityScheduler_lastCompletedDateWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "lastCompletedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  v4 = v5;
  if (v5)
  {

    v4 = v5;
  }

}

- (NSMutableDictionary)activities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLActivityScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (id)lastCompletedDateWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[PLActivityScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLActivityScheduler_lastCompletedDateWithIdentifier___block_invoke;
  block[3] = &unk_1E6A521C8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

void __37__PLActivityScheduler_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (PLActivityScheduler)init
{
  PLActivityScheduler *v2;
  uint64_t v3;
  NSMutableDictionary *activities;
  uint64_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLActivityScheduler;
  v2 = -[PLActivityScheduler init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v5 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)scheduleActivityWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  PLActivity *v22;
  NSObject *v23;
  id v24;
  _QWORD block[5];
  PLActivity *v26;

  v24 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "storageLocked");

  if ((v21 & 1) == 0)
  {
    v22 = -[PLActivity initWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:]([PLActivity alloc], "initWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", v24, v14, v15, v16, v17, v18);
    if (v22)
    {
      -[PLActivityScheduler workQueue](self, "workQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __135__PLActivityScheduler_scheduleActivityWithIdentifier_withCriteria_withMustRunCriterion_withQueue_withInterruptBlock_withActivityBlock___block_invoke;
      block[3] = &unk_1E6A521A0;
      block[4] = self;
      v26 = v22;
      dispatch_async_and_wait(v23, block);

    }
  }

}

uint64_t __135__PLActivityScheduler_scheduleActivityWithIdentifier_withCriteria_withMustRunCriterion_withQueue_withInterruptBlock_withActivityBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "activities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "storageLocked");

    v4 = v9;
    if ((v7 & 1) == 0)
    {
      -[PLActivityScheduler workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PLActivityScheduler_cancelActivityWithIdentifier___block_invoke;
      block[3] = &unk_1E6A521A0;
      block[4] = self;
      v11 = v9;
      dispatch_async_and_wait(v8, block);

      v4 = v9;
    }
  }

}

void __52__PLActivityScheduler_cancelActivityWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setEnabled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "activities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    v3 = v5;
  }

}

- (void)setActivities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
