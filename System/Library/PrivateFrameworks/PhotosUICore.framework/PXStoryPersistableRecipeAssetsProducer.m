@implementation PXStoryPersistableRecipeAssetsProducer

- (PXStoryPersistableRecipeAssetsProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPersistableRecipeAssetsProducer.m"), 26, CFSTR("%s is not available as initializer"), "-[PXStoryPersistableRecipeAssetsProducer init]");

  abort();
}

- (PXStoryPersistableRecipeAssetsProducer)initWithPersistableRecipe:(id)a3
{
  id v5;
  PXStoryPersistableRecipeAssetsProducer *v6;
  PXStoryPersistableRecipeAssetsProducer *v7;
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
  v16.super_class = (Class)PXStoryPersistableRecipeAssetsProducer;
  v6 = -[PXStoryPersistableRecipeAssetsProducer init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistableRecipe, a3);
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

- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5
{
  char v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  PXStoryPersistableRecipeAssetsProducer *v24;
  id v25;
  SEL v26;

  v5 = a3;
  v8 = a5;
  -[PXStoryPersistableRecipeAssetsProducer persistableRecipe](self, "persistableRecipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke;
  aBlock[3] = &unk_1E513A6B0;
  v11 = v9;
  v26 = a2;
  v23 = v11;
  v24 = self;
  v12 = v8;
  v25 = v12;
  v13 = _Block_copy(aBlock);
  v14 = v13;
  if ((v5 & 1) != 0)
  {
    (*((void (**)(void *))v13 + 2))(v13);
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistableRecipeAssetsProducer workQueue](self, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke_10;
    v19[3] = &unk_1E5148CE0;
    v17 = v15;
    v20 = v17;
    v21 = v14;
    dispatch_async(v16, v19);

  }
  return v17;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
}

void __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  PXStaticDisplayAssetsDataSource *v5;
  void *v6;
  PXStaticDisplayAssetsDataSource *v7;
  NSObject *v8;
  PXPassthroughAssetsDataSourceManager *v9;
  uint64_t v10;
  PXStoryProducerResult *v11;
  void *v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  +[PFStoryRecipe_PXStoryExtension displayAssetsInRecipe:withCategory:error:](PFStoryRecipe_PXStoryExtension, "displayAssetsInRecipe:withCategory:error:", v2, 1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = [PXStaticDisplayAssetsDataSource alloc];
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](v5, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", 0, 0, v6, 0, 1);

  }
  else
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "failed to get display assets from recipe: %@", buf, 0xCu);
    }

    v7 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:]([PXStaticDisplayAssetsDataSource alloc], "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", 0, 0, 0, 0, 1);
  }
  v9 = -[PXPassthroughAssetsDataSourceManager initWithDataSource:]([PXPassthroughAssetsDataSourceManager alloc], "initWithDataSource:", v7);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v9);
  -[PXStoryProducerResult error:](v11, "error:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

}

uint64_t __92__PXStoryPersistableRecipeAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
