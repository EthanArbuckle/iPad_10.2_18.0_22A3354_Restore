@implementation PXDisplayAssetVideoContentProvider

- (PXDisplayAssetVideoContentProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetVideoContentProvider.m"), 94, CFSTR("%s is not available as initializer"), "-[PXDisplayAssetVideoContentProvider init]");

  abort();
}

- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXDisplayAssetVideoContentProvider *v18;

  v7 = a7;
  v12 = (objc_class *)MEMORY[0x1E0D78238];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  v18 = -[PXDisplayAssetVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](self, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:", v16, v15, v14, v13, v7, v17);

  return v18;
}

- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXDisplayAssetVideoContentProvider *v19;
  PXDisplayAssetVideoContentProvider *v20;
  uint64_t v21;
  NSArray *strategies;
  void *v23;
  uint64_t v24;
  NSArray *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *contentIdentifier;
  NSMutableDictionary *v31;
  NSMutableDictionary *loadingQueue_requestsByPriority;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *postprocessingQueue;
  dispatch_queue_t v36;
  OS_dispatch_queue *loadingQueue;
  double v38;
  id v40;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v40 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v41.receiver = self;
  v41.super_class = (Class)PXDisplayAssetVideoContentProvider;
  v19 = -[PXDisplayAssetVideoContentProvider init](&v41, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_audioSession, a6);
    objc_storeStrong((id *)&v20->_loadingQueue_asset, a3);
    objc_storeStrong((id *)&v20->_mediaProvider, a4);
    v21 = objc_msgSend(v16, "copy");
    strategies = v20->_strategies;
    v20->_strategies = (NSArray *)v21;

    v20->_requestURLOnly = a7;
    if (!-[NSArray count](v20->_strategies, "count"))
    {
      +[PXDisplayAssetVideoContentDeliveryStrategy defaultStreamingMediumQualityStrategy](PXDisplayAssetVideoContentDeliveryStrategy, "defaultStreamingMediumQualityStrategy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v20->_strategies;
      v20->_strategies = (NSArray *)v24;

    }
    v20->_mayContainAudio = PXExists();
    objc_msgSend(v15, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](v20->_strategies, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingFormat:", CFSTR("-%@"), v28, v40);
    v29 = objc_claimAutoreleasedReturnValue();
    contentIdentifier = v20->_contentIdentifier;
    v20->_contentIdentifier = (NSString *)v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    loadingQueue_requestsByPriority = v20->_loadingQueue_requestsByPriority;
    v20->_loadingQueue_requestsByPriority = v31;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create("com.apple.PXDisplayAssetVideoContentProvider.postprocessing", v33);
    postprocessingQueue = v20->_postprocessingQueue;
    v20->_postprocessingQueue = (OS_dispatch_queue *)v34;

    v36 = dispatch_queue_create("com.apple.PXDisplayAssetVideoContentProvider.loading", 0);
    loadingQueue = v20->_loadingQueue;
    v20->_loadingQueue = (OS_dispatch_queue *)v36;

    objc_msgSend(v15, "aspectRatio");
    v20->_videoAspectRatio = v38;
    objc_storeStrong((id *)&v20->_resourceReclamationController, a8);
    objc_msgSend(v18, "registerObserver:", v20);

  }
  return v20;
}

- (BOOL)mayContainAudio
{
  return self->_mayContainAudio;
}

- (id)analyticsPayload
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetVideoContentProvider asset](self, "asset");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6 = *MEMORY[0x1E0D09828];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *loadingQueue;
  _QWORD v11[4];
  id v12[2];
  id location;
  _QWORD v14[5];

  -[PXVideoContentProvider loadingResult](self, "loadingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "priority");
  v7 = MEMORY[0x1E0C809B0];
  if (v6 >= a3)
  {

  }
  else
  {
    -[PXVideoContentProvider loadingResult](self, "loadingResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke;
      v14[3] = &unk_1E51479C8;
      v14[4] = self;
      -[PXDisplayAssetVideoContentProvider performChanges:](self, "performChanges:", v14);
    }
  }
  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke_2;
  v11[3] = &unk_1E51447A0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  dispatch_async(loadingQueue, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (id)videoAspectRatio
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_videoAspectRatio);
}

- (BOOL)needsPostprocessing
{
  return 0;
}

- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, id, const __CFString *))a4 + 2))(a4, a3, &stru_1E5149688);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PXDisplayAssetVideoContentProvider;
  -[PXDisplayAssetVideoContentProvider description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Asset %@, Media Provider: %@"), v4, self->_loadingQueue_asset, self->_mediaProvider);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)reloadContent
{
  NSObject *loadingQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PXDisplayAssetVideoContentProvider_reloadContent__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(loadingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setAsset:(id)a3
{
  id v4;
  NSObject *loadingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXDisplayAssetVideoContentProvider_setAsset___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(loadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (PXDisplayAsset)asset
{
  NSObject *loadingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  loadingQueue = self->_loadingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXDisplayAssetVideoContentProvider_asset__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(loadingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PXDisplayAsset *)v3;
}

- (void)cancelLoading
{
  NSObject *loadingQueue;
  _QWORD block[5];

  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXDisplayAssetVideoContentProvider_cancelLoading__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(loadingQueue, block);
}

- (void)makeUniqueContentIdentifier
{
  NSString *v3;
  NSString *contentIdentifier;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  contentIdentifier = self->_contentIdentifier;
  self->_contentIdentifier = v3;

}

- (void)_loadingQueue_setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *loadingQueue_asset;
  PXDisplayAsset *v7;
  uint64_t v8;
  PXDisplayAsset *v9;
  PXDisplayAsset *v10;
  PXDisplayAsset *v11;
  uint64_t v12;
  PXDisplayAsset *v13;

  v5 = (PXDisplayAsset *)a3;
  loadingQueue_asset = self->_loadingQueue_asset;
  if (loadingQueue_asset != v5)
  {
    v13 = v5;
    v7 = loadingQueue_asset;
    objc_storeStrong((id *)&self->_loadingQueue_asset, a3);
    if (v7)
    {
      v8 = -[PXDisplayAsset playbackStyle](v7, "playbackStyle");
      if (v8 == -[PXDisplayAsset playbackStyle](v13, "playbackStyle"))
      {
        v9 = v13;
        v10 = v7;
        v11 = v10;
        if (v9)
        {
          v12 = -[PXDisplayAsset isContentEqualTo:](v9, "isContentEqualTo:", v10);
          if (!v12)
            v12 = -[PXDisplayAsset isContentEqualTo:](v11, "isContentEqualTo:", v9);

          if (v12 == 2)
            goto LABEL_12;
        }
        else
        {

        }
        if ((unint64_t)-[PXDisplayAsset playbackStyle](v9, "playbackStyle") >= 3)
          -[PXDisplayAssetVideoContentProvider _loadingQueue_reloadContent](self, "_loadingQueue_reloadContent");
      }
    }
LABEL_12:

    v5 = v13;
  }

}

- (void)_loadingQueueBeginLoadingWithPriority:(int64_t)a3
{
  PXDisplayAsset *loadingQueue_asset;
  PXDisplayAsset *v6;
  _QWORD v7[5];

  loadingQueue_asset = self->_loadingQueue_asset;
  if (loadingQueue_asset)
  {
    v6 = loadingQueue_asset;
    -[PXDisplayAssetVideoContentProvider _loadingQueue_beginRequestForPriorityIfNeeded:](self, "_loadingQueue_beginRequestForPriorityIfNeeded:", a3);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PXDisplayAssetVideoContentProvider__loadingQueueBeginLoadingWithPriority___block_invoke;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    -[PXDisplayAssetVideoContentProvider performChanges:](self, "performChanges:", v7);
  }

}

- (void)_loadingQueue_cancelAllRequests
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_loadingQueue_requestsByPriority, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_153);
  -[NSMutableDictionary removeAllObjects](self->_loadingQueue_requestsByPriority, "removeAllObjects");
}

- (void)_loadingQueue_beginRequestForPriorityIfNeeded:(int64_t)a3
{
  PXDisplayAsset *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *loadingQueue_requestsByPriority;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  PXDisplayAsset *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = self->_loadingQueue_asset;
  if ((unint64_t)-[PXDisplayAsset playbackStyle](v5, "playbackStyle") <= 2)
  {
    PLVideoPlaybackGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      PXDisplayAssetPlaybackStyleDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Unable to request video for asset %@ because its playback style (%@) does not require video. This may be expected if the asset has been recently adjusted.", buf, 0x16u);

    }
  }
  else if (v5
         && -[PXDisplayAssetVideoContentProvider _loadingQueue_needsNewRequestForPriority:](self, "_loadingQueue_needsNewRequestForPriority:", a3))
  {
    self->_loadingQueue_lastRequestedPriority = a3;
    -[PXDisplayAssetVideoContentProvider mediaProvider](self, "mediaProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXDisplayAssetVideoContentProviderRequest startRequestWithAsset:mediaProvider:strategies:priority:requestURLOnly:delegate:loadingQueue:](PXDisplayAssetVideoContentProviderRequest, "startRequestWithAsset:mediaProvider:strategies:priority:requestURLOnly:delegate:loadingQueue:", v5, v6, self->_strategies, a3, self->_requestURLOnly, self, self->_loadingQueue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    loadingQueue_requestsByPriority = self->_loadingQueue_requestsByPriority;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](loadingQueue_requestsByPriority, "setObject:forKeyedSubscript:", v7, v9);

  }
}

- (BOOL)_loadingQueue_needsNewRequestForPriority:(int64_t)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *loadingQueue_requestsByPriority;
  void *v8;
  void *v9;

  -[PXVideoContentProvider loadingResult](self, "loadingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    loadingQueue_requestsByPriority = self->_loadingQueue_requestsByPriority;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](loadingQueue_requestsByPriority, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return PXExists() ^ 1;
  }
  return 0;
}

- (void)_postprocessingQueue_performPostprocessingOfItem:(id)a3 info:(id)a4 priority:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PXDisplayAssetVideoContentProvider__postprocessingQueue_performPostprocessingOfItem_info_priority___block_invoke;
  v10[3] = &unk_1E5115748;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  -[PXDisplayAssetVideoContentProvider postprocessPlayerItem:completionHandler:](self, "postprocessPlayerItem:completionHandler:", v8, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)_handlePostprocessedPlayerItem:(id)a3 priority:(int64_t)a4 description:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *loadingQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("Unable to produce a post-processed player item for this video.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PXVideoContentProviderErrorDomain"), 2, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  loadingQueue = self->_loadingQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke;
  v17[3] = &unk_1E5141C90;
  v17[4] = self;
  v18 = v8;
  v20 = v9;
  v21 = a4;
  v19 = v10;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(loadingQueue, v17);

}

