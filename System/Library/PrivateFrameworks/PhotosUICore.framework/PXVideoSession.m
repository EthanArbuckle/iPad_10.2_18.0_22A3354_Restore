@implementation PXVideoSession

- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5
{
  return -[PXVideoSession initWithContentProvider:videoPlayer:resourceReclamationController:playerCreationDelay:](self, "initWithContentProvider:videoPlayer:resourceReclamationController:playerCreationDelay:", a3, a4, a5, 0.0);
}

- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5 playerCreationDelay:(double)a6
{
  id v11;
  id v12;
  id v13;
  PXVideoSession *v14;
  PXVideoSession *v15;
  PXPhotosensitivityProcessing *v16;
  PXPhotosensitivityProcessing *photoSensitivityProcessing;
  PXVideoPlaybackReporter *v18;
  void *v19;
  uint64_t v20;
  PXVideoPlaybackReporter *playbackReporter;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *videoWorkQueue;
  dispatch_queue_t v25;
  OS_dispatch_queue *stateQueue;
  dispatch_queue_t v27;
  OS_dispatch_queue *updateQueue;
  id v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  PXVideoSession *v37;
  char *v38;
  id v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  dispatch_queue_t v48;
  void *v49;
  NSObject *v50;
  char *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  char *v56;
  _QWORD v57[4];
  id v58;
  id location;
  _QWORD v60[4];
  char *v61;
  _QWORD v62[4];
  char *v63;
  id v64;
  double v65;
  _QWORD block[4];
  PXVideoSession *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v74.receiver = self;
  v74.super_class = (Class)PXVideoSession;
  v14 = -[PXVideoSession init](&v74, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v14->_updateQueue_updateFlags.isPerformingUpdate && (v14->_updateQueue_updateFlags.updated & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession initWithContentProvider:videoPlayer:resourceReclamationController:playerCreationDelay:]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("PXVideoSession.m"), 267, CFSTR("invalidating %lu after it already has been updated"), 4096);

      abort();
    }
    v14->_updateQueue_updateFlags.needsUpdate |= 0x1000uLL;
    v16 = objc_alloc_init(PXPhotosensitivityProcessing);
    photoSensitivityProcessing = v15->_photoSensitivityProcessing;
    v15->_photoSensitivityProcessing = v16;

    v18 = [PXVideoPlaybackReporter alloc];
    objc_msgSend(v11, "contentIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXVideoPlaybackReporter initWithIdentifier:CPAnalysticsEndpoint:](v18, "initWithIdentifier:CPAnalysticsEndpoint:", v19, 1);
    playbackReporter = v15->_playbackReporter;
    v15->_playbackReporter = (PXVideoPlaybackReporter *)v20;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.PXVideoSession.work", v22);
    videoWorkQueue = v15->_videoWorkQueue;
    v15->_videoWorkQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_create("com.apple.PXVideoSession.state", v22);
    stateQueue = v15->_stateQueue;
    v15->_stateQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_create("com.apple.PXVideoSession.update", v22);
    updateQueue = v15->_updateQueue;
    v15->_updateQueue = (OS_dispatch_queue *)v27;

    v29 = v13;
    if (!v13)
      v29 = objc_alloc_init(MEMORY[0x1E0D78238]);
    objc_storeStrong((id *)&v15->_resourceReclamationController, v29);
    if (!v13)

    -[PXAVResourceReclamationController registerObserver:](v15->_resourceReclamationController, "registerObserver:", v15);
    v30 = (void *)MEMORY[0x1E0CB37E8];
    do
      v31 = __ldaxr(&initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay__ivarQueueCounter);
    while (__stlxr(v31 + 1, &initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay__ivarQueueCounter));
    v32 = (void *)objc_msgSend(v30, "numberWithInt:");
    v15->_updateQueueIdentifier = v32;
    dispatch_queue_set_specific((dispatch_queue_t)v15->_updateQueue, (const void *)QueueIdentifierContext, v32, 0);
    objc_storeStrong((id *)&v15->_contentProvider, a3);
    v72 = 0u;
    v73 = 0u;
    v71 = 0u;
    -[PXVideoContentProvider loadingResult](v15->_contentProvider, "loadingResult");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "timeRange");
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v71 = 0u;
    }

    v35 = v15->_stateQueue;
    v36 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke;
    block[3] = &unk_1E513FD20;
    v37 = v15;
    v67 = v37;
    v68 = v71;
    v69 = v72;
    v70 = v73;
    dispatch_sync(v35, block);
    objc_msgSend(v11, "registerChangeObserver:context:", v37, VideoContentProviderObservationContext_256416);
    v62[0] = v36;
    v62[1] = 3221225472;
    v62[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_2;
    v62[3] = &unk_1E5144A98;
    v65 = a6;
    v38 = v37;
    v63 = v38;
    v39 = v12;
    v64 = v39;
    objc_msgSend(v38, "_performChanges:", v62);
    objc_msgSend(v38, "videoPlayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActionAtItemEnd:", 2);

    v41 = MEMORY[0x1E0C9BAA8];
    v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v38 + 488) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v38 + 504) = v42;
    *(_OWORD *)(v38 + 520) = *(_OWORD *)(v41 + 32);
    objc_msgSend(v38, "_loadAssetTracksIfNeeded");
    objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v38, sel__handlePlayerTimeAdvancementTimer_, 0, 1, 0.2);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v38 + 12);
    *((_QWORD *)v38 + 12) = v43;

    if ((objc_msgSend(v11, "mayContainAudio") & 1) != 0)
    {
      objc_msgSend(v11, "audioSession");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v11, "audioSession");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "registerVolumeObserver:", v38);
        objc_msgSend(v39, "setWrappedAudioSession:", v46);
        v38[712] = 1;

      }
      else
      {
        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = dispatch_queue_create("com.apple.PXVideoSession.audioSession", v47);
        v49 = (void *)*((_QWORD *)v38 + 15);
        *((_QWORD *)v38 + 15) = v48;

        v50 = v15->_stateQueue;
        v60[0] = v36;
        v60[1] = 3221225472;
        v60[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_3;
        v60[3] = &unk_1E5149198;
        v51 = v38;
        v61 = v51;
        dispatch_sync(v50, v60);
        objc_initWeak(&location, v51);
        v52 = *((_QWORD *)v38 + 15);
        v57[0] = v36;
        v57[1] = 3221225472;
        v57[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_4;
        v57[3] = &unk_1E5148D30;
        objc_copyWeak(&v58, &location);
        dispatch_async(v52, v57);
        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      v38[712] = 1;
    }
    v56 = v38;
    px_dispatch_on_main_queue();

  }
  return v15;
}

- (PXVideoSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 354, CFSTR("%s is not available as initializer"), "-[PXVideoSession init]");

  abort();
}

- (id)_stateQueue_newPresentationStateFromCurrentWithPresenter:(void *)a3
{
  _PXVideoSessionPresentationState *v5;
  __int128 v6;
  double v7;
  _OWORD v9[3];

  v5 = objc_alloc_init(_PXVideoSessionPresentationState);
  -[_PXVideoSessionPresentationState setPresenter:](v5, "setPresenter:", a3);
  -[_PXVideoSessionPresentationState setLoopingEnabled:](v5, "setLoopingEnabled:", self->_stateQueue_isLoopingEnabled);
  v6 = *(_OWORD *)&self->_stateQueue_playbackTimeRange.start.flags;
  v9[0] = *(_OWORD *)(&self->_stateQueue_isLoopingEnabled + 2);
  v9[1] = v6;
  v9[2] = *(_OWORD *)((char *)&self->_stateQueue_playbackTimeRange.duration.value + 4);
  -[_PXVideoSessionPresentationState setPlaybackTimeRange:](v5, "setPlaybackTimeRange:", v9);
  LODWORD(v7) = HIDWORD(self->_stateQueue_playbackStartTime.epoch);
  -[_PXVideoSessionPresentationState setVolume:withFade:](v5, "setVolume:withFade:", LOBYTE(self->_stateQueue_volume), v7);
  -[_PXVideoSessionPresentationState setSeekToBeginningAtEnd:](v5, "setSeekToBeginningAtEnd:", BYTE1(self->_stateQueue_volume));
  -[_PXVideoSessionPresentationState setDesiredPlayState:](v5, "setDesiredPlayState:", self->_stateQueue_desiredPlayState);
  -[_PXVideoSessionPresentationState setShouldDisableAutomaticPixelBufferUpdates:](v5, "setShouldDisableAutomaticPixelBufferUpdates:", self->_stateQueue_shouldDisableAutomaticPixelBufferUpdates);
  -[_PXVideoSessionPresentationState setDesiredPlaybackRate:](v5, "setDesiredPlaybackRate:", self->_stateQueue_desiredPlaybackRate);
  -[_PXVideoSessionPresentationState setAudioSessionCategory:mode:routeSharingPolicy:options:](v5, "setAudioSessionCategory:mode:routeSharingPolicy:options:", self->_stateQueue_audioSessionCategory, self->_stateQueue_audioSessionMode, self->_stateQueue_audioSessionRouteSharingPolicy, self->_stateQueue_audioSessionCategoryOptions);
  return v5;
}

- (void)enterPresentationContext:(int64_t)a3 presenter:(void *)a4
{
  NSObject *stateQueue;
  _QWORD v6[8];

  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXVideoSession_enterPresentationContext_presenter___block_invoke;
  v6[3] = &unk_1E51446C8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a2;
  dispatch_sync(stateQueue, v6);
  -[PXVideoSession _updateFromCurrentPresentationState](self, "_updateFromCurrentPresentationState");
}

- (void)leavePresentationContext:(int64_t)a3 presenter:(void *)a4
{
  NSObject *stateQueue;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXVideoSession_leavePresentationContext_presenter___block_invoke;
  v6[3] = &unk_1E513FD48;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  if (*((_BYTE *)v8 + 24))
    -[PXVideoSession _updateFromCurrentPresentationState](self, "_updateFromCurrentPresentationState");
  _Block_object_dispose(&v7, 8);
}

- (void)performChanges:(id)a3 withPresentationContext:(int64_t)a4 presenter:(void *)a5
{
  id v8;
  NSObject *stateQueue;
  uint64_t v10;
  NSObject *updateQueue;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  _QWORD block[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__256351;
  v23 = __Block_byref_object_dispose__256352;
  v24 = 0;
  stateQueue = self->_stateQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke;
  block[3] = &unk_1E513FD48;
  block[6] = a4;
  block[7] = a5;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(stateQueue, block);
  if (v20[5])
  {
    updateQueue = self->_updateQueue;
    v12 = v10;
    v13 = 3221225472;
    v14 = __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke_2;
    v15 = &unk_1E5149038;
    v16 = v8;
    v17 = &v19;
    dispatch_async(updateQueue, &v12);
    -[PXVideoSession _updateFromCurrentPresentationState](self, "_updateFromCurrentPresentationState", v12, v13, v14, v15);

  }
  _Block_object_dispose(&v19, 8);

}

- (id)performFinalCleanup
{
  void *v3;
  NSObject *audioSessionQueue;
  id v5;
  NSTimer *playerTimeAdvancementTimer;
  ISWrappedAVPlayer *v7;
  id stateQueue_playbackTimeRangeEndBoundaryObserver;
  ISWrappedAVPlayer *stateQueue_videoPlayer;
  _QWORD block[4];
  id v12;

  if (-[PXVideoPlaybackReporter state](self->_playbackReporter, "state") == 1)
    -[PXVideoPlaybackReporter reportPlaybackAbandoned](self->_playbackReporter, "reportPlaybackAbandoned");
  if (self->_audioSessionQueue)
  {
    -[PXVideoSession audioSession](self, "audioSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    audioSessionQueue = self->_audioSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PXVideoSession_performFinalCleanup__block_invoke;
    block[3] = &unk_1E5149198;
    v12 = v3;
    v5 = v3;
    dispatch_async(audioSessionQueue, block);

  }
  -[NSTimer invalidate](self->_playerTimeAdvancementTimer, "invalidate");
  playerTimeAdvancementTimer = self->_playerTimeAdvancementTimer;
  self->_playerTimeAdvancementTimer = 0;

  v7 = self->_stateQueue_videoPlayer;
  -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:](v7, "replaceCurrentItemWithPlayerItem:", 0);
  -[ISWrappedAVPlayer removeTimeObserver:](v7, "removeTimeObserver:", self->_stateQueue_playbackTimeRangeEndBoundaryObserver);
  -[ISWrappedAVPlayer unregisterChangeObserver:context:](v7, "unregisterChangeObserver:context:", self, VideoPlayerObservationContext);
  -[ISWrappedAVPlayer setDelegate:](v7, "setDelegate:", 0);
  stateQueue_playbackTimeRangeEndBoundaryObserver = self->_stateQueue_playbackTimeRangeEndBoundaryObserver;
  self->_stateQueue_playbackTimeRangeEndBoundaryObserver = 0;

  -[PXVideoSession _removeAllVideoOutputs](self, "_removeAllVideoOutputs");
  stateQueue_videoPlayer = self->_stateQueue_videoPlayer;
  self->_stateQueue_videoPlayer = 0;

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PXVideoSession _relinquishAny4k60StreamAllowance](self, "_relinquishAny4k60StreamAllowance");
  CVPixelBufferRelease(self->_stateQueue_currentPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXVideoSession;
  -[PXVideoSession dealloc](&v3, sel_dealloc);
}

- (void)prewarmVideoView
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  self->_isExpectingVideoView = 1;
  objc_initWeak(&location, self);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__PXVideoSession_prewarmVideoView__block_invoke;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "scheduleMainQueueTask:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_actuallyPrewarmVideoView
{
  NSMutableArray *v3;
  NSMutableArray *mainQueue_videoViewQueue;
  NSMutableArray *v5;
  id v6;

  if (!self->_mainQueue_videoViewQueue)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
    self->_mainQueue_videoViewQueue = v3;

    v5 = self->_mainQueue_videoViewQueue;
    -[PXVideoSession dequeueVideoView](self, "dequeueVideoView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v5, "addObject:", v6);

  }
}

- (id)dequeueVideoView
{
  NSMutableArray *mainQueue_videoViewQueue;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  id v7;

  mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
  if (!mainQueue_videoViewQueue)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_mainQueue_videoViewQueue;
    self->_mainQueue_videoViewQueue = v4;

    mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
  }
  -[NSMutableArray lastObject](mainQueue_videoViewQueue, "lastObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)v6;
    -[NSMutableArray removeLastObject](self->_mainQueue_videoViewQueue, "removeLastObject");
  }
  else
  {
    v7 = -[PXVideoSession _newVideoView](self, "_newVideoView");
  }
  return v7;
}

- (void)recycleVideoView:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (void)requestPixelBufferOutputWithRequestIdentifier:(id)a3 maxOutputSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *stateQueue;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  stateQueue = self->_stateQueue;
  v9 = MEMORY[0x1E0C809B0];
  v20 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke;
  block[3] = &unk_1E513FD70;
  block[4] = self;
  v10 = v7;
  v15 = width;
  v16 = height;
  v13 = v10;
  v14 = &v17;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v18 + 24))
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke_2;
    v11[3] = &unk_1E51479C8;
    v11[4] = self;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v11);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)cancelPixelBufferOutputWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *stateQueue;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  stateQueue = self->_stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  v15 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke;
  block[3] = &unk_1E513FD98;
  block[4] = self;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke_2;
    v8[3] = &unk_1E51479C8;
    v8[4] = self;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v8);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)setAudioSessionCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *stateQueue;
  id v13;
  id v14;
  NSObject *audioSessionQueue;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[3];
  id location;
  _QWORD block[4];
  id v22;
  PXVideoSession *v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  if (self->_audioSessionQueue)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke;
    block[3] = &unk_1E513FDC0;
    v13 = v10;
    v22 = v13;
    v23 = self;
    v26 = a6;
    v14 = v11;
    v27 = a5;
    v24 = v14;
    v25 = &v28;
    dispatch_sync(stateQueue, block);
    if (*((_BYTE *)v29 + 24))
    {
      -[PXVideoSession setUpdatingAudioSession:](self, "setUpdatingAudioSession:", 1);
      objc_initWeak(&location, self);
      audioSessionQueue = self->_audioSessionQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke_2;
      v16[3] = &unk_1E513FDE8;
      objc_copyWeak(v19, &location);
      v17 = v13;
      v18 = v14;
      v19[1] = (id)a5;
      v19[2] = (id)a6;
      dispatch_async(audioSessionQueue, v16);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v28, 8);
  }

}

