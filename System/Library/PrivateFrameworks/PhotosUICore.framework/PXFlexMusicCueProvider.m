@implementation PXFlexMusicCueProvider

- (PXFlexMusicCueProvider)init
{
  PXFlexMusicCueProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  NSMutableArray *v5;
  NSMutableArray *requests;
  NSObject *v7;
  _QWORD block[4];
  PXFlexMusicCueProvider *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXFlexMusicCueProvider;
  v2 = -[PXFlexMusicCueProvider init](&v11, sel_init);
  if (v2)
  {
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v2->_requests;
    v2->_requests = v5;

    v7 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PXFlexMusicCueProvider_init__block_invoke;
    block[3] = &unk_1E5149198;
    v10 = v2;
    dispatch_async(v7, block);

  }
  return v2;
}

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFlexMusicCueProvider requestCuesForAudioAsset:resultHandler:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXFlexMusicCueProvider.m"), 52, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("asset"), v16, v17);

    }
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXFlexMusicCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke;
  block[3] = &unk_1E51422C8;
  objc_copyWeak(&v21, &location);
  v19 = v8;
  v20 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  NSObject *queue;
  _QWORD block[5];

  if ((a4 & 2) != 0 && (void *)LibraryContext_195226 == a5)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PXFlexMusicCueProvider_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_fetchCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  NSObject *queue;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  NSMutableArray *requests;
  _PXFlexMusicCueRequest *v11;
  id v12;

  v12 = a3;
  queue = self->_queue;
  v7 = (void (**)(id, void *, _QWORD))a4;
  dispatch_assert_queue_V2(queue);
  if (-[PXFlexMusicLibrary hasLocalResourceForAsset:resourceType:](self->_library, "hasLocalResourceForAsset:resourceType:", v12, 2))
  {
    +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cuesForAsset:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v9, 0);
  }
  else
  {
    requests = self->_requests;
    v11 = -[_PXFlexMusicCueRequest initWithAsset:resultHandler:]([_PXFlexMusicCueRequest alloc], "initWithAsset:resultHandler:", v12, v7);

    -[NSMutableArray addObject:](requests, "addObject:", v11);
    -[PXFlexMusicLibrary requestDownloadForAsset:resourceType:](self->_library, "requestDownloadForAsset:resourceType:", v12, 2);
  }

}

- (void)_deliverCuesIfNeeded
{
  id v3;
  NSMutableArray *requests;
  id v5;
  _QWORD v6[4];
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  requests = self->_requests;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXFlexMusicCueProvider__deliverCuesIfNeeded__block_invoke;
  v6[3] = &unk_1E5134560;
  v7 = v3;
  v5 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](requests, "enumerateObjectsUsingBlock:", v6);
  -[NSMutableArray removeObjectsAtIndexes:](self->_requests, "removeObjectsAtIndexes:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__PXFlexMusicCueProvider__deliverCuesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a2;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cuesForAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v9, "resultHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v7, 0);

    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

uint64_t __55__PXFlexMusicCueProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverCuesIfNeeded");
}

void __65__PXFlexMusicCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_fetchCuesForAudioAsset:resultHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __30__PXFlexMusicCueProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), LibraryContext_195226);
}

@end
