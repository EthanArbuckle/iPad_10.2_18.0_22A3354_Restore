@implementation TSUProgressObserver

- (TSUProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  TSUProgressObserver *v8;
  TSUProgressObserver *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSUProgressObserver;
  v8 = -[TSUProgressObserver init](&v11, sel_init);
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

- (TSUProgressObserver)init
{
  return -[TSUProgressObserver initWithValueInterval:queue:handler:](self, "initWithValueInterval:queue:handler:", 0, 0, 0.0);
}

- (void)dealloc
{
  NSObject *mQueue;
  objc_super v4;

  mQueue = self->mQueue;
  if (mQueue)
    dispatch_release(mQueue);

  v4.receiver = self;
  v4.super_class = (Class)TSUProgressObserver;
  -[TSUProgressObserver dealloc](&v4, sel_dealloc);
}

- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5
{
  double v9;
  double v10;
  NSObject *mQueue;
  _QWORD block[5];

  if (self->mLastHandledIndeterminate != a5
    || (v9 = vabdd_f64(a3, self->mLastHandledValue),
        -[TSUProgressObserver valueInterval](self, "valueInterval"),
        v9 >= v10)
    || a3 >= a4 && self->mLastHandledValue < a4)
  {
    self->mLastHandledIndeterminate = a5;
    self->mLastHandledValue = a3;
    mQueue = self->mQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__TSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke;
    block[3] = &unk_24D61AB38;
    block[4] = self;
    dispatch_async(mQueue, block);
  }
}

uint64_t __60__TSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  return objc_msgSend(v2, "drain");
}

- (double)valueInterval
{
  return self->mValueInterval;
}

@end
