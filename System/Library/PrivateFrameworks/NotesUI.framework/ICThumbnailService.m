@implementation ICThumbnailService

+ (ICThumbnailService)sharedThumbnailService
{
  if (sharedThumbnailService_onceToken != -1)
    dispatch_once(&sharedThumbnailService_onceToken, &__block_literal_global_84);
  return (ICThumbnailService *)(id)sharedThumbnailService_instance;
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_3(id *a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  ICThumbnailDescription *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if (v3)
  {
    v11 = -[ICThumbnailDescription initWithConfiguration:]([ICThumbnailDescription alloc], "initWithConfiguration:", a1[4]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", a1[5]);
    -[ICThumbnailDescription setFetchDuration:](v11, "setFetchDuration:");

    -[ICThumbnailDescription setCreationDate:](v11, "setCreationDate:", a1[5]);
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    -[ICThumbnailDescription setError:](v11, "setError:", v6);

    objc_msgSend(a1[6], "processThumbnailDescriptionResult:", v11);
  }
  else
  {
    objc_msgSend(a1[6], "thumbnailGeneratorForConfiguration:", a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_4;
    v12[3] = &unk_1E5C23C40;
    v8 = a1[4];
    v13 = a1[5];
    v9 = a1[4];
    v10 = a1[6];
    v14 = v9;
    v15 = v10;
    objc_msgSend(v7, "generateThumbnailWithConfiguration:completion:", v8, v12);

  }
}

- (id)thumbnailGeneratorForConfiguration:(id)a3
{
  ICThumbnailGeneratorSystemPaper *v3;
  ICThumbnailGeneratorSystemPaper *v5;
  void *v6;
  void *v7;
  __objc2_class *v8;
  id v9;

  switch(objc_msgSend(a3, "thumbnailType"))
  {
    case 0:
      v8 = ICThumbnailGeneratorAttachment;
      goto LABEL_8;
    case 1:
      v8 = ICThumbnailGeneratorNote;
      goto LABEL_8;
    case 2:
    case 3:
      v8 = ICThumbnailGeneratorNoteAttachments;
      goto LABEL_8;
    case 4:
    case 7:
    case 10:
    case 11:
      v5 = [ICThumbnailGeneratorSystemPaper alloc];
      -[ICThumbnailService workerContext](self, "workerContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAssetThumbnailCache shared](ICAssetThumbnailCache, "shared");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[ICThumbnailGeneratorSystemPaper initWithManagedObjectContext:cache:](v5, "initWithManagedObjectContext:cache:", v6, v7);

      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICThumbnailService thumbnailGeneratorForConfiguration:]", 1, 0, CFSTR("Cannot generate System Paper backdrop thumbnail"));
      v3 = 0;
      return v3;
    case 8:
      v8 = ICThumbnailGeneratorAvatar;
LABEL_8:
      v9 = [v8 alloc];
      -[ICThumbnailService workerContext](self, "workerContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (ICThumbnailGeneratorSystemPaper *)objc_msgSend(v9, "initWithManagedObjectContext:", v6);
LABEL_9:

      break;
    default:
      return v3;
  }
  return v3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)thumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  void (**v16)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICThumbnailService cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v8);
    objc_msgSend(v10, "setFetchDuration:");

    if (v7)
      v7[2](v7, v10);
  }
  else
  {
    -[ICThumbnailService backgroundQueue](self, "backgroundQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke;
    v13[3] = &unk_1E5C23C90;
    v13[4] = self;
    v14 = v6;
    v16 = v7;
    v15 = v8;
    dispatch_async(v12, v13);

  }
}

- (ICThumbnailCaching)cache
{
  return self->_cache;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setFetchDuration:");

  objc_msgSend(v7, "setCreationDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "image");
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 40), "fallbackBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "fallbackBlock");
    v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scale");
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

LABEL_4:
  }
  objc_msgSend(*(id *)(a1 + 48), "processThumbnailDescriptionResult:", v7);

}

- (void)processThumbnailDescriptionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      objc_msgSend(v4, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_decodeInBackground");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImage:", v7);

    }
    -[ICThumbnailService cache](self, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v9);

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__74;
  v28 = __Block_byref_object_dispose__74;
  v29 = 0;
  -[ICThumbnailService schedulingSerialQueue](self, "schedulingSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICThumbnailService_processThumbnailDescriptionResult___block_invoke;
  block[3] = &unk_1E5C1E190;
  v23 = &v24;
  block[4] = self;
  v11 = v4;
  v22 = v11;
  dispatch_sync(v10, block);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = (id)v25[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if (v16)
          (*(void (**)(uint64_t, id))(v16 + 16))(v16, v11);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v24, 8);
}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id location;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(a1[4], "schedulingSerialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E5C23C18;
  v4 = a1[5];
  block[4] = a1[4];
  v16 = v4;
  v17 = a1[7];
  v18 = &v19;
  dispatch_sync(v2, block);

  if (!*((_BYTE *)v20 + 24))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
    objc_initWeak(&location, v5);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_3;
    v9[3] = &unk_1E5C23C68;
    objc_copyWeak(&v13, &location);
    v10 = a1[5];
    v6 = a1[6];
    v7 = a1[4];
    v11 = v6;
    v12 = v7;
    objc_msgSend(v5, "addExecutionBlock:", v9);
    objc_msgSend(a1[4], "thumbnailGenerationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v5);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  _Block_object_dispose(&v19, 8);
}

- (OS_dispatch_queue)schedulingSerialQueue
{
  return self->_schedulingSerialQueue;
}

void __56__ICThumbnailService_processThumbnailDescriptionResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "callbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "callbacks");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v9);

}

