@implementation PXFetchResultCountObserver

- (PXFetchResultCountObserver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultCountObserver.m"), 30, CFSTR("%s is not available as initializer"), "-[PXFetchResultCountObserver init]");

  abort();
}

- (PXFetchResultCountObserver)initWithQOSClass:(unsigned int)a3 photoLibrary:(id)a4 fetchResultBlock:(id)a5
{
  id v10;
  id v11;
  void *v12;
  PXFetchResultCountObserver *v13;
  PXFetchResultCountObserver *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  dispatch_block_t v19;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultCountObserver.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultCountObserver.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResultBlock"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)PXFetchResultCountObserver;
  v13 = -[PXFetchResultCountObserver init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_fetchResultCount = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, (dispatch_qos_class_t)a3, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.PXFetchResultCountObserver", v16);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_photoLibrary, a4);
    -[PHPhotoLibrary registerChangeObserver:](v14->_photoLibrary, "registerChangeObserver:", v14);
    objc_initWeak(&location, v14);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXFetchResultCountObserver_initWithQOSClass_photoLibrary_fetchResultBlock___block_invoke;
    block[3] = &unk_1E5146480;
    objc_copyWeak(&v25, &location);
    v24 = v12;
    v19 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
    dispatch_async((dispatch_queue_t)v14->_serialQueue, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v14;
}

- (void)_serialQueue_acquireFetchResultFromBlock:(id)a3
{
  NSObject *serialQueue;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16[2];
  id location;

  serialQueue = self->_serialQueue;
  v6 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(serialQueue);
  v6[2](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultCountObserver.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  -[PXFetchResultCountObserver setFetchResult:](self, "setFetchResult:", v7);
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultCountObserver.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[photoLibrary.photoLibraryURL isEqual:_photoLibrary.photoLibraryURL]"));

  }
  v12 = (void *)objc_msgSend(v7, "count");
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PXFetchResultCountObserver__serialQueue_acquireFetchResultFromBlock___block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v16, &location);
  v16[1] = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)setFetchResultCount:(int64_t)a3
{
  id WeakRetained;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_fetchResultCount != a3)
  {
    self->_fetchResultCount = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "fetchResultCountObserver:didChangeFetchResultCount:", self, a3);

  }
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14[2];
  id location;
  _QWORD v16[5];
  id v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__166313;
  v23 = __Block_byref_object_dispose__166314;
  v24 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(serialQueue, block);
  if (v20[5])
  {
    objc_msgSend(v4, "changeDetailsForFetchResult:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "fetchResultAfterChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_serialQueue;
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_2;
      v16[3] = &unk_1E5148D08;
      v16[4] = self;
      v11 = v9;
      v17 = v11;
      dispatch_sync(v10, v16);
      v12 = (void *)objc_msgSend(v11, "count");
      objc_initWeak(&location, self);
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_3;
      v13[3] = &unk_1E51447A0;
      objc_copyWeak(v14, &location);
      v14[1] = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v13);
      objc_destroyWeak(v14);
      objc_destroyWeak(&location);

    }
  }
  _Block_object_dispose(&v19, 8);

}

- (int64_t)fetchResultCount
{
  return self->_fetchResultCount;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResult, a3);
}

- (PXFetchResultCountObserverDelegate)delegate
{
  return (PXFetchResultCountObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchResult");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFetchResult:", *(_QWORD *)(a1 + 40));
}

void __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFetchResultCount:", v1);

}

void __71__PXFetchResultCountObserver__serialQueue_acquireFetchResultFromBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFetchResultCount:", v1);

}

void __77__PXFetchResultCountObserver_initWithQOSClass_photoLibrary_fetchResultBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_serialQueue_acquireFetchResultFromBlock:", *(_QWORD *)(a1 + 32));

}

@end