- (void)_audioSessionQueue_updateAudioSessionWithCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  PXVideoSession *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  -[PXVideoSession audioSession](self, "audioSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  LOBYTE(a5) = objc_msgSend(v12, "setCategory:mode:routeSharingPolicy:options:error:", v11, v10, a5, a6, &v16);

  v13 = v16;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__PXVideoSession__audioSessionQueue_updateAudioSessionWithCategory_mode_routeSharingPolicy_options___block_invoke;
  v15[3] = &unk_1E51479C8;
  v15[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v15);
  if ((a5 & 1) == 0)
  {
    PLVideoPlaybackGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to update audio category on video session: %@\n\tError: %@", buf, 0x16u);
    }

  }
}

- (unint64_t)audioSessionCategoryOptions
{
  NSObject *stateQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXVideoSession_audioSessionCategoryOptions__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)audioSessionCategory
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PXVideoSession_audioSessionCategory__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)audioSessionMode
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_audioSessionMode__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (unint64_t)audioSessionRouteSharingPolicy
{
  NSObject *stateQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PXVideoSession_audioSessionRouteSharingPolicy__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadIfNeededWithPriority:(int64_t)a3
{
  void *v5;

  -[PXVideoSession contentProvider](self, "contentProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginLoadingWithPriority:", a3);

  -[PXVideoPlaybackReporter reportPlaybackRequestedWithPriority:](self->_playbackReporter, "reportPlaybackRequestedWithPriority:", a3);
}

- (void)cancelLoading
{
  id v2;

  -[PXVideoSession contentProvider](self, "contentProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelLoading");

}

- (CGImage)generateSnapshotImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  CGImage *v17;
  id v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  CMTime time;
  CMTime duration;
  CMTimeRange range;
  CMTime v27;
  CGImage *v28;
  CMTime start;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  memset(&v27, 0, sizeof(v27));
  if (v3)
    objc_msgSend(v3, "currentTime");
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "duration");
    v8 = (__int128 *)MEMORY[0x1E0CA2E68];
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&range, &start, &duration);
    time = v27;
    CMTimeClampToRange(&start, &time, &range);
    v27 = start;
    objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAppliesPreferredTrackTransform:", 1);
    v22 = *v8;
    v23 = *((_QWORD *)v8 + 2);
    objc_msgSend(v9, "setRequestedTimeToleranceAfter:", &v22);
    v20 = *v8;
    v21 = *((_QWORD *)v8 + 2);
    objc_msgSend(v9, "setRequestedTimeToleranceBefore:", &v20);
    objc_msgSend(v5, "videoComposition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoComposition:", v10);

    objc_msgSend(v9, "customVideoCompositor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("NUVideoPlaybackCompositor"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "customVideoCompositor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLabel:", CFSTR("PXVideoSession-generateSnapshotImage"));

    }
    v19 = 0;
    start = v27;
    v14 = objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v9, &start, 0, &v19);
    v15 = v19;
    v28 = (CGImage *)v14;
    if (!v14)
    {
      PLVideoPlaybackGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(start.value) = 136315650;
        *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)"-[PXVideoSession generateSnapshotImage]";
        LOWORD(start.flags) = 2112;
        *(_QWORD *)((char *)&start.flags + 2) = self;
        HIWORD(start.epoch) = 2112;
        v30 = v15;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "%s Unable to generate snapshot for video session:\n%@\nError:%@", (uint8_t *)&start, 0x20u);
      }

    }
    PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround();

    v17 = v28;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)seekToTime:(id *)a3 completionHandler:(id)a4
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v4 = v6;
  v5 = v7;
  -[PXVideoSession seekToTime:toleranceBefore:toleranceAfter:completionHandler:](self, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, a4);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = 3221225472;
  v16[2] = __78__PXVideoSession_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v16[3] = &unk_1E513FE10;
  v17 = v10;
  v15 = *a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v14 = *a4;
  v13 = *a5;
  v12 = v10;
  objc_msgSend(v11, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v15, &v14, &v13, v16);

}

- (void)seekToExactTime:(id *)a3 updatePixelBuffer:(BOOL)a4 waitUntilComplete:(BOOL)a5
{
  _BOOL4 v5;
  BOOL v10;
  void (**v11)(void *, BOOL *, NSLock **, const __CFString *);
  void *v12;
  id v13;
  NSObject *v14;
  Float64 v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  Float64 Seconds;
  void *v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  __int128 v27;
  int64_t var3;
  BOOL v29;
  id location;
  _QWORD aBlock[5];
  CMTime time;
  void *v33;
  _BYTE buf[24];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v10 = !v5;
  else
    v10 = 1;
  if (v10)
  {
    if (!v5)
      goto LABEL_8;
LABEL_7:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke;
    aBlock[3] = &unk_1E513FE60;
    aBlock[4] = self;
    v11 = (void (**)(void *, BOOL *, NSLock **, const __CFString *))_Block_copy(aBlock);
    v11[2](v11, &self->_stateQueue_isPlayable, &self->_stateQueue_isPlayableLock, CFSTR("isPlayableLock"));
    v11[2](v11, &self->_stateQueue_readyForSeeking, &self->_stateQueue_readyForSeekingLock, CFSTR("readyForSeekingLock"));
    v11[2](v11, &self->_stateQueue_videoOutputIsReady, &self->_stateQueue_videoOutputReadyLock, CFSTR("videoOutputReadyLock"));

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSThread.isMainThread ? waitUntilComplete == NO : YES"));

  if (v5)
    goto LABEL_7;
LABEL_8:
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && -[PXVideoSession isPlayable](self, "isPlayable")
    && -[PXVideoSession isReadyForSeeking](self, "isReadyForSeeking")
    && -[PXVideoSession isVideoOutputReady](self, "isVideoOutputReady"))
  {
    if (v5)
      v13 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    else
      v13 = 0;
    objc_msgSend(v13, "lock");
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_195;
    v24[3] = &unk_1E513FE88;
    v29 = a4;
    objc_copyWeak(&v26, &location);
    v27 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v14 = v13;
    v25 = v14;
    time = (CMTime)*a3;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v22 = *(_OWORD *)buf;
    v23 = *(_QWORD *)&buf[16];
    objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time, buf, &v22, v24);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSObject lockBeforeDate:](v14, "lockBeforeDate:", v17);

      if ((v18 & 1) == 0)
      {
        PLVideoPlaybackGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          time = (CMTime)*a3;
          Seconds = CMTimeGetSeconds(&time);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(Float64 *)&buf[14] = Seconds;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "%@ sync seeking to time %f timed out", buf, 0x16u);
        }

      }
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    PLVideoPlaybackGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      time = (CMTime)*a3;
      v15 = CMTimeGetSeconds(&time);
      -[PXVideoSession description](self, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543874;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v15;
      HIWORD(time.epoch) = 2114;
      v33 = v16;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%{public}@ wasn't ready for seeking to time %f: %{public}@", (uint8_t *)&time, 0x20u);

    }
  }

}

- (void)_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4
{
  id v6;
  NSObject *videoWorkQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  videoWorkQueue = self->_videoWorkQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PXVideoSession__updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke;
  v9[3] = &unk_1E513FEB0;
  objc_copyWeak(&v11, &location);
  v12 = *a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(videoWorkQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  Float64 Seconds;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  CMTime time;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXVideoSession videoOutput](self, "videoOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a3;
  v8 = objc_msgSend(v7, "copyPixelBufferForItemTime:itemTimeForDisplay:", &time, 0);

  if (!v8)
  {
    PLVideoPlaybackGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      time = (CMTime)*a3;
      Seconds = CMTimeGetSeconds(&time);
      -[PXVideoSession videoOutput](self, "videoOutput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      HIWORD(time.epoch) = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%@ got nil pixelBuffer for time %f from videoOutput: %@", (uint8_t *)&time, 0x20u);

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PXVideoSession__videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke;
  v13[3] = &unk_1E513FED8;
  v14 = v6;
  v15 = v8;
  v12 = v6;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v13);

}

- (BOOL)shouldDisableAutomaticPixelBufferUpdates
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PXVideoSession_shouldDisableAutomaticPixelBufferUpdates__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXVideoSession_setShouldDisableAutomaticPixelBufferUpdates___block_invoke;
  block[3] = &unk_1E513FF00;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x2000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setShouldDisableAutomaticPixelBufferUpdates:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 759, CFSTR("invalidating %lu after it already has been updated"), 0x2000);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x2000uLL;
  }
  _Block_object_dispose(&v10, 8);
}

- (id)videoPlayer
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_videoPlayer__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setVideoPlayer:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  PXVideoSession *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  stateQueue = self->_stateQueue;
  block = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __33__PXVideoSession_setVideoPlayer___block_invoke;
  v12 = &unk_1E513FD98;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v15 = &v16;
  dispatch_sync(stateQueue, &block);
  if (*((_BYTE *)v17 + 24))
  {
    -[PXVideoSession signalChange:](self, "signalChange:", 0x4000);
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x29244) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setVideoPlayer:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXVideoSession.m"), 806, CFSTR("invalidating %lu after it already has been updated"), 168516, block, v10, v11, v12);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x29244uLL;
  }

  _Block_object_dispose(&v16, 8);
}

- (id)audioSession
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PXVideoSession_audioSession__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setAudioSession:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__PXVideoSession_setAudioSession___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (BOOL)_request4k60StreamAllowance
{
  BOOL v3;
  uint64_t v4;

  if (_request4k60StreamAllowance_onceToken != -1)
    dispatch_once(&_request4k60StreamAllowance_onceToken, &__block_literal_global_256436);
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  if (self->_sharedLock_has4k60Allowance)
  {
    v3 = 1;
  }
  else
  {
    v4 = sharedLock_totalVideoSessionsWith4kStreams;
    if (sharedLock_totalVideoSessionsWith4kStreams >= _request4k60StreamAllowance_maxConcurrent4k60Streams)
    {
      v3 = 0;
    }
    else
    {
      v3 = 1;
      self->_sharedLock_has4k60Allowance = 1;
      sharedLock_totalVideoSessionsWith4kStreams = v4 + 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  return v3;
}

- (void)_relinquishAny4k60StreamAllowance
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  if (self->_sharedLock_has4k60Allowance)
  {
    self->_sharedLock_has4k60Allowance = 0;
    v3 = sharedLock_totalVideoSessionsWith4kStreams--;
    if (v3 <= 0)
    {
      PXAssertGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = sharedLock_totalVideoSessionsWith4kStreams;
        _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Unbalanced inc/dec for sharedLock_totalVideoSessionsWith4kStreams: %ld", (uint8_t *)&v5, 0xCu);
      }

      sharedLock_totalVideoSessionsWith4kStreams = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (double)desiredPlaybackRate
{
  NSObject *stateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PXVideoSession_desiredPlaybackRate__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDesiredPlaybackRate:(double)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_setDesiredPlaybackRate___block_invoke;
  block[3] = &unk_1E5141AE0;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v10 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x200) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setDesiredPlaybackRate:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 880, CFSTR("invalidating %lu after it already has been updated"), 512);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x200uLL;
  }
  _Block_object_dispose(&v9, 8);
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXVideoSession_registerChangeObserver_context___block_invoke;
  v8[3] = &unk_1E513FF48;
  objc_copyWeak(v10, &location);
  v7 = v6;
  v9 = v7;
  v10[1] = a4;
  -[PXVideoSession _performBlockOnUpdateQueue:](self, "_performBlockOnUpdateQueue:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PXVideoSession_unregisterChangeObserver_context___block_invoke;
  v8[3] = &unk_1E513FF48;
  objc_copyWeak(v10, &location);
  v7 = v6;
  v9 = v7;
  v10[1] = a4;
  -[PXVideoSession _performBlockOnUpdateQueue:](self, "_performBlockOnUpdateQueue:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (void)_updateQueue_registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7.receiver = self;
  v7.super_class = (Class)PXVideoSession;
  -[PXVideoSession registerChangeObserver:context:](&v7, sel_registerChangeObserver_context_, v6, a4);

}

- (void)_updateQueue_unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7.receiver = self;
  v7.super_class = (Class)PXVideoSession;
  -[PXVideoSession unregisterChangeObserver:context:](&v7, sel_unregisterChangeObserver_context_, v6, a4);

}

- (void)performChanges:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_performChanges_withPresentationContext_presenter_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 911, CFSTR("Use %@ instead."), v7);

  abort();
}

- (void)_performChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PXVideoSession__performChanges___block_invoke;
  v6[3] = &unk_1E5148CE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXVideoSession _performBlockOnUpdateQueue:](self, "_performBlockOnUpdateQueue:", v6);

}

