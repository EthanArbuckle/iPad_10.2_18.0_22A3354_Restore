@implementation PXStoryTransientChapterCollectionProducer

- (PXStoryTransientChapterCollectionProducer)init
{
  return -[PXStoryTransientChapterCollectionProducer initWithStoryQueue:](self, "initWithStoryQueue:", 0);
}

- (PXStoryTransientChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  id v4;
  PXStoryTransientChapterCollectionProducer *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v8;
  id v9;
  objc_class *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransientChapterCollectionProducer;
  v5 = -[PXStoryTransientChapterCollectionProducer init](&v18, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v12, v14);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransientChapterCollectionProducer.m"), 41, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryTransientChapterCollectionProducer workQueue_uneditedChapterCollectionWithAssets:keyAsset:]", v11);

  abort();
}

- (id)_chapterCollectionManagerWithUneditedChapterColection:(id)a3
{
  id v4;
  NSObject *v5;
  PXStoryTransientChapterCollectionManager *transientChapterCollectionManager;
  PXStoryTransientChapterCollectionManager *v7;
  PXStoryTransientChapterCollectionManager *v8;
  PXStoryTransientChapterCollectionManager *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[PXStoryTransientChapterCollectionProducer storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  transientChapterCollectionManager = self->_transientChapterCollectionManager;
  if (transientChapterCollectionManager)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__PXStoryTransientChapterCollectionProducer__chapterCollectionManagerWithUneditedChapterColection___block_invoke;
    v11[3] = &unk_1E5147208;
    v12 = v4;
    -[PXStoryTransientChapterCollectionManager performChanges:](transientChapterCollectionManager, "performChanges:", v11);

  }
  else
  {
    v7 = -[PXStoryTransientChapterCollectionManager initWithUneditedChapterCollection:]([PXStoryTransientChapterCollectionManager alloc], "initWithUneditedChapterCollection:", v4);
    v8 = self->_transientChapterCollectionManager;
    self->_transientChapterCollectionManager = v7;

    -[PXStoryTransientChapterCollectionManager setPersistenceDelegate:](self->_transientChapterCollectionManager, "setPersistenceDelegate:", self);
  }
  v9 = self->_transientChapterCollectionManager;

  return v9;
}

- (void)_workQueue_persistEditTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PXStoryTransientChapterCollectionProducer storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransientChapterCollectionProducer errorReporter](self, "errorReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke;
  v9[3] = &unk_1E5147B40;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  -[PXStoryTransientChapterCollectionProducer workQueue_saveEditTransaction:completionHandler:](self, "workQueue_saveEditTransaction:completionHandler:", v4, v9);

}

- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  PXStoryErrorCreateWithCodeDebugFormat(4, CFSTR("%@ doesn't support saving chapter edits"), v7, v8, v9, v10, v11, v12, (uint64_t)v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v5, 0, v13);

}

- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransientChapterCollectionProducer storyQueue](self, "storyQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXStoryTransientChapterCollectionProducer workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke;
  block[3] = &unk_1E5147258;
  v15 = v12;
  v24 = v15;
  objc_copyWeak(&v29, &location);
  v25 = v10;
  v26 = v9;
  v27 = v13;
  v28 = v11;
  v16 = v11;
  v17 = v13;
  v18 = v9;
  v19 = v10;
  dispatch_async(v14, block);

  v20 = v28;
  v21 = v15;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  return v21;
}

- (void)chapterCollectionManager:(id)a3 didApplyEditTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PXStoryTransientChapterCollectionProducer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PXStoryTransientChapterCollectionProducer_chapterCollectionManager_didApplyEditTransaction___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v12, &location);
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryErrorReporter)errorReporter
{
  return (PXStoryErrorReporter *)objc_loadWeakRetained((id *)&self->_errorReporter);
}

- (void)setErrorReporter:(id)a3
{
  objc_storeWeak((id *)&self->_errorReporter, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_errorReporter);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_transientChapterCollectionManager, 0);
}

void __94__PXStoryTransientChapterCollectionProducer_chapterCollectionManager_didApplyEditTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_workQueue_persistEditTransaction:", *(_QWORD *)(a1 + 32));

}

void __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "workQueue_uneditedChapterCollectionWithAssets:keyAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke_2;
    v6[3] = &unk_1E5147230;
    v7 = *(id *)(a1 + 32);
    v8 = v3;
    v5 = v3;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    v9 = *(id *)(a1 + 64);
    dispatch_async(v4, v6);

    objc_destroyWeak(&v10);
  }
}

void __117__PXStoryTransientChapterCollectionProducer_requestChapterCollectionForKeyAsset_curatedAssets_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PXStoryProducerResult *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "_chapterCollectionManagerWithUneditedChapterColection:", *(_QWORD *)(a1 + 40));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    v3 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed to persist chapter collection edits: %@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke_5;
    v8[3] = &unk_1E5148D08;
    v7 = *(NSObject **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    dispatch_async(v7, v8);

  }
}

uint64_t __79__PXStoryTransientChapterCollectionProducer__workQueue_persistEditTransaction___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setError:forComponent:", *(_QWORD *)(a1 + 40), CFSTR("ChapterCollectionPersistence"));
}

uint64_t __99__PXStoryTransientChapterCollectionProducer__chapterCollectionManagerWithUneditedChapterColection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUneditedChapterCollection:", *(_QWORD *)(a1 + 32));
}

@end
