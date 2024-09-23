@implementation PLCaptureDeferredPhotoProcessor

uint64_t __73__PLCaptureDeferredPhotoProcessor_prewarmWithSettings_completionHandler___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "prewarmWithSettings:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)prewarmWithSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *asyncQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLCaptureDeferredPhotoProcessor_prewarmWithSettings_completionHandler___block_invoke;
  block[3] = &unk_1E3676290;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(asyncQueue, block);

}

- (PLCaptureDeferredPhotoProcessor)init
{
  void *v3;
  void *v4;
  PLCaptureDeferredPhotoProcessor *v5;

  +[PLCaptureDeferredPhotoProcessor sharedAsyncQueue](PLCaptureDeferredPhotoProcessor, "sharedAsyncQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B080], "sharedPhotoProcessorForApplicationID:", CFSTR("com.apple.camera"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLCaptureDeferredPhotoProcessor initWithProcessor:asyncQueue:](self, "initWithProcessor:asyncQueue:", v4, v3);

  return v5;
}

- (PLCaptureDeferredPhotoProcessor)initWithProcessor:(id)a3 asyncQueue:(id)a4
{
  id v7;
  id v8;
  PLCaptureDeferredPhotoProcessor *v9;
  PLCaptureDeferredPhotoProcessor *v10;
  PLCaptureDeferredPhotoProcessor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCaptureDeferredPhotoProcessor;
  v9 = -[PLCaptureDeferredPhotoProcessor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processor, a3);
    objc_storeStrong((id *)&v10->_asyncQueue, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)sharedAsyncQueue
{
  pl_dispatch_once();
  return (id)sharedAsyncQueue_pl_once_object_17;
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *asyncQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PLCaptureDeferredPhotoProcessor_cancelAllPrewarmingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(asyncQueue, v7);

}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *asyncQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  asyncQueue = self->_asyncQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PLCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke;
  v15[3] = &unk_1E3677998;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(asyncQueue, v15);

}

- (void)persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *asyncQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PLCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(asyncQueue, v7);

}

- (void)deletePersistentStorageForPhotoProxy:(id)a3
{
  -[AVCaptureDeferredPhotoProcessor deletePersistentStorageForPhotoProxy:](self->_processor, "deletePersistentStorageForPhotoProxy:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
}

void __95__PLCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistentlyStoredDeferredPhotoProxies");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__PLCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "processPhotoProxy:queuePosition:delegate:", a1[5], a1[6], a1[7]);
}

uint64_t __76__PLCaptureDeferredPhotoProcessor_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancelAllPrewarming");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__PLCaptureDeferredPhotoProcessor_sharedAsyncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.assetsd.AVCaptureDeferredPhotoProcessor", v2);
  v1 = (void *)sharedAsyncQueue_pl_once_object_17;
  sharedAsyncQueue_pl_once_object_17 = (uint64_t)v0;

}

@end
