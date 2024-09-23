@implementation PVLivePlayerAVAssetSource

- (PVLivePlayerAVAssetSource)initWithAVAsset:(id)a3
{
  id v5;
  PVLivePlayerAVAssetSource *v6;
  PVLivePlayerAVAssetSource *v7;
  void **p_asset;
  void *asset;
  float v10;
  dispatch_queue_t v11;
  void *videoTrackDimensions;
  dispatch_semaphore_t v13;
  OS_dispatch_queue *dispatchQueue;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *playbackReadyCondVar;
  PVFrameSet *cacheImageFrameSet;
  HGSynchronizable *v18;
  __int128 v20;
  int64_t v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PVLivePlayerAVAssetSource;
  v6 = -[PVLivePlayerAVAssetSource init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    p_asset = (void **)&v6->_asset;
    objc_storeStrong((id *)&v6->_asset, a3);
    asset = v7->_asset;
    if (asset)
    {
      objc_msgSend(asset, "duration");
      asset = *p_asset;
    }
    else
    {
      v20 = 0uLL;
      v21 = 0;
    }
    *(_OWORD *)&v7->_assetDuration.value = v20;
    v7->_assetDuration.epoch = v21;
    objc_msgSend(asset, "preferredRate");
    v7->_assetRate = v10;
    v11 = dispatch_queue_create("com.apple.ProVideo.PVLivePlayerAVAssetSource", 0);
    videoTrackDimensions = (void *)v7->_videoTrackDimensions;
    v7->_videoTrackDimensions = ($470D365275581EF16070F5A11344F73E)v11;

    v13 = dispatch_semaphore_create(0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_semaphore_create(0);
    playbackReadyCondVar = v7->_playbackReadyCondVar;
    v7->_playbackReadyCondVar = (OS_dispatch_semaphore *)v15;

    cacheImageFrameSet = v7->_cacheImageFrameSet;
    v7->_cacheImageFrameSet = 0;

    v18 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v18);
    v7->_cacheLock = v18;
    -[PVLivePlayerAVAssetSource setLoopPlayback:](v7, "setLoopPlayback:", 1);
    -[PVLivePlayerAVAssetSource setRepeatFrames:](v7, "setRepeatFrames:", 1);
    -[PVLivePlayerAVAssetSource setupPlayer](v7, "setupPlayer");
    -[PVLivePlayerAVAssetSource setMuted:](v7, "setMuted:", 0);
  }

  return v7;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HGSynchronizable *cacheLock;
  NSArray *playerItemOutputs;
  AVQueuePlayer *playerQueue;
  AVPlayerLooper *playerLooper;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVQueuePlayer pause](self->_playerQueue, "pause");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_playerItemOutputs;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6++), "setDelegate:queue:", 0, 0);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  -[AVQueuePlayer cancelPendingPrerolls](self->_playerQueue, "cancelPendingPrerolls");
  -[AVPlayerLooper disableLooping](self->_playerLooper, "disableLooping");
  -[PVLivePlayerAVAssetSource finishReading](self, "finishReading");
  -[PVLivePlayerAVAssetSource stopObservers](self, "stopObservers");
  cacheLock = self->_cacheLock;
  if (cacheLock)
    (*((void (**)(HGSynchronizable *))cacheLock->var0 + 1))(cacheLock);
  playerItemOutputs = self->_playerItemOutputs;
  self->_playerItemOutputs = 0;

  playerQueue = self->_playerQueue;
  self->_playerQueue = 0;

  playerLooper = self->_playerLooper;
  self->_playerLooper = 0;

  v11.receiver = self;
  v11.super_class = (Class)PVLivePlayerAVAssetSource;
  -[PVLivePlayerAVAssetSource dealloc](&v11, sel_dealloc);
}

- (void)play
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (-[PVLivePlayerAVAssetSource status](self, "status") != 1)
  {
    if (-[PVLivePlayerAVAssetSource status](self, "status") == 2)
    {
      -[AVQueuePlayer play](self->_playerQueue, "play");
      -[PVLivePlayerAVAssetSource setStatus:](self, "setStatus:", 1);
      return;
    }
    if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
      -[AVPlayerLooper loopingPlayerItems](self->_playerLooper, "loopingPlayerItems");
    else
      -[AVQueuePlayer items](self->_playerQueue, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "status");
    if (v4)
    {
      if (v4 != 1)
      {
        if (v4 != 2)
        {
LABEL_15:

          return;
        }
        v5 = 4;
LABEL_14:
        -[PVLivePlayerAVAssetSource setStatus:](self, "setStatus:", v5);
        goto LABEL_15;
      }
    }
    else if (-[AVQueuePlayer status](self->_playerQueue, "status") != 1)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_dispatchQueue, 0xFFFFFFFFFFFFFFFFLL);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_playbackReadyCondVar, 0xFFFFFFFFFFFFFFFFLL);
    -[AVQueuePlayer play](self->_playerQueue, "play");
    v5 = 1;
    goto LABEL_14;
  }
}

