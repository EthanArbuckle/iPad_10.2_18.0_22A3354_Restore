@implementation PUPlayPauseBarItemsController

- (PUPlayPauseBarItemsController)initWithViewModel:(id)a3
{
  id v5;
  PUPlayPauseBarItemsController *v6;
  PUPlayPauseBarItemsController *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *observerQueue;
  uint64_t v10;
  NSHashTable *changeObservers;
  _QWORD v13[4];
  PUPlayPauseBarItemsController *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUPlayPauseBarItemsController;
  v6 = -[PUPlayPauseBarItemsController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v8 = dispatch_queue_create("com.apple.photos.playpausebaritemscontroller.observer-queue", 0);
    observerQueue = v7->__observerQueue;
    v7->__observerQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    changeObservers = v7->__changeObservers;
    v7->__changeObservers = (NSHashTable *)v10;

    -[PUBrowsingViewModel registerChangeObserver:](v7->_viewModel, "registerChangeObserver:", v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__PUPlayPauseBarItemsController_initWithViewModel___block_invoke;
    v13[3] = &unk_1E58ABD10;
    v14 = v7;
    -[PUPlayPauseBarItemsController _performChanges:](v14, "_performChanges:", v13);

  }
  return v7;
}

- (PUPlayPauseBarItemsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 73, CFSTR("%s is not available as initializer"), "-[PUPlayPauseBarItemsController init]");

  abort();
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PUPlayPauseBarItemsController _observerQueue](self, "_observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUPlayPauseBarItemsController_registerChangeObserver___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PUPlayPauseBarItemsController _observerQueue](self, "_observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PUPlayPauseBarItemsController_unregisterChangeObserver___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *videoPlayer;
  PUBrowsingVideoPlayer *v6;

  v6 = (PUBrowsingVideoPlayer *)a3;
  -[PUPlayPauseBarItemsController _assertInsideUpdate](self, "_assertInsideUpdate");
  videoPlayer = self->__videoPlayer;
  if (videoPlayer != v6)
  {
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](videoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](self->__videoPlayer, "registerChangeObserver:", self);
    -[PUPlayPauseBarItemsController _invalidatePlayPauseState](self, "_invalidatePlayPauseState");
    -[PUPlayPauseBarItemsController _invalidateAVPlayer](self, "_invalidateAVPlayer");
  }

}

- (void)_setPlayPauseState:(int64_t)a3
{
  id v5;

  -[PUPlayPauseBarItemsController _assertInsideUpdate](self, "_assertInsideUpdate");
  if (self->_playPauseState != a3)
  {
    self->_playPauseState = a3;
    -[PUPlayPauseBarItemsController _currentChange](self, "_currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPlayPauseStateDidChange:", 1);

  }
}

- (void)_setAVPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;

  v5 = (ISWrappedAVPlayer *)a3;
  -[PUPlayPauseBarItemsController _assertInsideUpdate](self, "_assertInsideUpdate");
  if (self->__avPlayer != v5)
  {
    -[PUPlayPauseBarItemsController _stopObservingAVPlayer](self, "_stopObservingAVPlayer");
    objc_storeStrong((id *)&self->__avPlayer, a3);
    -[PUPlayPauseBarItemsController _startObservingAVPlayer](self, "_startObservingAVPlayer");
    -[PUPlayPauseBarItemsController _invalidateCurrentPlaybackTimeAndDuration](self, "_invalidateCurrentPlaybackTimeAndDuration");
  }

}

- (void)_startObservingAVPlayer
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  CMTime v13;
  id location;

  -[PUPlayPauseBarItemsController _timeObservationToken](self, "_timeObservationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self _timeObservationToken]"));

  }
  -[PUPlayPauseBarItemsController _avPlayer](self, "_avPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    -[PUPlayPauseBarItemsController _avPlayer](self, "_avPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v13, 1, 30);
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke;
    v11[3] = &unk_1E58A6CE8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPlayPauseBarItemsController _setTimeObservationToken:](self, "_setTimeObservationToken:", v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_stopObservingAVPlayer
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUPlayPauseBarItemsController _timeObservationToken](self, "_timeObservationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    -[PUPlayPauseBarItemsController _avPlayer](self, "_avPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avPlayer"));

    }
    objc_msgSend(v5, "removeTimeObserver:", v7);
    -[PUPlayPauseBarItemsController _setTimeObservationToken:](self, "_setTimeObservationToken:", 0);

    v4 = v7;
  }

}

