@implementation PUOneUpVisualImageAnalyzingController

- (PUOneUpVisualImageAnalyzingController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpVisualImageAnalyzingController.m"), 39, CFSTR("%s is not available as initializer"), "-[PUOneUpVisualImageAnalyzingController init]");

  abort();
}

- (PUOneUpVisualImageAnalyzingController)initWithBrowsingViewModel:(id)a3
{
  id v6;
  PUOneUpVisualImageAnalyzingController *v7;
  uint64_t v8;
  PXUpdater *updater;
  uint64_t v10;
  PXVisualIntelligenceManager *visualImageManager;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *loadVideoFrameQueue;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpVisualImageAnalyzingController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("browsingViewModel != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpVisualImageAnalyzingController;
  v7 = -[PUOneUpVisualImageAnalyzingController init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    -[PXUpdater addUpdateSelector:needsUpdate:](v7->_updater, "addUpdateSelector:needsUpdate:", sel__updateAssetViewModel, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v7->_updater, "addUpdateSelector:needsUpdate:", sel__updateAnalysisSuspended, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v7->_updater, "addUpdateSelector:needsUpdate:", sel__updateCanPerformAnalysis, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v7->_updater, "addUpdateSelector:needsUpdate:", sel__updateCurrentAnalysis, 1);
    v7->_isEnabled = 0;
    objc_storeStrong((id *)&v7->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](v7->_browsingViewModel, "registerChangeObserver:", v7);
    objc_msgSend(MEMORY[0x1E0D7BC00], "sharedManager");
    v10 = objc_claimAutoreleasedReturnValue();
    visualImageManager = v7->_visualImageManager;
    v7->_visualImageManager = (PXVisualIntelligenceManager *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.1UpVisualImageAnalyzing.loadCurrentVideoFrame", v12);
    loadVideoFrameQueue = v7->_loadVideoFrameQueue;
    v7->_loadVideoFrameQueue = (OS_dispatch_queue *)v13;

    PXVKSetUpResourcePurgingWhenApplicationIsHidden();
  }

  return v7;
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    -[PUOneUpVisualImageAnalyzingController _invalidateCanPerformAnalysis](self, "_invalidateCanPerformAnalysis");
    -[PUOneUpVisualImageAnalyzingController _invalidateAnalysisSuspended](self, "_invalidateAnalysisSuspended");
  }
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *v6;

  v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    v6 = v5;
    -[PUOneUpVisualImageAnalyzingController _cancelCurrentAnalysis](self, "_cancelCurrentAnalysis");
    -[PUAssetViewModel unregisterChangeObserver:](self->_assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](self->_assetViewModel, "registerChangeObserver:", self);
    -[PUOneUpVisualImageAnalyzingController _invalidateCanPerformAnalysis](self, "_invalidateCanPerformAnalysis");
    -[PUOneUpVisualImageAnalyzingController _invalidateCurrentAnalysis](self, "_invalidateCurrentAnalysis");
    v5 = v6;
  }

}

- (void)setCanPerformAnalysis:(BOOL)a3
{
  if (self->_canPerformAnalysis != a3)
  {
    self->_canPerformAnalysis = a3;
    if (!a3)
      -[PUOneUpVisualImageAnalyzingController _cancelCurrentAnalysis](self, "_cancelCurrentAnalysis");
    -[PUOneUpVisualImageAnalyzingController _invalidateCurrentAnalysis](self, "_invalidateCurrentAnalysis");
  }
}

- (void)_setNeedsUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUOneUpVisualImageAnalyzingController__setNeedsUpdate__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_cancelCurrentAnalysis
{
  id v3;

  -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpVisualImageAnalyzingController _cancelVKImageAnalysisForAssetViewModel:](self, "_cancelVKImageAnalysisForAssetViewModel:", v3);

}

- (void)_invalidateAssetViewModel
{
  id v2;

  -[PUOneUpVisualImageAnalyzingController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetViewModel);

}

