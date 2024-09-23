@implementation PUAggregateDictionaryBrowsingViewModelTracer

- (PUAggregateDictionaryBrowsingViewModelTracer)init
{
  return -[PUAggregateDictionaryBrowsingViewModelTracer initWithBrowsingViewModel:](self, "initWithBrowsingViewModel:", 0);
}

- (PUAggregateDictionaryBrowsingViewModelTracer)initWithBrowsingViewModel:(id)a3
{
  id v4;
  PUAggregateDictionaryBrowsingViewModelTracer *v5;
  PUAggregateDictionaryBrowsingViewModelTracer *v6;
  id v7;
  uint64_t v8;
  NSHashTable *viewingContexts;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUAggregateDictionaryBrowsingViewModelTracer;
  v5 = -[PUAggregateDictionaryBrowsingViewModelTracer init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_browsingViewModel, v4);
    objc_msgSend(v4, "registerChangeObserver:", v6);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    viewingContexts = v6->__viewingContexts;
    v6->__viewingContexts = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6->__isApplicationActive = objc_msgSend(v10, "isSuspended") ^ 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__applicationWillResignActive_, *MEMORY[0x1E0DC4868], v10);
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], v10);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browsingViewModel);
  objc_msgSend(WeakRetained, "unregisterChangeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PUAggregateDictionaryBrowsingViewModelTracer;
  -[PUAggregateDictionaryBrowsingViewModelTracer dealloc](&v5, sel_dealloc);
}

- (void)_applicationWillResignActive:(id)a3
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setApplicationActive:](self, "_setApplicationActive:", 0);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setApplicationActive:](self, "_setApplicationActive:", 1);
}

- (void)_setApplicationActive:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->__isApplicationActive != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->__isApplicationActive = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __70__PUAggregateDictionaryBrowsingViewModelTracer__setApplicationActive___block_invoke;
    v4[3] = &unk_1E58ABD10;
    v4[4] = self;
    -[PUAggregateDictionaryBrowsingViewModelTracer performChanges:](self, "performChanges:", v4);
  }
}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUAggregateDictionaryBrowsingViewModelTracer _isPerformingChanges](self, "_isPerformingChanges");
  -[PUAggregateDictionaryBrowsingViewModelTracer _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v4[2](v4);

  -[PUAggregateDictionaryBrowsingViewModelTracer _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
    -[PUAggregateDictionaryBrowsingViewModelTracer _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)addViewingContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUAggregateDictionaryBrowsingViewModelTracer _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  -[PUAggregateDictionaryBrowsingViewModelTracer _viewingContexts](self, "_viewingContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", v5);
    -[PUAggregateDictionaryBrowsingViewModelTracer _invalidateOneUpSessionActive](self, "_invalidateOneUpSessionActive");
  }

}

- (void)removeViewingContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUAggregateDictionaryBrowsingViewModelTracer _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  -[PUAggregateDictionaryBrowsingViewModelTracer _viewingContexts](self, "_viewingContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v4, "removeObject:", v5);
    -[PUAggregateDictionaryBrowsingViewModelTracer _invalidateOneUpSessionActive](self, "_invalidateOneUpSessionActive");
  }

}

- (void)_assertInsideChangeBlock
{
  id v4;

  if (!-[PUAggregateDictionaryBrowsingViewModelTracer _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAggregateDictionaryBrowsingViewModelTracer.m"), 136, CFSTR("not within a performChanges block"));

  }
}

- (void)_setOneUpSessionActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->__oneUpSessionActive != a3)
  {
    v3 = a3;
    PLAggdGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11[0] = 67109120;
      v11[1] = v3;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "OneUp session active:%d", (uint8_t *)v11, 8u);
    }

    self->__oneUpSessionActive = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    if (v3)
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer _setOneUpSessionStartTime:](self, "_setOneUpSessionStartTime:", v6);
    }
    else
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer _oneUpSessionStartTime](self, "_oneUpSessionStartTime");
      v9 = v7 - v8;
      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userBrowsedOneUpFor:", v9);

    }
    -[PUAggregateDictionaryBrowsingViewModelTracer _invalidateViewedAsset](self, "_invalidateViewedAsset");
  }
}