- (void)pause
{
  -[AVQueuePlayer pause](self->_playerQueue, "pause");
  -[PVLivePlayerAVAssetSource setStatus:](self, "setStatus:", 2);
}

- (id)imageBufferForHostTime:(double)a3
{
  __CVBuffer *v5;
  __CVBuffer *v6;
  void *v7;
  void *v8;
  PVFrameSet *v9;
  PVFrameSet **p_cacheImageFrameSet;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = -[PVLivePlayerAVAssetSource _copyPixelBufferForHostTime:](self, "_copyPixelBufferForHostTime:");
  if (v5)
  {
    v6 = v5;
    v16 = 0uLL;
    v17 = 0;
    -[PVLivePlayerAVAssetSource itemTimeForHostTime:](self, "itemTimeForHostTime:", a3);
    +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v15 = v17;
    v12 = *(_OWORD *)&self->_videoTrackFrameRate;
    v13 = *(_QWORD *)&self->_videoTrackFrameDelta.timescale;
    +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:timestamp:frameDuration:](PVCMSampleBuffer, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v7, &v14, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PVFrameSet initWithColorBuffer:metadata:]([PVFrameSet alloc], "initWithColorBuffer:metadata:", v8, 0);
    CVPixelBufferRelease(v6);

  }
  else
  {
    v9 = 0;
  }
  if (-[PVLivePlayerAVAssetSource repeatFrames](self, "repeatFrames"))
  {
    *(_QWORD *)&v16 = self->_cacheLock;
    BYTE8(v16) = 0;
    HGSynchronizable::Lock((HGSynchronizable *)v16);
    p_cacheImageFrameSet = &self->_cacheImageFrameSet;
    if (v9)
      objc_storeStrong((id *)p_cacheImageFrameSet, v9);
    else
      v9 = *p_cacheImageFrameSet;
    HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&v16);
  }
  return v9;
}