void __60__ICThumbnailService_thumbnailWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "callbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v4 = *(const void **)(a1 + 48);
    if (v4)
    {
      v5 = _Block_copy(v4);
      objc_msgSend(v10, "addObject:", v5);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DE8];
    v7 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v6, "arrayWithObject:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "callbacks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (NSMutableDictionary)callbacks
{
  return self->_callbacks;
}

- (NSOperationQueue)thumbnailGenerationQueue
{
  return self->_thumbnailGenerationQueue;
}

void __44__ICThumbnailService_sharedThumbnailService__block_invoke()
{
  ICThumbnailService *v0;
  void *v1;

  v0 = objc_alloc_init(ICThumbnailService);
  v1 = (void *)sharedThumbnailService_instance;
  sharedThumbnailService_instance = (uint64_t)v0;

}

- (ICThumbnailService)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICThumbnailService *v7;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICThumbnailService initWithViewContext:workerContext:](self, "initWithViewContext:workerContext:", v4, v6);
  return v7;
}

- (ICThumbnailService)initWithViewContext:(id)a3 workerContext:(id)a4
{
  id v7;
  id v8;
  ICThumbnailService *v9;
  ICThumbnailService *v10;
  uint64_t v11;
  NSMutableDictionary *callbacks;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *schedulingSerialQueue;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *backgroundQueue;
  NSOperationQueue *v21;
  NSOperationQueue *thumbnailGenerationQueue;
  uint64_t v23;
  ICThumbnailCaching *cache;
  ICManagedObjectContextChangeController *v25;
  void *v26;
  uint64_t v27;
  ICManagedObjectContextChangeController *managedObjectChangeController;
  void *v29;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ICThumbnailService;
  v9 = -[ICThumbnailService init](&v31, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workerContext, a4);
    objc_storeStrong((id *)&v10->_viewContext, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    callbacks = v10->_callbacks;
    v10->_callbacks = (NSMutableDictionary *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, -1);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.notes.thumbnail-service-scheduler", v14);
    schedulingSerialQueue = v10->_schedulingSerialQueue;
    v10->_schedulingSerialQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, -1);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.notes.thumbnail-service-background", v18);
    backgroundQueue = v10->_backgroundQueue;
    v10->_backgroundQueue = (OS_dispatch_queue *)v19;

    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    thumbnailGenerationQueue = v10->_thumbnailGenerationQueue;
    v10->_thumbnailGenerationQueue = v21;

    -[NSOperationQueue setQualityOfService:](v10->_thumbnailGenerationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_thumbnailGenerationQueue, "setMaxConcurrentOperationCount:", 2);
    -[NSOperationQueue setName:](v10->_thumbnailGenerationQueue, "setName:", CFSTR("com.apple.notes.thumbnail-service-generation"));
    +[ICThumbnailCache shared](ICThumbnailCache, "shared");
    v23 = objc_claimAutoreleasedReturnValue();
    cache = v10->_cache;
    v10->_cache = (ICThumbnailCaching *)v23;

    v25 = [ICManagedObjectContextChangeController alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "ic_setFromNonNilObject:", v10->_viewContext);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[ICManagedObjectContextChangeController initWithManagedObjectContexts:delegate:](v25, "initWithManagedObjectContexts:delegate:", v26, v10);
    managedObjectChangeController = v10->_managedObjectChangeController;
    v10->_managedObjectChangeController = (ICManagedObjectContextChangeController *)v27;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v10, sel_attachmentPreviewImagesDidUpdate_, *MEMORY[0x1E0D63660], 0);

  }
  return v10;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  unint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = 0x1E0D63000uLL;
    v10 = MEMORY[0x1E0C809B0];
    v11 = __108__ICThumbnailService_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke;
    do
    {
      v12 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "changedValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v10;
          v28[1] = 3221225472;
          v28[2] = v11;
          v28[3] = &unk_1E5C23CB8;
          v17 = v14;
          v29 = v17;
          if (objc_msgSend(v16, "ic_containsObjectPassingTest:", v28))
          {
            objc_msgSend(v17, "objectID");
            v18 = v8;
            v19 = v11;
            v20 = v9;
            v21 = v5;
            v22 = v10;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "ic_addNonNilObject:", v23);

            v10 = v22;
            v5 = v21;
            v9 = v20;
            v11 = v19;
            v8 = v18;
            v7 = v26;
          }

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "note");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "ic_addNonNilObject:", v15);
LABEL_13:

        }
        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  v24 = (void *)objc_msgSend(v27, "copy");
  return v24;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICThumbnailService;
  -[ICThumbnailService dealloc](&v4, sel_dealloc);
}