- (void)didPerformChanges
{
  $F40CD077B40800501ED060B808F886F7 *p_updateQueue_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v60.receiver = self;
  v60.super_class = (Class)PXVideoSession;
  -[PXVideoSession didPerformChanges](&v60, sel_didPerformChanges);
  p_updateQueue_updateFlags = &self->_updateQueue_updateFlags;
  self->_updateQueue_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateQueue_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXVideoSession.m"), 924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateQueue_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateQueue_updateFlags->needsUpdate;
    }
    self->_updateQueue_updateFlags.isPerformingUpdate = 1;
    self->_updateQueue_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXVideoSession _updatePlayerItem](self, "_updatePlayerItem");
      if (!self->_updateQueue_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("PXVideoSession.m"), 929, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXVideoSession _updatePlayability](self, "_updatePlayability");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXVideoSession.m"), 932, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXVideoSession _updateDuration](self, "_updateDuration");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXVideoSession.m"), 935, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXVideoSession _updateAudioStatus](self, "_updateAudioStatus");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXVideoSession.m"), 938, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXVideoSession _updateTrackGeometry](self, "_updateTrackGeometry");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXVideoSession.m"), 941, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXVideoSession _updateBuffering](self, "_updateBuffering");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXVideoSession.m"), 944, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXVideoSession _updatePlayState](self, "_updatePlayState");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXVideoSession.m"), 947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v11 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x80uLL;
    if ((v11 & 0x80) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFF7FLL;
      -[PXVideoSession _updateStalled](self, "_updateStalled");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("PXVideoSession.m"), 950, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v12 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x100uLL;
    if ((v12 & 0x100) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFEFFLL;
      -[PXVideoSession _updateAtBeginningOrEnd](self, "_updateAtBeginningOrEnd");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PXVideoSession.m"), 953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v13 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x200uLL;
    if ((v13 & 0x200) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFFDFFLL;
      -[PXVideoSession _updateAVPlayerPlayState](self, "_updateAVPlayerPlayState");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXVideoSession.m"), 956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v14 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x20000uLL;
    if ((v14 & 0x20000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v14 & 0xFFFFFFFFFFFDFFFFLL;
      -[PXVideoSession _updateCurrentPlayerItem](self, "_updateCurrentPlayerItem");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("PXVideoSession.m"), 959, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v15 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x400uLL;
    if ((v15 & 0x400) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXVideoSession _updateVideoOutput](self, "_updateVideoOutput");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXVideoSession.m"), 962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v16 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x800uLL;
    if ((v16 & 0x800) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v16 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXVideoSession _updateCurrentPixelBuffer](self, "_updateCurrentPixelBuffer");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PXVideoSession.m"), 965, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v17 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x1000uLL;
    if ((v17 & 0x1000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v17 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXVideoSession _updatePlayerItemInPlayer](self, "_updatePlayerItemInPlayer");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PXVideoSession.m"), 968, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v18 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x2000uLL;
    if ((v18 & 0x2000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v18 & 0xFFFFFFFFFFFFDFFFLL;
      -[PXVideoSession _updateDisplayLinkState](self, "_updateDisplayLinkState");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PXVideoSession.m"), 971, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v19 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x4000uLL;
    if ((v19 & 0x4000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v19 & 0xFFFFFFFFFFFFBFFFLL;
      -[PXVideoSession _updateVolumeAnimator](self, "_updateVolumeAnimator");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("PXVideoSession.m"), 974, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v20 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x8000uLL;
    if ((v20 & 0x8000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v20 & 0xFFFFFFFFFFFF7FFFLL;
      -[PXVideoSession _updatePlayerVolume](self, "_updatePlayerVolume");
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("PXVideoSession.m"), 977, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateQueue_updateFlags.isPerformingUpdate"));

    }
    v21 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x10000uLL;
    if ((v21 & 0x10000) != 0)
    {
      p_updateQueue_updateFlags->needsUpdate = v21 & 0xFFFFFFFFFFFEFFFFLL;
      -[PXVideoSession _updateReadyForSeeking](self, "_updateReadyForSeeking");
      v21 = p_updateQueue_updateFlags->needsUpdate;
    }
    self->_updateQueue_updateFlags.isPerformingUpdate = 0;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession didPerformChanges]");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("PXVideoSession.m"), 980, CFSTR("still needing to update %lu after update pass"), p_updateQueue_updateFlags->needsUpdate);

    }
  }
}

- (void)outputMediaDataWillChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXVideoSession_outputMediaDataWillChange___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v3);
}

- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v5 = a3;
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[PXVideoSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoSessionDidPlayToEnd:", self);

    -[PXVideoSession playbackTimeRange](self, "playbackTimeRange");
    if ((v17 & 1) == 0
      || (-[PXVideoSession playbackTimeRange](self, "playbackTimeRange"), (v16 & 1) == 0)
      || (-[PXVideoSession playbackTimeRange](self, "playbackTimeRange"), v15)
      || (-[PXVideoSession playbackTimeRange](self, "playbackTimeRange"), v14 < 0))
    {
      if (-[PXVideoSession seekToBeginningAtEnd](self, "seekToBeginningAtEnd"))
      {
        v12 = *MEMORY[0x1E0CA2E68];
        v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v10 = v12;
        v11 = v13;
        v8 = v12;
        v9 = v13;
        objc_msgSend(v5, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v12, &v10, &v8, 0);
      }
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  PXVideoSession *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  PXVideoSession *v24;
  unint64_t v25;

  v9 = a3;
  if ((void *)VideoPlayerObservationContext == a5)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __47__PXVideoSession_observable_didChange_context___block_invoke;
    v23 = &unk_1E5144FE8;
    v24 = self;
    v25 = a4;
    v10 = &v20;
LABEL_6:
    -[PXVideoSession _performChanges:](self, "_performChanges:", v10, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_7;
  }
  if ((void *)VideoContentProviderObservationContext_256416 != a5)
  {
    if ((void *)VolumeAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 1041, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __47__PXVideoSession_observable_didChange_context___block_invoke_2;
    v17 = &unk_1E5144FE8;
    v18 = self;
    v19 = a4;
    v10 = &v14;
    goto LABEL_6;
  }
  if ((a4 & 1) != 0)
  {
    -[PXVideoSession contentProvider](self, "contentProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadingResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoSession _handleContentLoadingResult:](self, "_handleContentLoadingResult:", v12);

  }
LABEL_7:

}

- (void)wrappedAudioSession:(id)a3 didChangeVolumeFrom:(float)a4 to:(float)a5
{
  double v8;
  double v9;
  id v10;

  -[PXVideoSession delegate](self, "delegate", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  *(float *)&v9 = a5;
  objc_msgSend(v10, "videoSessionAudioSessionOutputVolumeDidChange:fromVolume:toVolume:", self, v8, v9);

}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PLVideoPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Received AV resource reclamation event.", v5, 2u);
  }

  -[PXVideoSession _rebuildAVObjects](self, "_rebuildAVObjects");
}

- (void)_rebuildAVObjects
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  PXVideoSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLVideoPlaybackGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Rebuilding AV Objects for %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__PXVideoSession__rebuildAVObjects__block_invoke;
  v4[3] = &unk_1E51479C8;
  v4[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v4);
}

- (void)_handleContentLoadingResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PXVideoSession *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXVideoSession__handleContentLoadingResult___block_invoke;
  v6[3] = &unk_1E5144868;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v6);

}

- (void)_updateFromCurrentPresentationState
{
  NSObject *stateQueue;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__256351;
  v11 = __Block_byref_object_dispose__256352;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  if (v8[5])
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke_2;
    v5[3] = &unk_1E513FF70;
    v5[4] = self;
    v5[5] = &v7;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v5);
  }
  _Block_object_dispose(&v7, 8);

}

- (void)_audioSessionQueue_initializeAudioSession
{
  double Current;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D78290], "auxiliarySession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoSession audioSessionCategory](self, "audioSessionCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoSession audioSessionMode](self, "audioSessionMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v5, "setCategory:mode:routeSharingPolicy:options:error:", v6, v7, -[PXVideoSession audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy"), -[PXVideoSession audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), &v17);
  v9 = v17;

  if ((v8 & 1) == 0)
  {
    PLVideoPlaybackGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Unable to configure audio session for video playback. Error: %@", buf, 0xCu);
    }

  }
  -[PXVideoSession setAudioSession:](self, "setAudioSession:", v5);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWrappedAudioSession:", v5);

  v12 = CFAbsoluteTimeGetCurrent();
  PLVideoPlaybackGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2048;
    v21 = v12 - Current;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Configured AVAudioSession in %@ in %f seconds.", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(v5, "registerVolumeObserver:", self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__PXVideoSession__audioSessionQueue_initializeAudioSession__block_invoke;
  v15[3] = &unk_1E5148D30;
  objc_copyWeak(&v16, (id *)buf);
  -[PXVideoSession _performBlockOnUpdateQueue:](self, "_performBlockOnUpdateQueue:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void)_didFinishInitializingAudioSession
{
  _QWORD v3[5];

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PXVideoSession__didFinishInitializingAudioSession__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v3);
}

- (id)playbackTimeRangeEndBoundaryObserver
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXVideoSession_playbackTimeRangeEndBoundaryObserver__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setPlaybackTimeRangeEndBoundaryObserver:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  PXVideoSession *v9;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXVideoSession_setPlaybackTimeRangeEndBoundaryObserver___block_invoke;
  block[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (id)_newVideoView
{
  PXVideoView *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  PXVideoView *v10;
  PXVideoSession *v11;

  v3 = objc_alloc_init(PXVideoView);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXVideoView setPlayer:](v3, "setPlayer:", v4);
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __31__PXVideoSession__newVideoView__block_invoke;
    v9 = &unk_1E5148D08;
    v10 = v3;
    v11 = self;
    -[PXVideoSession _performBlockOnUpdateQueue:](self, "_performBlockOnUpdateQueue:", &v6);

  }
  -[PXVideoView setVideoGravity:](v3, "setVideoGravity:", *MEMORY[0x1E0C8A6E0], v6, v7, v8, v9);
  objc_setAssociatedObject(v3, (const void *)VideoViewSessionKey, self, 0);

  return v3;
}

- (void)_handleDisplayLink:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PXVideoSession__handleDisplayLink___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v3);
}

- (void)_updateVideoOutput
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v32;
  BOOL v33;
  double v34;
  double v35;
  _BOOL4 v36;
  uint64_t AspectRatio;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL4 v44;
  uint64_t *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *videoWorkQueue;
  id v55;
  _QWORD block[4];
  id v57;
  id v58;
  id v59;
  id location;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PXVideoSession pixelBufferOutputTokenCount](self, "pixelBufferOutputTokenCount");
    -[PXVideoSession videoOutput](self, "videoOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PXVideoSession pixelBufferOutputSizes](self, "pixelBufferOutputSizes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXVideoSession naturalSize](self, "naturalSize");
      v8 = v7;
      v10 = v9;
      -[PXVideoSession nominalFrameRate](self, "nominalFrameRate");
      v12 = v11;
      objc_msgSend(v6, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "CGSizeValue");
      v15 = v14;
      v17 = v16;

      if (objc_msgSend(v6, "count"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "CGSizeValue");
          PXSizeMax();
          v15 = v20;
          v17 = v21;

          ++v18;
        }
        while (v18 < objc_msgSend(v6, "count"));
      }
      v22 = *MEMORY[0x1E0C9D820];
      v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v24 = v17 == v23 && v15 == *MEMORY[0x1E0C9D820];
      if (v5)
      {
        -[PXVideoSession videoOutputSize](self, "videoOutputSize");
        v25 = PXSizeApproximatelyEqualOrBiggerThanSize();
      }
      else
      {
        v25 = 0;
      }
      v26 = MEMORY[0x1A85CD5B8](v15, v17, 2000.0, 2000.0);
      v27 = MEMORY[0x1E0C809B0];
      if (v24)
      {
        if (v12 == 0.0)
          v28 = v26;
        else
          v28 = 0;
        if (((v25 | v28) & 1) == 0)
        {
          v29 = *MEMORY[0x1E0CA8FF0];
          v61[0] = *MEMORY[0x1E0CA9010];
          v61[1] = v29;
          v62[0] = MEMORY[0x1E0C9AAB0];
          v62[1] = MEMORY[0x1E0C9AA70];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
          v44 = -[PXVideoSession isExpectingVideoView](self, "isExpectingVideoView");
          v45 = (uint64_t *)MEMORY[0x1E0CA9040];
          if (v44)
          {
            if (_deviceSupportsIOSurfaceCompression_onceToken != -1)
              dispatch_once(&_deviceSupportsIOSurfaceCompression_onceToken, &__block_literal_global_826);
            if (_deviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression == 1)
            {
              v46 = (void *)objc_msgSend(v30, "mutableCopy");
              objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E53EAAA0, *v45);
              v47 = objc_msgSend(v46, "copy");

              v30 = (void *)v47;
            }
          }
          v48 = *v45;
          objc_msgSend(v30, "objectForKeyedSubscript:", *v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v49)
          {
            v50 = (void *)objc_msgSend(v30, "mutableCopy");
            PXGSupportedPixelBufferFormats();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, v48);

            v52 = objc_msgSend(v50, "copy");
            v30 = (void *)v52;
          }
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B328]), "initWithOutputSettings:", v30);
          objc_msgSend(v53, "setDelegate:queue:", self, 0);
          -[PXVideoSession setVideoOutput:size:](self, "setVideoOutput:size:", v53, v15, v17);
          objc_initWeak(&location, self);
          videoWorkQueue = self->_videoWorkQueue;
          block[0] = v27;
          block[1] = 3221225472;
          block[2] = __36__PXVideoSession__updateVideoOutput__block_invoke;
          block[3] = &unk_1E5147B18;
          objc_copyWeak(&v59, &location);
          v57 = v53;
          v58 = v3;
          v55 = v53;
          dispatch_async(videoWorkQueue, block);

          objc_destroyWeak(&v59);
          objc_destroyWeak(&location);

        }
      }
      else if (v8 != v22 || v10 != v23)
      {
        v32 = v12 == 0.0 ? v26 : 0;
        if (((v25 | v32) & 1) == 0)
        {
          v33 = v12 <= 50.0;
          v34 = v15;
          v35 = v17;
          if (!v33)
          {
            v34 = v15;
            v35 = v17;
            if ((v26 & MEMORY[0x1A85CD5B8](v8, v10, 2000.0, 2000.0)) == 1)
            {
              v36 = -[PXVideoSession _request4k60StreamAllowance](self, "_request4k60StreamAllowance");
              if (v36)
                v34 = v15;
              else
                v34 = 1920.0;
              if (v36)
                v35 = v17;
              else
                v35 = 1080.0;
            }
          }
          if (MEMORY[0x1A85CD5B8](v8, v10, v34, v35))
          {
            AspectRatio = PXSizeGetAspectRatio();
            MEMORY[0x1A85CD660](AspectRatio);
          }
          PXSizeRoundToEven();
          v39 = v38;
          v63[0] = *MEMORY[0x1E0CA90E0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = v40;
          v63[1] = *MEMORY[0x1E0CA8FD8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = *MEMORY[0x1E0CA9010];
          v64[1] = v41;
          v64[2] = MEMORY[0x1E0C9AAB0];
          v43 = *MEMORY[0x1E0CA8FF0];
          v63[2] = v42;
          v63[3] = v43;
          v64[3] = MEMORY[0x1E0C9AA70];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_40;
        }
      }
      px_dispatch_on_main_queue();

      goto LABEL_49;
    }
  }
  else
  {
    -[PXVideoSession videoOutput](self, "videoOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PXVideoSession playState](self, "playState") != 3)
  {
    -[PXVideoSession _removeAllVideoOutputs](self, "_removeAllVideoOutputs");
    -[PXVideoSession setVideoOutput:size:](self, "setVideoOutput:size:", 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[PXVideoSession setIsVideoOutputReady:](self, "setIsVideoOutputReady:", 0);
    px_dispatch_on_main_queue();
  }
LABEL_49:

}

- (void)_addOutput:(id)a3 toPlayerItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PXVideoSession videoOutput](self, "videoOutput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    -[PXVideoSession playerItem](self, "playerItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
    {
      objc_msgSend(v6, "addOutput:", v9);
      objc_msgSend(v9, "requestNotificationOfMediaDataChangeWithAdvanceInterval:", 0.1);
    }
  }
  else
  {

  }
}

- (void)_updateCurrentPixelBuffer
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint64_t v6;
  int64_t updateQueue_pendingPlayerItemSeekCount;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  if (!-[PXVideoSession shouldDisableAutomaticPixelBufferUpdates](self, "shouldDisableAutomaticPixelBufferUpdates"))
  {
    if (self->_updateQueue_pendingPlayerItemSeekCount < 1)
    {
      -[PXVideoSession videoOutput](self, "videoOutput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43__PXVideoSession__updateCurrentPixelBuffer__block_invoke;
      v10[3] = &unk_1E5147280;
      objc_copyWeak(&v12, (id *)buf);
      v11 = v8;
      v9 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[PXVideoSession log](self, "log");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = os_signpost_id_make_with_pointer(v3, self);
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(v3))
        {
          v6 = -[PXVideoSession logContext](self, "logContext");
          updateQueue_pendingPlayerItemSeekCount = self->_updateQueue_pendingPlayerItemSeekCount;
          *(_DWORD *)buf = 134218240;
          v14 = v6;
          v15 = 2048;
          v16 = updateQueue_pendingPlayerItemSeekCount;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_EVENT, v5, "PXVideoSessionSkippedUpdatingPixelBuffer", "Context=%{signpost.telemetry:string2}lu pendingPlayerItemSeekCount=%ld", buf, 0x16u);
        }
      }

    }
  }
}

