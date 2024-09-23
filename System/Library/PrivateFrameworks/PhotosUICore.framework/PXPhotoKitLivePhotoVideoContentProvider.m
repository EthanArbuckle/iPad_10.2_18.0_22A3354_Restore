@implementation PXPhotoKitLivePhotoVideoContentProvider

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXPhotoKitLivePhotoVideoContentProvider *v18;

  v7 = a7;
  v12 = (objc_class *)MEMORY[0x1E0D78238];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  v18 = -[PXPhotoKitLivePhotoVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](self, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:", v16, v15, v14, v13, v7, v17);

  return v18;
}

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 spec:(id)a7 resourceReclamationController:(id)a8
{
  id v14;
  id v15;
  PXPhotoKitLivePhotoVideoContentProvider *v16;
  void *v17;
  objc_super v19;

  v14 = a3;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  v16 = -[PXPhotoKitVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](&v19, sel_initWithAsset_mediaProvider_deliveryStrategies_audioSession_requestURLOnly_resourceReclamationController_, v14, a4, a5, a6, 0, a8);
  if (v16)
  {
    v16->_assetPlaybackStyle = objc_msgSend(v14, "playbackStyle");
    objc_storeStrong((id *)&v16->_spec, a7);
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDeferredKeyObserver:", v16);

  }
  return v16;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("stabilizeLivePhotos"));

    if (v8)
      -[PXDisplayAssetVideoContentProvider reloadContent](self, "reloadContent");
  }
  else
  {

  }
}

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitVideoContentProvider.m"), 133, CFSTR("%s is not available as initializer"), "-[PXPhotoKitLivePhotoVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:]");

  abort();
}

- (BOOL)needsPostprocessing
{
  return self->_assetPlaybackStyle > 5uLL || (self->_assetPlaybackStyle & 0x3F) == 3;
}

- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PXMediaAnalysisVideoStabilizationRecipeSource *v22;
  PXMediaAnalysisVideoStabilizationRecipeSource *v23;
  PXPhotoKitLivePhotoVideoContentProviderSpec *v24;
  PXVideoStabilizeOperationSpec *v25;
  PXVideoStabilizeOperation *v26;
  PXVideoStabilizeOperation *stabilizeOperation;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  _BYTE location[12];
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXDisplayAssetVideoContentProvider asset](self, "asset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "useMediaAnalysisRecipe");

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0D75130];
      objc_msgSend(v6, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "naturalSize");
      v19 = v18;
      v21 = v20;

      v22 = -[PXMediaAnalysisVideoStabilizationRecipeSource initWithAsset:videoDimensions:]([PXMediaAnalysisVideoStabilizationRecipeSource alloc], "initWithAsset:videoDimensions:", v30, v19, v21);
    }
    else
    {
      v22 = -[PXURLVideoStabilizationRecipeSource initWithVideoURL:]([PXURLVideoStabilizationRecipeSource alloc], "initWithVideoURL:", v11);
    }
    v23 = v22;
    v24 = self->_spec;
    v25 = objc_alloc_init(PXVideoStabilizeOperationSpec);
    -[PXVideoProcessingOperationSpec setInputVideoURL:](v25, "setInputVideoURL:", v11);
    if (v24)
    {
      -[PXPhotoKitLivePhotoVideoContentProviderSpec loopStartTime](v24, "loopStartTime");
      v44 = v46;
      v45 = v47;
      -[PXVideoStabilizeOperationSpec setStartTime:](v25, "setStartTime:", &v44);
      -[PXPhotoKitLivePhotoVideoContentProviderSpec loopTimeRange](v24, "loopTimeRange");
      v38 = v41;
      v39 = v42;
      v40 = v43;
      -[PXVideoStabilizeOperationSpec setTimeRange:](v25, "setTimeRange:", &v38);
      -[PXPhotoKitLivePhotoVideoContentProviderSpec crossfadeDuration](v24, "crossfadeDuration");
    }
    else
    {
      v46 = 0uLL;
      v47 = 0;
      v45 = 0;
      v44 = 0uLL;
      -[PXVideoStabilizeOperationSpec setStartTime:](v25, "setStartTime:", &v44);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[PXVideoStabilizeOperationSpec setTimeRange:](v25, "setTimeRange:", &v38);
      v36 = 0uLL;
      v37 = 0;
    }
    v34 = v36;
    v35 = v37;
    -[PXVideoStabilizeOperationSpec setCrossfadeDuration:](v25, "setCrossfadeDuration:", &v34);
    -[PXVideoStabilizeOperationSpec setRecipeSource:](v25, "setRecipeSource:", v23);
    -[PXVideoStabilizeOperationSpec setPerformStabilization:](v25, "setPerformStabilization:", -[PXPhotoKitLivePhotoVideoContentProviderSpec stabilizeIfPossible](v24, "stabilizeIfPossible"));
    -[PXVideoStabilizeOperationSpec setWantsAudio:](v25, "setWantsAudio:", -[PXPhotoKitLivePhotoVideoContentProviderSpec wantsAudio](v24, "wantsAudio"));
    v26 = -[PXVideoStabilizeOperation initWithSpec:]([PXVideoStabilizeOperation alloc], "initWithSpec:", v25);
    stabilizeOperation = self->_stabilizeOperation;
    self->_stabilizeOperation = v26;

    objc_initWeak((id *)location, self);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __83__PXPhotoKitLivePhotoVideoContentProvider_postprocessPlayerItem_completionHandler___block_invoke;
    v31[3] = &unk_1E5146480;
    objc_copyWeak(&v33, (id *)location);
    v32 = v7;
    -[PXVideoStabilizeOperation setCompletionBlock:](self->_stabilizeOperation, "setCompletionBlock:", v31);
    objc_msgSend((id)objc_opt_class(), "postProcessingOperationQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addOperation:", self->_stabilizeOperation);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)location);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "asset");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = self;
      v49 = 2112;
      v50 = v29;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@: Unable to post process Live Photo asset %@", location, 0x16u);

    }
    (*((void (**)(id, id, const __CFString *))v7 + 2))(v7, v6, CFSTR("Processed: Unstabilized Loop"));
  }

}