- (void)_setViewedAsset:(id)a3
{
  PUDisplayAsset *v5;
  PUDisplayAsset *v6;
  id *p_viewedAsset;
  NSObject *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (PUDisplayAsset *)a3;
  v6 = v5;
  p_viewedAsset = (id *)&self->__viewedAsset;
  if (self->__viewedAsset != v5 && (-[PUDisplayAsset isEqual:](v5, "isEqual:") & 1) == 0)
  {
    if (*p_viewedAsset)
    {
      PLAggdGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = *p_viewedAsset;
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "stop viewing asset %@", (uint8_t *)&v17, 0xCu);
      }

      if (-[PUAggregateDictionaryBrowsingViewModelTracer _viewedAssetLongEnough](self, "_viewedAssetLongEnough")
        && objc_msgSend(*p_viewedAsset, "mediaType") == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v11 = v10;
        -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAssetStartTime](self, "_viewedAssetStartTime");
        v13 = v11 - v12;
        +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userViewedPhotoInOneUpFor:", v13);
        if ((-[PUDisplayAsset mediaSubtypes](self->__viewedAsset, "mediaSubtypes") & 2) != 0)
          objc_msgSend(v14, "userViewedHDRPhotoInOneUpFor:", v13);

      }
    }
    objc_storeStrong((id *)&self->__viewedAsset, a3);
    if (*p_viewedAsset)
    {
      PLAggdGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = *p_viewedAsset;
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "start viewing asset %@", (uint8_t *)&v17, 0xCu);
      }

    }
    -[PUAggregateDictionaryBrowsingViewModelTracer _invalidateViewedAssetLongEnough](self, "_invalidateViewedAssetLongEnough");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PUAggregateDictionaryBrowsingViewModelTracer _setViewedAssetStartTime:](self, "_setViewedAssetStartTime:");
    -[PUAggregateDictionaryBrowsingViewModelTracer _scheduleViewUpdate](self, "_scheduleViewUpdate");
  }

}

- (void)_scheduleViewUpdate
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[PUAggregateDictionaryBrowsingViewModelTracer _didScheduleViewUpdate](self, "_didScheduleViewUpdate"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setDidScheduleViewUpdate:](self, "_setDidScheduleViewUpdate:", 1);
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __67__PUAggregateDictionaryBrowsingViewModelTracer__scheduleViewUpdate__block_invoke;
    v4[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_handleScheduledViewUpdate
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v9[5];

  -[PUAggregateDictionaryBrowsingViewModelTracer _setDidScheduleViewUpdate:](self, "_setDidScheduleViewUpdate:", 0);
  -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAsset](self, "_viewedAsset");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAssetLongEnough](self, "_viewedAssetLongEnough");

    if (!v5)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__PUAggregateDictionaryBrowsingViewModelTracer__handleScheduledViewUpdate__block_invoke;
      v9[3] = &unk_1E58ABD10;
      v9[4] = self;
      -[PUAggregateDictionaryBrowsingViewModelTracer performChanges:](self, "performChanges:", v9);
      -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAsset](self, "_viewedAsset");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAssetLongEnough](self, "_viewedAssetLongEnough");

        if (!v8)
          -[PUAggregateDictionaryBrowsingViewModelTracer _scheduleViewUpdate](self, "_scheduleViewUpdate");
      }
    }
  }
}

- (void)_setViewedAssetLongEnough:(BOOL)a3
{
  void *v3;
  id v4;

  if (self->__viewedAssetLongEnough != a3)
  {
    self->__viewedAssetLongEnough = a3;
    if (a3)
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAsset](self, "_viewedAsset");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userViewedAssetInOneUp:", v4);

    }
  }
}

- (void)_setPlayingVideo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->__isPlayingVideo != a3)
  {
    v3 = a3;
    self->__isPlayingVideo = a3;
    +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(v8, "userWillPlayAssetInOneUp:", v7);
    else
      objc_msgSend(v8, "userDidPlayAssetInOneUp:", v7);

  }
}

- (void)_setPlayingStreamedVideo:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->__isPlayingStreamedVideo != a3)
  {
    self->__isPlayingStreamedVideo = a3;
    if (a3)
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentAssetReference");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asset");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "streamedVideoPlaybackBegan:", v6);

    }
    else
    {
      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "streamedVideoPlaybackEnded");
    }

  }
}

- (void)_setStreamedVideoActuallyPlaying:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->__isStreamedVideoActuallyPlaying != a3)
  {
    self->__isStreamedVideoActuallyPlaying = a3;
    if (a3)
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentAssetReference");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asset");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "streamedVideoPlaybackStartedActuallyPlaying:", v6);

    }
  }
}

