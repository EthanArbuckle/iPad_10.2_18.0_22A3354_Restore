@implementation PXGDisplayAssetVideoPresentationController

- (BOOL)shouldRewindOnBackAction
{
  NSObject *v3;
  __CFString *v4;
  double Seconds;
  void *v6;
  double v7;
  CMTimeFlags v8;
  NSObject *v9;
  CMTime v11;
  CMTime v12;
  CMTime v13;
  CMTime lhs;
  CMTime buf;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXGDisplayAssetVideoPresentationController isLoopingEnabled](self, "isLoopingEnabled"))
    goto LABEL_6;
  memset(&buf, 0, sizeof(buf));
  -[PXGDisplayAssetVideoPresentationController beginningTime](self, "beginningTime");
  memset(&v13, 0, sizeof(v13));
  -[PXGDisplayAssetVideoPresentationController actualTime](self, "actualTime");
  memset(&v12, 0, sizeof(v12));
  lhs = v13;
  v11 = buf;
  CMTimeSubtract(&v12, &lhs, &v11);
  PLStoryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lhs = v12;
    v4 = (__CFString *)CMTimeCopyDescription(0, &lhs);
    LODWORD(lhs.value) = 134218242;
    *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
    LOWORD(lhs.flags) = 2112;
    *(_QWORD *)((char *)&lhs.flags + 2) = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%p playedDuration: %@", (uint8_t *)&lhs, 0x16u);

  }
  if ((v12.flags & 0x1D) != 1)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    lhs = v12;
    Seconds = CMTimeGetSeconds(&lhs);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "significantPlayedDuration");
    v8 = Seconds > v7;

  }
  PLStoryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.value) = 134218240;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    LOWORD(buf.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.flags + 2) = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "%p shouldRewindOnBackAction: %i", (uint8_t *)&buf, 0x12u);
  }

  return v8;
}

- (PXGDisplayAssetVideoPresentationController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDisplayAssetVideoPresentationController.m"), 51, CFSTR("%s is not available as initializer"), "-[PXGDisplayAssetVideoPresentationController init]");

  abort();
}

- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4 videoSessionManager:(id)a5 options:(id)a6 loadingPriority:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXGDisplayAssetVideoPresentationController *v17;
  PXGDisplayAssetVideoPresentationController *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *accessQueue;
  OS_dispatch_queue *v21;
  id v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *timeObserversByTime;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  NSString *identifier;
  __int128 v32;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  v17 = -[PXGDisplayAssetVideoPresentationController init](&v33, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAsset, a3);
    if (v14)
    {
      v19 = (OS_dispatch_queue *)v14;
      accessQueue = v18->_accessQueue;
      v18->_accessQueue = v19;
    }
    else
    {
      v21 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v22 = MEMORY[0x1E0C80D38];
      accessQueue = v18->_accessQueue;
      v18->_accessQueue = v21;
    }

    objc_storeStrong((id *)&v18->_videoSessionManager, a5);
    objc_storeStrong((id *)&v18->_options, a6);
    v18->_videoSessionPresenter = &v18->_videoSessionPresenter;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timeObserversByTime = v18->_timeObserversByTime;
    v18->_timeObserversByTime = v23;

    v25 = MEMORY[0x1E0CA2E18];
    v32 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v18->_desiredTime.value = *MEMORY[0x1E0CA2E18];
    v26 = *(_QWORD *)(v25 + 16);
    v18->_desiredTime.epoch = v26;
    objc_storeStrong((id *)&v18->_audioSessionCategory, (id)*MEMORY[0x1E0C89660]);
    v27 = MEMORY[0x1E0CA2E40];
    v28 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&v18->_playbackTimeRange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&v18->_playbackTimeRange.start.epoch = v28;
    *(_OWORD *)&v18->_playbackTimeRange.duration.timescale = *(_OWORD *)(v27 + 32);
    *(_OWORD *)&v18->_playbackStartTime.value = v32;
    v18->_playbackStartTime.epoch = v26;
    v18->_loadingPriority = a7;
    v18->_isVisible = 1;
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), v18);
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v29;

    v18->_desiredPlaybackRate = 1.0;
  }

  return v18;
}

- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4
{
  id v6;
  id v7;
  PXVideoSessionManagerDisplayAssetOptions *v8;
  void *v9;
  PXGDisplayAssetVideoPresentationController *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  +[PXVideoSessionManager sharedInstance](PXVideoSessionManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXGDisplayAssetVideoPresentationController initWithDisplayAsset:accessQueue:videoSessionManager:options:loadingPriority:](self, "initWithDisplayAsset:accessQueue:videoSessionManager:options:loadingPriority:", v7, v6, v9, v8, 0);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PXVideoSessionManager checkInVideoSession:](self->_videoSessionManager, "checkInVideoSession:", self->_videoSession);
  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  -[PXGDisplayAssetVideoPresentationController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDisplayAssetVideoPresentationController displayAsset](self, "displayAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p asset:%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)videoSessionWithMediaProvider:(id)a3
{
  -[PXGDisplayAssetVideoPresentationController _setupVideoSessionIfNeededWithMediaProvider:](self, "_setupVideoSessionIfNeededWithMediaProvider:", a3);
  return -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
}

- (id)pixelBufferSourceWithMediaProvider:(id)a3
{
  -[PXGDisplayAssetVideoPresentationController _setupPixelBufferSourceIfNeededWithMediaProvider:](self, "_setupPixelBufferSourceIfNeededWithMediaProvider:", a3);
  -[PXGDisplayAssetVideoPresentationController setPixelBufferSourceCounter:](self, "setPixelBufferSourceCounter:", -[PXGDisplayAssetVideoPresentationController pixelBufferSourceCounter](self, "pixelBufferSourceCounter") + 1);
  return -[PXGDisplayAssetVideoPresentationController pixelBufferSource](self, "pixelBufferSource");
}

- (void)recyclePixelBufferSource
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PXGDisplayAssetVideoPresentationController setPixelBufferSource:](self, "setPixelBufferSource:", 0);
  -[PXGDisplayAssetVideoPresentationController setPixelBufferSourceCounter:](self, "setPixelBufferSourceCounter:", -[PXGDisplayAssetVideoPresentationController pixelBufferSourceCounter](self, "pixelBufferSourceCounter") - 1);
  if (-[PXGDisplayAssetVideoPresentationController pixelBufferSourceCounter](self, "pixelBufferSourceCounter") <= 0)
  {
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unregisterChangeObserver:context:", self, VideoSessionObservationContext);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v19, "videoPlayer");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeTimeObserver:", v11);

            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v9);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    objc_msgSend(v19, "videoPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelPendingPrerolls");

    if (v19)
    {
      -[PXGDisplayAssetVideoPresentationController videoSessionManager](self, "videoSessionManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "checkInVideoSession:", v19);

      -[PXGDisplayAssetVideoPresentationController setVideoSession:](self, "setVideoSession:", 0);
    }

  }
}

- (void)_setupVideoSessionIfNeededWithMediaProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "mediaProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7 == v4;

    if (!v4)
      goto LABEL_20;
  }
  else
  {
    v8 = 0;
    if (!v4)
      goto LABEL_20;
  }
  if (!v8)
  {
    -[PXGDisplayAssetVideoPresentationController videoSessionManager](self, "videoSessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGDisplayAssetVideoPresentationController displayAsset](self, "displayAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGDisplayAssetVideoPresentationController options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoSessionForAsset:withOptions:mediaProvider:", v10, v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGDisplayAssetVideoPresentationController log](self, "log");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        v16 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        v17 = objc_msgSend(v12, "logContext");
        -[PXGDisplayAssetVideoPresentationController displayAsset](self, "displayAsset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v34 = v16;
        v35 = 2050;
        v36 = v17;
        v37 = 2114;
        v38 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_EVENT, v15, "PXGDisplayAssetVideoPresentationControllerCreatedVideoSession", "Context=%{signpost.telemetry:string2}lu videoSession=%{public}llu, asset.uuid=%{public}@", buf, 0x20u);

      }
    }

    objc_msgSend(v12, "registerChangeObserver:context:", self, VideoSessionObservationContext);
    objc_msgSend(v12, "loadIfNeededWithPriority:", -[PXGDisplayAssetVideoPresentationController loadingPriority](self, "loadingPriority"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (v26)
            objc_msgSend(v26, "CMTimeValue");
          else
            memset(v27, 0, sizeof(v27));
          -[PXGDisplayAssetVideoPresentationController startObservingBoundaryTime:](self, "startObservingBoundaryTime:", v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

    -[PXGDisplayAssetVideoPresentationController setVideoSession:](self, "setVideoSession:", v12);
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");

  }
LABEL_20:

}

- (void)_setupPixelBufferSourceIfNeededWithMediaProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t AspectRatioWithDefault;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  PXGVideoSessionPixelBufferSource *v24;
  void *v25;
  PXGVideoSessionPixelBufferSource *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGDisplayAssetVideoPresentationController pixelBufferSource](self, "pixelBufferSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PXGDisplayAssetVideoPresentationController _setupVideoSessionIfNeededWithMediaProvider:](self, "_setupVideoSessionIfNeededWithMediaProvider:", v4);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[PXGDisplayAssetVideoPresentationController options](self, "options", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "strategies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      v11 = 4;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v13, "quality") < (uint64_t)v11)
            v11 = objc_msgSend(v13, "quality");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);

      v14 = 0.0;
      v15 = 0.0;
      if (v11 <= 5)
      {
        v14 = dbl_1A7C0B820[v11];
        v15 = dbl_1A7C0B850[v11];
      }
    }
    else
    {

      v15 = 640.0;
      v14 = 360.0;
    }
    -[PXGDisplayAssetVideoPresentationController targetSize](self, "targetSize");
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      -[PXGDisplayAssetVideoPresentationController displayAsset](self, "displayAsset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pixelWidth");
      objc_msgSend(v16, "pixelHeight");
      AspectRatioWithDefault = PXSizeGetAspectRatioWithDefault();
      v19 = v18;
      v20 = MEMORY[0x1A85CD654](AspectRatioWithDefault);
      v22 = v21;
      v23 = MEMORY[0x1A85CD654](v19, v15, v14);
      if (MEMORY[0x1A85CD5B8](v23))
      {
        v14 = v22;
        v15 = v20;
      }

    }
    v24 = [PXGVideoSessionPixelBufferSource alloc];
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PXGVideoSessionPixelBufferSource initWithVideoSession:maxOutputSize:](v24, "initWithVideoSession:maxOutputSize:", v25, v15, v14);
    -[PXGDisplayAssetVideoPresentationController setPixelBufferSource:](self, "setPixelBufferSource:", v26);

  }
}