- (void)_handleStabilizeOperationFinishedWithProcessingCompletionHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXVideoStabilizeOperation *stabilizeOperation;
  void *v19;
  void *v20;
  uint8_t buf[4];
  PXPhotoKitLivePhotoVideoContentProvider *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (-[PXVideoStabilizeOperation isFinished](self->_stabilizeOperation, "isFinished"))
  {
    -[PXVideoProcessingOperation result](self->_stabilizeOperation, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputVideoAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C8B300]);
      objc_msgSend(v5, "outputVideoAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithAsset:", v8);

      objc_msgSend(v5, "outputVideoComposition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setVideoComposition:", v10);

      objc_msgSend(v5, "outputAudioMix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAudioMix:", v11);

      v12 = (void *)MEMORY[0x1E0CB3940];
      PXVideoStabilizeAnalysisTypeDescription(objc_msgSend(v5, "analysisType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Processed: [%@]"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v4[2](v4, v9, v14);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PXVideoProcessingOperation result](self->_stabilizeOperation, "result");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2112;
        v24 = v20;
        _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ failed to create stabilized video player item with error %@", buf, 0x16u);

      }
      v15 = (void *)MEMORY[0x1E0C8B3C0];
      -[PXVideoProcessingOperation spec](self->_stabilizeOperation, "spec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputVideoURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetWithURL:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithAsset:", v9);
      v4[2](v4, v14, CFSTR("Processed: Unstabilized Loop"));
    }

  }
  stabilizeOperation = self->_stabilizeOperation;
  self->_stabilizeOperation = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[PXVideoStabilizeOperation cancel](self->_stabilizeOperation, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  -[PXPhotoKitLivePhotoVideoContentProvider dealloc](&v3, sel_dealloc);
}

- (void)cancelLoading
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  -[PXDisplayAssetVideoContentProvider cancelLoading](&v3, sel_cancelLoading);
  -[PXVideoStabilizeOperation cancel](self->_stabilizeOperation, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizeOperation, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __83__PXPhotoKitLivePhotoVideoContentProvider_postprocessPlayerItem_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleStabilizeOperationFinishedWithProcessingCompletionHandler:", *(_QWORD *)(a1 + 32));

}

+ (NSOperationQueue)postProcessingOperationQueue
{
  if (postProcessingOperationQueue_onceToken != -1)
    dispatch_once(&postProcessingOperationQueue_onceToken, &__block_literal_global_290804);
  return (NSOperationQueue *)(id)postProcessingOperationQueue_queue;
}

uint64_t __71__PXPhotoKitLivePhotoVideoContentProvider_postProcessingOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)postProcessingOperationQueue_queue;
  postProcessingOperationQueue_queue = (uint64_t)v0;

  objc_msgSend((id)postProcessingOperationQueue_queue, "setQualityOfService:", 25);
  return objc_msgSend((id)postProcessingOperationQueue_queue, "setMaxConcurrentOperationCount:", 1);
}

@end
