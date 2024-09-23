@implementation PXStoryDummySongsProducer

- (PXStoryDummySongsProducer)init
{
  PXStoryDummySongsProducer *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummySongsProducer;
  v2 = -[PXStoryDummySongsProducer init](&v6, sel_init);
  if (v2)
  {
    px_dispatch_queue_create();
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
  v10[2] = __67__PXStoryDummySongsProducer_requestSongsWithOptions_resultHandler___block_invoke;
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
  void (**v4)(id, PXStoryProducerResult *);
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  PXStorySongsConfiguration *v13;
  PXStorySongsConfiguration *v14;
  PXStoryProducerResult *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  unsigned __int8 v21;

  v4 = (void (**)(id, PXStoryProducerResult *))a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __PXOptionsEnumeratedValues_block_invoke;
  v19 = &unk_1E5148928;
  v6 = v5;
  v7 = 0;
  v20 = v6;
  v21 = 0;
  v8 = 1023;
  do
  {
    v9 = v8 & (1 << v7);
    if (v9)
    {
      ((void (*)(uint64_t *, uint64_t, unsigned __int8 *))v18)(&v16, v8 & (1 << v7), &v21);
      v8 ^= v9;
      v10 = v21;
      if (!v8)
        break;
    }
    else
    {
      v10 = 0;
    }
    if (v7 > 0x3E)
      break;
    ++v7;
  }
  while (!v10);

  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetFetchResultWithArray(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PXStorySongsConfiguration alloc];
  v14 = -[PXStorySongsConfiguration initWithCuratedAudioAssets:](v13, "initWithCuratedAudioAssets:", v12, v16, v17);
  v15 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v14);
  v4[2](v4, v15);

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

id __74__PXStoryDummySongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "integerValue");

  objc_msgSend(v3, "fetchLocalAssetForMood:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __67__PXStoryDummySongsProducer_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestSongsWithOptions:resultHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