- (void)_mainQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *videoWorkQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v4 = a3;
  -[PXDisplayLink targetTimestamp](self->_mainQueue_displayLink, "targetTimestamp");
  v6 = v5;
  objc_initWeak(&location, self);
  videoWorkQueue = self->_videoWorkQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PXVideoSession__mainQueue_updateCurrentPixelBufferWithVideoOutput___block_invoke;
  v9[3] = &unk_1E513FF48;
  objc_copyWeak(v11, &location);
  v10 = v4;
  v11[1] = v6;
  v8 = v4;
  dispatch_async(videoWorkQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_videoWorkQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3 outputTime:(double)a4
{
  id v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  _QWORD v11[5];
  _QWORD v12[6];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v6 = a3;
  if (!-[PXVideoSession shouldDisableAutomaticPixelBufferUpdates](self, "shouldDisableAutomaticPixelBufferUpdates"))
  {
    if (v6)
    {
      kdebug_trace();
      v15 = 0uLL;
      v16 = 0;
      objc_msgSend(v6, "itemTimeForHostTime:", a4);
      v13 = v15;
      v14 = v16;
      if (!objc_msgSend(v6, "hasNewPixelBufferForItemTime:", &v13))
        goto LABEL_11;
      v13 = v15;
      v14 = v16;
      v7 = (__CVBuffer *)objc_msgSend(v6, "copyPixelBufferForItemTime:itemTimeForDisplay:", &v13, 0);
      if (v7)
      {
        v8 = -[PXPhotosensitivityProcessing copyAndProcessPixelBuffer:timestamp:](self->_photoSensitivityProcessing, "copyAndProcessPixelBuffer:timestamp:", v7, a4);
        v9 = v7;
        if (v8)
        {
          v10 = v8;
          CVPixelBufferRelease(v7);
          v9 = v10;
        }
        CVPixelBufferGetWidth(v9);
        CVPixelBufferGetHeight(v9);
      }
      else
      {
        v9 = 0;
      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke;
      v12[3] = &unk_1E5144FE8;
      v12[4] = self;
      v12[5] = v9;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v12);
      if (!v7)
      {
LABEL_11:
        if (-[PXVideoSession desiredPlayState](self, "desiredPlayState") == 1)
          -[PXVideoSession incrementPixelBufferFrameDropsCount](self, "incrementPixelBufferFrameDropsCount");
      }
      kdebug_trace();
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke_2;
      v11[3] = &unk_1E51479C8;
      v11[4] = self;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v11);
    }
  }

}

- (void)_updateDisplayLinkState
{
  unint64_t v3;
  BOOL v4;
  char v5;
  id v6;
  char v7;
  id location;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v3 = -[PXVideoSession pixelBufferOutputTokenCount](self, "pixelBufferOutputTokenCount");
  v4 = -[PXVideoSession shouldDisableAutomaticPixelBufferUpdates](self, "shouldDisableAutomaticPixelBufferUpdates");
  if (v3)
    v5 = v4;
  else
    v5 = 1;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v7 = v5;
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_setDisplayLinkPaused:(BOOL)a3
{
  -[PXDisplayLink setPaused:](self->_mainQueue_displayLink, "setPaused:", a3);
}

- (void)_mainQueue_setDisplayLink:(id)a3
{
  PXDisplayLink **p_mainQueue_displayLink;
  PXDisplayLink *v6;
  PXDisplayLink *v7;

  v7 = (PXDisplayLink *)a3;
  p_mainQueue_displayLink = &self->_mainQueue_displayLink;
  v6 = self->_mainQueue_displayLink;
  if (v6 != v7)
  {
    if (v6)
      -[PXDisplayLink invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_mainQueue_displayLink, a3);
  }

}

- (__CVBuffer)currentPixelBuffer
{
  NSObject *stateQueue;
  __CVBuffer *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PXVideoSession_currentPixelBuffer__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentPixelBuffer:(__CVBuffer *)a3
{
  NSObject *stateQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXVideoSession_setCurrentPixelBuffer___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 1024);
  _Block_object_dispose(&v7, 8);
}

- (int64_t)pixelBufferFrameDropsCount
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PXVideoSession_pixelBufferFrameDropsCount__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)incrementPixelBufferFrameDropsCount
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXVideoSession_incrementPixelBufferFrameDropsCount__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)_updateDuration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentItemStatus");

  if (v4 == 1)
  {
    -[PXVideoSession videoPlayer](self, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "currentItemDuration");
    }
    else
    {
      v9 = 0uLL;
      v10 = 0;
    }
    v11 = v9;
    v12 = v10;

  }
  v7 = v11;
  v8 = v12;
  -[PXVideoSession setVideoDuration:](self, "setVideoDuration:", &v7);
}

- (AVPlayerItemVideoOutput)videoOutput
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_videoOutput__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVPlayerItemVideoOutput *)v3;
}

- (CGSize)videoOutputSize
{
  NSObject *stateQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1A7E74EE7;
  v12 = *MEMORY[0x1E0C9D820];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PXVideoSession_videoOutputSize__block_invoke;
  v7[3] = &unk_1E5148AA8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setVideoOutput:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *stateQueue;
  id v9;
  _QWORD block[5];
  id v11;
  CGFloat v12;
  CGFloat v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (!v7)
    -[PXVideoSession _relinquishAny4k60StreamAllowance](self, "_relinquishAny4k60StreamAllowance");
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke;
  block[3] = &unk_1E5144B50;
  block[4] = self;
  v11 = v7;
  v12 = width;
  v13 = height;
  v9 = v7;
  dispatch_sync(stateQueue, block);

}

- (BOOL)isVideoOutputReady
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PXVideoSession_isVideoOutputReady__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsVideoOutputReady:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v6[5];
  BOOL v7;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXVideoSession_setIsVideoOutputReady___block_invoke;
  v6[3] = &unk_1E5144398;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_videoDuration__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)setVideoDuration:(id *)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PXVideoSession_setVideoDuration___block_invoke;
  block[3] = &unk_1E513FF98;
  v7 = *a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 64);
  _Block_object_dispose(&v8, 8);
}

- (id)currentPlayerItem
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PXVideoSession_currentPlayerItem__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setCurrentPlayerItem:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  PXVideoSession *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  stateQueue = self->_stateQueue;
  block = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __39__PXVideoSession_setCurrentPlayerItem___block_invoke;
  v12 = &unk_1E513FD98;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v15 = &v16;
  dispatch_sync(stateQueue, &block);
  if (*((_BYTE *)v17 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setCurrentPlayerItem:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXVideoSession.m"), 1582, CFSTR("invalidating %lu after it already has been updated"), 1024, block, v10, v11, v12);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }

  _Block_object_dispose(&v16, 8);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PXVideoSession_currentTime__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)setUpdatingAudioSession:(BOOL)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXVideoSession_setUpdatingAudioSession___block_invoke;
  block[3] = &unk_1E513FF00;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24) && !a3)
  {
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __42__PXVideoSession_setUpdatingAudioSession___block_invoke_2;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v7);
  }
  _Block_object_dispose(&v10, 8);
}

- (void)setVolume:(float)a3 withFade:(BOOL)a4
{
  NSObject *stateQueue;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD block[6];
  float v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PXVideoSession_setVolume_withFade___block_invoke;
  block[3] = &unk_1E513FFC0;
  v9 = a3;
  v10 = a4;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v12 + 24))
  {
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __37__PXVideoSession_setVolume_withFade___block_invoke_247;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v7);
  }
  _Block_object_dispose(&v11, 8);
}

- (float)volume
{
  NSObject *stateQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__PXVideoSession_volume__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreventsSleepDuringVideoPlayback:", v3);

}

- (BOOL)preventsSleepDuringVideoPlayback
{
  void *v2;
  char v3;

  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preventsSleepDuringVideoPlayback");

  return v3;
}

- (BOOL)isLoopingEnabled
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_isLoopingEnabled__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *stateQueue;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PXVideoSession_setLoopingEnabled___block_invoke;
  v7[3] = &unk_1E5144398;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(stateQueue, v7);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLoopingEnabled:", v3);

}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRange
{
  NSObject *stateQueue;
  uint64_t *v5;
  __int128 v6;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x5010000000;
  v12 = &unk_1A7E74EE7;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PXVideoSession_playbackTimeRange__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  v5 = v10;
  v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

- (void)setPlaybackTimeRange:(id *)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  __int128 v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  stateQueue = self->_stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke;
  block[3] = &unk_1E513FFE8;
  v7 = *(_OWORD *)&a3->var0.var3;
  v17 = *(_OWORD *)&a3->var0.var0;
  v18 = v7;
  v19 = *(_OWORD *)&a3->var1.var1;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v21 + 24))
  {
    -[PXVideoSession videoPlayer](self, "videoPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoSession playbackTimeRangeEndBoundaryObserver](self, "playbackTimeRangeEndBoundaryObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTimeObserver:", v9);

    if ((a3->var0.var2 & 1) != 0
      && (a3->var1.var2 & 1) != 0
      && !a3->var1.var3
      && (a3->var1.var0 & 0x8000000000000000) == 0)
    {
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke_2;
      v11[3] = &unk_1E5140010;
      v11[4] = self;
      v10 = *(_OWORD *)&a3->var0.var3;
      v13 = *(_OWORD *)&a3->var0.var0;
      v14 = v10;
      v15 = *(_OWORD *)&a3->var1.var1;
      v12 = v8;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v11);

    }
  }
  _Block_object_dispose(&v20, 8);
}

- (void)setPlaybackStartTime:(id *)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PXVideoSession_setPlaybackStartTime___block_invoke;
  v4[3] = &unk_1E51446C8;
  v4[4] = self;
  v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PXVideoSession_playbackStartTime__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)seekToBeginningAtEnd
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PXVideoSession_seekToBeginningAtEnd__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)seekToPlaybackStartTime
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_seekToPlaybackStartTime__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (void)setSeekToBeginningAtEnd:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *stateQueue;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  BOOL v10;

  v3 = a3;
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PXVideoSession_setSeekToBeginningAtEnd___block_invoke;
  v9[3] = &unk_1E5144398;
  v9[4] = self;
  v10 = a3;
  dispatch_sync(stateQueue, v9);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v6, "setActionAtItemEnd:", v8);

}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsExternalPlayback:", v3);

}

- (BOOL)isPlayerTimeAdvancing
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PXVideoSession_isPlayerTimeAdvancing__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPlayerTimeAdvancing:(BOOL)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_setPlayerTimeAdvancing___block_invoke;
  block[3] = &unk_1E513FF00;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setPlayerTimeAdvancing:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 1754, CFSTR("invalidating %lu after it already has been updated"), 128);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x80uLL;
  }
  _Block_object_dispose(&v10, 8);
}

- (int64_t)audioStatus
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_audioStatus__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAudioStatus:(int64_t)a3
{
  NSObject *stateQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setAudioStatus___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 16);
  _Block_object_dispose(&v7, 8);
}

- (AVPlayerItem)playerItem
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PXVideoSession_playerItem__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVPlayerItem *)v3;
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PXVideoSession_timeRangeMapper__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PFSlowMotionTimeRangeMapper *)v3;
}

- (void)setPlayerItem:(id)a3 segmentTimeRangeOfOriginalVideo:(id *)a4 timeRangeMapper:(id)a5
{
  id v8;
  id v9;
  NSObject *stateQueue;
  id v11;
  __int128 v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  PXVideoSession *v18;
  id v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v9 = a5;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXVideoSession_setPlayerItem_segmentTimeRangeOfOriginalVideo_timeRangeMapper___block_invoke;
  block[3] = &unk_1E5140038;
  v11 = v8;
  v17 = v11;
  v18 = self;
  v20 = &v24;
  v12 = *(_OWORD *)&a4->var0.var3;
  v21 = *(_OWORD *)&a4->var0.var0;
  v22 = v12;
  v23 = *(_OWORD *)&a4->var1.var1;
  v13 = v9;
  v19 = v13;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v25 + 24))
  {
    -[PXVideoSession _loadAssetTracksIfNeeded](self, "_loadAssetTracksIfNeeded");
    -[PXVideoSession _updateQueue_seekToPlaybackTimeRangeStartIfNeeded](self, "_updateQueue_seekToPlaybackTimeRangeStartIfNeeded");
    -[PXVideoSession signalChange:](self, "signalChange:", 1);
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x1452) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setPlayerItem:segmentTimeRangeOfOriginalVideo:timeRangeMapper:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXVideoSession.m"), 1813, CFSTR("invalidating %lu after it already has been updated"), 5202);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x1452uLL;
  }

  _Block_object_dispose(&v24, 8);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)segmentTimeRangeOfOriginalVideo
{
  NSObject *stateQueue;
  uint64_t *v5;
  __int128 v6;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x5010000000;
  v12 = &unk_1A7E74EE7;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXVideoSession_segmentTimeRangeOfOriginalVideo__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  v5 = v10;
  v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

- (BOOL)isSegmentOfOriginalVideo
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  -[PXVideoSession segmentTimeRangeOfOriginalVideo](self, "segmentTimeRangeOfOriginalVideo");
  if ((v7 & 1) == 0)
    return 0;
  -[PXVideoSession segmentTimeRangeOfOriginalVideo](self, "segmentTimeRangeOfOriginalVideo");
  if ((v6 & 1) == 0)
    return 0;
  -[PXVideoSession segmentTimeRangeOfOriginalVideo](self, "segmentTimeRangeOfOriginalVideo");
  if (v5)
    return 0;
  -[PXVideoSession segmentTimeRangeOfOriginalVideo](self, "segmentTimeRangeOfOriginalVideo");
  return v4 >= 0;
}

- (BOOL)isPlayable
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PXVideoSession_isPlayable__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPlayable:(BOOL)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PXVideoSession_setPlayable___block_invoke;
  block[3] = &unk_1E513FF00;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setPlayable:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 1848, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x40uLL;
    -[PXVideoSession signalChange:](self, "signalChange:", 32);
  }
  _Block_object_dispose(&v10, 8);
}

- (BOOL)isStalled
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PXVideoSession_isStalled__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStalled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PXVideoSession_setStalled___block_invoke;
  block[3] = &unk_1E513FF00;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 2);
  _Block_object_dispose(&v8, 8);
}

- (BOOL)isBuffering
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_isBuffering__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setBuffering:(BOOL)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_setBuffering___block_invoke;
  block[3] = &unk_1E513FF00;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0xC0) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setBuffering:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 1893, CFSTR("invalidating %lu after it already has been updated"), 192);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0xC0uLL;
  }
  _Block_object_dispose(&v10, 8);
}

- (BOOL)isReadyForSeeking
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PXVideoSession_isReadyForSeeking__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsReadyForSeeking:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession_setIsReadyForSeeking___block_invoke;
  block[3] = &unk_1E513FF00;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 0x2000);
  _Block_object_dispose(&v8, 8);
}

