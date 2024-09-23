@implementation HKSPAccumulator

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  HKSPAccumulator *v9;

  v6 = (void *)MEMORY[0x1E0D519E8];
  v7 = a4;
  objc_msgSend(v6, "hkspMainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKSPAccumulator initWithInterval:updateBlock:scheduler:](self, "initWithInterval:updateBlock:scheduler:", v7, v8, a3);

  return v9;
}

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPAccumulator *v11;

  v8 = a5;
  v9 = a4;
  v10 = &__block_literal_global_21;
  v11 = -[HKSPAccumulator initWithInterval:updateBlock:scheduler:mutexGenerator:](self, "initWithInterval:updateBlock:scheduler:mutexGenerator:", v9, v8, &__block_literal_global_21, a3);

  return v11;
}

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKSPAccumulator *v13;
  HKSPAccumulator *v14;
  NSMutableSet *v15;
  NSMutableSet *accumulatedValues;
  HKSPThrottler *v17;
  HKSPAccumulator *v18;
  uint64_t v19;
  HKSPThrottler *throttler;
  HKSPAccumulator *v21;
  _QWORD v23[4];
  HKSPAccumulator *v24;
  id v25;
  objc_super v26;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKSPAccumulator;
  v13 = -[HKSPAccumulator init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_scheduler, a5);
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accumulatedValues = v14->_accumulatedValues;
    v14->_accumulatedValues = v15;

    v17 = [HKSPThrottler alloc];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__HKSPAccumulator_initWithInterval_updateBlock_scheduler_mutexGenerator___block_invoke;
    v23[3] = &unk_1E4E3A738;
    v25 = v10;
    v18 = v14;
    v24 = v18;
    v19 = -[HKSPThrottler initWithInterval:executeBlock:scheduler:mutexGenerator:](v17, "initWithInterval:executeBlock:scheduler:mutexGenerator:", v23, v11, v12, a3);
    throttler = v18->_throttler;
    v18->_throttler = (HKSPThrottler *)v19;

    v21 = v18;
  }

  return v14;
}

uint64_t __73__HKSPAccumulator_initWithInterval_updateBlock_scheduler_mutexGenerator___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)accumulateValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSPAccumulator accumulateValues:](self, "accumulateValues:", v6, v7, v8);
  }
}

- (void)accumulateValues:(id)a3
{
  id v4;
  NAScheduler *scheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HKSPAccumulator_accumulateValues___block_invoke;
  v7[3] = &unk_1E4E3A760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](scheduler, "performBlock:", v7);

}

uint64_t __36__HKSPAccumulator_accumulateValues___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "execute");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedValues, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
}

@end