- (BOOL)_timeConversionNeeded
{
  void *v2;
  char v3;

  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSegmentOfOriginalVideo");

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeConvertedFromVideoSessionTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;
  void *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTime lhs;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PXGDisplayAssetVideoPresentationController _timeConversionNeeded](self, "_timeConversionNeeded");
  if ((_DWORD)result)
  {
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "segmentTimeRangeOfOriginalVideo");
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
    }
    *(_OWORD *)&lhs.value = v11;
    lhs.epoch = v12;
    v10 = *a4;
    CMTimeAdd((CMTime *)retstr, &lhs, (CMTime *)&v10);

  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    retstr->var3 = a4->var3;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoSessionTimeConvertedFromTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  int64_t v14;
  CMTime v15;
  CMTime rhs;
  CMTime time;
  CMTimeRange range;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PXGDisplayAssetVideoPresentationController _timeConversionNeeded](self, "_timeConversionNeeded");
  if ((_DWORD)result)
  {
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "segmentTimeRangeOfOriginalVideo");
    else
      memset(&range, 0, sizeof(range));
    time = (CMTime)*a4;
    v10 = CMTimeRangeContainsTime(&range, &time);

    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (v11)
        objc_msgSend(v11, "segmentTimeRangeOfOriginalVideo");
      else
        memset(&v15, 0, sizeof(v15));
      rhs = v15;
      time = (CMTime)*a4;
      CMTimeSubtract((CMTime *)retstr, &time, &rhs);
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v11, "segmentTimeRangeOfOriginalVideo");
      }
      else
      {
        v14 = 0;
        v13 = 0u;
      }
      *(_OWORD *)&retstr->var0 = v13;
      retstr->var3 = v14;
    }

  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    retstr->var3 = a4->var3;
  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_timeRangeConvertedFromVideoSessionTimeRange:(SEL)a3
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime start;
  CMTime v11;

  result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)-[PXGDisplayAssetVideoPresentationController _timeConversionNeeded](self, "_timeConversionNeeded");
  if ((_DWORD)result
    && (a4->var0.var2 & 1) != 0
    && (a4->var1.var2 & 1) != 0
    && !a4->var1.var3
    && (a4->var1.var0 & 0x8000000000000000) == 0)
  {
    memset(&v11, 0, sizeof(v11));
    start = (CMTime)a4->var0;
    -[PXGDisplayAssetVideoPresentationController _timeConvertedFromVideoSessionTime:](self, "_timeConvertedFromVideoSessionTime:", &start);
    start = v11;
    var1 = a4->var1;
    return ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, (CMTime *)&var1);
  }
  else
  {
    v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_videoSessionTimeRangeConvertedFromTimeRange:(SEL)a3
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime start;
  CMTime v11;

  result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)-[PXGDisplayAssetVideoPresentationController _timeConversionNeeded](self, "_timeConversionNeeded");
  if ((_DWORD)result
    && (a4->var0.var2 & 1) != 0
    && (a4->var1.var2 & 1) != 0
    && !a4->var1.var3
    && (a4->var1.var0 & 0x8000000000000000) == 0)
  {
    memset(&v11, 0, sizeof(v11));
    start = (CMTime)a4->var0;
    -[PXGDisplayAssetVideoPresentationController _videoSessionTimeConvertedFromTime:](self, "_videoSessionTimeConvertedFromTime:", &start);
    start = v11;
    var1 = a4->var1;
    return ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, (CMTime *)&var1);
  }
  else
  {
    v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  }
  return result;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  -[PXGDisplayAssetVideoPresentationController performChanges:](&v6, sel_performChanges_, v4);

}

- (void)_updateVideoSession
{
  void *v3;
  int64_t desiredPlayState;
  _BOOL4 v5;
  _BOOL8 v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  BOOL v14;
  BOOL v15;
  _OWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    desiredPlayState = self->_desiredPlayState;
    v5 = -[PXGDisplayAssetVideoPresentationController isVisible](self, "isVisible");
    v18 = 0u;
    v19 = 0u;
    v6 = desiredPlayState == 1 && v5;
    v17 = 0uLL;
    -[PXGDisplayAssetVideoPresentationController playbackTimeRange](self, "playbackTimeRange");
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    -[PXGDisplayAssetVideoPresentationController _videoSessionTimeRangeConvertedFromTimeRange:](self, "_videoSessionTimeRangeConvertedFromTimeRange:", v16);
    v17 = v16[3];
    v18 = v16[4];
    v19 = v16[5];
    v7 = -[PXGDisplayAssetVideoPresentationController isLoopingEnabled](self, "isLoopingEnabled");
    if ((BYTE12(v17) & 1) != 0)
    {
      v8 = 0;
      if ((BYTE4(v19) & 1) != 0 && !*((_QWORD *)&v19 + 1))
        v8 = v18 >= 0;
    }
    else
    {
      v8 = 0;
    }
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PXGDisplayAssetVideoPresentationController__updateVideoSession__block_invoke;
    v10[3] = &unk_1E51424A0;
    v10[4] = self;
    v10[5] = v6;
    v11 = v17;
    v12 = v18;
    v13 = v19;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v9, "performChanges:withPresentationContext:presenter:", v10, 0, self->_videoSessionPresenter);

  }
}

