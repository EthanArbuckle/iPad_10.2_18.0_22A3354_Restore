@implementation HKSPThrottler

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPThrottler *v11;

  v8 = a5;
  v9 = a4;
  v10 = &__block_literal_global_21;
  v11 = -[HKSPThrottler initWithInterval:executeBlock:scheduler:mutexGenerator:](self, "initWithInterval:executeBlock:scheduler:mutexGenerator:", v9, v8, &__block_literal_global_21, a3);

  return v11;
}

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKSPThrottler *v13;
  HKSPLimitingScheduler *v14;
  HKSPLimitingScheduler *backingScheduler;
  HKSPTask *v16;
  void *v17;
  uint64_t v18;
  HKSPTask *task;
  HKSPThrottler *v20;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSPThrottler;
  v13 = -[HKSPThrottler init](&v22, sel_init);
  if (v13)
  {
    v14 = -[HKSPLimitingScheduler initWithScheduler:mutexGenerator:]([HKSPLimitingScheduler alloc], "initWithScheduler:mutexGenerator:", v11, v12);
    backingScheduler = v13->_backingScheduler;
    v13->_backingScheduler = v14;

    v16 = [HKSPTask alloc];
    -[HKSPThrottler description](v13, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKSPTask initWithIdentifier:block:delay:](v16, "initWithIdentifier:block:delay:", v17, v10, a3);
    task = v13->_task;
    v13->_task = (HKSPTask *)v18;

    v20 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingScheduler, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  HKSPThrottler *v9;

  v6 = (void *)MEMORY[0x1E0D519E8];
  v7 = a4;
  objc_msgSend(v6, "hkspMainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKSPThrottler initWithInterval:executeBlock:scheduler:](self, "initWithInterval:executeBlock:scheduler:", v7, v8, a3);

  return v9;
}

- (void)execute
{
  -[HKSPLimitingScheduler scheduleTask:](self->_backingScheduler, "scheduleTask:", self->_task);
}

@end
