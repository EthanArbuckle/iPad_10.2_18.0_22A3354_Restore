@implementation XBApplicationSnapshotGenerationScheduler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_sheduler;
}

void __58__XBApplicationSnapshotGenerationScheduler_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[XBApplicationSnapshotGenerationScheduler _init]([XBApplicationSnapshotGenerationScheduler alloc], "_init");
  v1 = (void *)sharedInstance_sheduler;
  sharedInstance_sheduler = (uint64_t)v0;

}

- (id)_init
{
  id v2;
  dispatch_workloop_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_workloop_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)XBApplicationSnapshotGenerationScheduler;
  v2 = -[XBApplicationSnapshotGenerationScheduler init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_workloop_create("XBApplicationSnapshotSchedulerImageGenerationWorkloop");
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create_with_target_V2("XBApplicationSnapshotSchedulerImageGenerationQueue", 0, *((dispatch_queue_t *)v2 + 1));
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = dispatch_workloop_create("XBApplicationSnapshotSchedulerImageDataGenerationWorkloop");
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

  }
  return v2;
}

- (void)performImageGenerationAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_imageGenerationQueue, a3);
}

- (void)performImageGenerationAsyncAndWait:(id)a3
{
  dispatch_async_and_wait((dispatch_queue_t)self->_imageGenerationWorkloop, a3);
}

- (void)performImageDataGenerationAsync:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dataGenerationWorkloop;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dataGenerationWorkloop = self->_dataGenerationWorkloop;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsync_withHandler___block_invoke;
  block[3] = &unk_24D7F4748;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(dataGenerationWorkloop, block);

}

void __88__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsync_withHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)a1[6];
  if (v3)
    dispatch_async(*(dispatch_queue_t *)(a1[4] + 16), v3);
}

- (void)performImageDataGenerationAsyncAndWait:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dataGenerationWorkloop;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dataGenerationWorkloop = self->_dataGenerationWorkloop;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsyncAndWait_withHandler___block_invoke;
  block[3] = &unk_24D7F4748;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async_and_wait(dataGenerationWorkloop, block);

}

void __95__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsyncAndWait_withHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)a1[6];
  if (v3)
    dispatch_async(*(dispatch_queue_t *)(a1[4] + 16), v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataGenerationWorkloop, 0);
  objc_storeStrong((id *)&self->_imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->_imageGenerationWorkloop, 0);
}

@end