- (void)_setStreamedVideoStalled:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->__isStreamedVideoStalled != a3)
  {
    self->__isStreamedVideoStalled = a3;
    if (a3)
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentAssetReference");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asset");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "streamedVideoPlaybackStalled:", v6);

    }
  }
}

- (void)_updateIfNeeded
{
  _BOOL8 v4;
  id v5;

  if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdate](self, "_needsUpdate"))
  {
    v4 = -[PUAggregateDictionaryBrowsingViewModelTracer _isPerformingUpdate](self, "_isPerformingUpdate");
    -[PUAggregateDictionaryBrowsingViewModelTracer _setPerformingUpdate:](self, "_setPerformingUpdate:", 1);
    -[PUAggregateDictionaryBrowsingViewModelTracer _updateOneUpSessionActive](self, "_updateOneUpSessionActive");
    -[PUAggregateDictionaryBrowsingViewModelTracer _updateViewedAssetIfNeeded](self, "_updateViewedAssetIfNeeded");
    -[PUAggregateDictionaryBrowsingViewModelTracer _updateViewedAssetLongEnoughIfNeeded](self, "_updateViewedAssetLongEnoughIfNeeded");
    -[PUAggregateDictionaryBrowsingViewModelTracer _updatePlayingVideoIfNeeded](self, "_updatePlayingVideoIfNeeded");
    -[PUAggregateDictionaryBrowsingViewModelTracer _setPerformingUpdate:](self, "_setPerformingUpdate:", v4);
    if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAggregateDictionaryBrowsingViewModelTracer.m"), 292, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateViewedAsset](self, "_needsUpdateViewedAsset")
      || -[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateViewedAssetLongEnough](self, "_needsUpdateViewedAssetLongEnough")|| -[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdatePlayingVideo](self, "_needsUpdatePlayingVideo")|| -[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateOneUpSessionActive](self, "_needsUpdateOneUpSessionActive");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!-[PUAggregateDictionaryBrowsingViewModelTracer _isPerformingChanges](self, "_isPerformingChanges")
    && !-[PUAggregateDictionaryBrowsingViewModelTracer _isPerformingUpdate](self, "_isPerformingUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAggregateDictionaryBrowsingViewModelTracer.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isPerformingChanges] || [self _isPerformingUpdate]"));

  }
}

- (void)_invalidateOneUpSessionActive
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateOneUpSessionActive:](self, "_setNeedsUpdateOneUpSessionActive:", 1);
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateOneUpSessionActive
{
  void *v3;
  _BOOL8 v4;

  if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateOneUpSessionActive](self, "_needsUpdateOneUpSessionActive"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateOneUpSessionActive:](self, "_setNeedsUpdateOneUpSessionActive:", 0);
    -[PUAggregateDictionaryBrowsingViewModelTracer _viewingContexts](self, "_viewingContexts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      v4 = -[PUAggregateDictionaryBrowsingViewModelTracer _isApplicationActive](self, "_isApplicationActive");
    else
      v4 = 0;

    -[PUAggregateDictionaryBrowsingViewModelTracer _setOneUpSessionActive:](self, "_setOneUpSessionActive:", v4);
  }
}

- (void)_invalidateViewedAsset
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateViewedAsset:](self, "_setNeedsUpdateViewedAsset:", 1);
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateViewedAssetIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateViewedAsset](self, "_needsUpdateViewedAsset"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateViewedAsset:](self, "_setNeedsUpdateViewedAsset:", 0);
    if (-[PUAggregateDictionaryBrowsingViewModelTracer _oneUpSessionActive](self, "_oneUpSessionActive"))
    {
      -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentAssetReference");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asset");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    -[PUAggregateDictionaryBrowsingViewModelTracer _setViewedAsset:](self, "_setViewedAsset:", v5);

  }
}

- (void)_invalidateViewedAssetLongEnough
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateViewedAssetLongEnough:](self, "_setNeedsUpdateViewedAssetLongEnough:", 1);
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateViewedAssetLongEnoughIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BOOL8 v8;

  if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdateViewedAssetLongEnough](self, "_needsUpdateViewedAssetLongEnough"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdateViewedAssetLongEnough:](self, "_setNeedsUpdateViewedAssetLongEnough:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAssetStartTime](self, "_viewedAssetStartTime");
    v6 = v5;
    -[PUAggregateDictionaryBrowsingViewModelTracer _viewedAsset](self, "_viewedAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v4 - v6 < 0.0 || v4 - v6 > 1.0;
    else
      v8 = 0;

    -[PUAggregateDictionaryBrowsingViewModelTracer _setViewedAssetLongEnough:](self, "_setViewedAssetLongEnough:", v8);
  }
}

