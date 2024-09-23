@implementation OITSUScaledProgress

- (OITSUScaledProgress)init
{
  OITSUScaledProgress *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OITSUScaledProgress;
  v2 = -[OITSUProgress init](&v4, sel_init);
  if (v2)
  {
    v2->mStorage = objc_alloc_init(OITSUScaledProgressStorage);
    v2->mProgressQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUScaledProgress", 0);
    -[OITSUScaledProgressStorage setMaxValue:](v2->mStorage, "setMaxValue:", 1.0);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mProgressQueue;
  objc_super v4;

  mProgressQueue = self->mProgressQueue;
  if (mProgressQueue)
    dispatch_release(mProgressQueue);

  v4.receiver = self;
  v4.super_class = (Class)OITSUScaledProgress;
  -[OITSUProgress dealloc](&v4, sel_dealloc);
}

- (OITSUProgress)progress
{
  NSObject *mProgressQueue;
  OITSUProgress *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  mProgressQueue = self->mProgressQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__OITSUScaledProgress_progress__block_invoke;
  v5[3] = &unk_24F39B098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressQueue, v5);
  v3 = (OITSUProgress *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__OITSUScaledProgress_progress__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  objc_autoreleasePoolPop(v2);
}

- (void)setProgress:(id)a3
{
  NSObject *mProgressQueue;
  _QWORD v4[6];

  mProgressQueue = self->mProgressQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__OITSUScaledProgress_setProgress___block_invoke;
  v4[3] = &unk_24F39B110;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mProgressQueue, v4);
}

void __35__OITSUScaledProgress_setProgress___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  id v4;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[5] != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "p_removeProgressObserverFromProgressInQueue");
    v4 = *(id *)(a1 + 40);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
    objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  }
  objc_autoreleasePoolPop(v2);
}

- (double)value
{
  OITSUProgress *v3;
  OITSUProgress *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[OITSUScaledProgress progress](self, "progress");
  if (!v3)
    return 0.0;
  v4 = v3;
  -[OITSUProgress value](v3, "value");
  v6 = v5;
  -[OITSUProgress maxValue](v4, "maxValue");
  v8 = v6 / v7;
  -[OITSUScaledProgress maxValue](self, "maxValue");
  return v8 * v9;
}

- (double)maxValue
{
  double result;

  -[OITSUScaledProgressStorage maxValue](self->mStorage, "maxValue");
  return result;
}

- (void)setMaxValue:(double)a3
{
  -[OITSUScaledProgressStorage setMaxValue:](self->mStorage, "setMaxValue:", a3);
  -[OITSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (BOOL)isIndeterminate
{
  OITSUProgress *v2;

  v2 = -[OITSUScaledProgress progress](self, "progress");
  return !v2 || -[OITSUProgress isIndeterminate](v2, "isIndeterminate");
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  NSObject *mProgressQueue;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OITSUScaledProgress;
  v6 = -[OITSUProgress addProgressObserverWithValueInterval:queue:handler:](&v10, sel_addProgressObserverWithValueInterval_queue_handler_, a4, a5, a3);
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__OITSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
  return v6;
}

void __74__OITSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  objc_autoreleasePoolPop(v2);
}

- (void)removeProgressObserver:(id)a3
{
  NSObject *mProgressQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUScaledProgress;
  -[OITSUProgress removeProgressObserver:](&v6, sel_removeProgressObserver_, a3);
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__OITSUScaledProgress_removeProgressObserver___block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
}

void __46__OITSUScaledProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  objc_autoreleasePoolPop(v2);
}

- (void)p_addProgressObserverToProgressInQueue
{
  uint64_t v3;
  double v4;
  double v7;
  double v8;
  double v9;
  OITSUProgress *mProgress;
  OS_dispatch_queue *mProgressQueue;
  _QWORD v12[5];

  if (self->mProgress)
  {
    -[OITSUProgress protected_minProgressObserverValueInterval](self, "protected_minProgressObserverValueInterval");
    v4 = *(double *)&v3;
    if (v3 >= 0 && ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      -[OITSUProgress maxValue](self->mProgress, "maxValue");
      v8 = v7;
      -[OITSUScaledProgress maxValue](self, "maxValue");
      mProgress = self->mProgress;
      mProgressQueue = self->mProgressQueue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __61__OITSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke;
      v12[3] = &unk_24F39A608;
      v12[4] = self;
      self->mProgressObserver = -[OITSUProgress addProgressObserverWithValueInterval:queue:handler:](mProgress, "addProgressObserverWithValueInterval:queue:handler:", mProgressQueue, v12, v4 * (v8 / v9));
    }
  }
}

uint64_t __61__OITSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  if (self->mProgressObserver)
  {
    -[OITSUProgress removeProgressObserver:](self->mProgress, "removeProgressObserver:");

    self->mProgressObserver = 0;
  }
}

@end