- (void)_updateAssetViewModel
{
  void *v3;
  id v4;

  -[PUOneUpVisualImageAnalyzingController browsingViewModel](self, "browsingViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetViewModelForCurrentAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpVisualImageAnalyzingController setAssetViewModel:](self, "setAssetViewModel:", v3);

}

- (void)_invalidateCanPerformAnalysis
{
  id v2;

  -[PUOneUpVisualImageAnalyzingController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanPerformAnalysis);

}

- (void)_updateCanPerformAnalysis
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  v4 = -[PUOneUpVisualImageAnalyzingController isEnabled](self, "isEnabled");
  -[PUOneUpVisualImageAnalyzingController browsingViewModel](self, "browsingViewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpVisualImageAnalyzingController setCanPerformAnalysis:](self, "setCanPerformAnalysis:", objc_msgSend(v3, "canPerformAnalysisWithEnabled:browsingViewModel:assetViewModel:", v4, v6, v5));

}

- (void)_invalidateCurrentAnalysis
{
  id v3;

  -[PUOneUpVisualImageAnalyzingController setCurrentAnalysisRequestID:](self, "setCurrentAnalysisRequestID:", 0);
  -[PUOneUpVisualImageAnalyzingController updater](self, "updater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOf:", sel__updateCurrentAnalysis);

}

- (void)_discardCurrentAnalysis
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clearImageAnalysisFromAssetViewModel:", v4);

  -[PUOneUpVisualImageAnalyzingController _invalidateCurrentAnalysis](self, "_invalidateCurrentAnalysis");
}

- (void)_updateCurrentAnalysis
{
  id v3;

  if (-[PUOneUpVisualImageAnalyzingController canPerformAnalysis](self, "canPerformAnalysis"))
  {
    if (!-[PUOneUpVisualImageAnalyzingController currentAnalysisRequestID](self, "currentAnalysisRequestID"))
    {
      -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PUOneUpVisualImageAnalyzingController _requestVKImageAnalysisForAssetViewModel:](self, "_requestVKImageAnalysisForAssetViewModel:", v3);

    }
  }
}

- (void)_invalidateAnalysisSuspended
{
  id v2;

  -[PUOneUpVisualImageAnalyzingController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAnalysisSuspended);

}

- (void)_updateAnalysisSuspended
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PUOneUpVisualImageAnalyzingController browsingViewModel](self, "browsingViewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isScrubbing") & 1) != 0
    || (objc_msgSend(v5, "livePhotoShouldPlay") & 1) != 0
    || (objc_msgSend(v5, "isScrolling") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = -[PUOneUpVisualImageAnalyzingController isEnabled](self, "isEnabled") ^ 1;
  }
  -[PUOneUpVisualImageAnalyzingController visualImageManager](self, "visualImageManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalysisSuspended:", v3);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUOneUpVisualImageAnalyzingController browsingViewModel](self, "browsingViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUOneUpVisualImageAnalyzingController _handleBrowsingViewModelChange:](self, "_handleBrowsingViewModelChange:", v6);
  }
  else
  {
    -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUOneUpVisualImageAnalyzingController _handleAssetViewModelChange:](self, "_handleAssetViewModelChange:", v6);
  }

}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isScrollingDidChange") & 1) != 0
    || (objc_msgSend(v8, "isScrubbingDidChange") & 1) != 0
    || objc_msgSend(v8, "livePhotoShouldPlayDidChange"))
  {
    goto LABEL_7;
  }
  if (!objc_msgSend(v8, "isInteractingWithVideoScrubberDidChange"))
    goto LABEL_8;
  -[PUOneUpVisualImageAnalyzingController browsingViewModel](self, "browsingViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInteractingWithVideoScrubber");

  if (!v5)
  {
LABEL_7:
    -[PUOneUpVisualImageAnalyzingController _invalidateCanPerformAnalysis](self, "_invalidateCanPerformAnalysis");
  }
  else
  {
    v6 = (void *)objc_opt_class();
    -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_clearImageAnalysisFromAssetViewModel:", v7);

  }
LABEL_8:
  if (objc_msgSend(v8, "currentAssetDidChange"))
    -[PUOneUpVisualImageAnalyzingController _invalidateAssetViewModel](self, "_invalidateAssetViewModel");

}

