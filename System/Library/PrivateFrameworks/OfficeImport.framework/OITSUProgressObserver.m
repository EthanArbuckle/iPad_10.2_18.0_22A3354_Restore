@implementation OITSUProgressObserver

- (OITSUProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  OITSUProgressObserver *v8;
  OITSUProgressObserver *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OITSUProgressObserver;
  v8 = -[OITSUProgressObserver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a4 && a5)
    {
      v8->mValueInterval = a3;
      dispatch_retain((dispatch_object_t)a4);
      v9->mQueue = (OS_dispatch_queue *)a4;
      v9->mHandler = (id)objc_msgSend(a5, "copy");
      v9->mLastHandledValue = 0.0;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (OITSUProgressObserver)init
{
  return -[OITSUProgressObserver initWithValueInterval:queue:handler:](self, "initWithValueInterval:queue:handler:", 0, 0, 0.0);
}

- (void)dealloc
{
  NSObject *mQueue;
  objc_super v4;

  mQueue = self->mQueue;
  if (mQueue)
    dispatch_release(mQueue);

  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressObserver;
  -[OITSUProgressObserver dealloc](&v4, sel_dealloc);
}

- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5
{
  double v9;
  double v10;
  NSObject *mQueue;
  _QWORD block[5];

  if (self->mLastHandledIndeterminate != a5
    || (v9 = vabdd_f64(a3, self->mLastHandledValue),
        -[OITSUProgressObserver valueInterval](self, "valueInterval"),
        v9 >= v10)
    || a3 >= a4 && self->mLastHandledValue < a4)
  {
    self->mLastHandledIndeterminate = a5;
    self->mLastHandledValue = a3;
    mQueue = self->mQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__OITSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke;
    block[3] = &unk_24F39A608;
    block[4] = self;
    dispatch_async(mQueue, block);
  }
}

void __62__OITSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2DDB58]();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (double)valueInterval
{
  return self->mValueInterval;
}

@end