- (void)_invalidatePlayingVideo
{
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdatePlayingVideo:](self, "_setNeedsUpdatePlayingVideo:", 1);
  -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePlayingVideoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (-[PUAggregateDictionaryBrowsingViewModelTracer _needsUpdatePlayingVideo](self, "_needsUpdatePlayingVideo"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setNeedsUpdatePlayingVideo:](self, "_setNeedsUpdatePlayingVideo:", 0);
    -[PUAggregateDictionaryBrowsingViewModelTracer browsingViewModel](self, "browsingViewModel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentAssetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetViewModelForAssetReference:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "desiredPlayState") == 4 && objc_msgSend(v5, "isActivated"))
    {
      objc_msgSend(v5, "playerItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isFileURL");

        if ((v9 & 1) == 0)
        {
          v10 = objc_msgSend(v5, "playState") == 3;
          v11 = objc_msgSend(v5, "isStalled");
          v12 = 1;
          v13 = 1;
LABEL_10:
          -[PUAggregateDictionaryBrowsingViewModelTracer _setPlayingVideo:](self, "_setPlayingVideo:", v12);
          -[PUAggregateDictionaryBrowsingViewModelTracer _setPlayingStreamedVideo:](self, "_setPlayingStreamedVideo:", v13);
          -[PUAggregateDictionaryBrowsingViewModelTracer _setStreamedVideoActuallyPlaying:](self, "_setStreamedVideoActuallyPlaying:", v10);
          -[PUAggregateDictionaryBrowsingViewModelTracer _setStreamedVideoStalled:](self, "_setStreamedVideoStalled:", v11);

          return;
        }
      }
      else
      {

      }
      v10 = 0;
      v13 = 0;
      v11 = 0;
      v12 = 1;
      goto LABEL_10;
    }
    v10 = 0;
    v12 = 0;
    v13 = 0;
    v11 = 0;
    goto LABEL_10;
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "currentAssetDidChange"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _scheduleCurrentAssetChange](self, "_scheduleCurrentAssetChange");
    -[PUAggregateDictionaryBrowsingViewModelTracer _setPlayingVideo:](self, "_setPlayingVideo:", 0);
    -[PUAggregateDictionaryBrowsingViewModelTracer _setPlayingStreamedVideo:](self, "_setPlayingStreamedVideo:", 0);
    -[PUAggregateDictionaryBrowsingViewModelTracer _setStreamedVideoActuallyPlaying:](self, "_setStreamedVideoActuallyPlaying:", 0);
    -[PUAggregateDictionaryBrowsingViewModelTracer _setStreamedVideoStalled:](self, "_setStreamedVideoStalled:", 0);
  }
  else
  {
    objc_msgSend(v7, "assetViewModelChangesByAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    objc_msgSend(v6, "currentAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "videoPlayerChange");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "desiredPlayStateDidChange") & 1) != 0
            || (objc_msgSend(v17, "playerItemDidChange") & 1) != 0
            || (objc_msgSend(v17, "playStateDidChange") & 1) != 0
            || (objc_msgSend(v17, "isActivatedDidChange") & 1) != 0
            || objc_msgSend(v17, "isStalledDidChange"))
          {
            v19[0] = v15;
            v19[1] = 3221225472;
            v19[2] = __68__PUAggregateDictionaryBrowsingViewModelTracer_viewModel_didChange___block_invoke;
            v19[3] = &unk_1E58ABD10;
            v19[4] = self;
            -[PUAggregateDictionaryBrowsingViewModelTracer performChanges:](self, "performChanges:", v19);
          }

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v6 = v18;
  }

}