- (void)_handleAssetViewModelChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "assetContentChanged"))
    -[PUOneUpVisualImageAnalyzingController _discardCurrentAnalysis](self, "_discardCurrentAnalysis");
  if ((objc_msgSend(v11, "focusValueChanged") & 1) != 0
    || (objc_msgSend(v11, "videoPlayerDidChange") & 1) != 0
    || (objc_msgSend(v11, "assetChanged") & 1) != 0
    || objc_msgSend(v11, "visualImageAnalysisChanged"))
  {
    -[PUOneUpVisualImageAnalyzingController _invalidateCanPerformAnalysis](self, "_invalidateCanPerformAnalysis");
  }
  else
  {
    objc_msgSend(v11, "videoPlayerChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v11, "videoPlayerChange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "desiredPlayStateDidChange"))
      {
        -[PUOneUpVisualImageAnalyzingController _invalidateCanPerformAnalysis](self, "_invalidateCanPerformAnalysis");
        -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "videoPlayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isPlaybackDesired");

        if (v8)
        {
          v9 = (void *)objc_opt_class();
          -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_clearImageAnalysisFromAssetViewModel:", v10);

        }
      }

    }
  }

}

- (void)_requestVKImageAnalysisForAssetViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  int v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpVisualImageAnalyzingController.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetViewModel != nil"));

  }
  objc_msgSend(v5, "visualImageAnalysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "playbackStyle");

    if (v8 == 4)
    {
      -[PUOneUpVisualImageAnalyzingController _requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:](self, "_requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:", v5);
    }
    else
    {
      objc_initWeak(&location, v5);
      -[PUOneUpVisualImageAnalyzingController visualImageManager](self, "visualImageManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke;
      v17[3] = &unk_1E589A990;
      objc_copyWeak(&v18, &location);
      v12 = objc_msgSend(v9, "requestVKImageAnalysisForAsset:resultHandler:", v10, v17);

      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_4;
      v14[3] = &unk_1E589DC68;
      v15 = v5;
      v16 = v12;
      objc_msgSend(v15, "performChanges:", v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id from;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpVisualImageAnalyzingController.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetViewModel != nil"));

  }
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "preferredTransform");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }

  objc_msgSend(v5, "primaryVideoLayerSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_clearImageAnalysisFromAssetViewModel:", v5);
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  -[PUOneUpVisualImageAnalyzingController loadVideoFrameQueue](self, "loadVideoFrameQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel___block_invoke;
  block[3] = &unk_1E589A9B8;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  v17 = v11;
  v18 = v10;
  v21 = v26;
  v22 = v27;
  v23 = v28;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_requestAnalysisForVideoFrameOfAssetViewModel:(id)a3 asset:(id)a4 playerLayer:(id)a5 preferredTransform:(CGAffineTransform *)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  __CVBuffer *v15;
  __CVBuffer *v16;
  __int128 v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  id v21;
  id v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int64_t v26;
  CGImageRef imageOut;
  _BYTE buf[32];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && v11)
  {
    -[PUOneUpVisualImageAnalyzingController setVideoFrameRequestID:](self, "setVideoFrameRequestID:", -[PUOneUpVisualImageAnalyzingController videoFrameRequestID](self, "videoFrameRequestID") + 1);
    v13 = -[PUOneUpVisualImageAnalyzingController videoFrameRequestID](self, "videoFrameRequestID");
    if (v12 && (v14 = v13, (v15 = (__CVBuffer *)objc_msgSend(v12, "copyDisplayedPixelBuffer")) != 0))
    {
      v16 = v15;
      imageOut = 0;
      VTCreateCGImageFromCVPixelBuffer(v15, 0, &imageOut);
      if (imageOut)
      {
        v17 = *(_OWORD *)&a6->c;
        *(_OWORD *)buf = *(_OWORD *)&a6->a;
        *(_OWORD *)&buf[16] = v17;
        v29 = *(_OWORD *)&a6->tx;
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", imageOut, PXVKImageOrientationFromPreferredTransform(), 1.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(imageOut);
        imageOut = 0;
      }
      else
      {
        v18 = 0;
      }
      objc_initWeak((id *)buf, self);
      objc_copyWeak(v22, (id *)buf);
      v19 = v18;
      v22[1] = v16;
      v20 = *(_OWORD *)&a6->c;
      v23 = *(_OWORD *)&a6->a;
      v24 = v20;
      v25 = *(_OWORD *)&a6->tx;
      v21 = v10;
      v26 = v14;
      px_dispatch_on_main_queue();

      objc_destroyWeak(v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      PLVisualIntelligenceGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Unable to produce analysis for video frame of asset: %@, playerLayer: %@", buf, 0x16u);
      }
    }

  }
}

