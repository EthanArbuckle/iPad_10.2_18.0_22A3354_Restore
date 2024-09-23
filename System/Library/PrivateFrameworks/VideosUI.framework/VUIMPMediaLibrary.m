@implementation VUIMPMediaLibrary

- (VUIMPMediaLibrary)initWithMPMediaLibrary:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  id v9;
  id v10;
  void *v11;
  VUIMPMediaLibraryIdentifier *v12;
  void *v13;
  VUIMPMediaLibraryIdentifier *v14;
  VUIMPMediaLibrary *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  NSOperationQueue *v18;
  NSOperationQueue *serialOperationQueue;
  void *v20;
  MPMediaLibrary *mediaLibrary;
  void *v22;
  MPMediaLibrary *v23;
  uint64_t v24;
  void *v25;
  MPMediaLibrary *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  if (!v11)
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("manager"));
LABEL_4:
  v12 = [VUIMPMediaLibraryIdentifier alloc];
  objc_msgSend(v9, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIMPMediaLibraryIdentifier initWithIdentifier:](v12, "initWithIdentifier:", v13);

  v30.receiver = self;
  v30.super_class = (Class)VUIMPMediaLibrary;
  v15 = -[VUIMediaLibrary initWithIdentifier:type:manager:](&v30, sel_initWithIdentifier_type_manager_, v14, a4, v11);
  if (v15)
  {
    v16 = dispatch_queue_create("com.apple.videosui.VUIMPMediaLibrary.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v15->_serialProcessingDispatchQueue;
    v15->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v16;

    v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialOperationQueue = v15->_serialOperationQueue;
    v15->_serialOperationQueue = v18;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v15->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_storeStrong((id *)&v15->_mediaLibrary, a3);
    v15->_connectionState = objc_msgSend((id)objc_opt_class(), "_connectionStateFromMPMediaLibraryStatus:", -[MPMediaLibrary status](v15->_mediaLibrary, "status"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__handleMediaLibraryContentsDidChangeNotification_, *MEMORY[0x1E0CC1FF8], v15->_mediaLibrary);
    objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__handleMediaLibraryStatusDidChangeNotification_, *MEMORY[0x1E0CC2000], v15->_mediaLibrary);
    -[MPMediaLibrary setCloudFilteringType:](v15->_mediaLibrary, "setCloudFilteringType:", 5);
    mediaLibrary = v15->_mediaLibrary;
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", &unk_1EA0B9B50, *MEMORY[0x1E0CC1EC0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibrary addLibraryFilterPredicate:](mediaLibrary, "addLibraryFilterPredicate:", v22);

    v23 = v15->_mediaLibrary;
    v24 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1E38]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibrary addLibraryFilterPredicate:](v23, "addLibraryFilterPredicate:", v25);

    v26 = v15->_mediaLibrary;
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v24, *MEMORY[0x1E0CC1E88]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibrary addLibraryFilterPredicate:](v26, "addLibraryFilterPredicate:", v27);

    -[MPMediaLibrary beginGeneratingLibraryChangeNotifications](v15->_mediaLibrary, "beginGeneratingLibraryChangeNotifications");
    -[MPMediaLibrary artworkDataSource](v15->_mediaLibrary, "artworkDataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v28, "setUsesFallbackCache:", 0);

  }
  return v15;
}

