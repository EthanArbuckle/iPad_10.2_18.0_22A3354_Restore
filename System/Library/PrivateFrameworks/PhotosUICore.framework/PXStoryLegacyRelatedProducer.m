@implementation PXStoryLegacyRelatedProducer

- (PXStoryLegacyRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  PXStoryLegacyRelatedProducer *v4;
  PXStoryLegacyRelatedProducer *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXStoryLegacyRelatedProducer;
  v4 = -[PXStoryLegacyRelatedProducer init](&v14, sel_init);
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
  PXStoryLegacyRelatedProducer *v21;
  id v22;

  v8 = a3;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryLegacyRelatedProducer workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __126__PXStoryLegacyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
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

void __126__PXStoryLegacyRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    +[PXStoryLegacyRelatedProducer _relatedResultForConfiguration:targetUpNextCount:](PXStoryLegacyRelatedProducer, "_relatedResultForConfiguration:targetUpNextCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

+ (id)_relatedResultForConfiguration:(id)a3 targetUpNextCount:(unint64_t)a4
{
  id v5;
  void *v6;
  PXStoryProducerResult *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  _BOOL4 v18;
  PXStoryConfiguration *v19;
  void *v20;
  PXStoryConfiguration *v21;
  uint64_t v22;
  id v23;
  PXStoryRelatedResult *v24;
  PXStoryProducerResult *v25;
  PXStoryProducerResult *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id v36;
  PXStoryProducerResult *v37;
  void *v38;
  id v39;

  v5 = a3;
  objc_msgSend(v5, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (PXStoryProducerResult *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "parentConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        objc_msgSend(v9, "assetCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PXStoryProducerResult addObject:](v7, "addObject:", v10);
        objc_msgSend(v9, "parentConfiguration");
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      while (v11);
    }
    v39 = v5;
    v12 = objc_alloc_init(MEMORY[0x1E0CD1738]);
    v37 = v7;
    v13 = (void *)-[PXStoryProducerResult copy](v7, "copy");
    objc_msgSend(v12, "setExcludedAssetCollections:", v13);

    objc_msgSend(v12, "setFetchLimit:", a4);
    v38 = v6;
    v36 = v12;
    objc_msgSend(MEMORY[0x1E0CD1730], "transientCollectionListWithCollectionsRelatedToObject:relationType:options:", v6, 63, v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    if (v15 >= 1)
    {
      for (i = 0; i != v15; ++i)
      {
        v18 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:](PXStoryRelatedLayoutGenerator, "isExpectedKeyItemAtIndex:", i);
        v19 = [PXStoryConfiguration alloc];
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PXStoryConfiguration initWithAssetCollection:](v19, "initWithAssetCollection:", v20);

        -[PXStoryConfiguration setLaunchType:](v21, "setLaunchType:", CFSTR("UpNext"));
        if (v18)
          v22 = 4;
        else
          v22 = 8;
        v23 = -[PXStoryConfiguration copyWithAdditionalOptions:](v21, "copyWithAdditionalOptions:", v22);

        objc_msgSend(v16, "addObject:", v23);
      }
    }
    v24 = -[PXStoryRelatedResult initWithStoryConfigurations:debugInfo:]([PXStoryRelatedResult alloc], "initWithStoryConfigurations:debugInfo:", v16, CFSTR("Legacy Related Producer"));
    v25 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v24);

    v6 = v38;
    v5 = v39;
    v27 = v36;
    v26 = v37;
  }
  else
  {
    v26 = objc_alloc_init(PXStoryProducerResult);
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("asset collection isn't a PHAssetCollection: %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryProducerResult error:](v26, "error:", v27);
    v25 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

@end
