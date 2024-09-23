@implementation OITSUProgress

- (OITSUProgress)init
{
  OITSUProgress *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUProgress;
  v2 = -[OITSUProgress init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return 0;
    }
    else
    {
      v2->mProgressObservers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v2->mProgressObserversQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUProgress", 0);
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mProgressObserversQueue;
  objc_super v4;

  mProgressObserversQueue = self->mProgressObserversQueue;
  if (mProgressObserversQueue)
    dispatch_release(mProgressObserversQueue);
  v4.receiver = self;
  v4.super_class = (Class)OITSUProgress;
  -[OITSUProgress dealloc](&v4, sel_dealloc);
}

- (double)value
{
  return NAN;
}

- (double)maxValue
{
  return NAN;
}

- (BOOL)isIndeterminate
{
  return 1;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  OITSUProgressObserver *v5;
  NSObject *mProgressObserversQueue;
  _QWORD v9[6];

  v5 = 0;
  if (a4 && a5)
  {
    v5 = -[OITSUProgressObserver initWithValueInterval:queue:handler:]([OITSUProgressObserver alloc], "initWithValueInterval:queue:handler:", a4, a5, a3);
    mProgressObserversQueue = self->mProgressObserversQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__OITSUProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
    v9[3] = &unk_24F39B110;
    v9[4] = self;
    v9[5] = v5;
    dispatch_async(mProgressObserversQueue, v9);
  }
  return v5;
}

uint64_t __68__OITSUProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeProgressObserver:(id)a3
{
  NSObject *mProgressObserversQueue;
  _QWORD v4[6];

  if (a3)
  {
    mProgressObserversQueue = self->mProgressObserversQueue;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __40__OITSUProgress_removeProgressObserver___block_invoke;
    v4[3] = &unk_24F39B110;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(mProgressObserversQueue, v4);
  }
}

uint64_t __40__OITSUProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)protected_progressDidChange
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__OITSUProgress_protected_progressDidChange__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(global_queue, block);
}

void __44__OITSUProgress_protected_progressDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[7];
  char v11;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(*(id *)(a1 + 32), "value");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "maxValue");
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isIndeterminate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__OITSUProgress_protected_progressDidChange__block_invoke_2;
  v10[3] = &unk_24F39B138;
  v10[4] = v8;
  v10[5] = v4;
  v10[6] = v6;
  v11 = v7;
  dispatch_async(v9, v10);
  objc_autoreleasePoolPop(v2);
}

void __44__OITSUProgress_protected_progressDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E2DDB58]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "handleValue:maxValue:isIndeterminate:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)protected_hasProgressObservers
{
  NSObject *mProgressObserversQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mProgressObserversQueue = self->mProgressObserversQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__OITSUProgress_protected_hasProgressObservers__block_invoke;
  v5[3] = &unk_24F39B098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressObserversQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__OITSUProgress_protected_hasProgressObservers__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (double)protected_minProgressObserverValueInterval
{
  NSObject *mProgressObserversQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x7FF0000000000000;
  mProgressObserversQueue = self->mProgressObserversQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__OITSUProgress_protected_minProgressObserverValueInterval__block_invoke;
  v5[3] = &unk_24F39B160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressObserversQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__OITSUProgress_protected_minProgressObserverValueInterval__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "valueInterval");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmin(v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