- (void)_setCurrentPlaybackTime:(id *)a3
{
  __int128 v5;
  void *v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime;
  CMTime time1;

  -[PUPlayPauseBarItemsController _assertInsideUpdate](self, "_assertInsideUpdate");
  time1 = *(CMTime *)a3;
  currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_currentPlaybackTime.epoch = a3->var3;
    *(_OWORD *)&self->_currentPlaybackTime.value = v5;
    -[PUPlayPauseBarItemsController _currentChange](self, "_currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setCurrentPlaybackTimeDidChange:", 1);

  }
}

- (void)_setPlaybackDuration:(id *)a3
{
  __int128 v5;
  void *v6;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration;
  CMTime time1;

  -[PUPlayPauseBarItemsController _assertInsideUpdate](self, "_assertInsideUpdate");
  time1 = *(CMTime *)a3;
  playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_playbackDuration.epoch = a3->var3;
    *(_OWORD *)&self->_playbackDuration.value = v5;
    -[PUPlayPauseBarItemsController _currentChange](self, "_currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setPlaybackDurationDidChange:", 1);

  }
}

- (PUPlayPauseBarItemsControllerChange)_currentChange
{
  PUPlayPauseBarItemsControllerChange *currentChange;
  PUPlayPauseBarItemsControllerChange *v4;
  PUPlayPauseBarItemsControllerChange *v5;

  currentChange = self->__currentChange;
  if (!currentChange)
  {
    v4 = objc_alloc_init(PUPlayPauseBarItemsControllerChange);
    v5 = self->__currentChange;
    self->__currentChange = v4;

    currentChange = self->__currentChange;
  }
  return currentChange;
}