- (void)_handleVideoFrameImage:(id)a3 pixelBufferRef:(__CVBuffer *)a4 preferredTransform:(CGAffineTransform *)a5 forAssetViewModel:(id)a6 requestID:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  int64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  id from;
  id location[2];

  v12 = a3;
  v13 = a6;
  -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v13)
  {
    v15 = -[PUOneUpVisualImageAnalyzingController videoFrameRequestID](self, "videoFrameRequestID");

    if (v15 == a7)
    {
      objc_initWeak(location, v13);
      objc_initWeak(&from, self);
      objc_msgSend(v13, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      -[PUOneUpVisualImageAnalyzingController visualImageManager](self, "visualImageManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)&a5->c;
      v29 = *(_OWORD *)&a5->a;
      v30 = v18;
      v31 = *(_OWORD *)&a5->tx;
      v19 = PXVKImageOrientationFromPreferredTransform();
      v20 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke;
      v26[3] = &unk_1E589AA30;
      objc_copyWeak(&v27, &from);
      objc_copyWeak(&v28, location);
      v21 = objc_msgSend(v17, "requestVKImageAnalysisForAsset:pixelBuffer:orientation:resultHandler:", v16, a4, v19, v26);

      v35 = v21;
      -[PUOneUpVisualImageAnalyzingController setCurrentAnalysisRequestID:](self, "setCurrentAnalysisRequestID:", *((unsigned int *)v33 + 6));
      v22[0] = v20;
      v22[1] = 3221225472;
      v22[2] = __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_3;
      v22[3] = &unk_1E58AAD18;
      v23 = v13;
      v25 = &v32;
      v24 = v12;
      objc_msgSend(v23, "performChanges:", v22);

      _Block_object_dispose(&v32, 8);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);

      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
  }
  else
  {

  }
}

- (void)_handleAnalysisResult:(id)a3 error:(id)a4 forAssetViewModel:(id)a5 requestID:(int)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    -[PUOneUpVisualImageAnalyzingController assetViewModel](self, "assetViewModel");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v11)
    {
      v13 = -[PUOneUpVisualImageAnalyzingController currentAnalysisRequestID](self, "currentAnalysisRequestID");

      if (v13 == a6)
        +[PUOneUpVisualImageAnalyzingController _setVisualImageAnalysis:forAssetViewModel:](PUOneUpVisualImageAnalyzingController, "_setVisualImageAnalysis:forAssetViewModel:", v14, v11);
    }
    else
    {

    }
  }

}

- (void)_cancelVKImageAnalysisForAssetViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "visualIntelligenceAnalyzeRequestID"))
  {
    -[PUOneUpVisualImageAnalyzingController visualImageManager](self, "visualImageManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelRequestByID:", objc_msgSend(v5, "visualIntelligenceAnalyzeRequestID"));

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__PUOneUpVisualImageAnalyzingController__cancelVKImageAnalysisForAssetViewModel___block_invoke;
    v7[3] = &unk_1E58ABD10;
    v8 = v5;
    objc_msgSend(v8, "performChanges:", v7);

  }
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PXVisualIntelligenceManager)visualImageManager
{
  return self->_visualImageManager;
}

- (OS_dispatch_queue)loadVideoFrameQueue
{
  return self->_loadVideoFrameQueue;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (BOOL)canPerformAnalysis
{
  return self->_canPerformAnalysis;
}

- (int)currentAnalysisRequestID
{
  return self->_currentAnalysisRequestID;
}

- (void)setCurrentAnalysisRequestID:(int)a3
{
  self->_currentAnalysisRequestID = a3;
}

- (int64_t)videoFrameRequestID
{
  return self->_videoFrameRequestID;
}

- (void)setVideoFrameRequestID:(int64_t)a3
{
  self->_videoFrameRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadVideoFrameQueue, 0);
  objc_storeStrong((id *)&self->_visualImageManager, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __81__PUOneUpVisualImageAnalyzingController__cancelVKImageAnalysisForAssetViewModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisualIntelligenceAnalyzeRequestID:", 0);
}

void __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;

  v7 = a3;
  v8 = a4;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v9 = v7;
  v10 = v8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v13 = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v11);
}

uint64_t __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVisualIntelligenceAnalyzeRequestID:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  return objc_msgSend(*(id *)(a1 + 32), "setBestImage:", *(_QWORD *)(a1 + 40));
}