- (int64_t)playState
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PXVideoSession_playState__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPlayState:(int64_t)a3
{
  NSObject *stateQueue;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[8];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  PXVideoSession *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_setPlayState___block_invoke;
  block[3] = &unk_1E5140068;
  block[4] = self;
  block[5] = &v37;
  block[6] = &v33;
  block[7] = a3;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v38 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x680) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setPlayState:]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXVideoSession.m"), 1943, CFSTR("invalidating %lu after it already has been updated"), 1664);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x680uLL;
    -[PXVideoSession signalChange:](self, "signalChange:", 4);
    -[PXVideoSession log](self, "log");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        v9 = -[PXVideoSession logContext](self, "logContext");
        *(_DWORD *)buf = 134217984;
        v42 = v9;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    v10 = v6;
    v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        v13 = -[PXVideoSession logContext](self, "logContext");
        *(_DWORD *)buf = 134218240;
        v42 = v13;
        v43 = 2048;
        v44 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_EVENT, v12, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
      }
    }

    v14 = v10;
    v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        v17 = -[PXVideoSession logContext](self, "logContext");
        *(_DWORD *)buf = 134218240;
        v42 = v17;
        v43 = 2048;
        v44 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
      }
    }

    PLVideoPlaybackGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v34[3];
      if (v19 > 5)
        v20 = 0;
      else
        v20 = off_1E5140280[v19];
      if ((unint64_t)a3 > 5)
        v21 = 0;
      else
        v21 = off_1E5140280[a3];
      *(_DWORD *)buf = 138412802;
      v42 = (uint64_t)v20;
      v43 = 2112;
      v44 = (int64_t)v21;
      v45 = 2112;
      v46 = self;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "[Video Session] Actual play state changing from %@ to %@\n\t%@", buf, 0x20u);
    }

    if (a3 == 5)
    {
      -[PXVideoSession contentProvider](self, "contentProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "analyticsPayload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D09830]);

      -[PXVideoSession error](self, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D09838]);

      v28 = (void *)MEMORY[0x1E0D09910];
      v29 = (void *)objc_msgSend(v24, "copy");
      objc_msgSend(v28, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.videoSessionFailed"), v29);

    }
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

- (int64_t)desiredPlayState
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_desiredPlayState__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  _QWORD v12[6];
  _QWORD block[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  PXVideoSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  stateQueue = self->_stateQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setDesiredPlayState___block_invoke;
  block[3] = &unk_1E5140068;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v18;
  block[7] = a3;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v19 + 24))
  {
    PLVideoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v15[3];
      v9 = CFSTR("Playing");
      if (v8 == 1)
        v10 = CFSTR("Playing");
      else
        v10 = 0;
      if (v8)
        v11 = v10;
      else
        v11 = CFSTR("Paused");
      if (a3 != 1)
        v9 = 0;
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      v24 = 2112;
      if (!a3)
        v9 = CFSTR("Paused");
      v25 = v9;
      v26 = 2112;
      v27 = self;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[Video Session] Desired play state changing from %@ to %@\n\t%@", buf, 0x20u);
    }

    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __38__PXVideoSession_setDesiredPlayState___block_invoke_252;
    v12[3] = &unk_1E5144FE8;
    v12[4] = self;
    v12[5] = a3;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v12);
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

- (BOOL)isAtBeginning
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__PXVideoSession_isAtBeginning__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAtBeginning:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setAtBeginning___block_invoke;
  block[3] = &unk_1E513FF00;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 256);
  _Block_object_dispose(&v8, 8);
}

- (BOOL)isAtEnd
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__PXVideoSession_isAtEnd__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAtEnd:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__PXVideoSession_setAtEnd___block_invoke;
  block[3] = &unk_1E513FF00;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 512);
  _Block_object_dispose(&v8, 8);
}

- (unint64_t)pixelBufferOutputTokenCount
{
  NSObject *stateQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXVideoSession_pixelBufferOutputTokenCount__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)pixelBufferOutputSizes
{
  NSObject *stateQueue;
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
  v9 = __Block_byref_object_copy__256351;
  v10 = __Block_byref_object_dispose__256352;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PXVideoSession_pixelBufferOutputSizes__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_handleTrackGeometryDidLoad
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PXVideoSession__handleTrackGeometryDidLoad__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v2);
}

- (void)_avPlayerTimeDidChange:(id *)a3
{
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PXVideoSession__avPlayerTimeDidChange___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v6 = *a3;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v5);
}

- (void)_handlePlayerTimeAdvancementTimer:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PXVideoSession__handlePlayerTimeAdvancementTimer___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v3);
}

- (void)_updatePlayability
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  id v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v5 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("playable"), &v13);
  v6 = v13;
  if (v5 == 2)
  {
    -[PXVideoSession _setPlayabilityFromAsset:](self, "_setPlayabilityFromAsset:", v4);
  }
  else if (v5 == 3)
  {
    PLVideoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to load playable status of video %@: %@", buf, 0x16u);
    }

    -[PXVideoSession setPlayState:](self, "setPlayState:", 5);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    v14 = CFSTR("playable");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__PXVideoSession__updatePlayability__block_invoke;
    v9[3] = &unk_1E5144DF8;
    objc_copyWeak(&v10, (id *)buf);
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_handlePlayabilityDidLoadForAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    -[PXVideoSession playerItem](self, "playerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v12 = 0;
      v7 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("playable"), &v12);
      v8 = v12;
      if (v7 == 2)
      {
        -[PXVideoSession _setPlayabilityFromAsset:](self, "_setPlayabilityFromAsset:", v4);
      }
      else
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __52__PXVideoSession__handlePlayabilityDidLoadForAsset___block_invoke;
        v9[3] = &unk_1E5145A98;
        v9[4] = self;
        v10 = v4;
        v11 = v8;
        -[PXVideoSession _performChanges:](self, "_performChanges:", v9);

      }
    }
  }

}

- (void)_setPlayabilityFromAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isPlayable");
  else
    v6 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PXVideoSession__setPlayabilityFromAsset___block_invoke;
  v8[3] = &unk_1E5144F98;
  v10 = v6;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v8);

}

- (void)_updateAudioStatus
{
  void *v3;
  int v4;
  uint64_t v5;
  _QWORD v6[6];

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 1)
  {
    v4 = objc_msgSend(v3, "hasEnabledAudio");
    v5 = 1;
    if (v4)
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PXVideoSession__updateAudioStatus__block_invoke;
  v6[3] = &unk_1E5144FE8;
  v6[4] = self;
  v6[5] = v5;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v6);

}

- (void)_updateTrackGeometry
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *videoWorkQueue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;
  _QWORD v11[5];
  id v12;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__PXVideoSession__updateTrackGeometry__block_invoke;
    v11[3] = &unk_1E5144868;
    v11[4] = self;
    v12 = v4;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v11);

  }
  else if (objc_msgSend(v3, "status") == 1)
  {
    objc_initWeak(&location, self);
    videoWorkQueue = self->_videoWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PXVideoSession__updateTrackGeometry__block_invoke_2;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v9, &location);
    v8 = v3;
    dispatch_async(videoWorkQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_videoQueue_updateTrackGeometryWithPlayerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[5];
  int v17;
  _QWORD v18[7];
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("tracks"), 0) == 2
    && (objc_msgSend(v5, "tracks"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "statusOfValueForKey:error:", CFSTR("preferredTransform"), 0) == 2)
    {
      v25 = 0u;
      v24 = 0u;
      v23 = 0u;
      if (v9)
        objc_msgSend(v9, "preferredTransform");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke;
      v19[3] = &unk_1E51400B8;
      v19[4] = self;
      v20 = v23;
      v21 = v24;
      v22 = v25;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v19);
    }
    if (objc_msgSend(v9, "statusOfValueForKey:error:", CFSTR("naturalSize"), 0) == 2)
    {
      objc_msgSend(v9, "naturalSize");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_2;
      v18[3] = &unk_1E51449E0;
      v18[4] = self;
      v18[5] = v10;
      v18[6] = v11;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v18);
    }
    if (objc_msgSend(v9, "statusOfValueForKey:error:", CFSTR("nominalFrameRate"), 0) == 2)
    {
      objc_msgSend(v9, "nominalFrameRate");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_3;
      v16[3] = &unk_1E51400E0;
      v16[4] = self;
      v17 = v12;
      -[PXVideoSession _performChanges:](self, "_performChanges:", v16);
    }

  }
  else
  {
    objc_msgSend(v4, "presentationSize");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_4;
    v15[3] = &unk_1E51449E0;
    v15[4] = self;
    v15[5] = v13;
    v15[6] = v14;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v15);
  }

}

- (CGAffineTransform)preferredTransform
{
  NSObject *stateQueue;
  uint64_t *v5;
  __int128 v6;
  CGAffineTransform *result;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x5010000000;
  v12 = &unk_1A7E74EE7;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PXVideoSession_preferredTransform__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  v5 = v10;
  v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  NSObject *stateQueue;
  __int128 v6;
  _QWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PXVideoSession_setPreferredTransform___block_invoke;
  v7[3] = &unk_1E513FFE8;
  v6 = *(_OWORD *)&a3->c;
  v8 = *(_OWORD *)&a3->a;
  v9 = v6;
  v10 = *(_OWORD *)&a3->tx;
  v7[4] = self;
  v7[5] = &v11;
  dispatch_sync(stateQueue, v7);
  if (*((_BYTE *)v12 + 24))
    -[PXVideoSession signalChange:](self, "signalChange:", 2048);
  _Block_object_dispose(&v11, 8);
}

- (CGSize)naturalSize
{
  NSObject *stateQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1A7E74EE7;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PXVideoSession_naturalSize__block_invoke;
  v7[3] = &unk_1E5148AA8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSObject *stateQueue;
  void *v7;
  void *v8;
  _QWORD block[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  height = a3.height;
  width = a3.width;
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setNaturalSize___block_invoke;
  block[3] = &unk_1E513FD48;
  *(CGFloat *)&block[6] = width;
  *(CGFloat *)&block[7] = height;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setNaturalSize:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXVideoSession.m"), 2221, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }
  _Block_object_dispose(&v10, 8);
}

- (float)nominalFrameRate
{
  NSObject *stateQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_nominalFrameRate__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setNominalFrameRate:(float)a3
{
  NSObject *stateQueue;
  void *v6;
  void *v7;
  _QWORD block[6];
  float v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setNominalFrameRate___block_invoke;
  block[3] = &unk_1E5140108;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setNominalFrameRate:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 2243, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }
  _Block_object_dispose(&v10, 8);
}

- (void)_updateAtBeginningOrEnd
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  id location;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoSession playerItem](self, "playerItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke;
    v8[3] = &unk_1E5140130;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "px_loadDurationWithCompletionHandler:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke_2;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v7);
  }

}

- (void)_updateAtBeginningOrEndWithPlayerItemDuration:(id *)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;
  BOOL v15;
  CMTimeRange time1;
  CMTime v17;
  CMTime time2;
  __int128 v19;
  CMTimeEpoch v20;
  CMTimeRange buf;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!a4)
  {
    PLVideoPlaybackGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to load video duration. Error: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v19 = 0uLL;
  v20 = 0;
  if (v9)
    -[NSObject currentTime](v9, "currentTime");
  memset(&buf, 0, sizeof(buf));
  -[PXVideoSession playbackTimeRange](self, "playbackTimeRange");
  if ((BYTE12(v19) & 0x1D) != 1 || (a3->var2 & 0x1D) != 1)
  {
LABEL_10:
    v12 = 0;
    v11 = 1;
    goto LABEL_11;
  }
  *(_OWORD *)&time1.start.value = v19;
  time1.start.epoch = v20;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v11 = CMTimeCompare(&time1.start, &time2) < 1;
  *(_OWORD *)&time1.start.value = v19;
  time1.start.epoch = v20;
  time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    if ((buf.start.flags & 1) != 0)
    {
      v12 = 0;
      if ((buf.duration.flags & 1) != 0 && !buf.duration.epoch && (buf.duration.value & 0x8000000000000000) == 0)
      {
        time1 = buf;
        CMTimeRangeGetEnd(&v17, &time1);
        *(_OWORD *)&time1.start.value = v19;
        time1.start.epoch = v20;
        v12 = CMTimeCompare(&time1.start, &v17) >= 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_11:

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PXVideoSession__updateAtBeginningOrEndWithPlayerItemDuration_success_error___block_invoke;
  v13[3] = &unk_1E5140158;
  v13[4] = self;
  v14 = v11;
  v15 = v12;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v13);

}

- (void)_updateBuffering
{
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "currentItemIsLikelyToKeepUp");
  v4 = objc_msgSend(v7, "currentItemPlaybackBufferFull");
  objc_msgSend(v7, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (v3 | v4) ^ 1u;
  else
    v6 = 0;

  -[PXVideoSession setBuffering:](self, "setBuffering:", v6);
}

- (void)_updateStalled
{
  int64_t v3;
  int64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v3 = -[PXVideoSession desiredPlayState](self, "desiredPlayState");
  v4 = -[PXVideoSession playState](self, "playState");
  v5 = !-[PXVideoSession isPlayerTimeAdvancing](self, "isPlayerTimeAdvancing");
  if (v4 != 4)
    v5 = 0;
  if (v4 == 1)
    v6 = 1;
  else
    v6 = v5;
  if (v3 == 1)
    v7 = v6;
  else
    v7 = 0;
  -[PXVideoSession setStalled:](self, "setStalled:", v7);
}

- (void)_updatePlayerItem
{
  _QWORD v3[5];

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXVideoSession__updatePlayerItem__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXVideoSession _performChanges:](self, "_performChanges:", v3);
}

- (void)_updatePlayerItemInPlayer
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v8 = 0;
    -[PXVideoSession videoPlayer](self, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    goto LABEL_7;
  }
  if (self->_updateQueue_didFinishInitializingAudioSession)
  {
    v8 = v3;
    v4 = -[PXVideoSession isLoopingEnabled](self, "isLoopingEnabled");
    -[PXVideoSession videoPlayer](self, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setLoopingEnabled:withTemplateItem:", 1, v8);
LABEL_8:

      v3 = v8;
      goto LABEL_9;
    }
    v7 = v8;
LABEL_7:
    objc_msgSend(v5, "replaceCurrentItemWithPlayerItem:", v7);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_updateVolumeAnimator
{
  NSObject *stateQueue;
  _QWORD block[7];
  _QWORD v5[3];
  char v6;
  _QWORD v7[3];
  int v8;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = v7;
  block[6] = v5;
  dispatch_sync(stateQueue, block);
  px_dispatch_on_main_queue();
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

- (void)_updatePlayerVolume
{
  int v3;
  void *v4;
  double v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PXVideoSession__updatePlayerVolume__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(MEMORY[0x1E0C80D38], v6);
  v3 = *((_DWORD *)v8 + 6);
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v3;
  objc_msgSend(v4, "setVolume:", v5);

  _Block_object_dispose(&v7, 8);
}

- (void)_updateReadyForSeeking
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "status") == 1)
  {
    objc_msgSend(v5, "currentItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "status") == 1;

  }
  else
  {
    v4 = 0;
  }
  -[PXVideoSession setIsReadyForSeeking:](self, "setIsReadyForSeeking:", v4);

}

- (void)_updatePlayState
{
  void *v3;
  void *v4;
  void *v5;
  NSError *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSError *error;
  int64_t v24;
  int v25;
  PXVideoSession *v26;
  __int16 v27;
  NSError *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession contentProvider](self, "contentProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[PXVideoSession contentProvider](self, "contentProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      -[PXVideoSession contentProvider](self, "contentProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loadingResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXVideoSessionErrorDomain"), 1, v15, CFSTR("Video loading failed"));
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();

      PLVideoPlaybackGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        v25 = 138412546;
        v26 = self;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v25, 0x16u);
      }
LABEL_21:
      v8 = 5;
      goto LABEL_22;
    }
  }
  if (!-[PXVideoSession isPlayable](self, "isPlayable")
    && -[PXVideoSession desiredPlayState](self, "desiredPlayState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXVideoSessionErrorDomain"), 2, 0, CFSTR("Video is not playable on this device"));
    v6 = (NSError *)objc_claimAutoreleasedReturnValue();
    PLVideoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_21;
  }
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[PXVideoSession isUpdatingAudioSession](self, "isUpdatingAudioSession"))
  {
    v6 = 0;
    v8 = 1;
    goto LABEL_22;
  }
  v16 = -[NSObject status](v7, "status");
  if (v16 == 2)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    -[NSObject error](v7, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXVideoSessionErrorDomain"), 2, v18, CFSTR("AVPlayer state == PXVideoSessionActualPlayStateFailed"));
    v6 = (NSError *)objc_claimAutoreleasedReturnValue();

    PLVideoPlaybackGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_20;
  }
  if (v16 != 1)
  {
    v6 = 0;
    v8 = v16 == 0;
    goto LABEL_22;
  }
  if (-[NSObject currentItemStatus](v7, "currentItemStatus") == 2)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    -[NSObject currentItem](v7, "currentItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXVideoSessionErrorDomain"), 2, v22, CFSTR("AVPlayerItem status == AVPlayerItemStatusFailed"));
    v6 = (NSError *)objc_claimAutoreleasedReturnValue();

    PLVideoPlaybackGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v25, 0x16u);
    }