- (__CVBuffer)_copyPixelBufferForHostTime:(double)a3
{
  int v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = -[NSArray count](self->_playerItemOutputs, "count");
  if (v5 < 1)
    return 0;
  v6 = 0;
  while (1)
  {
    v7 = (v6 + self->_currentPlayerItemOutput) % v5;
    -[NSArray objectAtIndex:](self->_playerItemOutputs, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v16 = 0uLL;
    v17 = 0;
    if (v8)
      objc_msgSend(v8, "itemTimeForHostTime:", a3);
    v14 = v16;
    v15 = v17;
    if (objc_msgSend(v9, "hasNewPixelBufferForItemTime:", &v14))
      break;

    if (v5 == ++v6)
      return 0;
  }
  v12 = v16;
  v13 = v17;
  v10 = (__CVBuffer *)objc_msgSend(v9, "copyPixelBufferForItemTime:itemTimeForDisplay:", &v12, 0);
  self->_currentPlayerItemOutput = v7;

  return v10;
}

- (void)seekToTime:(id *)a3
{
  AVQueuePlayer *playerQueue;
  __int128 v6;
  int64_t var3;
  CMTime time;
  CMTime v9;

  if (self->_playerQueue)
  {
    time = *(CMTime *)a3;
    CMTimeConvertScale(&v9, &time, HIDWORD(self->_videoTrackRange.start.value), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    *(CMTime *)a3 = v9;
    if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
    {
      CMTimeMake(&v9, (a3->var0 - *(_QWORD *)(&self->_assetRate + 1))% *(int64_t *)((char *)&self->_videoTrackRange.start.epoch + 4), a3->var1);
      *(CMTime *)a3 = v9;
    }
    playerQueue = self->_playerQueue;
    v6 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[AVQueuePlayer seekToTime:](playerQueue, "seekToTime:", &v6);
  }
}

- (__CVBuffer)_copyPixelBufferForTime:(id *)a3
{
  int v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  __CVBuffer *v10;
  __int128 v12;
  int64_t v13;
  __int128 v14;
  int64_t var3;

  v5 = -[NSArray count](self->_playerItemOutputs, "count");
  if (v5 < 1)
    return 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = (v6 + self->_currentPlayerItemOutput) % v5;
    -[NSArray objectAtIndex:](self->_playerItemOutputs, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    if (objc_msgSend(v9, "hasNewPixelBufferForItemTime:", &v14))
      break;
    ++v6;
    v7 = v9;
    if (v5 == v6)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
  v12 = *(_OWORD *)&a3->var0;
  v13 = a3->var3;
  v10 = (__CVBuffer *)objc_msgSend(v9, "copyPixelBufferForItemTime:itemTimeForDisplay:", &v12, 0);
  self->_currentPlayerItemOutput = v8;
LABEL_8:

  return v10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;

  -[NSArray objectAtIndexedSubscript:](self->_playerItemOutputs, "objectAtIndexedSubscript:", self->_currentPlayerItemOutput);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    objc_msgSend(v6, "itemTimeForHostTime:", a4);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setMuted:(BOOL)a3
{
  AVQueuePlayer *playerQueue;

  playerQueue = self->_playerQueue;
  if (playerQueue)
    -[AVQueuePlayer setMuted:](playerQueue, "setMuted:", a3);
}

- (void)setupPlayer
{
  void *v3;
  void *v4;
  AVQueuePlayer *v5;
  AVQueuePlayer *playerQueue;
  AVPlayerLooper *v7;
  AVPlayerLooper *playerLooper;
  dispatch_semaphore_t v9;
  AVAsset *asset;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const opaqueCMFormatDescription *v15;
  uint64_t *v16;
  void *v17;
  __int128 v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  _QWORD *v23;
  NSArray *v24;
  NSArray *playerItemOutputs;
  NSArray *v26;
  __int128 v27;
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[6];
  _BYTE v31[32];
  __int128 v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:automaticallyLoadedAssetKeys:", self->_asset, &unk_1E6649800);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B350], "queuePlayerWithItems:", v4);
  v5 = (AVQueuePlayer *)objc_claimAutoreleasedReturnValue();
  playerQueue = self->_playerQueue;
  self->_playerQueue = v5;

  -[AVQueuePlayer setAutomaticallyWaitsToMinimizeStalling:](self->_playerQueue, "setAutomaticallyWaitsToMinimizeStalling:", 0);
  if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
  {
    objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", self->_playerQueue, v3);
    v7 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
    playerLooper = self->_playerLooper;
    self->_playerLooper = v7;

  }
  v9 = dispatch_semaphore_create(0);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  asset = self->_asset;
  v11 = MEMORY[0x1E0C809B0];
  v12 = *MEMORY[0x1E0C8A808];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke;
  v33[3] = &unk_1E64D5148;
  v35 = &v36;
  v13 = v9;
  v34 = v13;
  -[AVAsset loadTracksWithMediaType:completionHandler:](asset, "loadTracksWithMediaType:completionHandler:", v12, v33);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v37[5], "formatDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const opaqueCMFormatDescription *)objc_msgSend(v14, "objectAtIndex:", 0);

  v16 = v37;
  v17 = (void *)v37[5];
  if (v17)
  {
    objc_msgSend(v17, "timeRange");
    v16 = v37;
  }
  else
  {
    v32 = 0u;
    memset(v31, 0, sizeof(v31));
  }
  v18 = *(_OWORD *)&v31[16];
  *(_OWORD *)(&self->_assetRate + 1) = *(_OWORD *)v31;
  *(_OWORD *)&self->_videoTrackRange.start.flags = v18;
  *(_OWORD *)((char *)&self->_videoTrackRange.duration.value + 4) = v32;
  objc_msgSend((id)v16[5], "nominalFrameRate");
  HIDWORD(self->_videoTrackRange.duration.epoch) = v19;
  CMTimeMake((CMTime *)v31, 1, HIDWORD(self->_videoTrackRange.start.value));
  *(_OWORD *)&self->_videoTrackFrameRate = *(_OWORD *)v31;
  *(_QWORD *)&self->_videoTrackFrameDelta.timescale = *(_QWORD *)&v31[16];
  self->_videoTrackFrameDelta.epoch = (int64_t)CMVideoFormatDescriptionGetDimensions(v15);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v20, "setObject:forKey:", &unk_1E6649818, *MEMORY[0x1E0CA9040]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
  {
    -[AVPlayerLooper loopingPlayerItems](self->_playerLooper, "loopingPlayerItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_34;
    v30[3] = &unk_1E64D5170;
    v23 = v30;
    v30[4] = v20;
    v30[5] = v21;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v30);
  }
  else
  {
    -[AVQueuePlayer items](self->_playerQueue, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_2;
    v29[3] = &unk_1E64D5170;
    v23 = v29;
    v29[4] = v20;
    v29[5] = v21;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v29);
  }

  -[PVLivePlayerAVAssetSource startObservers](self, "startObservers");
  v24 = (NSArray *)objc_msgSend(v21, "copy");
  playerItemOutputs = self->_playerItemOutputs;
  self->_playerItemOutputs = v24;

  v26 = self->_playerItemOutputs;
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_3;
  v28[3] = &unk_1E64D5198;
  v28[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", v28);
  self->_currentPlayerItemOutput = 0;
  v27 = *(_OWORD *)&self->_videoTrackRange.start.flags;
  *(_OWORD *)(&self->_currentPlayerItemOutput + 1) = *(_OWORD *)(&self->_assetRate + 1);
  *(_OWORD *)&self->_currentPlayerItemRange.start.flags = v27;
  *(_OWORD *)((char *)&self->_currentPlayerItemRange.duration.value + 4) = *(_OWORD *)((char *)&self->_videoTrackRange.duration.value
                                                                                     + 4);

  _Block_object_dispose(&v36, 8);
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_34(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B328]), "initWithPixelBufferAttributes:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "addOutput:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B328]), "initWithPixelBufferAttributes:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "addOutput:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(v3, "setSuppressesPlayerRendering:", 1);
  objc_msgSend(v3, "requestNotificationOfMediaDataChangeWithAdvanceInterval:", 1.0);

}

- (void)finishReading
{
  -[PVLivePlayerAVAssetSource setStatus:](self, "setStatus:", 3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_playbackReadyCondVar);
}

- (void)startObservers
{
  void *v3;
  void *v4;
  id v5;

  -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_playerQueue, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, &s_PlayerQueueStatusObservationContext);
  if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
    -[AVPlayerLooper loopingPlayerItems](self->_playerLooper, "loopingPlayerItems");
  else
    -[AVQueuePlayer items](self->_playerQueue, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_playerItemDidPlayToEnd_, *MEMORY[0x1E0C8AC48], v5);

}

- (void)stopObservers
{
  void *v3;
  void *v4;
  id v5;

  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerQueue, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &s_PlayerQueueStatusObservationContext);
  if (-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback"))
    -[AVPlayerLooper loopingPlayerItems](self->_playerLooper, "loopingPlayerItems");
  else
    -[AVQueuePlayer items](self->_playerQueue, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], v5);

}

