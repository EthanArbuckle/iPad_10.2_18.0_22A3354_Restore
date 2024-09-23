@implementation PXGridInlineVideoSessionAssetPlaybackRecord

- (PXGridInlineVideoSessionAssetPlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5 playLivePhotosWithSettlingEffectIfPossible:(BOOL)a6
{
  PXGridInlineVideoSessionAssetPlaybackRecord *v7;
  PXGridInlineVideoSessionAssetPlaybackRecord *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *bufferRequestIdentifier;
  __int128 v17;
  _OWORD v19[3];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXGridInlineVideoSessionAssetPlaybackRecord;
  v7 = -[PXGridInlinePlaybackRecord initWithDisplayAsset:mediaProvider:geometryReference:](&v20, sel_initWithDisplayAsset_mediaProvider_geometryReference_, a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_ivarLock._os_unfair_lock_opaque = 0;
    v7->_playLivePhotosWithSettlingEffectIfPossible = a6;
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8->_playLivePhotosWithSettlingEffectIfPossible)
    {
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("-FRCWallpaper"));
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    bufferRequestIdentifier = v8->_bufferRequestIdentifier;
    v8->_bufferRequestIdentifier = (NSString *)v14;

    if (v8->_playLivePhotosWithSettlingEffectIfPossible)
    {
      v17 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v19[0] = *MEMORY[0x1E0CA2E40];
      v19[1] = v17;
      v19[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      -[PXGridInlinePlaybackRecord setBestVideoTimeRange:](v8, "setBestVideoTimeRange:", v19);
    }
  }
  return v8;
}

- (void)dealloc
{
  os_unfair_lock_s *p_ivarLock;
  __CVBuffer *currentPixelBuffer;
  PXVideoSession *v5;
  void *v6;
  objc_super v7;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  v5 = self->_videoSession;
  os_unfair_lock_unlock(p_ivarLock);
  CVPixelBufferRelease(currentPixelBuffer);
  -[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:](v5, "cancelPixelBufferOutputWithRequestIdentifier:", self->_bufferRequestIdentifier);
  +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInVideoSession:", v5);

  v7.receiver = self;
  v7.super_class = (Class)PXGridInlineVideoSessionAssetPlaybackRecord;
  -[PXGridInlineVideoSessionAssetPlaybackRecord dealloc](&v7, sel_dealloc);
}

- (NSString)videoStatusDescription
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[PXGridInlineVideoSessionAssetPlaybackRecord videoSession](self, "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "statusDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Video Not Loaded");
  }

  return (NSString *)v4;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  self->_desiredPlayState = a3;
  objc_msgSend((id)objc_opt_class(), "videoSessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke;
  v6[3] = &unk_1E5144EB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (BOOL)isPlaying
{
  return -[PXGridInlineVideoSessionAssetPlaybackRecord currentPixelBuffer](self, "currentPixelBuffer") != 0;
}

- (void)prepareForVisible
{
  int64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  if (!self->_playLivePhotosWithSettlingEffectIfPossible)
  {
    v3 = -[PXGridInlineVideoSessionAssetPlaybackRecord desiredPlayState](self, "desiredPlayState");
    objc_msgSend((id)objc_opt_class(), "videoSessionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForVisible__block_invoke;
    v5[3] = &unk_1E5144EB8;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(v4, v5);

  }
}

- (void)prepareForInvisible
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "videoSessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForInvisible__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_videoQueue_ensureVideoSessionWithDesiredPlayState:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  PXVideoSessionManagerDisplayAssetOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _OWORD v14[6];

  -[PXGridInlineVideoSessionAssetPlaybackRecord videoSession](self, "videoSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PXGridInlinePlaybackRecord displayAsset](self, "displayAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "playbackStyle");
    v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
    -[PXVideoSessionManagerDisplayAssetOptions setShouldPlayLivePhotosWithSettlingEffectIfPossible:](v8, "setShouldPlayLivePhotosWithSettlingEffectIfPossible:", self->_playLivePhotosWithSettlingEffectIfPossible);
    -[PXVideoSessionManagerDisplayAssetOptions setShouldStabilizeLivePhotosIfPossible:](v8, "setShouldStabilizeLivePhotosIfPossible:", 1);
    -[PXVideoSessionManagerDisplayAssetOptions setIsAudioAllowed:](v8, "setIsAudioAllowed:", v7 != 3);
    -[PXVideoSessionManagerDisplayAssetOptions setShouldCrossfadeLivePhotosWhenLooping:](v8, "setShouldCrossfadeLivePhotosWhenLooping:", 1);
    -[PXGridInlinePlaybackRecord bestVideoTimeRange](self, "bestVideoTimeRange");
    v14[0] = v14[3];
    v14[1] = v14[4];
    v14[2] = v14[5];
    -[PXVideoSessionManagerDisplayAssetOptions setLivePhotoLoopTimeRange:](v8, "setLivePhotoLoopTimeRange:", v14);
    if (v7 == 5)
      objc_msgSend(MEMORY[0x1E0D78290], "sharedAmbientInstance");
    else
      objc_msgSend(MEMORY[0x1E0D78290], "sharedVideoPlaybackInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoSessionManagerDisplayAssetOptions setAudioSession:](v8, "setAudioSession:", v9);

    +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGridInlinePlaybackRecord displayAsset](self, "displayAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGridInlinePlaybackRecord mediaProvider](self, "mediaProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoSessionForAsset:withOptions:mediaProvider:", v11, v8, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "playbackStyle") != 3)
      objc_msgSend(v5, "prewarmVideoView");
    objc_msgSend(v5, "loadIfNeededWithPriority:", 0);
    objc_msgSend(v5, "registerChangeObserver:context:", self, PXGridInlineVideoSessionAssetPlaybackRecordVideoSessionObservableContext);
    objc_msgSend(v5, "requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:", self->_bufferRequestIdentifier, 1920.0, 1080.0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __98__PXGridInlineVideoSessionAssetPlaybackRecord__videoQueue_ensureVideoSessionWithDesiredPlayState___block_invoke;
    v13[3] = &unk_1E511DBA8;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend(v5, "performChanges:withPresentationContext:presenter:", v13, 0, 0);
    -[PXGridInlineVideoSessionAssetPlaybackRecord setVideoSession:](self, "setVideoSession:", v5);

  }
}

- (void)_videoQueue_relinquishVideoSession
{
  void *v3;
  id v4;

  -[PXGridInlineVideoSessionAssetPlaybackRecord videoSession](self, "videoSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPixelBufferOutputWithRequestIdentifier:", self->_bufferRequestIdentifier);
  +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInVideoSession:", v4);

  -[PXGridInlineVideoSessionAssetPlaybackRecord setVideoSession:](self, "setVideoSession:", 0);
  -[PXGridInlineVideoSessionAssetPlaybackRecord _setCurrentPixelBuffer:](self, "_setCurrentPixelBuffer:", 0);

}

- (void)_configureVideoSession:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[6];
  _OWORD v11[3];

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setVolume:withFade:", 1, v5);
    objc_msgSend(v6, "setPreventsSleepDuringVideoPlayback:", 0);
    objc_msgSend(v6, "setAllowsExternalPlayback:", 0);
    -[PXGridInlinePlaybackRecord displayAsset](self, "displayAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "playbackStyle");

    if (v8 == 5 || v8 == 3)
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v11[0] = *MEMORY[0x1E0CA2E40];
      v11[1] = v9;
      v11[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      objc_msgSend(v6, "setPlaybackTimeRange:", v11);
      objc_msgSend(v6, "setLoopingEnabled:", 1);
    }
    else
    {
      -[PXGridInlinePlaybackRecord bestVideoTimeRange](self, "bestVideoTimeRange");
      v10[0] = v10[3];
      v10[1] = v10[4];
      v10[2] = v10[5];
      objc_msgSend(v6, "setPlaybackTimeRange:", v10);
      objc_msgSend(v6, "setSeekToBeginningAtEnd:", 1);
    }
  }

}

- (void)_videoQueue_updateCurrentPixelBuffer
{
  void *v3;
  uint64_t v4;

  -[PXGridInlineVideoSessionAssetPlaybackRecord videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPixelBuffer");

  -[PXGridInlineVideoSessionAssetPlaybackRecord _setCurrentPixelBuffer:](self, "_setCurrentPixelBuffer:", v4);
}

- (void)_setCurrentPixelBuffer:(__CVBuffer *)a3
{
  os_unfair_lock_s *p_ivarLock;
  __CVBuffer *currentPixelBuffer;
  void *v7;
  void (**v8)(void);

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  if (currentPixelBuffer == a3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    CVPixelBufferRelease(currentPixelBuffer);
    self->_currentPixelBuffer = CVPixelBufferRetain(a3);
    os_unfair_lock_unlock(p_ivarLock);
    -[PXGridInlineVideoSessionAssetPlaybackRecord pixelBufferDidChangeHandler](self, "pixelBufferDidChangeHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PXGridInlineVideoSessionAssetPlaybackRecord pixelBufferDidChangeHandler](self, "pixelBufferDidChangeHandler");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }
}

- (PXVideoSession)videoSession
{
  os_unfair_lock_s *p_ivarLock;
  PXVideoSession *v4;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = self->_videoSession;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v4;
  PXVideoSession *videoSession;

  v4 = (PXVideoSession *)a3;
  os_unfair_lock_lock(&self->_ivarLock);
  videoSession = self->_videoSession;
  self->_videoSession = v4;

  os_unfair_lock_unlock(&self->_ivarLock);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a4;
  v9 = a3;
  if ((void *)PXGridInlineVideoSessionAssetPlaybackRecordVideoSessionObservableContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlineVideoSessionAssetPlaybackRecord.m"), 255, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 0x400) != 0)
  {
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "videoSessionQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__PXGridInlineVideoSessionAssetPlaybackRecord_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5148D30;
    objc_copyWeak(&v14, &location);
    dispatch_async(v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (__CVBuffer)currentPixelBuffer
{
  os_unfair_lock_s *p_ivarLock;
  __CVBuffer *currentPixelBuffer;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  os_unfair_lock_unlock(p_ivarLock);
  return currentPixelBuffer;
}

- (CGAffineTransform)preferredTransform
{
  os_unfair_lock_s *p_ivarLock;
  PXVideoSession *videoSession;
  CGAffineTransform *result;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  videoSession = self->_videoSession;
  if (videoSession)
    -[PXVideoSession preferredTransform](videoSession, "preferredTransform");
  os_unfair_lock_unlock(p_ivarLock);
  return result;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (id)pixelBufferDidChangeHandler
{
  return self->_pixelBufferDidChangeHandler;
}

- (void)setPixelBufferDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)providePlaceholderHandler
{
  return self->_providePlaceholderHandler;
}

- (void)setProvidePlaceholderHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)discardVideoOnPause
{
  return self->_discardVideoOnPause;
}

- (void)setDiscardVideoOnPause:(BOOL)a3
{
  self->_discardVideoOnPause = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providePlaceholderHandler, 0);
  objc_storeStrong(&self->_pixelBufferDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_bufferRequestIdentifier, 0);
}

void __76__PXGridInlineVideoSessionAssetPlaybackRecord_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_videoQueue_updateCurrentPixelBuffer");

}

void __98__PXGridInlineVideoSessionAssetPlaybackRecord__videoQueue_ensureVideoSessionWithDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setDesiredPlayState:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_configureVideoSession:", v4);

}

uint64_t __66__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForInvisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoQueue_relinquishVideoSession");
}

uint64_t __64__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoQueue_ensureVideoSessionWithDesiredPlayState:", *(_QWORD *)(a1 + 40));
}

void __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == 1)
  {
    objc_msgSend(v2, "_videoQueue_ensureVideoSessionWithDesiredPlayState:", 1);
  }
  else if (objc_msgSend(v2, "discardVideoOnPause"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_videoQueue_relinquishVideoSession");
  }
  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke_2;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableVideoSession__8l;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "performChanges:withPresentationContext:presenter:", v5, 0, 0);

}

uint64_t __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", *(_QWORD *)(a1 + 32));
}

+ (OS_dispatch_queue)videoSessionQueue
{
  if (videoSessionQueue_onceToken != -1)
    dispatch_once(&videoSessionQueue_onceToken, &__block_literal_global_51146);
  return (OS_dispatch_queue *)(id)videoSessionQueue_videoSessionQueue;
}

void __64__PXGridInlineVideoSessionAssetPlaybackRecord_videoSessionQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)videoSessionQueue_videoSessionQueue;
  videoSessionQueue_videoSessionQueue = v0;

}

@end