LABEL_20:

    goto LABEL_21;
  }
  v24 = -[PXVideoSession desiredPlayState](self, "desiredPlayState");
  if (v24 == 1)
  {
    v6 = 0;
    if (-[PXVideoSession isBuffering](self, "isBuffering"))
      v8 = 4;
    else
      v8 = 3;
  }
  else
  {
    v6 = 0;
    if (v24)
      v8 = 0;
    else
      v8 = 2;
  }
LABEL_22:

  error = self->_error;
  self->_error = v6;

  -[PXVideoSession setPlayState:](self, "setPlayState:", v8);
}

- (void)_updateCurrentPlayerItem
{
  void *v3;
  id v4;

  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoSession setCurrentPlayerItem:](self, "setCurrentPlayerItem:", v3);

}

- (void)_updateAVPlayerPlayState
{
  int64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXVideoSession playState](self, "playState");
  if (v4 == 2)
  {
    objc_msgSend(v8, "pause");
LABEL_7:
    v5 = v8;
    goto LABEL_8;
  }
  if (v4 == 3)
  {
    -[PXVideoPlaybackReporter reportPlaybackBegan](self->_playbackReporter, "reportPlaybackBegan");
    -[PXVideoSession desiredPlaybackRate](self, "desiredPlaybackRate");
    *(float *)&v7 = v7;
    objc_msgSend(v8, "setRate:", v7);
    goto LABEL_7;
  }
  v5 = v8;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 2447, CFSTR("unknown play state"));

    abort();
  }
LABEL_8:

}

- (void)_removeAllVideoOutputs
{
  void *v3;
  NSObject *videoWorkQueue;
  id v5;
  _QWORD block[4];
  id v7;

  -[PXVideoSession _relinquishAny4k60StreamAllowance](self, "_relinquishAny4k60StreamAllowance");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  videoWorkQueue = self->_videoWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXVideoSession__removeAllVideoOutputs__block_invoke;
  block[3] = &unk_1E5149198;
  v7 = v3;
  v5 = v3;
  dispatch_async(videoWorkQueue, block);

}

- (void)_updateQueue_seekToPlaybackTimeRangeStartIfNeeded
{
  void *v3;
  CMTime *v4;
  CFAbsoluteTime Current;
  CMTime v6;
  _QWORD v7[4];
  id v8[2];
  CMTime v9;
  id location;
  CMTimeRange range;
  CMTime time;
  CMTime v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[PXVideoSession _assertOnUpdateQueue](self, "_assertOnUpdateQueue");
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (-[PXVideoSession playState](self, "playState") != 3 || -[PXVideoSession isAtEnd](self, "isAtEnd")))
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    -[PXVideoSession playbackTimeRange](self, "playbackTimeRange");
    v14 = 0;
    v15 = 0;
    v16 = 0;
    -[PXVideoSession playbackStartTime](self, "playbackStartTime");
    memset(&v13, 0, sizeof(v13));
    v4 = (CMTime *)MEMORY[0x1E0CA2E68];
    v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    ++self->_updateQueue_pendingPlayerItemSeekCount;
    Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__PXVideoSession__updateQueue_seekToPlaybackTimeRangeStartIfNeeded__block_invoke;
    v7[3] = &unk_1E51401F8;
    v8[1] = *(id *)&Current;
    v9 = v13;
    objc_copyWeak(v8, &location);
    range.start = v13;
    time = *v4;
    v6 = time;
    objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &range, &time, &v6, v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }

}

- (void)_handlePlayerItemSeekDidFinish
{
  NSObject *updateQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  updateQueue = self->_updateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PXVideoSession__handlePlayerItemSeekDidFinish__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(updateQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateQueue_decrementPendingPlayerItemSeekCount
{
  --self->_updateQueue_pendingPlayerItemSeekCount;
}

- (void)_handleDidReachPlaybackTimeRangeEnd
{
  -[PXVideoSession playbackTimeRange](self, "playbackTimeRange");
}

- (id)_playbackStateDescription
{
  int64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v25;
  __CFString *v26;
  _BOOL4 v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;

  v3 = -[PXVideoSession desiredPlayState](self, "desiredPlayState");
  v4 = -[PXVideoSession playState](self, "playState");
  if (v4 > 5)
    v26 = 0;
  else
    v26 = off_1E5140238[v4];
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");
  if (v6 > 2)
    v25 = 0;
  else
    v25 = off_1E5140268[v6];
  v27 = -[PXVideoSession isBuffering](self, "isBuffering");
  v7 = -[PXVideoSession isPlayerTimeAdvancing](self, "isPlayerTimeAdvancing");
  v8 = -[PXVideoSession isStalled](self, "isStalled");
  memset(&v30, 0, sizeof(v30));
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "currentTime");
  else
    memset(&v30, 0, sizeof(v30));

  memset(&v29, 0, sizeof(v29));
  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "currentItemDuration");
  else
    memset(&v29, 0, sizeof(v29));
  v13 = CFSTR("▶︎");
  if (v3 != 1)
    v13 = 0;
  if (v3)
    v14 = v13;
  else
    v14 = CFSTR("‖");

  v15 = objc_msgSend(v5, "currentItemIsLikelyToKeepUp");
  v16 = objc_msgSend(v5, "currentItemPlaybackBufferFull");
  v17 = objc_msgSend(v5, "currentItemPlaybackBufferEmpty");
  objc_msgSend(v5, "rate");
  v18 = (void *)MEMORY[0x1E0CB3940];
  v20 = v19;
  v28 = v30;
  __43__PXVideoSession__playbackStateDescription__block_invoke(&v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v29;
  __43__PXVideoSession__playbackStateDescription__block_invoke(&v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %@ %@ b%i a%i s%i l%i f%i e%i r%.1f %@/%@"), v14, v26, v25, v27, v7, v8, v15, v16, v17, *(_QWORD *)&v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)_loadAssetTracksIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PXVideoSession playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("tracks"), 0) == 2)
    {
      -[PXVideoSession _handleAssetTracksDidLoadForAsset:](self, "_handleAssetTracksDidLoadForAsset:", v4);
    }
    else
    {
      objc_initWeak(&location, v4);
      objc_initWeak(&from, self);
      v11[0] = CFSTR("tracks");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __42__PXVideoSession__loadAssetTracksIfNeeded__block_invoke;
      v6[3] = &unk_1E5144DF8;
      objc_copyWeak(&v7, &from);
      objc_copyWeak(&v8, &location);
      objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", v5, v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleAssetTracksDidLoadForAsset:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXVideoSession *v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke;
    v7[3] = &unk_1E5144868;
    v8 = v5;
    v9 = self;
    v6 = v5;
    -[PXVideoSession _performChanges:](self, "_performChanges:", v7);

  }
}

- (NSString)description
{
  id v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXVideoSession contentProvider](self, "contentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Content Provider: %@\n"), v4);

  v5 = -[PXVideoSession desiredPlayState](self, "desiredPlayState");
  v6 = CFSTR("Playing");
  if (v5 != 1)
    v6 = 0;
  if (!v5)
    v6 = CFSTR("Paused");
  objc_msgSend(v3, "appendFormat:", CFSTR("Desired Play State: %@\n"), v6);
  v7 = -[PXVideoSession playState](self, "playState");
  v8 = 0;
  if (v7 <= 5)
    v8 = off_1E5140280[v7];
  objc_msgSend(v3, "appendFormat:", CFSTR("Play State: %@\n"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("Stalled: %i\n"), -[PXVideoSession isStalled](self, "isStalled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("At Beginning: %i End: %i\n"), -[PXVideoSession isAtBeginning](self, "isAtBeginning"), -[PXVideoSession isAtEnd](self, "isAtEnd"));
  -[PXVideoSession _playbackStateDescription](self, "_playbackStateDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Playback: %@\n"), v9);

  -[PXVideoSession videoOutput](self, "videoOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("VideoOutput: %@\n"), v10);

  if (self->_stateQueue_obtainedFirstPixelBuffer)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v3, "appendFormat:", CFSTR("Got First Pixel Buffer: %@\n"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("Pixel Buffer Frame Drops: %ld"), -[PXVideoSession pixelBufferFrameDropsCount](self, "pixelBufferFrameDropsCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tBuffering: %i\n"), -[PXVideoSession isBuffering](self, "isBuffering"));
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_stringByIndentingNewLines");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %p> {\n\t%@}"), v15, self, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (NSString)debugDetailedDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  -[PXVideoSession description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXVideoSession videoPlayer](self, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tAVPlayer: %@"), v5);

  -[PXVideoSession playerItem](self, "playerItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\tPlayer Item: %@"), v6);
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tisPlaybackBufferEmpty: %i"), objc_msgSend(v7, "isPlaybackBufferEmpty"));
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tisPlaybackBufferFull: %i"), objc_msgSend(v7, "isPlaybackBufferFull"));
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tisPlaybackLikelyToKeepUp: %i"), objc_msgSend(v7, "isPlaybackLikelyToKeepUp"));
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\tPlayer Item: None"), v9);
  }

  return (NSString *)v4;
}

- (NSString)statusDescription
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[PXVideoSession contentProvider](self, "contentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultDebugDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("Video Not Loaded");
  v6 = v4;

  return v6;
}

- (BOOL)_isOnUpdateQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_updateQueueIdentifier;
}

- (void)_assertOnUpdateQueue
{
  id v4;

  if (!-[PXVideoSession _isOnUpdateQueue](self, "_isOnUpdateQueue"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSession.m"), 2681, CFSTR("Expected %s to be called on the update queue"), "-[PXVideoSession _assertOnUpdateQueue]");

  }
}

- (void)_performBlockOnUpdateQueue:(id)a3
{
  void (**block)(void);

  block = (void (**)(void))a3;
  if (-[PXVideoSession _isOnUpdateQueue](self, "_isOnUpdateQueue"))
    block[2]();
  else
    dispatch_async((dispatch_queue_t)self->_updateQueue, block);

}

- (PXVideoSessionDelegate)delegate
{
  return (PXVideoSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXVideoContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setCurrentTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_currentTime.value = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = var3;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (BOOL)isUpdatingAudioSession
{
  return self->_isUpdatingAudioSession;
}

- (BOOL)isExpectingVideoView
{
  return self->_isExpectingVideoView;
}

- (PXPhotosensitivityProcessing)photoSensitivityProcessing
{
  return self->_photoSensitivityProcessing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoSensitivityProcessing, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainQueue_displayLink, 0);
  objc_storeStrong((id *)&self->_mainQueue_volumeAnimator, 0);
  objc_storeStrong((id *)&self->_playbackReporter, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSession, 0);
  objc_storeStrong(&self->_stateQueue_playerTimeObservationToken, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoPlayer, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoOutputReadyLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_readyForSeekingLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_isPlayableLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_stateQueue_playerItem, 0);
  objc_storeStrong((id *)&self->_stateQueue_currentPlayerItem, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoOutput, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSessionMode, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSessionCategory, 0);
  objc_storeStrong(&self->_stateQueue_playbackTimeRangeEndBoundaryObserver, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferPausedOutputTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferOutputSizesByTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferOutputTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_presentationStatesByContext, 0);
  objc_storeStrong((id *)&self->_mainQueue_videoViewQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_videoWorkQueue, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_playerTimeAdvancementTimer, 0);
}

void __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("preferredTransform"), 0) == 2
    && objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("naturalSize"), 0) == 2
    && objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("nominalFrameRate"), 0) == 2)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 688) & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _handleAssetTracksDidLoadForAsset:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 2630, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680) |= 0x10uLL;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v4 = *(void **)(a1 + 32);
    v11[0] = CFSTR("preferredTransform");
    v11[1] = CFSTR("naturalSize");
    v11[2] = CFSTR("nominalFrameRate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke_2;
    v8[3] = &unk_1E5148D30;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTrackGeometryDidLoad");

}

void __42__PXVideoSession__loadAssetTracksIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAssetTracksDidLoadForAsset:", v2);

}

__CFString *__43__PXVideoSession__playbackStateDescription__block_invoke(CMTime *a1)
{
  __CFString *v1;
  CMTime time;

  if ((a1->flags & 0x1D) == 1)
  {
    time = *a1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f"), CMTimeGetSeconds(&time));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("?");
  }
  return v1;
}

void __48__PXVideoSession__handlePlayerItemSeekDidFinish__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateQueue_decrementPendingPlayerItemSeekCount");

}

void __67__PXVideoSession__updateQueue_seekToPlaybackTimeRangeStartIfNeeded__block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  NSObject *v4;
  Float64 Seconds;
  id WeakRetained;
  CMTime v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(double *)(a1 + 40);
  PLVideoPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(CMTime *)(a1 + 48);
    Seconds = CMTimeGetSeconds(&v7);
    LODWORD(v7.value) = 134218240;
    *(Float64 *)((char *)&v7.value + 4) = Seconds;
    LOWORD(v7.flags) = 2048;
    *(double *)((char *)&v7.flags + 2) = Current - v3;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Seeked to start time %.2f in %f seconds", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlayerItemSeekDidFinish");

}

void __40__PXVideoSession__removeAllVideoOutputs__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PXVideoSession__removeAllVideoOutputs__block_invoke_2;
  v3[3] = &unk_1E51401D0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __40__PXVideoSession__removeAllVideoOutputs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDelegate:queue:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "removeOutput:", v3);

}

float __37__PXVideoSession__updatePlayerVolume__block_invoke(uint64_t a1)
{
  double v2;
  float result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "presentationValue");
  result = v2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

float __39__PXVideoSession__updateVolumeAnimator__block_invoke(_QWORD *a1)
{
  float result;

  result = *(float *)(a1[4] + 476);
  *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 480);
  return result;
}

void __39__PXVideoSession__updateVolumeAnimator__block_invoke_2(_QWORD *a1)
{
  void *v1;
  _QWORD v2[5];
  _QWORD v3[5];

  v1 = *(void **)(a1[4] + 760);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke_3;
    v3[3] = &unk_1E5140180;
    v3[4] = a1[6];
    objc_msgSend(v1, "performChangesWithDuration:curve:changes:", 2, v3, 0.25);
  }
  else
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke_4;
    v2[3] = &unk_1E5140180;
    v2[4] = a1[6];
    objc_msgSend(v1, "performChangesWithoutAnimation:", v2);
  }
  kdebug_trace();

}

uint64_t __39__PXVideoSession__updateVolumeAnimator__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __39__PXVideoSession__updateVolumeAnimator__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __35__PXVideoSession__updatePlayerItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "contentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  objc_msgSend(v3, "timeRangeMapper", v7, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerItem:segmentTimeRangeOfOriginalVideo:timeRangeMapper:", v5, &v7, v6);

}

uint64_t __78__PXVideoSession__updateAtBeginningOrEndWithPlayerItemDuration_success_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAtBeginning:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setAtEnd:", *(unsigned __int8 *)(a1 + 41));
}

void __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke(uint64_t a1, __int128 *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  __int128 v9;
  uint64_t v10;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = *a2;
  v10 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_updateAtBeginningOrEndWithPlayerItemDuration:success:error:", &v9, a3, v7);

}