- (id)thumbnailWithConfiguration:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__74;
  v22 = __Block_byref_object_dispose__74;
  v23 = 0;
  v5 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __49__ICThumbnailService_thumbnailWithConfiguration___block_invoke;
  v15 = &unk_1E5C203C8;
  v17 = &v18;
  v6 = v5;
  v16 = v6;
  -[ICThumbnailService thumbnailWithConfiguration:completion:](self, "thumbnailWithConfiguration:completion:", v4, &v12);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "associatedObjectIdentifier", v12, v13, v14, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICThumbnailService thumbnailWithConfiguration:].cold.1(v9, buf, v8);
    }

  }
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __49__ICThumbnailService_thumbnailWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)thumbnailsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  dispatch_group_t v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("com.apple.notes.mention-avatar", v9);

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke;
  block[3] = &unk_1E5C1E990;
  objc_copyWeak(&v18, &location);
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_2;
        v16[3] = &unk_1E5C23C40;
        v17 = v2;
        v18 = v9;
        v19 = *(id *)(a1 + 40);
        objc_msgSend(WeakRetained, "thumbnailWithConfiguration:completion:", v9, v16);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_3;
  block[3] = &unk_1E5C1D6F0;
  v10 = *(NSObject **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v14 = v2;
  v15 = v11;
  v12 = v2;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

void __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 40), "associatedObjectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __62__ICThumbnailService_thumbnailsWithConfigurations_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICThumbnailService workerContext](self, "workerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICThumbnailService_attachmentPreviewImagesDidUpdate___block_invoke;
  v9[3] = &unk_1E5C1D9A8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

void __55__ICThumbnailService_attachmentPreviewImagesDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_addNonNilObject:", v4);

    objc_msgSend(v3, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_addNonNilObject:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateForObjectIdentifiers:", v8);

}

uint64_t __108__ICThumbnailService_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "noteCellKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__74;
        v21 = __Block_byref_object_dispose__74;
        v22 = 0;
        -[ICThumbnailService viewContext](self, "viewContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v8;
        v16[1] = 3221225472;
        v16[2] = __93__ICThumbnailService_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke;
        v16[3] = &unk_1E5C1E190;
        v16[5] = v10;
        v16[6] = &v17;
        v16[4] = self;
        objc_msgSend(v11, "performBlockAndWait:", v16);

        if (v18[5])
        {
          -[ICThumbnailService cache](self, "cache");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18[5]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "invalidateForObjectIdentifiers:", v13);

        }
        _Block_object_dispose(&v17, 8);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

}

void __93__ICThumbnailService_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "viewContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (ICManagedObjectContextChangeController)managedObjectChangeController
{
  return self->_managedObjectChangeController;
}

- (void)setManagedObjectChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectChangeController, a3);
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (void)setSchedulingSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingSerialQueue, a3);
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (void)setThumbnailGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailGenerationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_schedulingSerialQueue, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_managedObjectChangeController, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

- (void)thumbnailWithConfiguration:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = &unk_1E5C72168;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "ICThumbnailService timed out generating thumbnail synchronously after %@s for: %@.", buf, 0x16u);

}

@end