- (void)playerItemDidPlayToEnd:(id)a3
{
  if (!-[PVLivePlayerAVAssetSource loopPlayback](self, "loopPlayback", a3))
    -[PVLivePlayerAVAssetSource finishReading](self, "finishReading");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("status")) ^ 1;
  if (a6 != &s_PlayerQueueStatusObservationContext)
    LOBYTE(v13) = 1;
  if ((v13 & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)PVLivePlayerAVAssetSource;
    -[PVLivePlayerAVAssetSource observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
  else if (objc_msgSend(v11, "status") == 1)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dispatchQueue);
  }

}

- (void)outputMediaDataWillChange:(id)a3
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_playbackReadyCondVar);
}

- (int)status
{
  return HIDWORD(self->_outputReadyCondVar);
}

- (void)setStatus:(int)a3
{
  HIDWORD(self->_outputReadyCondVar) = a3;
}

- (BOOL)loopPlayback
{
  return (BOOL)self->_outputReadyCondVar;
}

- (void)setLoopPlayback:(BOOL)a3
{
  LOBYTE(self->_outputReadyCondVar) = a3;
}

- (BOOL)repeatFrames
{
  return BYTE1(self->_outputReadyCondVar);
}

- (void)setRepeatFrames:(BOOL)a3
{
  BYTE1(self->_outputReadyCondVar) = a3;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackReadyCondVar, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_videoTrackDimensions, 0);
  objc_storeStrong((id *)&self->_cacheImageFrameSet, 0);
  objc_storeStrong((id *)&self->_playerItemOutputs, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerQueue, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