void __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAnalysisResult:error:forAssetViewModel:requestID:", v2, v3, v4, *(unsigned int *)(a1 + 64));

}

void __124__PUOneUpVisualImageAnalyzingController__requestAnalysisForVideoFrameOfAssetViewModel_asset_playerLayer_preferredTransform___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(WeakRetained, "_handleVideoFrameImage:pixelBufferRef:preferredTransform:forAssetViewModel:requestID:", v4, v3, v8, v5, v6);

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
}

void __101__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(WeakRetained, "_requestAnalysisForVideoFrameOfAssetViewModel:asset:playerLayer:preferredTransform:", v3, v4, v5, v7);

}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;

  v7 = a3;
  v8 = a4;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v11 = a2;
  v9 = v7;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

uint64_t __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisualIntelligenceAnalyzeRequestID:", *(unsigned int *)(a1 + 40));
}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  int v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "visualIntelligenceAnalyzeRequestID");
  v5 = *(_DWORD *)(a1 + 48);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_3;
    v7[3] = &unk_1E58AB210;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "performChanges:", v7);

    objc_destroyWeak(&v9);
  }
}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  _BOOL8 v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setVisualImageAnalysis:", v2);

  v5 = *(_QWORD *)(a1 + 32) == 0;
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setHasVisualAnalysisFailed:", v5);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setVisualIntelligenceAnalyzeRequestID:", 0);

}

void __56__PUOneUpVisualImageAnalyzingController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateIfNeeded");

}

+ (BOOL)canPerformAnalysisWithEnabled:(BOOL)a3 browsingViewModel:(id)a4 assetViewModel:(id)a5
{
  int v6;
  id v7;
  id v8;
  char v10;
  void *v11;
  char isKindOfClass;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  if (v6)
  {
    if ((objc_msgSend(v7, "isScrolling") & 1) != 0)
    {
LABEL_3:
      LOBYTE(v6) = 0;
      goto LABEL_4;
    }
    v10 = objc_msgSend(v7, "isScrubbing");
    LOBYTE(v6) = 0;
    if (v8 && (v10 & 1) == 0)
    {
      objc_msgSend(v8, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_3;
      objc_msgSend(v8, "focusValue");
      if (fabs(v13) > 1.0)
        goto LABEL_3;
      objc_msgSend(v8, "visualImageAnalysis");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_3;
      objc_msgSend(v8, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "playbackStyle");

      if (v16 == 4)
      {
        objc_msgSend(v8, "videoPlayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isPlaybackDesired");

        if ((v18 & 1) != 0
          || !objc_msgSend(v8, "isFullyInFocus")
          || (objc_msgSend(v7, "isInteractingWithVideoScrubber") & 1) != 0)
        {
          goto LABEL_3;
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0D7BC00];
        objc_msgSend(v8, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v19, "canRequestVKImageAnalysisForAsset:", v20);

        if (!v6)
          goto LABEL_4;
      }
      LOBYTE(v6) = 1;
    }
  }
LABEL_4:

  return v6;
}

+ (void)_clearImageAnalysisFromAssetViewModel:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PUOneUpVisualImageAnalyzingController__clearImageAnalysisFromAssetViewModel___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

+ (void)_setVisualImageAnalysis:(id)a3 forAssetViewModel:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUOneUpVisualImageAnalyzingController.m"), 369, CFSTR("%s must be called on the main thread"), "+[PUOneUpVisualImageAnalyzingController _setVisualImageAnalysis:forAssetViewModel:]");

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PUOneUpVisualImageAnalyzingController__setVisualImageAnalysis_forAssetViewModel___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v10, "performChanges:", v12);

}

uint64_t __83__PUOneUpVisualImageAnalyzingController__setVisualImageAnalysis_forAssetViewModel___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasVisualAnalysisFailed:", *(_QWORD *)(a1 + 40) == 0);
  objc_msgSend(*(id *)(a1 + 32), "setVisualImageAnalysis:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setVisualIntelligenceAnalyzeRequestID:", 0);
}

uint64_t __79__PUOneUpVisualImageAnalyzingController__clearImageAnalysisFromAssetViewModel___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVisualImageAnalysis:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasVisualAnalysisFailed:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setVisualIntelligenceAnalyzeRequestID:", 0);
}

@end
