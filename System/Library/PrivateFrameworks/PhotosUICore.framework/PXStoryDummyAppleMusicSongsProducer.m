@implementation PXStoryDummyAppleMusicSongsProducer

- (PXStoryDummyAppleMusicSongsProducer)init
{
  PXStoryDummyAppleMusicSongsProducer *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummyAppleMusicSongsProducer;
  v2 = -[PXStoryDummyAppleMusicSongsProducer init](&v6, sel_init);
  if (v2)
  {
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PXStoryDummyAppleMusicSongsProducer_requestSongsWithOptions_resultHandler___block_invoke;
  v10[3] = &unk_1E512F910;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v11 = v6;
  v8 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return 0;
}

- (void)_queue_requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  NSArray *queue_assets;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  PXStorySongsConfiguration *v9;
  PXStoryProducerResult *v10;
  void (**v11)(id, PXStoryProducerResult *);

  v11 = (void (**)(id, PXStoryProducerResult *))a4;
  queue_assets = self->_queue_assets;
  if (!queue_assets)
  {
    PXMap();
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_queue_assets;
    self->_queue_assets = v6;

    queue_assets = self->_queue_assets;
  }
  PXAudioAssetFetchResultWithArray(queue_assets);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStorySongsConfiguration initWithCuratedAudioAssets:]([PXStorySongsConfiguration alloc], "initWithCuratedAudioAssets:", v8);
  v10 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v9);
  v11[2](v11, v10);

}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_assets, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

PXAppleMusicAsset *__84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXAppleMusicAsset *v3;
  id v4;
  PXAppleMusicAsset *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = [PXAppleMusicAsset alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke_2;
  v7[3] = &unk_1E512F978;
  v8 = v2;
  v4 = v2;
  v5 = -[PXAppleMusicAsset initWithConfiguration:](v3, "initWithConfiguration:", v7);

  return v5;
}

uint64_t __84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 32));
}

void __77__PXStoryDummyAppleMusicSongsProducer_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestSongsWithOptions:resultHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
