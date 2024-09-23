@implementation TSUScaledProgress

- (TSUScaledProgress)init
{
  TSUScaledProgress *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUScaledProgress;
  v2 = -[TSUProgress init](&v4, sel_init);
  if (v2)
  {
    v2->mStorage = objc_alloc_init(TSUScaledProgressStorage);
    v2->mProgressQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUScaledProgress", 0);
    -[TSUScaledProgressStorage setMaxValue:](v2->mStorage, "setMaxValue:", 1.0);
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
  v4.super_class = (Class)TSUScaledProgress;
  -[TSUProgress dealloc](&v4, sel_dealloc);
}

- (TSUProgress)progress
{
  NSObject *mProgressQueue;
  TSUProgress *v3;
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  mProgressQueue = self->mProgressQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSUScaledProgress_progress__block_invoke;
  v5[3] = &unk_24D61B278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressQueue, v5);
  v3 = (TSUProgress *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__TSUScaledProgress_progress__block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  return objc_msgSend(v2, "drain");
}

- (void)setProgress:(id)a3
{
  NSObject *mProgressQueue;
  _QWORD v4[6];

  mProgressQueue = self->mProgressQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__TSUScaledProgress_setProgress___block_invoke;
  v4[3] = &unk_24D61AE28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mProgressQueue, v4);
}

uint64_t __33__TSUScaledProgress_setProgress___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[5] != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "p_removeProgressObserverFromProgressInQueue");
    v4 = *(id *)(a1 + 40);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
    objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  }
  return objc_msgSend(v2, "drain");
}

- (double)value
{
  TSUProgress *v3;
  TSUProgress *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[TSUScaledProgress progress](self, "progress");
  if (!v3)
    return 0.0;
  v4 = v3;
  -[TSUProgress value](v3, "value");
  v6 = v5;
  -[TSUProgress maxValue](v4, "maxValue");
  v8 = v6 / v7;
  -[TSUScaledProgress maxValue](self, "maxValue");
  return v8 * v9;
}

- (double)maxValue
{
  double result;

  -[TSUScaledProgressStorage maxValue](self->mStorage, "maxValue");
  return result;
}

- (void)setMaxValue:(double)a3
{
  -[TSUScaledProgressStorage setMaxValue:](self->mStorage, "setMaxValue:", a3);
  -[TSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (BOOL)isIndeterminate
{
  TSUProgress *v2;

  v2 = -[TSUScaledProgress progress](self, "progress");
  return !v2 || -[TSUProgress isIndeterminate](v2, "isIndeterminate");
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  NSObject *mProgressQueue;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSUScaledProgress;
  v6 = -[TSUProgress addProgressObserverWithValueInterval:queue:handler:](&v10, sel_addProgressObserverWithValueInterval_queue_handler_, a4, a5, a3);
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__TSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
  block[3] = &unk_24D61AB38;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
  return v6;
}

uint64_t __72__TSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  return objc_msgSend(v2, "drain");
}

- (void)removeProgressObserver:(id)a3
{
  NSObject *mProgressQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUScaledProgress;
  -[TSUProgress removeProgressObserver:](&v6, sel_removeProgressObserver_, a3);
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TSUScaledProgress_removeProgressObserver___block_invoke;
  block[3] = &unk_24D61AB38;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
}

uint64_t __44__TSUScaledProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  return objc_msgSend(v2, "drain");
}

- (void)p_addProgressObserverToProgressInQueue
{
  uint64_t v3;
  double v4;
  double v7;
  double v8;
  double v9;
  TSUProgress *mProgress;
  OS_dispatch_queue *mProgressQueue;
  _QWORD v12[5];

  if (self->mProgress)
  {
    -[TSUProgress protected_minProgressObserverValueInterval](self, "protected_minProgressObserverValueInterval");
    v4 = *(double *)&v3;
    if (v3 >= 0 && ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      -[TSUProgress maxValue](self->mProgress, "maxValue");
      v8 = v7;
      -[TSUScaledProgress maxValue](self, "maxValue");
      mProgress = self->mProgress;
      mProgressQueue = self->mProgressQueue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __59__TSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke;
      v12[3] = &unk_24D61AB38;
      v12[4] = self;
      self->mProgressObserver = -[TSUProgress addProgressObserverWithValueInterval:queue:handler:](mProgress, "addProgressObserverWithValueInterval:queue:handler:", mProgressQueue, v12, v4 * (v8 / v9));
    }
  }
}

uint64_t __59__TSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  if (self->mProgressObserver)
  {
    -[TSUProgress removeProgressObserver:](self->mProgress, "removeProgressObserver:");

    self->mProgressObserver = 0;
  }
}

@end