+ (unint64_t)_connectionStateFromMPMediaLibraryStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0CC2438], "setFilteringDisabled:", 1);
}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    VUIErrorCancelled();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "responses");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  v3[3] = &unk_1E9F99D58;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "_enqueueCompletionQueueBlock:", v3);

}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VUIMPMediaEntitiesFetchOperation *v4;
  void *v5;
  VUIMPMediaEntitiesFetchOperation *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  VUIMPMediaEntitiesFetchOperation *v16;
  id v17;

  v3 = a2;
  v4 = -[VUIMPMediaEntitiesFetchOperation initWithMediaLibrary:requests:]([VUIMPMediaEntitiesFetchOperation alloc], "initWithMediaLibrary:requests:", v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
  v14[3] = &unk_1E9F99778;
  v15 = v3;
  v16 = v4;
  v17 = *(id *)(a1 + 40);
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "blockOperationWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDependency:", v6);
  objc_msgSend(v7, "serialOperationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v6);

  objc_msgSend(v7, "serialOperationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", v6);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __45__VUIMPMediaLibrary__enqueueProcessingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (id)title
{
  void *v2;
  void *v3;

  -[VUIMPMediaLibrary mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v12[3] = &unk_1E9F9F508;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[VUIMPMediaLibrary _enqueueProcessingBlock:](self, "_enqueueProcessingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)_imageLoaderIdentifier
{
  void *v2;
  void *v3;

  -[VUIMPMediaLibrary mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The imageLoaderObject parameter must be an instance of VUIPlistMediaEntityImageLoadParams or conform to VUIPlistMediaEntityImageLoadParamsCreating"));
      v5 = 0;
      goto LABEL_7;
    }
    v4 = v3;
  }
  v5 = v4;
  if (!v4)
    goto LABEL_6;
LABEL_7:

  return v5;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  double height;
  double width;
  id v7;
  VUIMPMediaEntityImageLoadOperation *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = -[VUIMPMediaEntityImageLoadOperation initWithParams:scaleToSize:]([VUIMPMediaEntityImageLoadOperation alloc], "initWithParams:scaleToSize:", v7, width, height);

  return v8;
}

- (void)_enqueueProcessingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIMPMediaLibrary serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VUIMPMediaLibrary__enqueueProcessingBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (VUIMPMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The %@ initializer is not available."), v8);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIMPMediaLibrary;
  -[VUIMediaLibraryImageLoader dealloc](&v4, sel_dealloc);
}

- (unint64_t)connectionState
{
  VUIMPMediaLibrary *v2;
  unint64_t connectionState;

  v2 = self;
  objc_sync_enter(v2);
  connectionState = v2->_connectionState;
  objc_sync_exit(v2);

  return connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  VUIMPMediaLibrary *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_connectionState != a3)
  {
    -[VUIMPMediaLibrary willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("connectionState"));
    obj->_connectionState = a3;
    -[VUIMPMediaLibrary didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("connectionState"));
  }
  objc_sync_exit(obj);

}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke;
  v10[3] = &unk_1E9F9F4B8;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[VUIMPMediaLibrary _enqueueProcessingBlock:](self, "_enqueueProcessingBlock:", v10);

}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VUIMPMediaLibraryConnectOperation *v4;
  void *v5;
  VUIMPMediaLibraryConnectOperation *v6;
  uint64_t v7;
  void *v8;
  VUIMPMediaLibraryConnectOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *);
  void *v16;
  VUIMPMediaLibraryConnectOperation *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v3 = a2;
  v4 = [VUIMPMediaLibraryConnectOperation alloc];
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIMPMediaLibraryConnectOperation initWithMediaLibrary:](v4, "initWithMediaLibrary:", v5);

  v7 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_initWeak(&location, v3);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_2;
    v20[3] = &unk_1E9F9F490;
    objc_copyWeak(&v22, &location);
    v21 = *(id *)(a1 + 32);
    -[VUIMPMediaLibraryConnectOperation setProgressBlock:](v6, "setProgressBlock:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_initWeak(&location, v3);
    v8 = (void *)MEMORY[0x1E0CB34C8];
    v13 = v7;
    v14 = 3221225472;
    v15 = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_4;
    v16 = &unk_1E9F99600;
    objc_copyWeak(&v19, &location);
    v9 = v6;
    v17 = v9;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v8, "blockOperationWithBlock:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDependency:", v9, v13, v14, v15, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "serialOperationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v6);

  if (v10)
  {
    objc_msgSend(v3, "serialOperationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v10);

  }
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  float v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_3;
  v6[3] = &unk_1E9F9F468;
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "_enqueueCompletionQueueBlock:", v6);

}

uint64_t __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_4(id *a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_5;
  v4[3] = &unk_1E9F99D58;
  v5 = a1[4];
  v6 = a1[5];
  objc_msgSend(v3, "_enqueueCompletionQueueBlock:", v4);

}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "success");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9F9F4E0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[VUIMPMediaLibrary _enqueueProcessingBlock:](self, "_enqueueProcessingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VUIMPMediaItemEntityTypesOperation *v4;
  void *v5;
  VUIMPMediaItemEntityTypesOperation *v6;
  void *v7;
  VUIMPMediaItemEntityTypesOperation *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  VUIMPMediaItemEntityTypesOperation *v18;
  id v19;

  v3 = a2;
  v4 = [VUIMPMediaItemEntityTypesOperation alloc];
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIMPMediaItemEntityTypesOperation initWithMPMediaLibrary:](v4, "initWithMPMediaLibrary:", v5);

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E9F99778;
  v17 = v3;
  v18 = v6;
  v19 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v3;
  objc_msgSend(v7, "blockOperationWithBlock:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDependency:", v8);
  objc_msgSend(v9, "serialOperationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v8);

  objc_msgSend(v9, "serialOperationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", v8);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E9F99D58;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "_enqueueCompletionQueueBlock:", v3);

}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    VUIErrorCancelled();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "response");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  if (v5)
  {
    -[VUIMediaLibrary manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__VUIMPMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E9F98E68;
    v10 = v5;
    objc_msgSend(v6, "_enqueueCompletionQueueBlock:", v9);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);

  return v7;
}

uint64_t __55__VUIMPMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (automaticallyNotifiesObserversForKey____onceToken != -1)
    dispatch_once(&automaticallyNotifiesObserversForKey____onceToken, &__block_literal_global_85);
  if ((objc_msgSend((id)automaticallyNotifiesObserversForKey____keysToNotifyManually, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VUIMPMediaLibrary;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

void __58__VUIMPMediaLibrary_automaticallyNotifiesObserversForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("connectionState"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)automaticallyNotifiesObserversForKey____keysToNotifyManually;
  automaticallyNotifiesObserversForKey____keysToNotifyManually = v0;

}

- (void)_handleMediaLibraryStatusDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIMediaLibrary manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__VUIMPMediaLibrary__handleMediaLibraryStatusDidChangeNotification___block_invoke;
  v6[3] = &unk_1E9F9A938;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "_enqueueCompletionQueueBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __68__VUIMPMediaLibrary__handleMediaLibraryStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "mediaLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "status");

    objc_msgSend(v4, "setConnectionState:", objc_msgSend((id)objc_opt_class(), "_connectionStateFromMPMediaLibraryStatus:", v3));
    WeakRetained = v4;
  }

}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (void)setSerialOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