- (void)_publishChanges
{
  PUPlayPauseBarItemsControllerChange *v3;
  PUPlayPauseBarItemsControllerChange *currentChange;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = self->__currentChange;
  currentChange = self->__currentChange;
  self->__currentChange = 0;

  if (-[PUPlayPauseBarItemsControllerChange hasChanges](v3, "hasChanges"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__75732;
    v19 = __Block_byref_object_dispose__75733;
    v20 = 0;
    -[PUPlayPauseBarItemsController _observerQueue](self, "_observerQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PUPlayPauseBarItemsController__publishChanges__block_invoke;
    block[3] = &unk_1E58AAE48;
    block[4] = self;
    block[5] = &v15;
    dispatch_sync(v5, block);

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (id)v16[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "playPauseBarItemsController:didChange:", self, v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }

}

- (void)_assertInsideChangeBlock
{
  id v4;

  if (!-[PUPlayPauseBarItemsController _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 200, CFSTR("not within a change block"));

  }
}

- (void)_assertInsideUpdate
{
  id v4;

  if (!-[PUPlayPauseBarItemsController _isUpdating](self, "_isUpdating"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 205, CFSTR("not within update"));

  }
}

- (void)_performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUPlayPauseBarItemsController _isPerformingChanges](self, "_isPerformingChanges");
  -[PUPlayPauseBarItemsController _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v4[2](v4);

  -[PUPlayPauseBarItemsController _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
  {
    -[PUPlayPauseBarItemsController _updateIfNeeded](self, "_updateIfNeeded");
    -[PUPlayPauseBarItemsController _publishChanges](self, "_publishChanges");
  }
}

- (void)_updateIfNeeded
{
  _BOOL8 v4;
  id v5;

  if (-[PUPlayPauseBarItemsController _needsUpdate](self, "_needsUpdate"))
  {
    v4 = -[PUPlayPauseBarItemsController _isUpdating](self, "_isUpdating");
    -[PUPlayPauseBarItemsController _setUpdating:](self, "_setUpdating:", 1);
    -[PUPlayPauseBarItemsController _updateVideoPlayerIfNeeded](self, "_updateVideoPlayerIfNeeded");
    -[PUPlayPauseBarItemsController _updatePlayPauseStateIfNeeded](self, "_updatePlayPauseStateIfNeeded");
    -[PUPlayPauseBarItemsController _updateAVPlayerIfNeeded](self, "_updateAVPlayerIfNeeded");
    -[PUPlayPauseBarItemsController _updateCurrentPlaybackTimeAndDurationIfNeeded](self, "_updateCurrentPlaybackTimeAndDurationIfNeeded");
    -[PUPlayPauseBarItemsController _setUpdating:](self, "_setUpdating:", v4);
    if (-[PUPlayPauseBarItemsController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 234, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUPlayPauseBarItemsController _needsUpdateVideoPlayer](self, "_needsUpdateVideoPlayer")
      || -[PUPlayPauseBarItemsController _needsUpdatePlayPauseState](self, "_needsUpdatePlayPauseState")
      || -[PUPlayPauseBarItemsController _needsUpdateAVPlayer](self, "_needsUpdateAVPlayer")
      || -[PUPlayPauseBarItemsController _needsUpdateCurrentPlaybackTimeAndDuration](self, "_needsUpdateCurrentPlaybackTimeAndDuration");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!-[PUPlayPauseBarItemsController _isUpdating](self, "_isUpdating")
    && !-[PUPlayPauseBarItemsController _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayPauseBarItemsController.m"), 247, CFSTR("not within a change block or update"));

  }
}

- (void)_invalidateVideoPlayer
{
  -[PUPlayPauseBarItemsController _setNeedsUpdateVideoPlayer:](self, "_setNeedsUpdateVideoPlayer:", 1);
  -[PUPlayPauseBarItemsController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateVideoPlayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PUPlayPauseBarItemsController _needsUpdateVideoPlayer](self, "_needsUpdateVideoPlayer"))
  {
    -[PUPlayPauseBarItemsController _setNeedsUpdateVideoPlayer:](self, "_setNeedsUpdateVideoPlayer:", 0);
    -[PUPlayPauseBarItemsController viewModel](self, "viewModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentAssetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetViewModelForAssetReference:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPlayPauseBarItemsController _setVideoPlayer:](self, "_setVideoPlayer:", v5);

  }
}

- (void)_invalidatePlayPauseState
{
  -[PUPlayPauseBarItemsController _setNeedsUpdatePlayPauseState:](self, "_setNeedsUpdatePlayPauseState:", 1);
  -[PUPlayPauseBarItemsController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePlayPauseStateIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  if (-[PUPlayPauseBarItemsController _needsUpdatePlayPauseState](self, "_needsUpdatePlayPauseState"))
  {
    -[PUPlayPauseBarItemsController _setNeedsUpdatePlayPauseState:](self, "_setNeedsUpdatePlayPauseState:", 0);
    -[PUPlayPauseBarItemsController _videoPlayer](self, "_videoPlayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "desiredPlayState");
    if (v3 >= 3)
    {
      if (v3 - 3 > 1)
      {
        v4 = 0;
        goto LABEL_11;
      }
      if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
      {
        if (objc_msgSend(v5, "playState") == 5)
          v4 = 2;
        else
          v4 = 1;
        goto LABEL_11;
      }
    }
    v4 = 2;
LABEL_11:
    -[PUPlayPauseBarItemsController _setPlayPauseState:](self, "_setPlayPauseState:", v4);

  }
}

- (void)_invalidateAVPlayer
{
  -[PUPlayPauseBarItemsController _setNeedsUpdateAVPlayer:](self, "_setNeedsUpdateAVPlayer:", 1);
  -[PUPlayPauseBarItemsController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateAVPlayerIfNeeded
{
  void *v3;
  id v4;

  if (-[PUPlayPauseBarItemsController _needsUpdateAVPlayer](self, "_needsUpdateAVPlayer"))
  {
    -[PUPlayPauseBarItemsController _setNeedsUpdateAVPlayer:](self, "_setNeedsUpdateAVPlayer:", 0);
    -[PUPlayPauseBarItemsController _videoPlayer](self, "_videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUPlayPauseBarItemsController _setAVPlayer:](self, "_setAVPlayer:", v4);
  }
}

- (void)_invalidateCurrentPlaybackTimeAndDuration
{
  -[PUPlayPauseBarItemsController _setNeedsUpdateCurrentPlaybackTimeAndDuration:](self, "_setNeedsUpdateCurrentPlaybackTimeAndDuration:", 1);
  -[PUPlayPauseBarItemsController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateCurrentPlaybackTimeAndDurationIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  if (-[PUPlayPauseBarItemsController _needsUpdateCurrentPlaybackTimeAndDuration](self, "_needsUpdateCurrentPlaybackTimeAndDuration"))
  {
    -[PUPlayPauseBarItemsController _setNeedsUpdateCurrentPlaybackTimeAndDuration:](self, "_setNeedsUpdateCurrentPlaybackTimeAndDuration:", 0);
    v11 = *MEMORY[0x1E0CA2E18];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v9 = v11;
    v10 = v12;
    -[PUPlayPauseBarItemsController _videoPlayer](self, "_videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isActivated");

    -[PUPlayPauseBarItemsController _avPlayer](self, "_avPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (v5)
      {
        objc_msgSend(v5, "currentTime");
        objc_msgSend(v6, "currentItemDuration");
      }
    }
    v7 = v11;
    v8 = v12;
    -[PUPlayPauseBarItemsController _setCurrentPlaybackTime:](self, "_setCurrentPlaybackTime:", &v7);
    v7 = v9;
    v8 = v10;
    -[PUPlayPauseBarItemsController _setPlaybackDuration:](self, "_setPlaybackDuration:", &v7);

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUPlayPauseBarItemsController viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUPlayPauseBarItemsController _handleViewModel:didChange:](self, "_handleViewModel:didChange:", v9, v6);
  }
  else
  {
    -[PUPlayPauseBarItemsController _videoPlayer](self, "_videoPlayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUPlayPauseBarItemsController _handleVideoPlayer:didChange:](self, "_handleVideoPlayer:didChange:", v9, v6);
  }

}

- (void)_handleViewModel:(id)a3 didChange:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  _QWORD v9[5];

  v5 = a4;
  objc_msgSend(v5, "assetViewModelChangesByAssetReference");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PFExists();

  LOBYTE(v6) = objc_msgSend(v5, "currentAssetDidChange");
  if ((v6 & 1) != 0 || v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_3;
    v9[3] = &unk_1E58ABD10;
    v9[4] = self;
    -[PUPlayPauseBarItemsController _performChanges:](self, "_performChanges:", v9);
  }
}

- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PUPlayPauseBarItemsController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PUPlayPauseBarItemsController__handleVideoPlayer_didChange___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PUPlayPauseBarItemsController _performChanges:](self, "_performChanges:", v7);

}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)playPauseState
{
  return self->_playPauseState;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_needsUpdateVideoPlayer
{
  return self->__needsUpdateVideoPlayer;
}

- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3
{
  self->__needsUpdateVideoPlayer = a3;
}

- (BOOL)_needsUpdatePlayPauseState
{
  return self->__needsUpdatePlayPauseState;
}

- (void)_setNeedsUpdatePlayPauseState:(BOOL)a3
{
  self->__needsUpdatePlayPauseState = a3;
}

- (BOOL)_needsUpdateAVPlayer
{
  return self->__needsUpdateAVPlayer;
}

- (void)_setNeedsUpdateAVPlayer:(BOOL)a3
{
  self->__needsUpdateAVPlayer = a3;
}

- (BOOL)_needsUpdateCurrentPlaybackTimeAndDuration
{
  return self->__needsUpdateCurrentPlaybackTimeAndDuration;
}

- (void)_setNeedsUpdateCurrentPlaybackTimeAndDuration:(BOOL)a3
{
  self->__needsUpdateCurrentPlaybackTimeAndDuration = a3;
}

- (PUBrowsingVideoPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (ISWrappedAVPlayer)_avPlayer
{
  return self->__avPlayer;
}

- (id)_timeObservationToken
{
  return self->__timeObservationToken;
}

- (void)_setTimeObservationToken:(id)a3
{
  objc_storeStrong(&self->__timeObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__timeObservationToken, 0);
  objc_storeStrong((id *)&self->__avPlayer, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->__observerQueue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->__currentChange, 0);
}

uint64_t __62__PUPlayPauseBarItemsController__handleVideoPlayer_didChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isActivatedDidChange") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "desiredPlayStateDidChange") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "playStateDidChange"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidatePlayPauseState");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "avPlayerDidChange"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateAVPlayer");
  if ((objc_msgSend(*(id *)(a1 + 32), "isActivatedDidChange") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "playerItemDidChange"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidateCurrentPlaybackTimeAndDuration");
  }
  result = objc_msgSend(*(id *)(a1 + 32), "isAtEndDidChange");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_invalidatePlayPauseState");
  return result;
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayer");
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke()
{
  return PFExists();
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "videoPlayerDidChange");
}

void __48__PUPlayPauseBarItemsController__publishChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke_2;
  v2[3] = &unk_1E58ABD10;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_performChanges:", v2);

}

uint64_t __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentPlaybackTimeAndDuration");
}

void __58__PUPlayPauseBarItemsController_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __56__PUPlayPauseBarItemsController_registerChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __51__PUPlayPauseBarItemsController_initWithViewModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayer");
}

@end
