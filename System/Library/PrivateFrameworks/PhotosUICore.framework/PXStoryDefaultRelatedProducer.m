@implementation PXStoryDefaultRelatedProducer

- (PXStoryDefaultRelatedProducer)initWithTargetUpNextCount:(unint64_t)a3
{
  PXStoryDefaultRelatedProducer *v4;
  PXStoryDefaultRelatedProducer *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  NSMutableArray *v13;
  NSMutableArray *activeRequests;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXStoryDefaultRelatedProducer;
  v4 = -[PXStoryDefaultRelatedProducer init](&v16, sel_init);
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

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeRequests = v5->_activeRequests;
    v5->_activeRequests = v13;

  }
  return v5;
}

- (id)requestConfigurationsRelatedToConfiguration:(id)a3 withOptions:(unint64_t)a4 musicCurationParameters:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v25;
  id v26;
  PXStoryDefaultRelatedProducer *v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDefaultRelatedProducer activeRequests](self, "activeRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDefaultRelatedProducer workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke;
  block[3] = &unk_1E51430C0;
  v16 = v13;
  v25 = v16;
  v26 = v10;
  v27 = self;
  v28 = v11;
  v30 = v12;
  v31 = a4;
  v29 = v14;
  v17 = v12;
  v18 = v14;
  v19 = v11;
  v20 = v10;
  dispatch_async(v15, block);

  v21 = v30;
  v22 = v16;

  return v22;
}

- (unint64_t)targetUpNextCount
{
  return self->_targetUpNextCount;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)activeRequests
{
  return self->_activeRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  PXStoryProducerResult *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PXStoryProducerResult *v14;
  uint64_t v15;
  id v16;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(_QWORD *)(a1 + 56);
    v16 = 0;
    +[PXStoryDefaultRelatedProducer _requestForConfiguration:targetUpNextMemoryCount:musicCurationParameters:error:](PXStoryDefaultRelatedProducer, "_requestForConfiguration:targetUpNextMemoryCount:musicCurationParameters:error:", v2, v3, v4, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v5)
    {
      if ((*(_BYTE *)(a1 + 80) & 8) != 0)
        objc_msgSend(v5, "setWantsVerboseDebugInfo:", 1);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke_2;
      v11[3] = &unk_1E51277C0;
      v15 = v7;
      v14 = (PXStoryProducerResult *)*(id *)(a1 + 72);
      v12 = *(id *)(a1 + 64);
      v13 = v5;
      objc_msgSend(v13, "startGenerationWithCompletionHandler:", v11);

      v8 = v14;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 72);
      v8 = objc_alloc_init(PXStoryProducerResult);
      -[PXStoryProducerResult error:](v8, "error:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
  }
}

void __127__PXStoryDefaultRelatedProducer_requestConfigurationsRelatedToConfiguration_withOptions_musicCurationParameters_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  int v8;
  double v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PXStoryDefaultRelatedProducer _relatedResultFromUpNextResult:error:](PXStoryDefaultRelatedProducer, "_relatedResultFromUpNextResult:error:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6 - *(double *)(a1 + 56);
    v8 = 134218242;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Produced related in %0.3f seconds: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));

}

+ (id)_requestForConfiguration:(id)a3 targetUpNextMemoryCount:(unint64_t)a4 musicCurationParameters:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PXUpNextMemoriesGenerationRequest *v19;
  NSObject *v20;
  unint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = a4;
    v12 = v11;
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v9, "parentConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      do
      {
        objc_msgSend(v15, "assetCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v17);

        }
        objc_msgSend(v15, "parentConfiguration");
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v18;
      }
      while (v18);
    }
    v19 = -[PXUpNextMemoriesGenerationRequest initWithRootMemory:avoidMemoriesWithLocalIdentifiers:targetUpNextMemoryCount:musicCurationParameters:]([PXUpNextMemoriesGenerationRequest alloc], "initWithRootMemory:avoidMemoriesWithLocalIdentifiers:targetUpNextMemoryCount:musicCurationParameters:", v12, v13, v22, v10);

    if (!a6)
      goto LABEL_13;
LABEL_12:
    *a6 = 0;
    goto LABEL_13;
  }
  PLStoryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "cannot produce related because asset collection isn't a PHMemory: %@", buf, 0xCu);
  }

  v19 = 0;
  if (a6)
    goto LABEL_12;
LABEL_13:

  return v19;
}

+ (id)_relatedResultFromUpNextResult:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PXStoryProducerResult *v8;
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
  void *v19;
  PXStoryRelatedResult *v20;
  PXStoryProducerResult *v21;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v23 = v6;
    objc_msgSend(v5, "memories");
    v8 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXStoryProducerResult count](v8, "count");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    if (v9 >= 1)
    {
      for (i = 0; i != v9; ++i)
      {
        v12 = +[PXStoryRelatedLayoutGenerator isExpectedKeyItemAtIndex:](PXStoryRelatedLayoutGenerator, "isExpectedKeyItemAtIndex:", i);
        v13 = [PXStoryConfiguration alloc];
        -[PXStoryProducerResult objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
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
    v18 = [PXStoryRelatedResult alloc];
    objc_msgSend(v5, "debugInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXStoryRelatedResult initWithStoryConfigurations:debugInfo:](v18, "initWithStoryConfigurations:debugInfo:", v10, v19);

    v21 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v20);
    v7 = v23;
  }
  else
  {
    v8 = objc_alloc_init(PXStoryProducerResult);
    -[PXStoryProducerResult error:](v8, "error:", v7);
    v21 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

@end