- (void)_updatePresentationControllerState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  _QWORD block[6];
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playState");
  if ((unint64_t)(v4 - 1) > 4)
    v5 = 0;
  else
    v5 = qword_1A7C0B880[v4 - 1];
  v18 = 0uLL;
  v19 = 0;
  if (v3)
    objc_msgSend(v3, "currentTime");
  v14 = v18;
  v15 = v19;
  -[PXGDisplayAssetVideoPresentationController _timeConvertedFromVideoSessionTime:](self, "_timeConvertedFromVideoSessionTime:", &v14);
  v18 = v16;
  v19 = v17;
  v6 = objc_msgSend(v3, "isAtEnd");
  v16 = 0uLL;
  v17 = 0;
  if (v3)
    objc_msgSend(v3, "videoDuration");
  -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke;
  block[3] = &unk_1E51424E8;
  block[4] = self;
  block[5] = v5;
  v9 = v18;
  v10 = v19;
  v13 = v6;
  v11 = v16;
  v12 = v17;
  dispatch_async(v7, block);

}

- (void)setActualTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_actualTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 actualTime;
  CMTime time1;

  p_actualTime = &self->_actualTime;
  time1 = *(CMTime *)a3;
  actualTime = self->_actualTime;
  if (CMTimeCompare(&time1, (CMTime *)&actualTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_actualTime->epoch = a3->var3;
    *(_OWORD *)&p_actualTime->value = v6;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 32);
  }
}

- (void)setActualPlayState:(int64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  int64_t actualPlayState;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_actualPlayState != a3)
  {
    self->_actualPlayState = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 4);
    -[PXGDisplayAssetVideoPresentationController log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        actualPlayState = self->_actualPlayState;
        v17 = 134218240;
        v18 = v10;
        v19 = 2048;
        v20 = actualPlayState;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        v16 = self->_actualPlayState;
        v17 = 134218240;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

  }
}

- (void)setIsReadyForImmediatePlayback:(BOOL)a3
{
  if (self->_isReadyForImmediatePlayback != a3)
  {
    self->_isReadyForImmediatePlayback = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 1);
  }
}

- (void)setIsAtEnd:(BOOL)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  _BOOL8 isAtEnd;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  _BOOL8 v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  _BOOL8 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_isAtEnd != a3)
  {
    self->_isAtEnd = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 512);
    -[PXGDisplayAssetVideoPresentationController log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        isAtEnd = self->_isAtEnd;
        v17 = 134218240;
        v18 = v10;
        v19 = 2048;
        v20 = isAtEnd;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        v16 = self->_isAtEnd;
        v17 = 134218240;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

  }
}

- (void)setVideoDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_videoDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration;
  CMTime time1;

  p_videoDuration = &self->_videoDuration;
  time1 = *(CMTime *)a3;
  videoDuration = self->_videoDuration;
  if (CMTimeCompare(&time1, (CMTime *)&videoDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_videoDuration->epoch = a3->var3;
    *(_OWORD *)&p_videoDuration->value = v6;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 1024);
  }
}

- (void)prerollForImmediatePlaybackAtRate:(float)a3 withMediaProvider:(id)a4
{
  double v6;

  -[PXGDisplayAssetVideoPresentationController _setupPixelBufferSourceIfNeededWithMediaProvider:](self, "_setupPixelBufferSourceIfNeededWithMediaProvider:", a4);
  *(float *)&v6 = a3;
  -[PXGDisplayAssetVideoPresentationController _performPrerollAtRate:](self, "_performPrerollAtRate:", v6);
}

- (void)_performPrerollAtRate:(float)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id location;

  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "rate");
  if (*(float *)&v7 == 0.0
    && objc_msgSend(v6, "status") == 1
    && !-[PXGDisplayAssetVideoPresentationController isPendingSeekScheduled](self, "isPendingSeekScheduled"))
  {
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __68__PXGDisplayAssetVideoPresentationController__performPrerollAtRate___block_invoke;
    v13 = &unk_1E5142510;
    objc_copyWeak(&v14, &location);
    *(float *)&v8 = a3;
    objc_msgSend(v6, "prerollAtRate:completionHandler:", &v10, v8);
    LODWORD(v9) = 0;
    -[PXGDisplayAssetVideoPresentationController setPendingPrerollRate:](self, "setPendingPrerollRate:", v9, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&v7 = a3;
    -[PXGDisplayAssetVideoPresentationController setPendingPrerollRate:](self, "setPendingPrerollRate:", v7);
  }

}

