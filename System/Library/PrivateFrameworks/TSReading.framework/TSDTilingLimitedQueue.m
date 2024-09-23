@implementation TSDTilingLimitedQueue

- (TSDTilingLimitedQueue)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingLimitedQueue init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1374, CFSTR("-initWithLimit: is the designated initializer"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("-initWithLimit: is the designated initializer"), "-[TSDTilingLimitedQueue init]"), 0));
}

- (TSDTilingLimitedQueue)initWithLimit:(unint64_t)a3
{
  TSDTilingLimitedQueue *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDTilingLimitedQueue;
  v4 = -[TSDTilingLimitedQueue init](&v9, sel_init);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingLimitedQueue initWithLimit:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1382, CFSTR("Queue limit shoudl be at least one."));
      a3 = 1;
    }
    v4->mLimit = a3;
    v4->mManagerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.limitedqueue.manager", 0);
    v7 = dispatch_queue_create("com.apple.iwork.limitedqueue", MEMORY[0x24BDAC9C0]);
    v4->mTargetQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, (const void *)TSDTilingBackgroundQueueSpecific, (void *)TSDTilingBackgroundQueueSpecific, 0);
    v4->mSpinLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_barrier_sync((dispatch_queue_t)self->mManagerQueue, &__block_literal_global_42);
  dispatch_release((dispatch_object_t)self->mManagerQueue);
  dispatch_release((dispatch_object_t)self->mTargetQueue);
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLimitedQueue;
  -[TSDTilingLimitedQueue dealloc](&v3, sel_dealloc);
}

- (void)performAsync:(id)a3
{
  NSObject *mManagerQueue;
  _QWORD v4[6];

  mManagerQueue = self->mManagerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDTilingLimitedQueue_performAsync___block_invoke;
  v4[3] = &unk_24D82C328;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mManagerQueue, v4);
}

void __38__TSDTilingLimitedQueue_performAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  NSObject *v4;
  _QWORD v5[4];
  __int128 v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) == *(_QWORD *)(v2 + 24))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 8));
    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[2] = __38__TSDTilingLimitedQueue_performAsync___block_invoke_2;
  v5[3] = &unk_24D82B588;
  v6 = v3;
  dispatch_async(v4, v5);
}

void __38__TSDTilingLimitedQueue_performAsync___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) == *(_QWORD *)(v2 + 24) - 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v2 + 8));
    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
}

@end
