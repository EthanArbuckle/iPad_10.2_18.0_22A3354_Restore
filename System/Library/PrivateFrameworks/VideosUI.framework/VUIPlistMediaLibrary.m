@implementation VUIPlistMediaLibrary

- (VUIPlistMediaLibrary)initWithURL:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  VUIPlistMediaLibraryIdentifier *v8;
  VUIPlistMediaLibrary *v9;
  VUIPlistMediaDatabase *v10;
  VUIPlistMediaDatabase *database;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  NSOperationQueue *v14;
  NSOperationQueue *serialOperationQueue;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[VUIPlistMediaLibraryIdentifier initWithURL:]([VUIPlistMediaLibraryIdentifier alloc], "initWithURL:", v6);
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaLibrary;
  v9 = -[VUIMediaLibrary initWithIdentifier:type:manager:](&v18, sel_initWithIdentifier_type_manager_, v8, 0, v7);

  if (v9)
  {
    v10 = -[VUIPlistMediaDatabase initWithURL:]([VUIPlistMediaDatabase alloc], "initWithURL:", v6);
    database = v9->_database;
    v9->_database = v10;

    v12 = dispatch_queue_create("com.apple.videosui.VUIPlistMediaLibrary.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v9->_serialProcessingDispatchQueue;
    v9->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialOperationQueue = v9->_serialOperationQueue;
    v9->_serialOperationQueue = v14;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__handleMediaDatabaseContentsDidChangeNotification_, CFSTR("VUIPlistMediaDatabaseContentsDidChangeNotification"), v9->_database);

  }
  return v9;
}

- (VUIPlistMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
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
  v4.super_class = (Class)VUIPlistMediaLibrary;
  -[VUIMediaLibraryImageLoader dealloc](&v4, sel_dealloc);
}

- (id)title
{
  return CFSTR("Plist Database");
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
  v14 = __Block_byref_object_copy__34;
  v15 = __Block_byref_object_dispose__34;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9FA4C18;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[VUIPlistMediaLibrary _enqueueProcessingBlock:](self, "_enqueueProcessingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VUIPlistMediaItemEntityTypesOperation *v4;
  void *v5;
  VUIPlistMediaItemEntityTypesOperation *v6;
  void *v7;
  VUIPlistMediaItemEntityTypesOperation *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  VUIPlistMediaItemEntityTypesOperation *v18;
  id v19;

  v3 = a2;
  v4 = [VUIPlistMediaItemEntityTypesOperation alloc];
  objc_msgSend(v3, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIPlistMediaItemEntityTypesOperation initWithDatabase:](v4, "initWithDatabase:", v5);

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
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

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E9F99D58;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "_enqueueCompletionQueueBlock:", v3);

}

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
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
  v19 = __Block_byref_object_copy__34;
  v20 = __Block_byref_object_dispose__34;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v12[3] = &unk_1E9FA4C40;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[VUIPlistMediaLibrary _enqueueProcessingBlock:](self, "_enqueueProcessingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VUIPlistMediaEntitiesFetchOperation *v4;
  void *v5;
  VUIPlistMediaEntitiesFetchOperation *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  VUIPlistMediaEntitiesFetchOperation *v16;
  id v17;

  v3 = a2;
  v4 = -[VUIPlistMediaEntitiesFetchOperation initWithMediaLibrary:requests:]([VUIPlistMediaEntitiesFetchOperation alloc], "initWithMediaLibrary:requests:", v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
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

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  v3[3] = &unk_1E9F99D58;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "_enqueueCompletionQueueBlock:", v3);

}

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
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
    v9[2] = __58__VUIPlistMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E9F98E68;
    v10 = v5;
    objc_msgSend(v6, "_enqueueCompletionQueueBlock:", v9);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);

  return v7;
}

uint64_t __58__VUIPlistMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  -[VUIPlistMediaLibrary database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("PlistMediaLibrary");
  return v5;
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
  id v5;
  VUIPlistMediaEntityImageLoadOperation *v6;

  v5 = a3;
  v6 = -[VUIPlistMediaEntityImageLoadOperation initWithParams:]([VUIPlistMediaEntityImageLoadOperation alloc], "initWithParams:", v5);

  return v6;
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
  -[VUIPlistMediaLibrary serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VUIPlistMediaLibrary__enqueueProcessingBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__VUIPlistMediaLibrary__enqueueProcessingBlock___block_invoke(uint64_t a1)
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

- (VUIPlistMediaDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void)setSerialOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