- (void)_performPendingPrerollIfNeeded
{
  float v3;

  -[PXGDisplayAssetVideoPresentationController pendingPrerollRate](self, "pendingPrerollRate");
  if (v3 > 0.0)
    -[PXGDisplayAssetVideoPresentationController _performPrerollAtRate:](self, "_performPrerollAtRate:");
}

- (void)_prerollCompletedSuccessfully:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke;
  v6[3] = &unk_1E5144398;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)setShouldDisplayPreviousNonNullPixelBuffer:(BOOL)a3
{
  if (self->_shouldDisplayPreviousNonNullPixelBuffer != a3)
  {
    self->_shouldDisplayPreviousNonNullPixelBuffer = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 8);
  }
}

- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3
{
  if (self->_shouldDisableAutomaticPixelBufferUpdates != a3)
  {
    self->_shouldDisableAutomaticPixelBufferUpdates = a3;
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  int64_t desiredPlayState;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 2);
    -[PXGDisplayAssetVideoPresentationController log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        desiredPlayState = self->_desiredPlayState;
        v17 = 134218240;
        v18 = v10;
        v19 = 2048;
        v20 = desiredPlayState;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXGDisplayAssetVideoPresentationController logContext](self, "logContext");
        v16 = self->_desiredPlayState;
        v17 = 134218240;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    if (!a3)
    {
      if (-[PXGDisplayAssetVideoPresentationController resetsDesiredPlayStateOnHide](self, "resetsDesiredPlayStateOnHide"))
      {
        -[PXGDisplayAssetVideoPresentationController setDesiredPlayState:](self, "setDesiredPlayState:", 0);
      }
    }
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setResetsDesiredPlayStateOnHide:(BOOL)a3
{
  if (self->_resetsDesiredPlayStateOnHide != a3)
    self->_resetsDesiredPlayStateOnHide = a3;
}

- (void)setPlaybackTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_playbackTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_playbackTimeRange = &self->_playbackTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_playbackTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_playbackTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_playbackTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_playbackTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_playbackTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_playbackTimeRange->start.value = v8;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 64);
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setIsLoopingEnabled:(BOOL)a3
{
  if (self->_isLoopingEnabled != a3)
  {
    self->_isLoopingEnabled = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 128);
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setIsCrossfadingFromStillToVideoEnabled:(BOOL)a3
{
  if (self->_isCrossfadingFromStillToVideoEnabled != a3)
  {
    self->_isCrossfadingFromStillToVideoEnabled = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 256);
  }
}