- (void)_scheduleCurrentAssetChange
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[PUAggregateDictionaryBrowsingViewModelTracer _didScheduleCurrentAssetChange](self, "_didScheduleCurrentAssetChange"))
  {
    -[PUAggregateDictionaryBrowsingViewModelTracer _setDidScheduleCurrentAssetChange:](self, "_setDidScheduleCurrentAssetChange:", 1);
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 200000000);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__PUAggregateDictionaryBrowsingViewModelTracer__scheduleCurrentAssetChange__block_invoke;
    v4[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_handleScheduledCurrentAssetChange
{
  _QWORD v3[5];

  -[PUAggregateDictionaryBrowsingViewModelTracer _setDidScheduleCurrentAssetChange:](self, "_setDidScheduleCurrentAssetChange:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__PUAggregateDictionaryBrowsingViewModelTracer__handleScheduledCurrentAssetChange__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUAggregateDictionaryBrowsingViewModelTracer performChanges:](self, "performChanges:", v3);
}

- (PUBrowsingViewModel)browsingViewModel
{
  return (PUBrowsingViewModel *)objc_loadWeakRetained((id *)&self->_browsingViewModel);
}

- (NSHashTable)_viewingContexts
{
  return self->__viewingContexts;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingUpdate
{
  return self->__isPerformingUpdate;
}

- (void)_setPerformingUpdate:(BOOL)a3
{
  self->__isPerformingUpdate = a3;
}

- (BOOL)_needsUpdateViewedAsset
{
  return self->__needsUpdateViewedAsset;
}

- (void)_setNeedsUpdateViewedAsset:(BOOL)a3
{
  self->__needsUpdateViewedAsset = a3;
}

- (BOOL)_needsUpdateViewedAssetLongEnough
{
  return self->__needsUpdateViewedAssetLongEnough;
}

- (void)_setNeedsUpdateViewedAssetLongEnough:(BOOL)a3
{
  self->__needsUpdateViewedAssetLongEnough = a3;
}

- (BOOL)_needsUpdatePlayingVideo
{
  return self->__needsUpdatePlayingVideo;
}

- (void)_setNeedsUpdatePlayingVideo:(BOOL)a3
{
  self->__needsUpdatePlayingVideo = a3;
}

- (BOOL)_didScheduleCurrentAssetChange
{
  return self->__didScheduleCurrentAssetChange;
}

- (void)_setDidScheduleCurrentAssetChange:(BOOL)a3
{
  self->__didScheduleCurrentAssetChange = a3;
}

- (BOOL)_isApplicationActive
{
  return self->__isApplicationActive;
}

- (PUDisplayAsset)_viewedAsset
{
  return self->__viewedAsset;
}

- (double)_viewedAssetStartTime
{
  return self->__viewedAssetStartTime;
}

- (void)_setViewedAssetStartTime:(double)a3
{
  self->__viewedAssetStartTime = a3;
}

- (BOOL)_viewedAssetLongEnough
{
  return self->__viewedAssetLongEnough;
}

- (BOOL)_didScheduleViewUpdate
{
  return self->__didScheduleViewUpdate;
}

- (void)_setDidScheduleViewUpdate:(BOOL)a3
{
  self->__didScheduleViewUpdate = a3;
}

- (BOOL)_isPlayingVideo
{
  return self->__isPlayingVideo;
}

- (BOOL)_isPlayingStreamedVideo
{
  return self->__isPlayingStreamedVideo;
}

- (BOOL)_isStreamedVideoActuallyPlaying
{
  return self->__isStreamedVideoActuallyPlaying;
}

- (BOOL)_isStreamedVideoStalled
{
  return self->__isStreamedVideoStalled;
}

- (BOOL)_needsUpdateOneUpSessionActive
{
  return self->__needsUpdateOneUpSessionActive;
}

- (void)_setNeedsUpdateOneUpSessionActive:(BOOL)a3
{
  self->__needsUpdateOneUpSessionActive = a3;
}

- (BOOL)_oneUpSessionActive
{
  return self->__oneUpSessionActive;
}

- (double)_oneUpSessionStartTime
{
  return self->__oneUpSessionStartTime;
}

- (void)_setOneUpSessionStartTime:(double)a3
{
  self->__oneUpSessionStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewedAsset, 0);
  objc_storeStrong((id *)&self->__viewingContexts, 0);
  objc_destroyWeak((id *)&self->_browsingViewModel);
}

uint64_t __82__PUAggregateDictionaryBrowsingViewModelTracer__handleScheduledCurrentAssetChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewedAsset");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayingVideo");
}

void __75__PUAggregateDictionaryBrowsingViewModelTracer__scheduleCurrentAssetChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledCurrentAssetChange");

}

uint64_t __68__PUAggregateDictionaryBrowsingViewModelTracer_viewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayingVideo");
}

uint64_t __74__PUAggregateDictionaryBrowsingViewModelTracer__handleScheduledViewUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateViewedAssetLongEnough");
}

void __67__PUAggregateDictionaryBrowsingViewModelTracer__scheduleViewUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledViewUpdate");

}

uint64_t __70__PUAggregateDictionaryBrowsingViewModelTracer__setApplicationActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOneUpSessionActive");
}

@end