uint64_t __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAtBeginning:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setAtEnd:", 0);
}

uint64_t __38__PXVideoSession_setNominalFrameRate___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 552) != v2)
  {
    *(float *)(v1 + 552) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

float __34__PXVideoSession_nominalFrameRate__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 552);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

__n128 __33__PXVideoSession_setNaturalSize___block_invoke(__n128 *a1)
{
  __n128 *v1;
  __n128 result;
  __n128 *v3;

  v1 = a1 + 3;
  result.n128_u64[0] = a1[3].n128_u64[0];
  v3 = (__n128 *)(a1[2].n128_u64[0] + 536);
  if (v3->n128_f64[0] != result.n128_f64[0] || *(double *)(a1[2].n128_u64[0] + 544) != a1[3].n128_f64[1])
  {
    result = *v1;
    *v3 = *v1;
    *(_BYTE *)(*(_QWORD *)(a1[2].n128_u64[1] + 8) + 24) = 1;
  }
  return result;
}

__n128 __29__PXVideoSession_naturalSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 536);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

__n128 __40__PXVideoSession_setPreferredTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t1;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 + 488;
  v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 80);
  v5 = *(_OWORD *)(v2 + 488);
  v6 = *(_OWORD *)(v2 + 520);
  *(_OWORD *)&v9.c = *(_OWORD *)(v2 + 504);
  *(_OWORD *)&v9.tx = v6;
  *(_OWORD *)&v9.a = v5;
  if (!CGAffineTransformEqualToTransform(&t1, &v9))
  {
    result = *(__n128 *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v3 + 32) = v8;
    *(__n128 *)v3 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

__n128 __36__PXVideoSession_preferredTransform__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 504);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 520);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 488);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredTransform:", v3);
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setNominalFrameRate:", a2);
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setPreferredTransform:", v6);
  LODWORD(v4) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setNominalFrameRate:", v4);
}

uint64_t __38__PXVideoSession__updateTrackGeometry__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setPreferredTransform:", v5);
  objc_msgSend(*(id *)(a1 + 40), "renderSize");
  return objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:");
}

void __38__PXVideoSession__updateTrackGeometry__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_videoQueue_updateTrackGeometryWithPlayerItem:", *(_QWORD *)(a1 + 32));

}

uint64_t __36__PXVideoSession__updateAudioStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAudioStatus:", *(_QWORD *)(a1 + 40));
}

void __43__PXVideoSession__setPlayabilityFromAsset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPlayable:", *(unsigned __int8 *)(a1 + 48));
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlayState:", 5);
    PLVideoPlaybackGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Attempted to play unplayable video asset: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __52__PXVideoSession__handlePlayabilityDidLoadForAsset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPlayState:", 5);
  PLVideoPlaybackGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Failed to load playable status of video %@: %@", (uint8_t *)&v5, 0x16u);
  }

}

void __36__PXVideoSession__updatePlayability__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePlayabilityDidLoadForAsset:", v2);

}

uint64_t __52__PXVideoSession__handlePlayerTimeAdvancementTimer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  CMTimeFlags v6;
  CMTimeEpoch v7;
  __int128 v8;
  CMTime time2;
  CMTime time1;
  CMTime v12;
  CMTimeValue v13;
  CMTimeScale v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&v12, 0, sizeof(v12));
  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "currentTime");
  else
    memset(&v12, 0, sizeof(v12));

  v4 = 0;
  v5 = *(_QWORD *)(a1 + 32) + 716;
  v13 = *(_QWORD *)v5;
  v6 = *(_DWORD *)(v5 + 12);
  v14 = *(_DWORD *)(v5 + 8);
  v7 = *(_QWORD *)(v5 + 16);
  v8 = *(_OWORD *)&v12.value;
  *(_QWORD *)(v5 + 16) = v12.epoch;
  *(_OWORD *)v5 = v8;
  if ((v12.flags & 0x1D) == 1 && (v6 & 0x1D) == 1)
  {
    time1 = v12;
    time2.value = v13;
    time2.timescale = v14;
    time2.flags = v6;
    time2.epoch = v7;
    v4 = CMTimeCompare(&time1, &time2) > 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerTimeAdvancing:", v4);
}

void __41__PXVideoSession__avPlayerTimeDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  __int128 v9;
  uint64_t v10;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _avPlayerTimeDidChange:]_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXVideoSession.m"), 2052, CFSTR("invalidating %lu after it already has been updated"), 256);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x100uLL;
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 128);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession__avPlayerTimeDidChange___block_invoke_2;
  block[3] = &unk_1E51446C8;
  block[4] = v4;
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  dispatch_async(v5, block);

}

__n128 __41__PXVideoSession__avPlayerTimeDidChange___block_invoke_2(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 588);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

void __45__PXVideoSession__handleTrackGeometryDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _handleTrackGeometryDidLoad]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 2045, CFSTR("invalidating %lu after it already has been updated"), 16);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x10uLL;

}

void __40__PXVideoSession_pixelBufferOutputSizes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __45__PXVideoSession_pixelBufferOutputTokenCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __27__PXVideoSession_setAtEnd___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 482))
  {
    *(_BYTE *)(v2 + 482) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __25__PXVideoSession_isAtEnd__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 482);
  return result;
}

uint64_t __33__PXVideoSession_setAtBeginning___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 483))
  {
    *(_BYTE *)(v2 + 483) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __31__PXVideoSession_isAtBeginning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 483);
  return result;
}

_QWORD *__38__PXVideoSession_setDesiredPlayState___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 248);
  if (result[7] != *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    *(_QWORD *)(result[4] + 248) = result[7];
  }
  return result;
}

void __38__PXVideoSession_setDesiredPlayState___block_invoke_252(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "logContext");
      *(_DWORD *)buf = 134217984;
      v21 = v7;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  v8 = v4;
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "logContext");
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218240;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  v13 = v8;
  v14 = os_signpost_id_make_with_pointer(v13, *(const void **)(a1 + 32));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      v16 = objc_msgSend(*(id *)(a1 + 32), "logContext");
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218240;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) & 0xC0) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setDesiredPlayState:]_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXVideoSession.m"), 1978, CFSTR("invalidating %lu after it already has been updated"), 192);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0xC0uLL;

}

uint64_t __34__PXVideoSession_desiredPlayState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 248);
  return result;
}

_QWORD *__31__PXVideoSession_setPlayState___block_invoke(_QWORD *result)
{
  if (result[7] != *(_QWORD *)(result[4] + 200))
  {
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 200);
    *(_QWORD *)(result[4] + 200) = result[7];
  }
  return result;
}

uint64_t __27__PXVideoSession_playState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 200);
  return result;
}

uint64_t __39__PXVideoSession_setIsReadyForSeeking___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 584))
  {
    *(_BYTE *)(v2 + 584) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    if (*(_BYTE *)(result + 48))
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 624), "unlock");
  }
  return result;
}

uint64_t __35__PXVideoSession_isReadyForSeeking__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 584);
  return result;
}

uint64_t __31__PXVideoSession_setBuffering___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 241))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 241) = *(_BYTE *)(result + 48);
  }
  return result;
}

uint64_t __29__PXVideoSession_isBuffering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 241);
  return result;
}

uint64_t __29__PXVideoSession_setStalled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 401))
  {
    *(_BYTE *)(v2 + 401) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __27__PXVideoSession_isStalled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 401);
  return result;
}

uint64_t __30__PXVideoSession_setPlayable___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 400))
  {
    *(_BYTE *)(v2 + 400) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 616), "unlock");
}

uint64_t __28__PXVideoSession_isPlayable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 400);
  return result;
}

__n128 __49__PXVideoSession_segmentTimeRangeOfOriginalVideo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 368);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 384);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 352);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

void __80__PXVideoSession_setPlayerItem_segmentTimeRangeOfOriginalVideo_timeRangeMapper___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;

  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 336))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 336), *(id *)(a1 + 32));
    v2 = (_OWORD *)(*(_QWORD *)(a1 + 40) + 352);
    v4 = *(_OWORD *)(a1 + 80);
    v3 = *(_OWORD *)(a1 + 96);
    *v2 = *(_OWORD *)(a1 + 64);
    v2[1] = v4;
    v2[2] = v3;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 344), *(id *)(a1 + 48));
  }
}

void __33__PXVideoSession_timeRangeMapper__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 344));
}

void __28__PXVideoSession_playerItem__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 336));
}

_QWORD *__33__PXVideoSession_setAudioStatus___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[6];
  v2 = result[4];
  if (v1 != *(_QWORD *)(v2 + 328))
  {
    *(_QWORD *)(v2 + 328) = v1;
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __29__PXVideoSession_audioStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 328);
  return result;
}

uint64_t __41__PXVideoSession_setPlayerTimeAdvancing___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 320))
  {
    *(_BYTE *)(v2 + 320) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __39__PXVideoSession_isPlayerTimeAdvancing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 320);
  return result;
}

uint64_t __42__PXVideoSession_setSeekToBeginningAtEnd___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 481) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __41__PXVideoSession_seekToPlaybackStartTime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateQueue_seekToPlaybackTimeRangeStartIfNeeded");
}

uint64_t __38__PXVideoSession_seekToBeginningAtEnd__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 481);
  return result;
}

__n128 __35__PXVideoSession_playbackStartTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 452);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 468);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

__n128 __39__PXVideoSession_setPlaybackStartTime___block_invoke(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 452);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

__n128 __39__PXVideoSession_setPlaybackTimeRange___block_invoke(uint64_t a1)
{
  __int128 *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  uint64_t v7;
  __int128 v8;
  CMTimeRange v9;
  CMTimeRange range1;

  v2 = (__int128 *)(*(_QWORD *)(a1 + 32) + 404);
  v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range1.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range1.start.epoch = v3;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)(a1 + 80);
  v4 = *v2;
  v5 = v2[2];
  *(_OWORD *)&v9.start.epoch = v2[1];
  *(_OWORD *)&v9.duration.timescale = v5;
  *(_OWORD *)&v9.start.value = v4;
  if (!CMTimeRangeEqual(&range1, &v9))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = *(_QWORD *)(a1 + 32) + 404;
    result = *(__n128 *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v7 + 32) = v8;
    *(__n128 *)v7 = result;
  }
  return result;
}

void __39__PXVideoSession_setPlaybackTimeRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CMTimeRange range;
  CMTime v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateQueue_seekToPlaybackTimeRangeStartIfNeeded");
  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 80);
  CMTimeRangeGetEnd(&v14, &range);
  objc_msgSend(v4, "valueWithCMTime:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)&range, *(id *)(a1 + 32));
  v7 = *(void **)(a1 + 40);
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke_3;
  v11[3] = &unk_1E5148D30;
  objc_copyWeak(&v12, (id *)&range);
  v10 = (id)objc_msgSend(v7, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v8, v9, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&range);

}

void __39__PXVideoSession_setPlaybackTimeRange___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidReachPlaybackTimeRangeEnd");

}

__n128 __35__PXVideoSession_playbackTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 420);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 436);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 404);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

uint64_t __36__PXVideoSession_setLoopingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 402) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __34__PXVideoSession_isLoopingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 402);
  return result;
}

float __24__PXVideoSession_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 476);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

float __37__PXVideoSession_setVolume_withFade___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  NSObject *v4;
  double v5;
  double v6;
  int v7;
  int v8;
  double v9;
  __int16 v10;
  double v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  result = *(float *)(v2 + 476);
  if (result != *(float *)(a1 + 48) || *(unsigned __int8 *)(v2 + 480) != *(unsigned __int8 *)(a1 + 52))
  {
    PLVideoPlaybackGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(float *)(*(_QWORD *)(a1 + 32) + 476);
      v6 = *(float *)(a1 + 48);
      v7 = *(unsigned __int8 *)(a1 + 52);
      v8 = 134218496;
      v9 = v5;
      v10 = 2048;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Beginning volume change from %f to %f. Will fade: %d", (uint8_t *)&v8, 0x1Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    result = *(float *)(a1 + 48);
    *(float *)(*(_QWORD *)(a1 + 32) + 476) = result;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 480) = *(_BYTE *)(a1 + 52);
  }
  return result;
}

void __37__PXVideoSession_setVolume_withFade___block_invoke_247(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setVolume:withFade:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 1621, CFSTR("invalidating %lu after it already has been updated"), 0x4000);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x4000uLL;

}

uint64_t __42__PXVideoSession_setUpdatingAudioSession___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 240) != v2)
  {
    *(_BYTE *)(v1 + 240) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __42__PXVideoSession_setUpdatingAudioSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession setUpdatingAudioSession:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 1604, CFSTR("invalidating %lu after it already has been updated"), 64);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x40uLL;

}

__n128 __29__PXVideoSession_currentTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 588);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 604);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

void __39__PXVideoSession_setCurrentPlayerItem___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v1 = *(void **)(*(_QWORD *)(a1 + 40) + 312);
  if (*(void **)(a1 + 32) != v1)
  {
    v3 = v1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 312), *(id *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 256);
    if (v4)
    {
      v5 = v4;
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 128);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __39__PXVideoSession_setCurrentPlayerItem___block_invoke_2;
      v8[3] = &unk_1E5148D08;
      v9 = v3;
      v10 = v5;
      v7 = v5;
      dispatch_async(v6, v8);

    }
  }
}

uint64_t __39__PXVideoSession_setCurrentPlayerItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeOutput:", *(_QWORD *)(a1 + 40));
}

void __35__PXVideoSession_currentPlayerItem__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

__n128 __35__PXVideoSession_setVideoDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __n128 result;
  __n128 *v5;
  CMTime v6;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 32) + 284;
  time1 = *(CMTime *)(a1 + 48);
  v3 = *(_OWORD *)v2;
  v6.epoch = *(_QWORD *)(v2 + 16);
  *(_OWORD *)&v6.value = v3;
  if (CMTimeCompare(&time1, &v6))
  {
    v5 = (__n128 *)(*(_QWORD *)(a1 + 32) + 284);
    result = *(__n128 *)(a1 + 48);
    v5[1].n128_u64[0] = *(_QWORD *)(a1 + 64);
    *v5 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

__n128 __31__PXVideoSession_videoDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 284);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 300);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __40__PXVideoSession_setIsVideoOutputReady___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 280))
  {
    *(_BYTE *)(v2 + 280) = v1;
    if (*(_BYTE *)(result + 40))
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 632), "unlock");
  }
  return result;
}

uint64_t __36__PXVideoSession_isVideoOutputReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 280);
  return result;
}

void __38__PXVideoSession_setVideoOutput_size___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  if (v1 != *(void **)(a1 + 40))
  {
    v3 = v1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), *(id *)(a1 + 40));
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 264) = *(_OWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "logContext");
        NSStringFromCGSize(*(CGSize *)(a1 + 48));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_EVENT, v6, "PXVideoSessionCreatedVideoOutput", "Context=%{signpost.telemetry:string2}lu outputSize=%@", buf, 0x16u);

      }
    }

    if (v3)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke_244;
      v9[3] = &unk_1E5148D08;
      v9[4] = *(_QWORD *)(a1 + 32);
      v10 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v9);

    }
  }
}

void __38__PXVideoSession_setVideoOutput_size___block_invoke_244(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 128);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke_2;
  block[3] = &unk_1E5149198;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __38__PXVideoSession_setVideoOutput_size___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hash");
}

__n128 __33__PXVideoSession_videoOutputSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 264);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

void __29__PXVideoSession_videoOutput__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

uint64_t __53__PXVideoSession_incrementPixelBufferFrameDropsCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 576);
  return result;
}

uint64_t __44__PXVideoSession_pixelBufferFrameDropsCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 576);
  return result;
}

