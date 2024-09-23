@implementation TSUReadWriteQueue

- (TSUReadWriteQueue)initWithIdentifier:(id)a3
{
  TSUReadWriteQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUReadWriteQueue;
  v3 = -[TSUReadWriteQueue init](&v5, sel_init, a3);
  if (v3)
  {
    v3->mCanEnqueueReaders = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v3->mGlobalQueue = (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
    v3->mInFlightReaders = (OS_dispatch_group *)dispatch_group_create();
    v3->mInFlightWriters = (OS_dispatch_group *)dispatch_group_create();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->mInFlightReaders);
  dispatch_release((dispatch_object_t)self->mCanEnqueueReaders);
  dispatch_release((dispatch_object_t)self->mInFlightWriters);
  v3.receiver = self;
  v3.super_class = (Class)TSUReadWriteQueue;
  -[TSUReadWriteQueue dealloc](&v3, sel_dealloc);
}

- (void)performSyncRead:(id)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)self->mInFlightReaders);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  (*((void (**)(id))a3 + 2))(a3);
  dispatch_group_leave((dispatch_group_t)self->mInFlightReaders);
}

- (void)performAsyncWrite:(id)a3
{
  NSObject *mInFlightWriters;
  NSObject *mGlobalQueue;
  _QWORD v5[6];

  mInFlightWriters = self->mInFlightWriters;
  mGlobalQueue = self->mGlobalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__TSUReadWriteQueue_performAsyncWrite___block_invoke;
  v5[3] = &unk_24D61B2C8;
  v5[4] = self;
  v5[5] = a3;
  dispatch_group_async(mInFlightWriters, mGlobalQueue, v5);
}

intptr_t __39__TSUReadWriteQueue_performAsyncWrite___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)performSyncWrite:(id)a3
{
  dispatch_group_enter((dispatch_group_t)self->mInFlightWriters);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait((dispatch_group_t)self->mInFlightReaders, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  dispatch_group_leave((dispatch_group_t)self->mInFlightWriters);
}

- (void)waitOnInFlightWriters
{
  dispatch_group_wait((dispatch_group_t)self->mInFlightWriters, 0xFFFFFFFFFFFFFFFFLL);
}

@end
