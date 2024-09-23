@implementation TSDTilingBackgroundQueue

+ (id)p_sharedLimitedQueue
{
  if (p_sharedLimitedQueue_onceToken != -1)
    dispatch_once(&p_sharedLimitedQueue_onceToken, &__block_literal_global_185);
  return (id)p_sharedLimitedQueue_sLimitedQueue;
}

TSDTilingLimitedQueue *__48__TSDTilingBackgroundQueue_p_sharedLimitedQueue__block_invoke()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  TSDTilingLimitedQueue *result;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processorCount");
  if (v0 <= 1)
    v1 = 1;
  else
    v1 = v0;
  if (v1 >= 0xC)
    v2 = 24;
  else
    v2 = 2 * v1;
  result = -[TSDTilingLimitedQueue initWithLimit:]([TSDTilingLimitedQueue alloc], "initWithLimit:", v2);
  p_sharedLimitedQueue_sLimitedQueue = (uint64_t)result;
  return result;
}

- (TSDTilingBackgroundQueue)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingBackgroundQueue init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1466, CFSTR("-initWithAccessController: is the designated initializer"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("-initWithAccessController: is the designated initializer"), "-[TSDTilingBackgroundQueue init]"), 0));
}

- (TSDTilingBackgroundQueue)initWithAccessController:(id)a3
{
  TSDTilingBackgroundQueue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDTilingBackgroundQueue;
  v4 = -[TSDTilingBackgroundQueue init](&v6, sel_init);
  if (v4)
  {
    v4->mCanEnqueueReaders = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v4->mInFlightReaders = (OS_dispatch_group *)dispatch_group_create();
    v4->mAccessController = (TSKAccessController *)a3;
    v4->mReaderSpinLock._os_unfair_lock_opaque = 0;
    v4->mReadLockSignal = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
  __dmb(0xBu);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDTilingBackgroundQueue shutdown](self, "shutdown");
  dispatch_release((dispatch_object_t)self->mCanEnqueueReaders);
  dispatch_release((dispatch_object_t)self->mInFlightReaders);
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingBackgroundQueue;
  -[TSDTilingBackgroundQueue dealloc](&v3, sel_dealloc);
}

- (void)shutdown
{
  int64_t *p_mShutdownToken;
  int64_t mShutdownToken;
  _QWORD block[5];

  mShutdownToken = self->mShutdownToken;
  p_mShutdownToken = &self->mShutdownToken;
  block[4] = self;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__TSDTilingBackgroundQueue_shutdown__block_invoke;
  block[3] = &unk_24D829278;
  if (mShutdownToken != -1)
    dispatch_once(p_mShutdownToken, block);
}

uint64_t __36__TSDTilingBackgroundQueue_shutdown__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShuttingDown:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "drainAndPerformSync:", &__block_literal_global_191);
}

- (void)performAsync:(id)a3
{
  unint64_t mReaderCount;
  void *v6;
  _QWORD v7[6];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)self->mInFlightReaders);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  os_unfair_lock_lock(&self->mReaderSpinLock);
  mReaderCount = self->mReaderCount;
  if (!mReaderCount)
  {
    -[TSDTilingBackgroundQueue p_readLock](self, "p_readLock");
    mReaderCount = self->mReaderCount;
  }
  self->mReaderCount = mReaderCount + 1;
  os_unfair_lock_unlock(&self->mReaderSpinLock);
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "p_sharedLimitedQueue");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__TSDTilingBackgroundQueue_performAsync___block_invoke;
  v7[3] = &unk_24D82B588;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "performAsync:", v7);
}

void __41__TSDTilingBackgroundQueue_performAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 32))
  {
    objc_msgSend((id)v2, "p_readUnlock");
    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
}

- (void)drainAndPerformSync:(id)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait((dispatch_group_t)self->mInFlightReaders, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
}

- (void)p_readLock
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__TSDTilingBackgroundQueue_p_readLock__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __38__TSDTilingBackgroundQueue_p_readLock__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDTilingBackgroundQueue_p_readLock__block_invoke_2;
  v4[3] = &unk_24D829278;
  v4[4] = v1;
  return objc_msgSend(v2, "performRead:", v4);
}

intptr_t __38__TSDTilingBackgroundQueue_p_readLock__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)p_readUnlock
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mReadLockSignal);
}

+ (BOOL)isHoldingReadLockFromBackgroundQueue
{
  return dispatch_get_specific((const void *)TSDTilingBackgroundQueueSpecific) != 0;
}

- (BOOL)isShuttingDown
{
  return self->mShuttingDown;
}

- (void)setShuttingDown:(BOOL)a3
{
  self->mShuttingDown = a3;
}

@end
