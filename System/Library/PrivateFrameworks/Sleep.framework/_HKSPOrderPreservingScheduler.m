@implementation _HKSPOrderPreservingScheduler

- (_HKSPOrderPreservingScheduler)initWithScheduler:(id)a3 mutexProvider:(id)a4
{
  id v7;
  id v8;
  _HKSPOrderPreservingScheduler *v9;
  NSMutableArray *v10;
  NSMutableArray *tasks;
  _HKSPOrderPreservingScheduler *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKSPOrderPreservingScheduler;
  v9 = -[_HKSPOrderPreservingScheduler init](&v14, sel_init);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tasks = v9->_tasks;
    v9->_tasks = v10;

    *(_WORD *)&v9->_taskInProgress = 0;
    objc_storeStrong((id *)&v9->_scheduler, a3);
    objc_storeStrong((id *)&v9->_mutexProvider, a4);
    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  HKSPTask *v7;
  void *v8;

  v6 = a4;
  v7 = -[HKSPTask initWithBlock:delay:]([HKSPTask alloc], "initWithBlock:delay:", v6, a3);

  -[_HKSPOrderPreservingScheduler _scheduleTask:](self, "_scheduleTask:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;
  HKSPTask *v6;

  v4 = a3;
  v6 = -[HKSPTask initWithBlock:]([HKSPTask alloc], "initWithBlock:", v4);

  v5 = -[_HKSPOrderPreservingScheduler _scheduleTask:](self, "_scheduleTask:", v6);
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  id v5;
  HKSPTask *v6;
  id v7;
  id v8;
  HKSPTask *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D51990]);
  v6 = [HKSPTask alloc];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __56___HKSPOrderPreservingScheduler_performCancelableBlock___block_invoke;
  v17 = &unk_1E4E3A738;
  v19 = v4;
  v7 = v5;
  v18 = v7;
  v8 = v4;
  v9 = -[HKSPTask initWithBlock:](v6, "initWithBlock:", &v14);
  -[_HKSPOrderPreservingScheduler _scheduleTask:](self, "_scheduleTask:", v9, v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCancelable:", v10);

  v11 = v18;
  v12 = v7;

  return v12;
}

- (void)suspend
{
  HKSPMutexProvider *mutexProvider;
  _QWORD v3[5];

  mutexProvider = self->_mutexProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40___HKSPOrderPreservingScheduler_suspend__block_invoke;
  v3[3] = &unk_1E4E3AF48;
  v3[4] = self;
  -[HKSPMutexProvider performBlock:](mutexProvider, "performBlock:", v3);
}

- (void)resume
{
  HKSPMutexProvider *mutexProvider;
  _QWORD v4[5];

  mutexProvider = self->_mutexProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39___HKSPOrderPreservingScheduler_resume__block_invoke;
  v4[3] = &unk_1E4E3AF48;
  v4[4] = self;
  -[HKSPMutexProvider performBlock:](mutexProvider, "performBlock:", v4);
  -[_HKSPOrderPreservingScheduler _scheduleNextTaskIfPossible](self, "_scheduleNextTaskIfPossible");
}

- (id)_scheduleTask:(id)a3
{
  id v4;
  HKSPMutexProvider *mutexProvider;
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _HKSPOrderPreservingScheduler *v14;
  id v15;

  v4 = a3;
  mutexProvider = self->_mutexProvider;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47___HKSPOrderPreservingScheduler__scheduleTask___block_invoke;
  v13 = &unk_1E4E3A760;
  v14 = self;
  v6 = v4;
  v15 = v6;
  -[HKSPMutexProvider performBlock:](mutexProvider, "performBlock:", &v10);
  -[_HKSPOrderPreservingScheduler _scheduleNextTaskIfPossible](self, "_scheduleNextTaskIfPossible", v10, v11, v12, v13, v14);
  v7 = v15;
  v8 = v6;

  return v8;
}

- (void)_scheduleNextTaskIfPossible
{
  HKSPMutexProvider *mutexProvider;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  mutexProvider = self->_mutexProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60___HKSPOrderPreservingScheduler__scheduleNextTaskIfPossible__block_invoke;
  v5[3] = &unk_1E4E3B8A0;
  v5[4] = self;
  v5[5] = &v6;
  -[HKSPMutexProvider performBlock:](mutexProvider, "performBlock:", v5);
  v4 = (void *)v7[5];
  if (v4)
  {
    if ((objc_msgSend(v4, "isCanceled") & 1) != 0)
      -[_HKSPOrderPreservingScheduler _taskDidFinish](self, "_taskDidFinish");
    else
      -[_HKSPOrderPreservingScheduler _actuallyScheduleTask:](self, "_actuallyScheduleTask:", v7[5]);
  }
  _Block_object_dispose(&v6, 8);

}

- (void)_actuallyScheduleTask:(id)a3
{
  id v4;
  NAScheduler *scheduler;
  double v6;
  double v7;
  double v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "delay");
  scheduler = self->_scheduler;
  if (v6 <= 0.0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke_2;
    v13[3] = &unk_1E4E3A760;
    v9 = &v14;
    v13[4] = self;
    v14 = v4;
    v12 = v4;
    -[NAScheduler performBlock:](scheduler, "performBlock:", v13);
  }
  else
  {
    objc_msgSend(v4, "delay");
    v8 = v7;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke;
    v15[3] = &unk_1E4E3A760;
    v9 = &v16;
    v15[4] = self;
    v16 = v4;
    v10 = v4;
    v11 = (id)-[NAScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v15, v8);
  }

}

- (void)_executeTask:(id)a3
{
  objc_msgSend(a3, "execute");
  -[_HKSPOrderPreservingScheduler _taskDidFinish](self, "_taskDidFinish");
}

- (void)_taskDidFinish
{
  HKSPMutexProvider *mutexProvider;
  _QWORD v4[5];

  mutexProvider = self->_mutexProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___HKSPOrderPreservingScheduler__taskDidFinish__block_invoke;
  v4[3] = &unk_1E4E3AF48;
  v4[4] = self;
  -[HKSPMutexProvider performBlock:](mutexProvider, "performBlock:", v4);
  -[_HKSPOrderPreservingScheduler _scheduleNextTaskIfPossible](self, "_scheduleNextTaskIfPossible");
}

- (NSMutableArray)tasks
{
  return self->_tasks;
}

- (BOOL)taskInProgress
{
  return self->_taskInProgress;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

@end