- (void)setIsCleanApertureCompensationEnabled:(BOOL)a3
{
  if (self->_isCleanApertureCompensationEnabled != a3)
  {
    self->_isCleanApertureCompensationEnabled = a3;
    -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setDesiredPlaybackRate:(double)a3
{
  if (self->_desiredPlaybackRate != a3)
  {
    self->_desiredPlaybackRate = a3;
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setAudioSessionCategory:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_audioSessionCategory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_audioSessionCategory, a3);
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
    v5 = v6;
  }

}

- (void)setIsDuckingOtherAudioEnabled:(BOOL)a3
{
  if (self->_isDuckingOtherAudioEnabled != a3)
  {
    self->_isDuckingOtherAudioEnabled = a3;
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setIsMixingAudioWithOthersEnabled:(BOOL)a3
{
  if (self->_isMixingAudioWithOthersEnabled != a3)
  {
    self->_isMixingAudioWithOthersEnabled = a3;
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- (void)setVolume:(float)a3 withFade:(BOOL)a4
{
  _BOOL8 v4;
  double v7;

  v4 = a4;
  -[PXGDisplayAssetVideoPresentationController volume](self, "volume");
  if (*(float *)&v7 != a3)
  {
    *(float *)&v7 = a3;
    -[PXGDisplayAssetVideoPresentationController setVolume:](self, "setVolume:", v7);
    -[PXGDisplayAssetVideoPresentationController setShouldFadeVolumeChange:](self, "setShouldFadeVolumeChange:", v4);
    -[PXGDisplayAssetVideoPresentationController _invalidateVideoSession](self, "_invalidateVideoSession");
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginningTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  unsigned int var2;
  uint64_t v7;
  __int128 v8;
  int64_t v9;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = -[PXGDisplayAssetVideoPresentationController playbackStartTime](self, "playbackStartTime");
  var2 = retstr->var2;
  if ((var2 & 1) == 0)
  {
    result = -[PXGDisplayAssetVideoPresentationController playbackTimeRange](self, "playbackTimeRange");
    *(_OWORD *)&retstr->var0 = v8;
    retstr->var3 = v9;
    var2 = retstr->var2;
  }
  if ((var2 & 1) == 0)
  {
    v7 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E68];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }
  return result;
}

- (void)seekToBeginning
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  CMTime time1;
  CMTime time2;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  -[PXGDisplayAssetVideoPresentationController beginningTime](self, "beginningTime");
  -[PXGDisplayAssetVideoPresentationController actualTime](self, "actualTime");
  time1 = v9;
  if (CMTimeCompare(&time1, &time2))
  {
    time1 = v9;
    v5 = *MEMORY[0x1E0CA2E68];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v3 = v5;
    v4 = v6;
    -[PXGDisplayAssetVideoPresentationController setDesiredTime:toleranceBefore:toleranceAfter:](self, "setDesiredTime:toleranceBefore:toleranceAfter:", &time1, &v5, &v3);
  }
}

- (void)setDesiredTime:(id *)a3
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  v5 = *MEMORY[0x1E0CA2E30];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v3 = v5;
  v4 = v6;
  -[PXGDisplayAssetVideoPresentationController setDesiredTime:toleranceBefore:toleranceAfter:](self, "setDesiredTime:toleranceBefore:toleranceAfter:", &v7, &v5, &v3);
}

- (void)setDesiredTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  var3 = a3->var3;
  *(_OWORD *)&self->_desiredTime.value = *(_OWORD *)&a3->var0;
  self->_desiredTime.epoch = var3;
  -[PXGDisplayAssetVideoPresentationController signalChange:](self, "signalChange:", 16);
  v12 = *a3;
  v11 = *a4;
  v10 = *a5;
  -[PXGDisplayAssetVideoPresentationController _performSeekToTime:toleranceBefore:toleranceAfter:](self, "_performSeekToTime:toleranceBefore:toleranceAfter:", &v12, &v11, &v10);
}

- (void)_performSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  __int128 v12;
  __int128 v13;
  int64_t v14;
  __int128 v15;
  int64_t v16;
  __int128 v17;
  int64_t v18;
  __int128 v19;
  int64_t v20;
  __int128 v21;
  int64_t v22;
  __int128 v23;
  int64_t v24;
  __int128 v25;
  int64_t v26;
  __int128 v27;
  int64_t var3;
  __int128 v29;
  int64_t v30;

  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isReadyForSeeking"))
  {
    v27 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PXGDisplayAssetVideoPresentationController _videoSessionTimeConvertedFromTime:](self, "_videoSessionTimeConvertedFromTime:", &v27);
    *(_OWORD *)&a3->var0 = v29;
    v10 = v30;
    a3->var3 = v30;
    v29 = *(_OWORD *)&a3->var0;
    v30 = v10;
    v27 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v25 = *(_OWORD *)&a5->var0;
    v26 = a5->var3;
    objc_msgSend(v9, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v29, &v27, &v25, 0);
    v23 = *MEMORY[0x1E0CA2E18];
    v12 = v23;
    v24 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v11 = v24;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekTime:](self, "setPendingSeekTime:", &v23);
    v21 = v12;
    v22 = v11;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekToleranceBefore:](self, "setPendingSeekToleranceBefore:", &v21);
    v19 = v12;
    v20 = v11;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekToleranceAfter:](self, "setPendingSeekToleranceAfter:", &v19);
    *(_OWORD *)&self->_desiredTime.value = v12;
    self->_desiredTime.epoch = v11;
  }
  else
  {
    v17 = *(_OWORD *)&a3->var0;
    v18 = a3->var3;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekTime:](self, "setPendingSeekTime:", &v17);
    v15 = *(_OWORD *)&a4->var0;
    v16 = a4->var3;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekToleranceBefore:](self, "setPendingSeekToleranceBefore:", &v15);
    v13 = *(_OWORD *)&a5->var0;
    v14 = a5->var3;
    -[PXGDisplayAssetVideoPresentationController setPendingSeekToleranceAfter:](self, "setPendingSeekToleranceAfter:", &v13);
  }

}

- (void)synchronouslySeekToDesiredTime:(id *)a3 updatePixelBufferSource:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7[2];

  v4 = a4;
  memset(&v7[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  v7[0] = *a3;
  -[PXGDisplayAssetVideoPresentationController _videoSessionTimeConvertedFromTime:](self, "_videoSessionTimeConvertedFromTime:", v7);
  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v7[1];
  objc_msgSend(v6, "seekToExactTime:updatePixelBuffer:waitUntilComplete:", v7, v4, 1);

}

- (BOOL)isPendingSeekScheduled
{
  char v3;

  -[PXGDisplayAssetVideoPresentationController pendingSeekTime](self, "pendingSeekTime");
  return (v3 & 0x1D) == 1;
}

- (void)_performPendingSeekIfNeeded
{
  _BYTE v3[24];
  _BYTE v4[24];
  _BYTE v5[24];

  if (-[PXGDisplayAssetVideoPresentationController isPendingSeekScheduled](self, "isPendingSeekScheduled"))
  {
    -[PXGDisplayAssetVideoPresentationController pendingSeekTime](self, "pendingSeekTime");
    -[PXGDisplayAssetVideoPresentationController pendingSeekToleranceBefore](self, "pendingSeekToleranceBefore");
    -[PXGDisplayAssetVideoPresentationController pendingSeekToleranceAfter](self, "pendingSeekToleranceAfter");
    -[PXGDisplayAssetVideoPresentationController _performSeekToTime:toleranceBefore:toleranceAfter:](self, "_performSeekToTime:toleranceBefore:toleranceAfter:", v5, v4, v3);
  }
}

- (void)startObservingBoundaryTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  __int128 v23;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE location;
  _BYTE v26[24];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3B18];
  location = *a3;
  -[PXGDisplayAssetVideoPresentationController _videoSessionTimeConvertedFromTime:](self, "_videoSessionTimeConvertedFromTime:", &location);
  objc_msgSend(v5, "valueWithCMTime:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v10))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_initWeak((id *)&location, self);
      objc_msgSend(v12, "videoPlayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __73__PXGDisplayAssetVideoPresentationController_startObservingBoundaryTime___block_invoke;
      v21 = &unk_1E5142558;
      objc_copyWeak(&v22, (id *)&location);
      v23 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      objc_msgSend(v13, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v14, v15, &v18);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)&location);
      v11 = (void *)v16;
    }
    -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime", v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, v6);

  }
}

