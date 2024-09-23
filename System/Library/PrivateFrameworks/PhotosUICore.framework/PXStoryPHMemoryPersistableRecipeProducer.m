@implementation PXStoryPHMemoryPersistableRecipeProducer

- (PXStoryPHMemoryPersistableRecipeProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPHMemoryPersistableRecipeProducer.m"), 25, CFSTR("%s is not available as initializer"), "-[PXStoryPHMemoryPersistableRecipeProducer init]");

  abort();
}

- (PXStoryPHMemoryPersistableRecipeProducer)initWithMemory:(id)a3 keyAsset:(id)a4
{
  id v7;
  id v8;
  PXStoryPHMemoryPersistableRecipeProducer *v9;
  PXStoryPHMemoryPersistableRecipeProducer *v10;
  objc_class *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryPHMemoryPersistableRecipeProducer;
  v9 = -[PXStoryPHMemoryPersistableRecipeProducer init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v13, v15);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v10->_keyAsset, a4);
  }

  return v10;
}

- (id)requestPersistableRecipeWithOptions:(unint64_t)a3 resultHandler:(id)a4
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
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD aBlock[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v6 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__245135;
  v21[4] = __Block_byref_object_dispose__245136;
  -[PXStoryPHMemoryPersistableRecipeProducer memory](self, "memory");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5140330;
  v20 = v21;
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
    -[PXStoryPHMemoryPersistableRecipeProducer workQueue](self, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke_2;
    block[3] = &unk_1E5148CE0;
    v13 = v11;
    v16 = v13;
    v17 = v10;
    dispatch_async(v12, block);

  }
  _Block_object_dispose(v21, 8);

  return v13;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

void __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  PXStoryPersistableRecipeResult *v17;
  id v18;
  PXStoryPersistableRecipeResult *v19;
  PXStoryProducerResult *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1630], "fetchType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, v6, v7, 0, 0, 0);
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "keyAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = 0;
  +[PXStoryPHMemoryPersistableRecipeProducer _persistableRecipeForMemory:keyAsset:miroDataUsed:error:](PXStoryPHMemoryPersistableRecipeProducer, "_persistableRecipeForMemory:keyAsset:miroDataUsed:error:", v12, v13, &v24, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  v16 = v23;

  v17 = [PXStoryPersistableRecipeResult alloc];
  if (objc_msgSend(v15, "containsAnyData"))
    v18 = v15;
  else
    v18 = 0;
  v19 = -[PXStoryPersistableRecipeResult initWithPersistableRecipe:miroInfo:](v17, "initWithPersistableRecipe:miroInfo:", v14, v18);
  v20 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v19);
  -[PXStoryProducerResult flags:](v20, "flags:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "error:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __94__PXStoryPHMemoryPersistableRecipeProducer_requestPersistableRecipeWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

+ (id)_persistableRecipeForMemory:(id)a3 keyAsset:(id)a4 miroDataUsed:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  PXStoryMiroMemoryConverter *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "photosGraphProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("storyRecipeData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (PXStoryMiroMemoryConverter *)objc_alloc_init(MEMORY[0x1E0D752E0]);
    v23 = 0;
    -[PXStoryMiroMemoryConverter unarchivedRecipeWithData:error:](v13, "unarchivedRecipeWithData:error:", v12, &v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (!v14)
    {
      PLStoryGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v9;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "failed to unarchive recipe for %@: %@", buf, 0x16u);
      }

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  v13 = -[PXStoryMiroMemoryConverter initWithMemory:keyAsset:]([PXStoryMiroMemoryConverter alloc], "initWithMemory:keyAsset:", v9, v10);
  if (!-[PXStoryMiroMemoryConverter containsAnyData](v13, "containsAnyData"))
  {
    v15 = 0;
    goto LABEL_13;
  }
  v22 = 0;
  -[PXStoryMiroMemoryConverter createNewRecipeFromMiroMetadataWithError:](v13, "createNewRecipeFromMiroMetadataWithError:", &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if (v14)
  {
    v13 = objc_retainAutorelease(v13);
    *a5 = v13;
LABEL_9:
    v17 = v15;

    objc_msgSend(v9, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    +[PFStoryRecipe_PXStoryExtension recipe:withPHPhotoLibrary:error:](PFStoryRecipe_PXStoryExtension, "recipe:withPHPhotoLibrary:error:", v14, v18, &v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (v19)
      goto LABEL_14;
    PLStoryGetLog();
    v13 = (PXStoryMiroMemoryConverter *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_1A6789000, &v13->super, OS_LOG_TYPE_ERROR, "failed to assign photo library to recipe: %@", buf, 0xCu);
    }
  }
LABEL_13:

  v19 = 0;
LABEL_14:
  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v19;
}

@end
