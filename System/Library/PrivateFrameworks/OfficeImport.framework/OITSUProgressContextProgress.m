@implementation OITSUProgressContextProgress

- (OITSUProgressContextProgress)initWithProgressContext:(id)a3
{
  OITSUProgressContextProgress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUProgressContextProgress;
  v4 = -[OITSUProgress init](&v6, sel_init);
  if (v4)
  {
    v4->mProgressContext = (OITSUProgressContext *)a3;
    v4->mProgressContextObserverQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUProgressContextProgress", 0);
  }
  return v4;
}

- (OITSUProgressContextProgress)init
{
  return -[OITSUProgressContextProgress initWithProgressContext:](self, "initWithProgressContext:", 0);
}

- (void)dealloc
{
  NSObject *mProgressContextObserverQueue;
  objc_super v4;

  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  if (mProgressContextObserverQueue)
    dispatch_release(mProgressContextObserverQueue);
  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressContextProgress;
  -[OITSUProgress dealloc](&v4, sel_dealloc);
}

- (double)value
{
  OITSUProgressContext *mProgressContext;
  double result;

  mProgressContext = self->mProgressContext;
  if (!mProgressContext)
    return 0.0;
  -[OITSUProgressContext overallProgress](mProgressContext, "overallProgress");
  return result;
}

- (double)maxValue
{
  return 1.0;
}

- (BOOL)isIndeterminate
{
  return 0;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OITSUProgressContextProgress;
  v6 = -[OITSUProgress addProgressObserverWithValueInterval:queue:handler:](&v8, sel_addProgressObserverWithValueInterval_queue_handler_, a4, a5, a3);
  -[OITSUProgressContextProgress p_updateProgressContextObserver](self, "p_updateProgressContextObserver");
  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressContextProgress;
  -[OITSUProgress removeProgressObserver:](&v4, sel_removeProgressObserver_, a3);
  -[OITSUProgressContextProgress p_updateProgressContextObserver](self, "p_updateProgressContextObserver");
}

- (void)p_updateProgressContextObserver
{
  NSObject *mProgressContextObserverQueue;
  _QWORD block[5];

  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__OITSUProgressContextProgress_p_updateProgressContextObserver__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(mProgressContextObserverQueue, block);
}

void __63__OITSUProgressContextProgress_p_updateProgressContextObserver__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  BOOL v5;
  char v6;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "protected_hasProgressObservers");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 48))
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    if (*(_BYTE *)(v4 + 48))
      v6 = v3;
    else
      v6 = 1;
    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(v4 + 32), "removeProgressObserver:");
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 32), "addProgressObserver:selector:", v4, sel_p_progressDidChange_);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

- (void)p_progressDidChange:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("TSUProgressMessage"));
  if (v4)
    -[OITSUProgress setMessage:](self, "setMessage:", v4);
  -[OITSUProgress protected_progressDidChange](self, "protected_progressDidChange");
}

@end