- (void)stopObservingBoundaryTime:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  _BYTE v14[24];

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v13 = *a3;
  -[PXGDisplayAssetVideoPresentationController _videoSessionTimeConvertedFromTime:](self, "_videoSessionTimeConvertedFromTime:", &v13);
  objc_msgSend(v4, "valueWithCMTime:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoPlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeTimeObserver:", v7);

    }
  }
  -[PXGDisplayAssetVideoPresentationController timeObserversByTime](self, "timeObserversByTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v5);

}

- (void)_notifyReachedTime:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  __int128 v8;
  int64_t var3;
  _BYTE v10[24];

  -[PXGDisplayAssetVideoPresentationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXGDisplayAssetVideoPresentationController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PXGDisplayAssetVideoPresentationController _timeConvertedFromVideoSessionTime:](self, "_timeConvertedFromVideoSessionTime:", &v8);
    objc_msgSend(v7, "assetVideoPresentationController:didReachTime:", self, v10);

  }
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  int64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMTime time;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXGDisplayAssetVideoPresentationController displayAsset](self, "displayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackStyle");
  PXDisplayAssetPlaybackStyleDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("asset: %@\n"), v5);

  v6 = -[PXGDisplayAssetVideoPresentationController isReadyForImmediatePlayback](self, "isReadyForImmediatePlayback");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("prerolled: %@\n"), v7);
  v8 = -[PXGDisplayAssetVideoPresentationController desiredPlayState](self, "desiredPlayState");
  v9 = CFSTR("▶︎");
  if (!v8)
    v9 = CFSTR("❚❚");
  objc_msgSend(v3, "appendFormat:", CFSTR("desired: %@\n"), v9);
  v10 = -[PXGDisplayAssetVideoPresentationController actualPlayState](self, "actualPlayState");
  if ((unint64_t)(v10 - 1) > 3)
    v11 = CFSTR("?");
  else
    v11 = off_1E5142578[v10 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR("actual: %@\n"), v11);
  -[PXGDisplayAssetVideoPresentationController actualTime](self, "actualTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("time: %0.1fs\n"), CMTimeGetSeconds(&time));
  if (-[PXGDisplayAssetVideoPresentationController actualPlayState](self, "actualPlayState") == 4)
  {
    -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("error: %@\n"), v13);

  }
  -[PXGDisplayAssetVideoPresentationController videoSession](self, "videoSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("videoSession: %@\n"), v15);

  return (NSString *)v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];

  v6 = a4;
  v8 = a3;
  if ((void *)VideoSessionObservationContext == a5)
  {
    v9 = MEMORY[0x1E0C809B0];
    if ((v6 & 1) != 0)
    {
      -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(v10, block);

    }
    if ((v6 & 0x2C4) != 0)
      -[PXGDisplayAssetVideoPresentationController _invalidatePresentationControllerState](self, "_invalidatePresentationControllerState");
    if ((v6 & 0x2000) != 0)
    {
      -[PXGDisplayAssetVideoPresentationController accessQueue](self, "accessQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke_2;
      v12[3] = &unk_1E5149198;
      v12[4] = self;
      dispatch_async(v11, v12);

    }
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[11];
  return self;
}

- (void)setPlaybackStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_playbackStartTime.value = *(_OWORD *)&a3->var0;
  self->_playbackStartTime.epoch = var3;
}