void __40__PXVideoSession_setCurrentPixelBuffer___block_invoke(uint64_t a1)
{
  __CVBuffer *v2;
  __CVBuffer *v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(__CVBuffer **)(a1 + 48);
  v3 = *(__CVBuffer **)(*(_QWORD *)(a1 + 32) + 560);
  if (v2 != v3)
  {
    CVPixelBufferRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560) = CVPixelBufferRetain(*(CVPixelBufferRef *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v4 + 568))
    {
      *(_BYTE *)(v4 + 568) = 1;
      objc_msgSend(*(id *)(a1 + 32), "log");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          v8 = objc_msgSend(*(id *)(a1 + 32), "logContext");
          v9 = 134217984;
          v10 = v8;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_EVENT, v7, "PXVideoSessionGotFirstPixelBuffer", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v9, 0xCu);
        }
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

__CVBuffer *__36__PXVideoSession_currentPixelBuffer__block_invoke(uint64_t a1)
{
  __CVBuffer *result;
  CVPixelBufferRef v3;

  result = *(__CVBuffer **)(*(_QWORD *)(a1 + 32) + 560);
  if (result)
  {
    v3 = CVPixelBufferRetain(result);
    result = (__CVBuffer *)CFAutorelease(v3);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __41__PXVideoSession__updateDisplayLinkState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_setDisplayLinkPaused:", *(unsigned __int8 *)(a1 + 40));

}

void __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentPixelBuffer:", *(_QWORD *)(a1 + 40));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
}

uint64_t __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPixelBuffer:", 0);
}

void __69__PXVideoSession__mainQueue_updateCurrentPixelBufferWithVideoOutput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_videoWorkQueue_updateCurrentPixelBufferWithVideoOutput:outputTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void __43__PXVideoSession__updateCurrentPixelBuffer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_mainQueue_updateCurrentPixelBufferWithVideoOutput:", *(_QWORD *)(a1 + 32));

}

void __36__PXVideoSession__updateVideoOutput__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addOutput:toPlayerItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __36__PXVideoSession__updateVideoOutput__block_invoke_2(uint64_t a1)
{
  id v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 768))
  {
    v2 = (id)objc_msgSend(objc_alloc((Class)off_1E50B2330), "initWithWeakTarget:selector:", *(_QWORD *)(a1 + 32), sel__handleDisplayLink_);
    objc_msgSend(v2, "setPaused:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setDisplayLink:", v2);

  }
}

uint64_t __36__PXVideoSession__updateVideoOutput__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setDisplayLink:", 0);
}

void __37__PXVideoSession__handleDisplayLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _handleDisplayLink:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 1177, CFSTR("invalidating %lu after it already has been updated"), 2048);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x800uLL;

}

void __31__PXVideoSession__newVideoView__block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

void __31__PXVideoSession__newVideoView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "videoPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlayer:", v2);

}

void __58__PXVideoSession_setPlaybackTimeRangeEndBoundaryObserver___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 32);
  v2 = (id *)(*(_QWORD *)(a1 + 40) + 192);
  if (v1 != *v2)
    objc_storeStrong(v2, v1);
}

void __54__PXVideoSession_playbackTimeRangeEndBoundaryObserver__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

void __52__PXVideoSession__didFinishInitializingAudioSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 712) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _didFinishInitializingAudioSession]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 1135, CFSTR("invalidating %lu after it already has been updated"), 4096);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x1000uLL;

}

void __59__PXVideoSession__audioSessionQueue_initializeAudioSession__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinishInitializingAudioSession");

}

void __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v2 = 1;
  do
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v2 == 0;
    --v2;
  }
  while (!v9);
}

void __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  objc_msgSend(*(id *)(a1 + 32), "setLoopingEnabled:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isLoopingEnabled"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "volume");
  v4 = v3;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "shouldFadeVolumeChange");
  LODWORD(v6) = v4;
  objc_msgSend(v2, "setVolume:withFade:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "setPreventsSleepDuringVideoPlayback:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "preventsSleepDuringVideoPlayback"));
  objc_msgSend(*(id *)(a1 + 32), "setSeekToBeginningAtEnd:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "seekToBeginningAtEnd"));
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    objc_msgSend(v7, "playbackTimeRange");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }
  v8 = *(void **)(a1 + 32);
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  objc_msgSend(v8, "setPlaybackTimeRange:", v18);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v9, "playbackStartTime");
  }
  else
  {
    v16 = 0uLL;
    v17 = 0;
  }
  v10 = *(void **)(a1 + 32);
  v14 = v16;
  v15 = v17;
  objc_msgSend(v10, "setPlaybackStartTime:", &v14);
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "desiredPlayState"));
  objc_msgSend(*(id *)(a1 + 32), "setAllowsExternalPlayback:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allowsExternalPlayback"));
  objc_msgSend(*(id *)(a1 + 32), "setShouldDisableAutomaticPixelBufferUpdates:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "shouldDisableAutomaticPixelBufferUpdates"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "desiredPlaybackRate");
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlaybackRate:");
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "audioSessionCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "audioSessionMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAudioSessionCategory:mode:routeSharingPolicy:options:", v12, v13, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "audioSessionRouteSharingPolicy"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "audioSessionCategoryOptions"));

}

void __46__PXVideoSession__handleContentLoadingResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[3];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 752), "reportAVAssetCreated");
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 752);
    objc_msgSend(*(id *)(a1 + 32), "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEndpointWithPlayerItem:", v6);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "playerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "timeRange");
    v9 = *(void **)(a1 + 32);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  objc_msgSend(v9, "timeRangeMapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayerItem:segmentTimeRangeOfOriginalVideo:timeRangeMapper:", v8, v13, v10);

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 688) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession _handleContentLoadingResult:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXVideoSession.m"), 1075, CFSTR("invalidating %lu after it already has been updated"), 64);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680) |= 0x40uLL;

}

void __35__PXVideoSession__rebuildAVObjects__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  id v4;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v5[0] = *MEMORY[0x1E0CA2E40];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  objc_msgSend(v2, "setPlayerItem:segmentTimeRangeOfOriginalVideo:timeRangeMapper:", 0, v5, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0D78298]);
  objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", v4);

}

void __47__PXVideoSession_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if ((v4 & 1) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 688) & 0x10040) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXVideoSession.m"), 1015, CFSTR("invalidating %lu after it already has been updated"), 65600);
      goto LABEL_27;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x10040uLL;
  }
  if ((v4 & 4) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 688) & 0x20060) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXVideoSession.m"), 1018, CFSTR("invalidating %lu after it already has been updated"), 131168);
      goto LABEL_27;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x20060uLL;
  }
  if ((v4 & 0x10) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 688) & 0x10054) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXVideoSession.m"), 1021, CFSTR("invalidating %lu after it already has been updated"), 65620);
      goto LABEL_27;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x10054uLL;
  }
  if ((v4 & 0x1C0) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXVideoSession.m"), 1024, CFSTR("invalidating %lu after it already has been updated"), 32);
      goto LABEL_27;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x20uLL;
  }
  if ((v4 & 0x10) != 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) || (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) & 8) == 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 8uLL;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXVideoSession.m"), 1027, CFSTR("invalidating %lu after it already has been updated"), 8);
LABEL_27:

    abort();
  }
LABEL_21:

}

void __47__PXVideoSession_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession observable:didChange:context:]_block_invoke_2");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 1037, CFSTR("invalidating %lu after it already has been updated"), 0x8000);

      abort();
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x8000uLL;
  }

}

void __44__PXVideoSession_outputMediaDataWillChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsVideoOutputReady:", 1);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession outputMediaDataWillChange:]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXVideoSession.m"), 992, CFSTR("invalidating %lu after it already has been updated"), 0x2000);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x2000uLL;

}

id __34__PXVideoSession__performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PXVideoSession;
  return objc_msgSendSuper2(&v3, sel_performChanges_, v1);
}

void __51__PXVideoSession_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateQueue_unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __49__PXVideoSession_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateQueue_registerChangeObserver:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

uint64_t __41__PXVideoSession_setDesiredPlaybackRate___block_invoke(uint64_t result)
{
  double v1;

  v1 = *(double *)(result + 48);
  if (v1 != *(double *)(*(_QWORD *)(result + 32) + 672))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(double *)(*(_QWORD *)(result + 32) + 672) = v1;
  }
  return result;
}

double __37__PXVideoSession_desiredPlaybackRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 672);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __45__PXVideoSession__request4k60StreamAllowance__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PXVideoSessionMaxConcurrent4k60Streams"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = objc_msgSend(v2, "integerValue");
  else
    v1 = 1;
  _request4k60StreamAllowance_maxConcurrent4k60Streams = v1;

}

void __34__PXVideoSession_setAudioSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 664), *(id *)(a1 + 40));
}

void __30__PXVideoSession_audioSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 664));
}

void __33__PXVideoSession_setVideoPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  CMTime v10;
  id location;

  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 648))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "setDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 40), VideoPlayerObservationContext);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "removeTimeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 656));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "replaceCurrentItemWithPlayerItem:", 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 648), *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "registerChangeObserver:context:", *(_QWORD *)(a1 + 40), VideoPlayerObservationContext);
    objc_initWeak(&location, *(id *)(a1 + 40));
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 648);
    CMTimeMake(&v10, 1, 30);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__PXVideoSession_setVideoPlayer___block_invoke_2;
    v8[3] = &unk_1E5143B80;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v2, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v10, v3, v8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 656);
    *(_QWORD *)(v5 + 656) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "setLoopingEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 402));
    v7 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v7 + 664))
      objc_msgSend(*(id *)(v7 + 648), "setWrappedAudioSession:");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __33__PXVideoSession_setVideoPlayer___block_invoke_2(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_avPlayerTimeDidChange:", &v4);

}

void __29__PXVideoSession_videoPlayer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 648));
}

uint64_t __62__PXVideoSession_setShouldDisableAutomaticPixelBufferUpdates___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 640))
  {
    *(_BYTE *)(v2 + 640) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __58__PXVideoSession_shouldDisableAutomaticPixelBufferUpdates__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 640);
  return result;
}

uint64_t __91__PXVideoSession__videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setCurrentPixelBuffer:", *(_QWORD *)(a1 + 40));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __76__PXVideoSession__updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime:completionLock:", &v4, v3);

}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__256351;
  v20 = __Block_byref_object_dispose__256352;
  v21 = 0;
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_2;
  block[3] = &unk_1E513FE38;
  block[5] = a2;
  block[6] = a3;
  block[4] = &v16;
  dispatch_sync(v8, block);
  v9 = (void *)v17[5];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "lockBeforeDate:", v10);

    if ((v11 & 1) == 0)
    {
      PLVideoPlaybackGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(void **)(a1 + 32);
        objc_msgSend(v13, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2114;
        v25 = v7;
        v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%{public}@ waiting for %{public}@ timed out: %{public}@", buf, 0x20u);

      }
    }
  }
  _Block_object_dispose(&v16, 8);

}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_195(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  if (a2 && *(_BYTE *)(a1 + 72))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(WeakRetained, "_updateCurrenPixelBufferAfterSeekingToTime:completionLock:", &v5, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  if (!**(_BYTE **)(a1 + 40) && !**(_QWORD **)(a1 + 48))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lock");
    objc_storeStrong(*(id **)(a1 + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

uint64_t __78__PXVideoSession_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __48__PXVideoSession_audioSessionRouteSharingPolicy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 232);
  return result;
}

void __34__PXVideoSession_audioSessionMode__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 224));
}

void __38__PXVideoSession_audioSessionCategory__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __45__PXVideoSession_audioSessionCategoryOptions__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 216);
  return result;
}

uint64_t __100__PXVideoSession__audioSessionQueue_updateAudioSessionWithCategory_mode_routeSharingPolicy_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUpdatingAudioSession:", 0);
}

void __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 208);
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = v2;
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if (!v6)
    {
LABEL_8:
      v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 208);
      *(_QWORD *)(v9 + 208) = v8;

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) = *(_QWORD *)(a1 + 64);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = *(_QWORD *)(a1 + 72);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 224), *(id *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      return;
    }
  }
  v7 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 64) != v7[27] || *(_QWORD *)(a1 + 48) != v7[28] || *(_QWORD *)(a1 + 72) != v7[29])
    goto LABEL_8;
}

void __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_audioSessionQueue_updateAudioSessionWithCategory:mode:routeSharingPolicy:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 168), "containsObject:", a1[5]);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1[4] + 168), "removeObject:", a1[5]);
    result = objc_msgSend(*(id *)(a1[4] + 176), "setObject:forKeyedSubscript:", 0, a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

void __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 541, CFSTR("invalidating %lu after it already has been updated"), 1024);
    goto LABEL_8;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x400uLL;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 542, CFSTR("invalidating %lu after it already has been updated"), 0x2000);
LABEL_8:

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x2000uLL;

}

void __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 524, CFSTR("invalidating %lu after it already has been updated"), 1024);
    goto LABEL_8;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x400uLL;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 696) && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 689) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXVideoSession requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXVideoSession.m"), 525, CFSTR("invalidating %lu after it already has been updated"), 0x2000);
LABEL_8:

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) |= 0x2000uLL;

}

uint64_t __35__PXVideoSession_recycleVideoView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);
}

void __34__PXVideoSession_prewarmVideoView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = *MEMORY[0x1E0C99748];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:modes:", sel__mainQueue_actuallyPrewarmVideoView, 0, 0, v2);

}

uint64_t __37__PXVideoSession_performFinalCleanup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActive:error:", 0, 0);
}

void __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "presenter") == *(_QWORD *)(a1 + 56))
        break;

      if (++v4 >= (unint64_t)objc_msgSend(v14, "count"))
        goto LABEL_7;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
LABEL_7:
  v8 = v14;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (!v14)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_newPresentationStateFromCurrentWithPresenter:", *(_QWORD *)(a1 + 56));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v14, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v8 = v14;
  }

}

uint64_t __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __53__PXVideoSession_leavePresentationContext_presenter___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v7;

  v2 = *(void **)(a1[4] + 160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "count");
  v4 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "presenter") == a1[7])
      break;

    if (v4++ >= objc_msgSend(v7, "count"))
      goto LABEL_7;
  }
  objc_msgSend(v7, "removeObjectAtIndex:", v4);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;

LABEL_7:
}

void __53__PXVideoSession_enterPresentationContext_presenter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[4];
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    memset(v9, 0, sizeof(v9));
    if (objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", v9, v10, 16)
      && objc_msgSend(**((id **)&v9[0] + 1), "presenter") == *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXVideoSession.m"), 378, CFSTR("Trying to enter same presentation context %ld with same presenter %p time twice"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_newPresentationStateFromCurrentWithPresenter:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

__n128 __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __n128 result;
  __int128 v22;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

  v5 = MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(a1 + 32) + 284;
  *(_OWORD *)v6 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v5 + 16);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 483) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 400) = 1;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 168);
  *(_QWORD *)(v8 + 168) = v7;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 176);
  *(_QWORD *)(v11 + 176) = v10;

  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 184);
  *(_QWORD *)(v14 + 184) = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "loadingResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerItem");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 336);
  *(_QWORD *)(v18 + 336) = v17;

  v20 = *(_QWORD *)(a1 + 32) + 352;
  result = *(__n128 *)(a1 + 72);
  v22 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)v20 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v20 + 16) = v22;
  *(__n128 *)(v20 + 32) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672) = 0x3FF0000000000000;
  return result;
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (*(double *)(a1 + 48) > 0.0)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:");
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D78298]);
    objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", v3);

  }
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), (id)*MEMORY[0x1E0C89660]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), (id)*MEMORY[0x1E0C89748]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_audioSessionQueue_initializeAudioSession");

}

uint64_t __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 760);
  *(_QWORD *)(v3 + 760) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), VolumeAnimatorObservationContext);
}

@end