- (void)_loadingQueue_reloadContent
{
  _QWORD v3[5];

  -[PXDisplayAssetVideoContentProvider _loadingQueue_cancelAllRequests](self, "_loadingQueue_cancelAllRequests");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXDisplayAssetVideoContentProvider__loadingQueue_reloadContent__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXDisplayAssetVideoContentProvider performChanges:](self, "performChanges:", v3);
}

- (void)_reloadAVObjects
{
  NSObject *loadingQueue;
  _QWORD block[5];

  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PXDisplayAssetVideoContentProvider__reloadAVObjects__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(loadingQueue, block);
}

- (void)requestLoadingProgressDidChange:(id)a3
{
  NSObject *loadingQueue;
  _QWORD block[5];

  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(loadingQueue, block);
}

- (void)request:(id)a3 didFinishWithPlayerItem:(id)a4 videoURL:(id)a5 downloadedTimeRange:(id *)a6 info:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *loadingQueue;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PXDisplayAssetVideoContentProvider *v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  loadingQueue = self->_loadingQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke;
  v23[3] = &unk_1E51157E8;
  v24 = v16;
  v25 = self;
  v26 = v13;
  v27 = v14;
  v18 = *(_OWORD *)&a6->var0.var3;
  v30 = *(_OWORD *)&a6->var0.var0;
  v31 = v18;
  v32 = *(_OWORD *)&a6->var1.var1;
  v28 = v15;
  v29 = a2;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v16;
  dispatch_async(loadingQueue, v23);

}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (id)audioSession
{
  return self->_audioSession;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_loadingQueue_asset, 0);
  objc_storeStrong((id *)&self->_loadingQueue_requestsByPriority, 0);
  objc_storeStrong((id *)&self->_postprocessingQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "priority"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
  if (*(_QWORD *)(a1 + 56) || *(_QWORD *)(a1 + 64))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "needsPostprocessing"))
    {
      if ((*(_BYTE *)(a1 + 92) & 1) != 0
        && (*(_BYTE *)(a1 + 116) & 1) != 0
        && !*(_QWORD *)(a1 + 120)
        && (*(_QWORD *)(a1 + 104) & 0x8000000000000000) == 0)
      {
        PXAssertGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Postprocessing is not compatiable with downloaded segments of video yet", (uint8_t *)location, 2u);
        }

      }
      v7 = *(_BYTE **)(a1 + 40);
      if (v7[200])
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Postprocessing is not compatiable with requesting URLs only", (uint8_t *)location, 2u);
        }

        v7 = *(_BYTE **)(a1 + 40);
      }
      objc_initWeak(location, v7);
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 152);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_161;
      block[3] = &unk_1E51429B8;
      objc_copyWeak(&v35, location);
      v32 = *(id *)(a1 + 56);
      v33 = *(id *)(a1 + 32);
      v34 = *(id *)(a1 + 48);
      dispatch_async(v9, block);

      objc_destroyWeak(&v35);
      objc_destroyWeak(location);
      if ((v3 & 1) != 0)
        return;
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_2;
      v23[3] = &unk_1E51157C0;
      v23[4] = v10;
      v24 = *(id *)(a1 + 56);
      v25 = *(id *)(a1 + 64);
      v11 = *(_OWORD *)(a1 + 96);
      v28 = *(_OWORD *)(a1 + 80);
      v29 = v11;
      v30 = *(_OWORD *)(a1 + 112);
      v26 = *(id *)(a1 + 32);
      v27 = *(id *)(a1 + 48);
      objc_msgSend(v10, "performChanges:", v23);

      if ((v3 & 1) != 0)
        return;
    }
    objc_msgSend(*(id *)(a1 + 40), "cancelLoading");
    return;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Video Player Item loading failed."), *MEMORY[0x1E0CB2938]);
    v13 = *MEMORY[0x1E0CD1BE8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXVideoContentProviderErrorDomain"), 1, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_3;
    v19[3] = &unk_1E5145A98;
    v17 = *(void **)(a1 + 48);
    v20 = *(id *)(a1 + 40);
    v21 = v16;
    v22 = v17;
    v18 = v16;
    objc_msgSend(v20, "performChanges:", v19);

  }
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_161(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_postprocessingQueue_performPostprocessingOfItem:info:priority:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "priority"));

}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_2(uint64_t a1)
{
  PXVideoContentProviderLoadingResult *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  PXVideoContentProviderLoadingResult *v8;
  _OWORD v9[3];

  v2 = [PXVideoContentProviderLoadingResult alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 64), "priority");
  v7 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v7;
  v9[2] = *(_OWORD *)(a1 + 104);
  v8 = -[PXVideoContentProviderLoadingResult initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:](v2, "initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:", v3, v4, v9, v5, 0, v6, CFSTR("Loaded from Media Provider"));
  objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", v8);

}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_3(uint64_t a1)
{
  PXVideoContentProviderLoadingResult *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  PXVideoContentProviderLoadingResult *v6;
  _OWORD v7[3];

  v2 = [PXVideoContentProviderLoadingResult alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "priority");
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v7[0] = *MEMORY[0x1E0CA2E40];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v6 = -[PXVideoContentProviderLoadingResult initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:](v2, "initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:", 0, 0, v7, 0, v3, v4, CFSTR("Loading Failed"));
  objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", v6);

}