- (double)desiredPlaybackRate
{
  return self->_desiredPlaybackRate;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (PXVideoSessionManagerDisplayAssetOptions)options
{
  return self->_options;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXGDisplayAssetVideoPresentationControllerDelegate)delegate
{
  return (PXGDisplayAssetVideoPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDisplayPreviousNonNullPixelBuffer
{
  return self->_shouldDisplayPreviousNonNullPixelBuffer;
}

- (BOOL)shouldDisableAutomaticPixelBufferUpdates
{
  return self->_shouldDisableAutomaticPixelBufferUpdates;
}

- (BOOL)isReadyForImmediatePlayback
{
  return self->_isReadyForImmediatePlayback;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (BOOL)resetsDesiredPlayStateOnHide
{
  return self->_resetsDesiredPlayStateOnHide;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (int64_t)actualPlayState
{
  return self->_actualPlayState;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[12];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[13];
  return self;
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[14];
  return self;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[9].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[9].var1.var1;
  return self;
}

- (BOOL)isLoopingEnabled
{
  return self->_isLoopingEnabled;
}

- (BOOL)isCrossfadingFromStillToVideoEnabled
{
  return self->_isCrossfadingFromStillToVideoEnabled;
}

- (BOOL)isCleanApertureCompensationEnabled
{
  return self->_isCleanApertureCompensationEnabled;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (BOOL)isDuckingOtherAudioEnabled
{
  return self->_isDuckingOtherAudioEnabled;
}

- (BOOL)isMixingAudioWithOthersEnabled
{
  return self->_isMixingAudioWithOthersEnabled;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void)setVideoSession:(id)a3
{
  objc_storeStrong((id *)&self->_videoSession, a3);
}

- (PXGVideoSessionPixelBufferSource)pixelBufferSource
{
  return self->_pixelBufferSource;
}

- (void)setPixelBufferSource:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferSource, a3);
}

- (int64_t)pixelBufferSourceCounter
{
  return self->_pixelBufferSourceCounter;
}

- (void)setPixelBufferSourceCounter:(int64_t)a3
{
  self->_pixelBufferSourceCounter = a3;
}

- (float)pendingPrerollRate
{
  return self->_pendingPrerollRate;
}

- (void)setPendingPrerollRate:(float)a3
{
  self->_pendingPrerollRate = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[15];
  return self;
}

- (void)setPendingSeekTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[16];
  return self;
}

- (void)setPendingSeekToleranceBefore:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekToleranceBefore.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekToleranceBefore.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[17];
  return self;
}

- (void)setPendingSeekToleranceAfter:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekToleranceAfter.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekToleranceAfter.epoch = var3;
}

- (NSMutableDictionary)timeObserversByTime
{
  return self->_timeObserversByTime;
}

- (void)setTimeObserversByTime:(id)a3
{
  objc_storeStrong((id *)&self->_timeObserversByTime, a3);
}

- (BOOL)shouldFadeVolumeChange
{
  return self->_shouldFadeVolumeChange;
}

- (void)setShouldFadeVolumeChange:(BOOL)a3
{
  self->_shouldFadeVolumeChange = a3;
}

- (int64_t)loadingPriority
{
  return self->_loadingPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeObserversByTime, 0);
  objc_storeStrong((id *)&self->_pixelBufferSource, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

uint64_t __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoSession");
}

uint64_t __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performPendingSeekIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_performPendingPrerollIfNeeded");
}

void __73__PXGDisplayAssetVideoPresentationController_startObservingBoundaryTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_notifyReachedTime:", &v3);

}

uint64_t __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke_2;
  v3[3] = &__block_descriptor_33_e69_v16__0___PXGMutableDisplayAssetVideoPresentationController_Private__8l;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsReadyForImmediatePlayback:", *(unsigned __int8 *)(a1 + 32));
}

void __68__PXGDisplayAssetVideoPresentationController__performPrerollAtRate___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_prerollCompletedSuccessfully:", a2);

}

uint64_t __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  char v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke_2;
  v3[3] = &__block_descriptor_89_e69_v16__0___PXGMutableDisplayAssetVideoPresentationController_Private__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v8 = *(_BYTE *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  return objc_msgSend(v1, "performChanges:", v3);
}

void __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setActualPlayState:", v3);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "setActualTime:", &v7);
  objc_msgSend(v4, "setIsAtEnd:", *(unsigned __int8 *)(a1 + 88));
  v5 = *(_OWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v4, "setVideoDuration:", &v5);

}

void __65__PXGDisplayAssetVideoPresentationController__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[3];

  v3 = a2;
  objc_msgSend(v3, "setDesiredPlayState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "desiredPlaybackRate");
  objc_msgSend(v3, "setDesiredPlaybackRate:");
  v4 = *(_OWORD *)(a1 + 64);
  v13[0] = *(_OWORD *)(a1 + 48);
  v13[1] = v4;
  v13[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v3, "setPlaybackTimeRange:", v13);
  if (!*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(v3, "setSeekToBeginningAtEnd:", 0);
    v5 = v3;
    v6 = 0;
LABEL_6:
    objc_msgSend(v5, "setLoopingEnabled:", v6);
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 97))
  {
    v5 = v3;
    v6 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v3, "setSeekToBeginningAtEnd:", 1);
LABEL_7:
  objc_msgSend(v3, "setShouldDisableAutomaticPixelBufferUpdates:", objc_msgSend(*(id *)(a1 + 32), "shouldDisableAutomaticPixelBufferUpdates"));
  objc_msgSend(*(id *)(a1 + 32), "volume");
  v8 = v7;
  v9 = objc_msgSend(*(id *)(a1 + 32), "shouldFadeVolumeChange");
  LODWORD(v10) = v8;
  objc_msgSend(v3, "setVolume:withFade:", v9, v10);
  v11 = objc_msgSend(*(id *)(a1 + 32), "isMixingAudioWithOthersEnabled");
  if (objc_msgSend(*(id *)(a1 + 32), "isDuckingOtherAudioEnabled") && *(_QWORD *)(a1 + 40) == 1)
    v11 |= 2uLL;
  objc_msgSend(*(id *)(a1 + 32), "audioSessionCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAudioSessionCategory:mode:routeSharingPolicy:options:", v12, *MEMORY[0x1E0C89748], 0, v11);

}

@end
