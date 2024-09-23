@implementation PXStoryDummyRelatedProducer

- (PXStoryDummyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  PXStoryDummyRelatedProducer *v4;
  PXStoryDummyRelatedProducer *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXStoryDummyRelatedProducer;
  v4 = -[PXStoryDummyRelatedProducer init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_targetUpNextCount = a3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v8, v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  PXStoryDummyRelatedProducer *v21;
  id v22;

  v8 = a3;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDummyRelatedProducer workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __125__PXStoryDummyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
  v18[3] = &unk_1E5148370;
  v12 = v10;
  v19 = v12;
  v20 = v8;
  v21 = self;
  v22 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v18);

  v15 = v22;
  v16 = v12;

  return v16;
}

- (unint64_t)targetUpNextCount
{
  return self->_targetUpNextCount;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __125__PXStoryDummyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    +[PXStoryDummyRelatedProducer _relatedResultForConfiguration:targetUpNextCount:](PXStoryDummyRelatedProducer, "_relatedResultForConfiguration:targetUpNextCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

+ (id)_relatedResultForConfiguration:(id)a3 targetUpNextCount:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  _BOOL4 v12;
  PXStoryConfiguration *v13;
  void *v14;
  PXStoryConfiguration *v15;
  uint64_t v16;
  id v17;
  PXStoryRelatedResult *v18;
  PXStoryProducerResult *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setFetchLimit:", a4);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      v12 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:](PXStoryRelatedLayoutGenerator, "isExpectedKeyItemAtIndex:", i);
      v13 = [PXStoryConfiguration alloc];
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PXStoryConfiguration initWithAssetCollection:](v13, "initWithAssetCollection:", v14);

      -[PXStoryConfiguration setLaunchType:](v15, "setLaunchType:", CFSTR("UpNext"));
      if (v12)
        v16 = 4;
      else
        v16 = 8;
      v17 = -[PXStoryConfiguration copyWithAdditionalOptions:](v15, "copyWithAdditionalOptions:", v16);

      objc_msgSend(v10, "addObject:", v17);
    }
  }
  v18 = -[PXStoryRelatedResult initWithStoryConfigurations:debugInfo:]([PXStoryRelatedResult alloc], "initWithStoryConfigurations:debugInfo:", v10, CFSTR("Dummy Producer"));
  v19 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v18);

  return v19;
}

@end