void __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_2;
  v6[3] = &unk_1E5115798;
  v6[4] = v7;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *(void **)(a1 + 32);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_3;
  v5[3] = &unk_1E513FF70;
  v5[4] = v4;
  v5[5] = v7;
  objc_msgSend(v4, "performChanges:", v5);
  _Block_object_dispose(v7, 8);
}

uint64_t __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  uint64_t result;
  double v6;

  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a3, "loadingProgress");
  if (v4 >= v6)
    v6 = v4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

uint64_t __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __54__PXDisplayAssetVideoContentProvider__reloadAVObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_reloadContent");
}

uint64_t __65__PXDisplayAssetVideoContentProvider__loadingQueue_reloadContent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_beginRequestForPriorityIfNeeded:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
}

void __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke_2;
  v6[3] = &unk_1E5115770;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v3 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v9 = v3;
  v11 = v4;
  v10 = v5;
  objc_msgSend(v7, "performChanges:", v6);

}

void __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke_2(uint64_t a1)
{
  PXVideoContentProviderLoadingResult *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  PXVideoContentProviderLoadingResult *v8;
  _OWORD v9[3];

  v2 = [PXVideoContentProviderLoadingResult alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v9[0] = *MEMORY[0x1E0CA2E40];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v8 = -[PXVideoContentProviderLoadingResult initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:](v2, "initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:", v3, 0, v9, 0, v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", v8);

}

void __101__PXDisplayAssetVideoContentProvider__postprocessingQueue_performPostprocessingOfItem_info_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handlePostprocessedPlayerItem:priority:description:", v7, *(_QWORD *)(a1 + 40), v6);

}

BOOL __79__PXDisplayAssetVideoContentProvider__loadingQueue_needsNewRequestForPriority___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") > *(_QWORD *)(a1 + 32);
}

uint64_t __69__PXDisplayAssetVideoContentProvider__loadingQueue_cancelAllRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __76__PXDisplayAssetVideoContentProvider__loadingQueueBeginLoadingWithPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", 0);
}

uint64_t __51__PXDisplayAssetVideoContentProvider_cancelLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_cancelAllRequests");
}

void __43__PXDisplayAssetVideoContentProvider_asset__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
}

void __47__PXDisplayAssetVideoContentProvider_setAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadingQueue_setAsset:", *(_QWORD *)(a1 + 32));

}

void __51__PXDisplayAssetVideoContentProvider_reloadContent__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadingQueue_reloadContent");

}

uint64_t __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", 0);
}

void __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadingQueueBeginLoadingWithPriority:", *(_QWORD *)(a1 + 40));

}

uint64_t __143__PXDisplayAssetVideoContentProvider_initWithAsset_mediaProvider_deliveryStrategies_audioSession_requestURLOnly_resourceReclamationController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAudioAllowed");
}

@end
