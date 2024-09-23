@implementation PXStoryAssetCollectionStyleProducer

- (PXStoryAssetCollectionStyleProducer)initWithAssetCollection:(id)a3
{
  id v5;
  PXStoryAssetCollectionStyleProducer *v6;
  PXStoryAssetCollectionStyleProducer *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryAssetCollectionStyleProducer;
  v6 = -[PXStoryAssetCollectionStyleProducer init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[5];
  id v19;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5148CE0;
  aBlock[4] = self;
  v8 = v6;
  v19 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if ((v4 & 1) != 0)
  {
    (*((void (**)(void *))v9 + 2))(v9);
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryAssetCollectionStyleProducer workQueue](self, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke_47;
    v15[3] = &unk_1E5148CE0;
    v13 = v11;
    v16 = v13;
    v17 = v10;
    dispatch_async(v12, v15);

  }
  return v13;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  PXStoryStyleConfiguration *v8;
  uint64_t v9;
  PXStoryProducerResult *v10;
  void *v11;
  PXStoryProducerResult *v12;
  PXStoryStyleConfiguration *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, "storyColorGradeKind");
    if (!v4)
    {
      PLStoryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Memory lacking storyColorGradeKind, setting to None: %@", buf, 0xCu);
      }

      v4 = 1;
    }
    objc_msgSend(v3, "storyTitleCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)*MEMORY[0x1E0D75A50])
    {
      PLStoryGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "Memory lacking storyTitleCategory: %@", buf, 0xCu);
      }

    }
    v8 = -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:]([PXStoryStyleConfiguration alloc], "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", 0, v4, 0, 0, 0);

  }
  else
  {
    v8 = objc_alloc_init(PXStoryStyleConfiguration);
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = [PXStoryProducerResult alloc];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStoryProducerResult initWithObject:](v10, "initWithObject:", v11);
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v9 + 16))(v9, v12);

}

uint64_t __78__PXStoryAssetCollectionStyleProducer_requestStylesWithOptions_resultHandler___block_invoke_47(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
