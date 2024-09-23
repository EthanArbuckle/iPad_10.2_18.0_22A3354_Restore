@implementation BKAVPlayer

- (BKAVPlayer)initWithResourceLoader:(id)a3
{
  id v5;
  BKAVPlayer *v6;
  BKAVPlayer *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *timeObservers;
  NSMutableArray *v18;
  NSMutableArray *observedTimes;
  NSError *lastError;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *outputContextQueue;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *accessLogQueue;
  id v29;
  BUCoalescingCallBlock *v30;
  BUCoalescingCallBlock *coalescedLoadedTimeRanges;
  void *v32;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  id v38;
  CMTime v39;
  objc_super v40;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BKAVPlayer;
  v6 = -[BKAVPlayer init](&v40, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceLoader, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BKAVPlayerRateUserDefaultsKey")));
    v10 = v9;
    v11 = 1.0;
    LODWORD(v12) = 1.0;
    if (v9)
      objc_msgSend(v9, "floatValue", v12);
    v7->_playbackRate = *(float *)&v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BKAVPlayerVolumeUserDefaultsKey")));
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "floatValue");
      v11 = v15;
    }
    v7->_volume = v11;
    v7->_state = 4;
    *(int64x2_t *)&v7->_lastPosition = vdupq_n_s64(0x43E0000000000000uLL);
    v7->_pendingCurrentTime = 1.79769313e308;
    v7->_audibleDRMGroupID = -1;
    CMTimeMakeWithSeconds(&v39, 0.5, 1);
    v7->_seekTolerance = ($95D729B680665BEAEFA1D6FCA8238556)v39;
    v7->_needsToUpdateTimeObservers = 0;
    v16 = objc_opt_new(NSMutableDictionary);
    timeObservers = v7->_timeObservers;
    v7->_timeObservers = v16;

    v18 = objc_opt_new(NSMutableArray);
    observedTimes = v7->_observedTimes;
    v7->_observedTimes = v18;

    v7->_isAudibleDRMGroupAuthorized = 0;
    *(_WORD *)&v7->_wasInterrupted = 0;
    *(_WORD *)&v7->_isStalling = 0;
    v7->_lastBitrate = 0.0;
    lastError = v7->_lastError;
    v7->_lastError = 0;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.BKAudiobooks.outputContextQueue", v22);
    outputContextQueue = v7->_outputContextQueue;
    v7->_outputContextQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = dispatch_queue_create("com.apple.BKAudiobooks.accessLogQueue", v26);
    accessLogQueue = v7->_accessLogQueue;
    v7->_accessLogQueue = (OS_dispatch_queue *)v27;

    objc_initWeak((id *)&v39, v7);
    v29 = objc_alloc((Class)BUCoalescingCallBlock);
    v34 = _NSConcreteStackBlock;
    v35 = 3221225472;
    v36 = sub_4018;
    v37 = &unk_386E8;
    objc_copyWeak(&v38, (id *)&v39);
    v30 = (BUCoalescingCallBlock *)objc_msgSend(v29, "initWithNotifyBlock:blockDescription:", &v34, CFSTR("_coalescedLoadedTimeRanges in BKAVPlayer"));
    coalescedLoadedTimeRanges = v7->_coalescedLoadedTimeRanges;
    v7->_coalescedLoadedTimeRanges = v30;

    -[BUCoalescingCallBlock setCoalescingDelay:](v7->_coalescedLoadedTimeRanges, "setCoalescingDelay:", 1.0, v34, v35, v36, v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "playerItemDidReachEnd:", AVPlayerItemDidPlayToEndTimeNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "playerItemDidStallPlayback:", AVPlayerItemPlaybackStalledNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "playerItemFailedToReachEnd:", AVPlayerItemFailedToPlayToEndTimeNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "playerPlaybackWasInterrupted:", AVPlayerPlaybackWasInterruptedNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "routeChanged:", AVAudioSessionRouteChangeNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "audioSessionInterrupted:", AVAudioSessionInterruptionNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "handleNewAccessLogEntry:", AVPlayerItemNewAccessLogEntryNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "outputContextVolumeDidChange:", AVOutputContextVolumeDidChangeNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, "outputContextDestinationChange:", AVOutputContextOutputDeviceDidChangeNotification, 0);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)&v39);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BKAVPlayer _unregisterAssetForDRMGroupIDDelegation:](self, "_unregisterAssetForDRMGroupIDDelegation:", self->_asset);
  -[BKAVPlayer stop](self, "stop");
  -[BKAVPlayer setPlayer:](self, "setPlayer:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKAVPlayer;
  -[BKAVPlayer dealloc](&v4, "dealloc");
}

- (BOOL)isStreaming
{
  return -[NSURL bk_isStreamingAssetURL](self->_assetURL, "bk_isStreamingAssetURL");
}

- (void)setAsset:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;

  v5 = a3;
  v6 = BKAudiobooksBKAVLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "setAsset: asset=%@", buf, 0xCu);
  }

  if ((-[AVAsset isEqual:](self->_asset, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    -[BKAVPlayer setLastPosition:](self, "setLastPosition:", 9.22337204e18);
    -[BKAVPlayer setLastSeekPosition:](self, "setLastSeekPosition:", 9.22337204e18);
    -[BKAVPlayer _updatePlayer](self, "_updatePlayer");
    v8 = -[BKAVPlayer _isStreamingAssetURL](self, "_isStreamingAssetURL");
    if (v5)
    {
      if ((v8 & 1) == 0)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_4668;
        v9[3] = &unk_38710;
        v10 = v5;
        objc_msgSend(v10, "loadValuesAsynchronouslyForKeys:completionHandler:", &off_3A080, v9);

      }
    }
  }

}

- (void)setAssetURL:(id)a3 audibleDRMGroupID:(int)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int audibleDRMGroupID;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;

  v9 = a3;
  v10 = a5;
  v11 = BKAudiobooksBKAVLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "setAssetURL:audibleDRMGroupID: assetURL=%@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer assetURL](self, "assetURL"));
  if (objc_msgSend(v9, "isEqual:", v13))
  {
    audibleDRMGroupID = self->_audibleDRMGroupID;

    if (audibleDRMGroupID == a4)
    {
      v15 = objc_retainBlock(v10);
      v16 = v15;
      if (v15)
        (*((void (**)(id))v15 + 2))(v15);
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {

  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_assetURL, a3);
    self->_lastSeekPosition = 9.22337204e18;
    if (self->_audibleDRMGroupID != a4)
    {
      self->_isAudibleDRMGroupAuthorized = 0;
      self->_audibleDRMGroupID = a4;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_4860;
    v17[3] = &unk_38738;
    v18 = v10;
    -[BKAVPlayer _recreateCurrentAssetWithCompletion:](self, "_recreateCurrentAssetWithCompletion:", v17);
    v16 = v18;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_recreateCurrentAssetWithCompletion:(id)a3
{
  -[BKAVPlayer _recreateCurrentAssetWithRestoreTime:completion:](self, "_recreateCurrentAssetWithRestoreTime:completion:", 0, a3);
}

- (void)_recreateCurrentAssetWithRestoreTime:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSURL *assetURL;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *hlsQueue;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  _QWORD *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  NSURL *v37;
  __int16 v38;
  uint64_t v39;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_4C38;
  v31[3] = &unk_38788;
  objc_copyWeak(&v34, &location);
  v8 = v6;
  v32 = v8;
  v9 = v7;
  v33 = v9;
  v10 = objc_retainBlock(v31);
  v11 = -[BKAVPlayer isStreaming](self, "isStreaming");
  v12 = BKAudiobooksBKAVLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithCompletion:", buf, 2u);
  }

  if (-[AVAsset bk_isAudible](self->_asset, "bk_isAudible"))
    -[BKAVPlayer _unregisterAssetForDRMGroupIDDelegation:](self, "_unregisterAssetForDRMGroupIDDelegation:", self->_asset);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", self->_assetURL, 0));
  if (v11)
  {
    v15 = BKAudiobooksStreamingLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      assetURL = self->_assetURL;
      *(_DWORD *)buf = 138412546;
      v37 = assetURL;
      v38 = 2112;
      v39 = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Setting up streaming asset %@ with options %@", buf, 0x16u);
    }

    if (!self->_hlsQueue)
    {
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BKAudiobooks.hlsQueue", v19);
      hlsQueue = self->_hlsQueue;
      self->_hlsQueue = v20;

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resourceLoader"));
    objc_msgSend(v22, "setPreloadsEligibleContentKeys:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resourceLoader"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer resourceLoader](self, "resourceLoader"));
    objc_msgSend(v23, "setDelegate:queue:", v24, self->_hlsQueue);

    LODWORD(v25) = 0;
    -[BKAVPlayer setLastBitrate:](self, "setLastBitrate:", v25);
    -[BKAVPlayer setIsLoadingResources:](self, "setIsLoadingResources:", 1);
  }
  if (objc_msgSend(v14, "bk_isAudible"))
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_4E98;
    v28[3] = &unk_387B0;
    objc_copyWeak(&v30, &location);
    v29 = v10;
    -[BKAVPlayer _registerAssetForDRMGroupIDDelegation:completion:](self, "_registerAssetForDRMGroupIDDelegation:completion:", v14, v28);

    objc_destroyWeak(&v30);
  }
  else
  {
    -[BKAVPlayer setAsset:](self, "setAsset:", v14);
    v26 = objc_retainBlock(v10);
    v27 = v26;
    if (v26)
      ((void (*)(_QWORD *))v26[2])(v26);

  }
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (AVPlayerItem)currentItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));

  return (AVPlayerItem *)v3;
}

- (NSDate)currentDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentDate"));

  return (NSDate *)v3;
}

- (NSString)outputContextID
{
  NSObject *outputContextQueue;
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
  v9 = sub_5030;
  v10 = sub_5040;
  v11 = 0;
  outputContextQueue = self->_outputContextQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5048;
  v5[3] = &unk_387D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputContextQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)play
{
  if (!-[BKAVPlayer isPlaying](self, "isPlaying"))
  {
    -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
    -[BKAVPlayer _playWithSeekTime:fadeIn:](self, "_playWithSeekTime:fadeIn:");
  }
}

- (void)pause
{
  -[BKAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", 0);
  -[BKAVPlayer setWasInterrupted:](self, "setWasInterrupted:", 0);
  if (-[BKAVPlayer isPlaying](self, "isPlaying") || -[BKAVPlayer isPlaybackPending](self, "isPlaybackPending"))
    -[BKAVPlayer _pause](self, "_pause");
}

- (void)_pause
{
  double v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  LODWORD(v2) = 0;
  objc_msgSend(v3, "setRate:", v2);

}

- (void)stop
{
  void *v3;
  double v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setRate:", v4);

  -[BKAVPlayer setPendingCurrentTime:](self, "setPendingCurrentTime:", 0.0);
  v5 = -[BKAVPlayer isStopping](self, "isStopping");
  -[BKAVPlayer setIsStopping:](self, "setIsStopping:", 1);
  -[BKAVPlayer setState:](self, "setState:", 4);
  -[BKAVPlayer setIsStopping:](self, "setIsStopping:", v5);
}

- (void)togglePlayPause
{
  if (-[BKAVPlayer isPlaying](self, "isPlaying") || -[BKAVPlayer isPlaybackPending](self, "isPlaybackPending"))
    -[BKAVPlayer pause](self, "pause");
  else
    -[BKAVPlayer play](self, "play");
}

- (void)fadeIn:(double)a3
{
  double v5;

  if (!-[BKAVPlayer isPlaying](self, "isPlaying"))
  {
    *(float *)&v5 = a3;
    -[BKAVPlayer _playWithSeekTime:fadeIn:](self, "_playWithSeekTime:fadeIn:", 1.79769313e308, v5);
  }
}

- (void)fadeOut:(double)a3
{
  void *v4;
  double v5;
  CMTime v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  CMTimeMakeWithSeconds(&v6, a3, 1000000000);
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setRate:withVolumeRampDuration:", &v6, v5);

}

- (void)reset
{
  id v3;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  double v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  double v19;

  v3 = BKAudiobooksBKAVLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "player reset", (uint8_t *)&v18, 2u);
  }

  -[BKAVPlayer lastPosition](self, "lastPosition");
  v6 = v5;
  -[BKAVPlayer lastSeekPosition](self, "lastSeekPosition");
  v8 = v7;
  if (v6 == 9.22337204e18)
  {
    if (v7 == 9.22337204e18)
      goto LABEL_15;
    v12 = BKAudiobooksBKAVLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v8;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "lastSeekPosition is %lf, using that position to reset", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    v9 = BKAudiobooksBKAVLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "lastPosition is %lf, using that position to reset", (uint8_t *)&v18, 0xCu);
    }

    -[BKAVPlayer lastPosition](self, "lastPosition");
    v8 = v11;
  }
  if (v8 != 9.22337204e18)
  {
    v14 = BKAudiobooksBKAVLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "resetting player", (uint8_t *)&v18, 2u);
    }

    -[BKAVPlayer setPlayer:](self, "setPlayer:", 0);
    -[BKAVPlayer setContentKeySession:](self, "setContentKeySession:", 0);
    v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    -[BKAVPlayer _recreateCurrentAssetWithRestoreTime:completion:](self, "_recreateCurrentAssetWithRestoreTime:completion:", v16, 0);
    goto LABEL_17;
  }
LABEL_15:
  v17 = BKAudiobooksBKAVLog();
  v16 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_213A0();
LABEL_17:

}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)isPlaybackPending
{
  return self->_state == 1;
}

- (void)setScrubbing:(BOOL)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7[2];
  id location;

  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    if (a3)
    {
      self->_wasPlayingBeforeScrubbing = -[BKAVPlayer isPlaying](self, "isPlaying");
      -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 2);
      v4 = (void *)(self->_scrubPausableDispatchAfterGeneration + 1);
      self->_scrubPausableDispatchAfterGeneration = (unint64_t)v4;
      objc_initWeak(&location, self);
      v5 = dispatch_time(0, 400000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5640;
      block[3] = &unk_38800;
      objc_copyWeak(v7, &location);
      v7[1] = v4;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 1);
      ++self->_scrubDispatchAfterGeneration;
      if (self->_wasPlayingBeforeScrubbing && self->_state == 3)
        -[BKAVPlayer play](self, "play");
      self->_wasPlayingBeforeScrubbing = 0;
      ++self->_scrubPausableDispatchAfterGeneration;
      self->_scrubPausable = 0;
    }
  }
}

- (void)setIsStalling:(BOOL)a3
{
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5758;
  v6[3] = &unk_38828;
  v7 = a3;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5850;
      block[3] = &unk_386C0;
      v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)setIsLoadingResources:(BOOL)a3
{
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5928;
  v6[3] = &unk_38828;
  v7 = a3;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5A20;
      block[3] = &unk_386C0;
      v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)setPlaybackRate:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  float playbackRate;
  double v9;
  id v10;

  self->_playbackRate = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  *(float *)&v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("BKAVPlayerRateUserDefaultsKey"));

  if (-[BKAVPlayer wasInterrupted](self, "wasInterrupted"))
  {
    -[BKAVPlayer play](self, "play");
  }
  else if (-[BKAVPlayer isPlaying](self, "isPlaying"))
  {
    playbackRate = self->_playbackRate;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    *(float *)&v9 = playbackRate;
    objc_msgSend(v10, "setRate:", v9);

  }
}

- (float)_actualRate
{
  void *v3;
  float v4;
  void *v5;
  float v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v4 = 0.0;
  if (objc_msgSend(v3, "timeControlStatus") == (char *)&dword_0 + 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v5, "rate");
    v4 = v6;

  }
  return v4;
}

- (float)volume
{
  -[BKAVPlayer _reevaluateVolumeFromPlayer](self, "_reevaluateVolumeFromPlayer");
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  void *v5;
  BOOL v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  if (self->_volume != a3)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "outputContext"));
    v6 = objc_msgSend(v5, "canSetVolume") == 0;
    v8 = v13;
    if (!v6)
      v8 = v5;
    *(float *)&v7 = a3;
    objc_msgSend(v8, "setVolume:", v7);
    *(float *)&v9 = a3;
    -[BKAVPlayer _setInternalVolumeAndNotify:](self, "_setInternalVolumeAndNotify:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    *(float *)&v11 = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("BKAVPlayerVolumeUserDefaultsKey"));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  double v24;
  double v25;
  int v26;
  int v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  id v35;
  NSObject *v36;
  double v37;
  id v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSError *v43;
  NSError *lastError;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  unsigned int v49;
  const __CFString *v50;
  id v51;
  NSObject *v52;
  objc_super v53;
  _QWORD block[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id location[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_446A0 == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeOldKey));
      if (v13)
      {
        v14 = objc_opt_class(NSNull);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, CFSTR("status"), off_446A0);
          objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, CFSTR("loadedTimeRanges"), off_446A0);
        }
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
        objc_msgSend(v16, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 4, off_446A0);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
        objc_msgSend(v17, "addObserver:forKeyPath:options:context:", self, CFSTR("loadedTimeRanges"), 4, off_446A0);

        objc_initWeak(location, self);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asset"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("tracks"), CFSTR("duration"), 0));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_643C;
        v58[3] = &unk_38850;
        objc_copyWeak(&v59, location);
        objc_msgSend(v19, "loadValuesAsynchronouslyForKeys:completionHandler:", v20, v58);

        objc_destroyWeak(&v59);
        objc_destroyWeak(location);
      }

    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
        v23 = (char *)objc_msgSend(v22, "status");

        if (v23 == (_BYTE *)&dword_0 + 2)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
          v43 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "error"));
          lastError = self->_lastError;
          self->_lastError = v43;

          v45 = BKAudiobooksBKAVLog();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            sub_213CC((uint64_t *)&self->_lastError, self, v46);

          -[BKAVPlayer pause](self, "pause");
          -[BKAVPlayer _playbackFailedWithError:](self, "_playbackFailedWithError:", self->_lastError);
          -[BKAVPlayer setIsLoadingResources:](self, "setIsLoadingResources:", 0);
        }
        else if (v23 == (_BYTE *)&dword_0 + 1)
        {
          if (-[BKAVPlayer isPlaybackPending](self, "isPlaybackPending"))
          {
            objc_initWeak(location, self);
            -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
            v25 = v24;
            -[BKAVPlayer playFadeInTime](self, "playFadeInTime");
            v27 = v26;
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_64F8;
            v56[3] = &unk_38850;
            objc_copyWeak(&v57, location);
            LODWORD(v28) = v27;
            -[BKAVPlayer _playWithSeekTime:fadeIn:completion:](self, "_playWithSeekTime:fadeIn:completion:", v56, v25, v28);
            objc_destroyWeak(&v57);
            objc_destroyWeak(location);
          }
          else
          {
            -[BKAVPlayer setIsLoadingResources:](self, "setIsLoadingResources:", 0);
            if (-[BKAVPlayer needsToUpdateTimeObservers](self, "needsToUpdateTimeObservers"))
              -[BKAVPlayer updateTimeObservers](self, "updateTimeObservers");
          }
        }
      }
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("loadedTimeRanges")))
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));

      if (v29 == v11)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "loadedTimeRanges"));
        -[BKAVPlayer setCurrentLoadedTimeRanges:](self, "setCurrentLoadedTimeRanges:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer coalescedLoadedTimeRanges](self, "coalescedLoadedTimeRanges"));
        objc_msgSend(v32, "signalWithCompletion:", &stru_38890);

      }
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("rate")) & 1) == 0
           && objc_msgSend(v10, "isEqualToString:", CFSTR("timeControlStatus")))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
      v34 = (char *)objc_msgSend(v33, "timeControlStatus");

      if (v34)
      {
        if (v34 == (_BYTE *)&dword_0 + 1)
        {
          v51 = BKAudiobooksBKAVLog();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", (uint8_t *)location, 2u);
          }

          -[BKAVPlayer setIsStalling:](self, "setIsStalling:", 1);
        }
        else if (v34 == (_BYTE *)&dword_0 + 2)
        {
          v35 = BKAudiobooksBKAVLog();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusPlaying", (uint8_t *)location, 2u);
          }

          -[BKAVPlayer setIsStalling:](self, "setIsStalling:", 0);
          -[BKAVPlayer setState:](self, "setState:", 2);
          -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
          if (v37 != 1.79769313e308)
          {
            v38 = BKAudiobooksBKAVLog();
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
              LODWORD(location[0]) = 134217984;
              *(id *)((char *)location + 4) = v40;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "handing remaining pendingCurrentTime %f", (uint8_t *)location, 0xCu);
            }

            -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
            -[BKAVPlayer _seekToTime:completionHandler:](self, "_seekToTime:completionHandler:", 0);
          }
          objc_initWeak(location, self);
          v41 = objc_claimAutoreleasedReturnValue(-[BKAVPlayer outputContextQueue](self, "outputContextQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_652C;
          block[3] = &unk_38850;
          objc_copyWeak(&v55, location);
          dispatch_async(v41, block);

          objc_destroyWeak(&v55);
          objc_destroyWeak(location);
        }
      }
      else
      {
        v47 = BKAudiobooksBKAVLog();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = -[BKAVPlayer isStopping](self, "isStopping");
          v50 = &stru_39448;
          if (v49)
            v50 = CFSTR(" (Ignoring because BKAVPlayer is in the process of stopping)");
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = (id)v50;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusPaused%{public}@", (uint8_t *)location, 0xCu);
        }

        -[BKAVPlayer setIsStalling:](self, "setIsStalling:", 0);
        if (!-[BKAVPlayer isStopping](self, "isStopping"))
          -[BKAVPlayer setState:](self, "setState:", 3);
      }
    }
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)BKAVPlayer;
    -[BKAVPlayer observeValueForKeyPath:ofObject:change:context:](&v53, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_playbackFailedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
  objc_msgSend(v5, "player:failedWithError:", self, v4);

}

- (void)_playbackStalledWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
  objc_msgSend(v5, "player:playbackStalledWithError:", self, v4);

}

- (void)playerItemDidReachEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  if (v6 == v7)
  {
    -[BKAVPlayer pause](self, "pause");
    if (!-[BKAVPlayer isScrubbing](self, "isScrubbing"))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
      objc_msgSend(v8, "playerCurrentItemEnded:", self);

    }
  }
}

- (void)playerItemDidStallPlayback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSError *v11;
  NSError *lastError;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  if (v6 == v7)
  {
    v8 = BKAudiobooksBKAVLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2147C();

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
    v11 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    lastError = self->_lastError;
    self->_lastError = v11;

    -[BKAVPlayer pause](self, "pause");
    -[BKAVPlayer _playbackStalledWithError:](self, "_playbackStalledWithError:", self->_lastError);
  }
}

- (void)playerItemFailedToReachEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *lastError;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", AVPlayerItemFailedToPlayToEndTimeErrorKey));
    lastError = self->_lastError;
    self->_lastError = v9;

    v11 = BKAudiobooksBKAVLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214A8((uint64_t)&self->_lastError, v12, v13, v14, v15, v16, v17, v18);

    -[BKAVPlayer _playbackFailedWithError:](self, "_playbackFailedWithError:", self->_lastError);
  }

}

- (void)playerPlaybackWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];

  -[BKAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", -[BKAVPlayer isPlaying](self, "isPlaying", a3));
  v4 = BKAudiobooksBKAVLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[BKAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "player playback was interrupted (was interrupted early? %d)", (uint8_t *)v6, 8u);
  }

}

- (void)routeChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", AVAudioSessionRouteChangeReasonKey));

  if (objc_msgSend(v5, "integerValue") == (char *)&dword_0 + 2)
  {
    if (-[BKAVPlayer wasInterrupted](self, "wasInterrupted"))
    {
      v6 = BKAudiobooksBKAVLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "onRouteChange: already interrupted", buf, 2u);
      }
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_6AF4;
      v10[3] = &unk_38710;
      v10[4] = self;
      v7 = objc_retainBlock(v10);
      if (v7)
      {
        if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          ((void (*))v7[2].isa)(v7);
        }
        else
        {
          v8[0] = _NSConcreteStackBlock;
          v8[1] = 3221225472;
          v8[2] = sub_6B64;
          v8[3] = &unk_386C0;
          v9 = v7;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

        }
      }
    }

  }
}

- (void)audioSessionInterrupted:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  _BYTE v21[10];
  _BYTE v22[6];
  int v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionTypeKey));
  v6 = (char *)objc_msgSend(v5, "unsignedIntegerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionOptionKey));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionReasonKey));
  v10 = (char *)objc_msgSend(v9, "unsignedIntegerValue");

  v11 = -[BKAVPlayer isPlaying](self, "isPlaying");
  if (v10 == (_BYTE *)&dword_0 + 1)
  {
    v12 = BKAudiobooksBKAVLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109632;
      *(_DWORD *)v21 = v11;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = -[BKAVPlayer wasInterrupted](self, "wasInterrupted");
      *(_WORD *)v22 = 1024;
      *(_DWORD *)&v22[2] = -[BKAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "ignoring wasSuspended interruption, wasPlaying: %d, wasInterrupted: %d, wasInterruptedEarly: %d", (uint8_t *)&v20, 0x14u);
    }

  }
  else if (v6)
  {
    if (v6 == (_BYTE *)&dword_0 + 1)
    {
      v14 = BKAudiobooksBKAVLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 67109376;
        *(_DWORD *)v21 = v11;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = -[BKAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "handleInterruption began, wasPlaying %d, wasInterruptedEarly %d", (uint8_t *)&v20, 0xEu);
      }

      -[BKAVPlayer _pause](self, "_pause");
      v16 = (v11 & 1) != 0 || -[BKAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
      -[BKAVPlayer setWasInterrupted:](self, "setWasInterrupted:", v16);
      if (-[BKAVPlayer wasInterrupted](self, "wasInterrupted"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
        objc_msgSend(v19, "playerWasInterrupted:", self);

      }
      -[BKAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", 0);
    }
  }
  else
  {
    v17 = BKAudiobooksBKAVLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218496;
      *(_QWORD *)v21 = v8;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)v22 = -[BKAVPlayer wasInterrupted](self, "wasInterrupted");
      *(_WORD *)&v22[4] = 1024;
      v23 = v8 & 1;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "handleInterruption ended: %lu wasInterrupted: %d resumable: %d", (uint8_t *)&v20, 0x18u);
    }

    if ((v8 & 1) != 0 && -[BKAVPlayer wasInterrupted](self, "wasInterrupted"))
      -[BKAVPlayer play](self, "play");
    -[BKAVPlayer setWasInterrupted:](self, "setWasInterrupted:", 0);
  }

}

- (void)handleNewAccessLogEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *accessLogQueue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = objc_opt_class(AVPlayerItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  objc_initWeak(&location, self);
  accessLogQueue = self->_accessLogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6F44;
  block[3] = &unk_388E0;
  objc_copyWeak(&v13, &location);
  v12 = v8;
  v10 = v8;
  dispatch_async(accessLogQueue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)outputContextVolumeDidChange:(id)a3
{
  -[BKAVPlayer _processOutputContextVolumeNotification:](self, "_processOutputContextVolumeNotification:", a3);
}

- (void)outputContextDestinationChange:(id)a3
{
  -[BKAVPlayer _processOutputContextVolumeNotification:](self, "_processOutputContextVolumeNotification:", a3);
}

- (void)_seekToTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  $95D729B680665BEAEFA1D6FCA8238556 v11;
  $95D729B680665BEAEFA1D6FCA8238556 seekTolerance;
  _QWORD v13[5];
  id v14;
  double v15;
  CMTime v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentItem"));
  objc_msgSend(v8, "cancelPendingSeeks");

  -[BKAVPlayer setLastPosition:](self, "setLastPosition:", 9.22337204e18);
  -[BKAVPlayer setPendingCurrentTime:](self, "setPendingCurrentTime:", a3);
  -[BKAVPlayer setLastSeekPosition:](self, "setLastSeekPosition:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  CMTimeMakeWithSeconds(&v16, a3, 1000000000);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7240;
  v13[3] = &unk_38908;
  v15 = a3;
  v13[4] = self;
  v14 = v6;
  seekTolerance = self->_seekTolerance;
  v11 = self->_seekTolerance;
  v10 = v6;
  objc_msgSend(v9, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v16, &seekTolerance, &v11, v13);

}

- (double)currentTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double Seconds;
  void *v8;
  void *v9;
  CMTime time;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));

  -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
  if (v5 == 1.79769313e308)
  {
    Seconds = 0.0;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "currentTime");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);

    }
  }
  else
  {
    -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
    Seconds = v6;
  }

  return Seconds;
}

- (void)setCurrentTime:(double)a3
{
  -[BKAVPlayer setCurrentTime:completion:](self, "setCurrentTime:completion:", 0, a3);
}

- (void)setCurrentTime:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  double v16;
  uint8_t buf[4];
  double v18;

  v6 = a4;
  v7 = v6;
  if (a3 >= 0.0)
  {
    if (self->_scrubbing && self->_wasPlayingBeforeScrubbing)
    {
      -[BKAVPlayer _handleScrubPlayPreviewAtTime:completion:](self, "_handleScrubPlayPreviewAtTime:completion:", v6, a3);
    }
    else
    {
      v12 = BKAudiobooksBKAVLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = a3;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (setCurrentTime)", buf, 0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_7588;
      v14[3] = &unk_38930;
      v16 = a3;
      v15 = v7;
      -[BKAVPlayer _seekToTime:completionHandler:](self, "_seekToTime:completionHandler:", v14, a3);

    }
  }
  else
  {
    v8 = objc_retainBlock(v6);
    v9 = v8;
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

    v10 = BKAudiobooksBKAVLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_2153C();

  }
}

- (BOOL)isCurrentTimeValid
{
  double v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
  if (v3 != 1.79769313e308)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));

  if (v6)
    v4 = objc_msgSend(v6, "status") == (char *)&dword_0 + 1;
  else
    v4 = 0;

  return v4;
}

- (void)_handleScrubPlayPreviewAtTime:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  double v15;
  _QWORD block[4];
  id v17[2];
  id location[3];

  v6 = a4;
  if (self->_state == 2 && self->_scrubPausable)
  {
    -[BKAVPlayer _pause](self, "_pause");
    *(_WORD *)&self->_playingPreview = 0;
    v7 = (void *)(self->_scrubDispatchAfterGeneration + 1);
    self->_scrubDispatchAfterGeneration = (unint64_t)v7;
    objc_initWeak(location, self);
    v8 = dispatch_time(0, 400000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_78F4;
    block[3] = &unk_38800;
    objc_copyWeak(v17, location);
    v17[1] = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);

    objc_destroyWeak(v17);
    objc_destroyWeak(location);
  }
  else
  {
    v11 = BKAudiobooksBKAVLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = *(id *)&a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (_handleScrubPlayPreviewAtTime:completion:)", (uint8_t *)location, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_7A24;
    v13[3] = &unk_38930;
    v15 = a3;
    v14 = v6;
    -[BKAVPlayer _seekToTime:completionHandler:](self, "_seekToTime:completionHandler:", v13, a3);

  }
}

- (void)setPlayer:(id)a3
{
  AVPlayer **p_player;
  void *v6;
  void *v7;
  AVPlayer *v8;

  p_player = &self->_player;
  v8 = (AVPlayer *)a3;
  if (*p_player != v8)
  {
    -[BKAVPlayer _removePeriodicTimeObserver](self, "_removePeriodicTimeObserver");
    -[BKAVPlayer _removeAllTimeObserversWithClearObservedTimes:](self, "_removeAllTimeObserversWithClearObservedTimes:", 0);
    -[BKAVPlayer setCurrentLoadedTimeRanges:](self, "setCurrentLoadedTimeRanges:", 0);
    -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), off_446A0);
    -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), off_446A0);
    -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), off_446A0);
    if (!v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("status"), off_446A0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("loadedTimeRanges"), off_446A0);

    }
    objc_storeStrong((id *)&self->_player, a3);
    if (*p_player)
    {
      -[AVPlayer addObserver:forKeyPath:options:context:](*p_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 6, off_446A0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 0, off_446A0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 0, off_446A0);
    }
  }

}

- (void)_updatePlayer
{
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[BKAVPlayer _removePeriodicTimeObserver](self, "_removePeriodicTimeObserver");
  -[BKAVPlayer _removeAllTimeObserversWithClearObservedTimes:](self, "_removeAllTimeObserversWithClearObservedTimes:", 0);
  -[BKAVPlayer setCurrentLoadedTimeRanges:](self, "setCurrentLoadedTimeRanges:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer asset](self, "asset"));

  v4 = BKAudiobooksBKAVLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset, about to create playerItem", buf, 2u);
    }

    -[BKAVPlayer _revalidatePlayerItem](self, "_revalidatePlayerItem");
    -[BKAVPlayer _addPeriodicTimeObserver](self, "_addPeriodicTimeObserver");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_updatePlayer, no asset, about to call replaceCurrentItemWithPlayerItem nil", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v7, "replaceCurrentItemWithPlayerItem:", 0);

  }
}

- (void)_revalidatePlayerItem
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer asset](self, "asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v3));

  v5 = -[BKAVPlayer _isStreamingAssetURL](self, "_isStreamingAssetURL");
  if (v5)
  {
    objc_msgSend(v4, "setPreferredForwardBufferDuration:", 3600.0);
    objc_msgSend(v4, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:", 1);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));

  v7 = BKAudiobooksBKAVLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset and player, about to call replaceCurrentItemWithPlayerItem", v14, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v10, "replaceCurrentItemWithPlayerItem:", v4);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset, no existing player, we created a player with playerItem", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", v4));
    -[BKAVPlayer setPlayer:](self, "setPlayer:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v12, "setActionAtItemEnd:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v10, "setAllowsExternalPlayback:", 0);
  }

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v13, "setAutomaticallyWaitsToMinimizeStalling:", 1);

  }
}

- (void)_updateAudioParameters
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  objc_msgSend(v2, "setAudioTimePitchAlgorithm:", AVAudioTimePitchAlgorithmTimeDomain);

}

- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4
{
  -[BKAVPlayer _playWithSeekTime:fadeIn:completion:](self, "_playWithSeekTime:fadeIn:completion:", 0, a3);
}

- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4 completion:(id)a5
{
  id v8;
  float playbackRate;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  float v21;
  double v22;
  void *v23;
  float v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  float v28;
  double v29;
  float v30;
  _QWORD *v31;
  _QWORD *v32;
  NSError *lastError;
  void *v34;
  char *v35;
  void *v36;
  double v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  id v51;
  NSObject *v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[5];
  _QWORD *v57;
  id v58;
  CMTime time;
  _QWORD v60[5];
  _QWORD v61[5];
  uint8_t buf[4];
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;

  v8 = a5;
  playbackRate = self->_playbackRate;
  if (playbackRate < 0.0 || fabsf(playbackRate) < 0.01)
  {
    v10 = BKAudiobooksBKAVLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21568((uint64_t)&self->_playbackRate, v11, v12, v13, v14, v15, v16, v17);

    self->_playbackRate = 1.0;
  }
  v18 = BKAudiobooksBKAVLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (a3 == 1.79769313e308)
  {
    if (!v20)
      goto LABEL_12;
    -[BKAVPlayer playbackRate](self, "playbackRate");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v23, "rate");
    *(_DWORD *)buf = 134218496;
    v63 = a4;
    v64 = 2048;
    v65 = v22;
    v66 = 2048;
    v67 = v24;
    v25 = "_playWithSeekTime: BKNoPendingCurrentTime fadeInTime:%.1f playbackRate:%.1f rateBeforeCall:%.2f";
    v26 = v19;
    v27 = 32;
  }
  else
  {
    if (!v20)
      goto LABEL_12;
    -[BKAVPlayer playbackRate](self, "playbackRate");
    v29 = v28;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v23, "rate");
    *(_DWORD *)buf = 134218752;
    v63 = a3;
    v64 = 2048;
    v65 = a4;
    v66 = 2048;
    v67 = v29;
    v68 = 2048;
    v69 = v30;
    v25 = "_playWithSeekTime: %.1f fadeInTime:%.1f playbackRate:%.1f rateBeforeCall:%.2f";
    v26 = v19;
    v27 = 42;
  }
  _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);

LABEL_12:
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_848C;
  v61[3] = &unk_389A8;
  v61[4] = self;
  v31 = objc_retainBlock(v61);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_8750;
  v60[3] = &unk_389A8;
  v60[4] = self;
  v32 = objc_retainBlock(v60);
  lastError = self->_lastError;
  self->_lastError = 0;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
  v35 = (char *)objc_msgSend(v34, "status");

  if (v35)
  {
    if (v35 == (_BYTE *)&dword_0 + 2)
    {
      v40 = BKAudiobooksBKAVLog();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v42 = "recover player (AVPlayerItemStatusFailed)";
LABEL_25:
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
      }
    }
    else
    {
      if (v35 != (_BYTE *)&dword_0 + 1)
        goto LABEL_36;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
      if (objc_msgSend(v36, "isPlaybackLikelyToKeepUp"))
      {

LABEL_27:
        -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
        if (v45 == 1.79769313e308)
          goto LABEL_35;
        -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
        v47 = v46;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
        v49 = v48;
        if (v48)
          objc_msgSend(v48, "currentTime");
        else
          memset(&time, 0, sizeof(time));
        v50 = vabdd_f64(v47, CMTimeGetSeconds(&time));

        if (v50 < 0.00999999978)
        {
LABEL_35:
          -[BKAVPlayer setPendingCurrentTime:](self, "setPendingCurrentTime:", 1.79769313e308);
          ((void (*)(_QWORD *, id))v32[2])(v32, v8);
        }
        else
        {
          v51 = BKAudiobooksBKAVLog();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
            *(_DWORD *)buf = 134217984;
            v63 = v53;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (_playWithSeekTime)", buf, 0xCu);
          }

          -[BKAVPlayer pendingCurrentTime](self, "pendingCurrentTime");
          v55 = v54;
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_8A08;
          v56[3] = &unk_389F8;
          v56[4] = self;
          v57 = v32;
          v58 = v8;
          -[BKAVPlayer _seekToTime:completionHandler:](self, "_seekToTime:completionHandler:", v56, v55);

        }
        goto LABEL_36;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer assetNetworkError](self, "assetNetworkError"));

      if (!v43)
        goto LABEL_27;
      v44 = BKAudiobooksBKAVLog();
      v41 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v42 = "recover player (hasUnderlyingError)";
        goto LABEL_25;
      }
    }

    ((void (*)(_QWORD *, id))v31[2])(v31, v8);
    goto LABEL_36;
  }
  -[BKAVPlayer setPendingCurrentTime:](self, "setPendingCurrentTime:", a3);
  *(float *)&v37 = a4;
  -[BKAVPlayer setPlayFadeInTime:](self, "setPlayFadeInTime:", v37);
  -[BKAVPlayer setState:](self, "setState:", 1);
  v38 = objc_retainBlock(v8);
  v39 = v38;
  if (v38)
    (*((void (**)(id))v38 + 2))(v38);

LABEL_36:
}

- (void)_activateSessionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8B54;
  v6[3] = &unk_38A48;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "activateWithOptions:completionHandler:", 0, v6);

}

- (void)setState:(int64_t)a3
{
  int64_t state;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    v6 = BKAudiobooksBKAVLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromBKAudiobookPlayerState(self->_state);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "state = %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
    objc_msgSend(v10, "player:stateChangedFrom:to:", self, state, self->_state);

  }
  if (a3 == 2)
    -[BKAVPlayer setWasInterrupted:](self, "setWasInterrupted:", 0);
}

- (void)_registerAssetForDRMGroupIDDelegation:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  AVContentKeySession *v16;
  AVContentKeySession *contentKeySession;
  AVContentKeySession *v18;
  BKPendingAssetAuthorization *v19;
  BKPendingAssetAuthorization *v20;
  id v21;

  v21 = a4;
  v6 = a3;
  v7 = objc_opt_class(AVURLAsset);
  v8 = BUDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AVContentKeySession contentKeyRecipients](self->_contentKeySession, "contentKeyRecipients"));
  v11 = objc_msgSend(v10, "containsObject:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer pendingAssetAuth](self, "pendingAssetAuth"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asset"));
  v14 = objc_msgSend(v13, "isEqual:", v9);

  if (v9)
  {
    v15 = self->_audibleDRMGroupID == -1 ? 1 : v11;
    if (((v15 | v14) & 1) == 0)
    {
      if (!self->_contentKeySession)
      {
        self->_isAudibleDRMGroupAuthorized = 0;
        v16 = (AVContentKeySession *)objc_claimAutoreleasedReturnValue(+[AVContentKeySession contentKeySessionWithKeySystem:](AVContentKeySession, "contentKeySessionWithKeySystem:", AVContentKeySystemAuthorizationToken));
        contentKeySession = self->_contentKeySession;
        self->_contentKeySession = v16;

        -[AVContentKeySession setDelegate:queue:](self->_contentKeySession, "setDelegate:queue:", self, &_dispatch_main_q);
      }
      v18 = self->_contentKeySession;
      if (!self->_isAudibleDRMGroupAuthorized)
      {
        -[AVContentKeySession processContentKeyRequestWithIdentifier:initializationData:options:](v18, "processContentKeyRequestWithIdentifier:initializationData:options:", CFSTR("AudibleGroupID"), 0, 0);
        v20 = -[BKPendingAssetAuthorization initWithAsset:completion:]([BKPendingAssetAuthorization alloc], "initWithAsset:completion:", v9, v21);
        -[BKAVPlayer setPendingAssetAuth:](self, "setPendingAssetAuth:", v20);
        goto LABEL_12;
      }
      -[AVContentKeySession addContentKeyRecipient:](v18, "addContentKeyRecipient:", v9);
    }
  }
  v19 = (BKPendingAssetAuthorization *)objc_retainBlock(v21);
  v20 = v19;
  if (v19)
    ((void (*)(BKPendingAssetAuthorization *, void *))v19->_completion)(v19, v9);
LABEL_12:

}

- (void)_unregisterAssetForDRMGroupIDDelegation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  AVContentKeySession *contentKeySession;
  id v8;

  v4 = a3;
  v5 = objc_opt_class(AVURLAsset);
  v6 = BUDynamicCast(v5, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);

  if (v8)
    -[AVContentKeySession removeContentKeyRecipient:](self->_contentKeySession, "removeContentKeyRecipient:", v8);
  contentKeySession = self->_contentKeySession;
  self->_contentKeySession = 0;

}

- (BOOL)_isStreamingAssetURL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer assetURL](self, "assetURL"));
  v3 = objc_msgSend(v2, "bk_isStreamingAssetURL");

  return v3;
}

- (id)assetNetworkError
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;
  BOOL v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  NSErrorUserInfoKey v32;
  void *v33;
  _BYTE v34[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer currentItem](self, "currentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "errorLog"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorDomain", (_QWORD)v28));
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("CoreMediaErrorDomain"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorDomain"));
        v14 = objc_msgSend(v13, "isEqualToString:", NSURLErrorDomain);

        if (!v14
          || ((v15 = objc_msgSend(v10, "errorStatusCode"), (unint64_t)v15 + 1009 <= 6)
            ? (v16 = ((1 << (v15 - 15)) & 0x71) == 0)
            : (v16 = 1),
              v16))
        {
          if ((v12 & 1) == 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorDomain"));
            v18 = objc_msgSend(v17, "isEqualToString:", kCFErrorDomainCFNetwork);

            if (!v18)
              continue;
          }
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorComment"));
        v21 = objc_msgSend(v20, "length");

        if (v21)
        {
          v32 = NSDebugDescriptionErrorKey;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorComment"));
          v33 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

        }
        else
        {
          v23 = 0;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "errorDomain"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, objc_msgSend(v10, "errorStatusCode"), v23));

        v25 = BKAudiobooksBKAVLog();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_2163C(v10, v26);

        goto LABEL_24;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      v19 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_24:

  return v19;
}

- (void)_setInternalVolumeAndNotify:(float)a3
{
  double v5;
  id v6;

  if (vabdd_f64(self->_volume, a3) >= 0.00999999978)
  {
    self->_volume = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
    *(float *)&v5 = a3;
    objc_msgSend(v6, "player:volumeDidChange:", self, v5);

  }
}

- (void)_reevaluateVolumeFromPlayer
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputContext"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "canSetVolume");
    objc_msgSend(v4, "volume");
    -[BKAVPlayer _reevaluateInternalVolumeWithContextCanSetVolume:volume:](self, "_reevaluateInternalVolumeWithContextCanSetVolume:volume:", v5);
  }

}

- (void)_reevaluateInternalVolumeWithContextCanSetVolume:(BOOL)a3 volume:(float)a4
{
  id v5;

  if (a3)
  {
    -[BKAVPlayer _setInternalVolumeAndNotify:](self, "_setInternalVolumeAndNotify:");
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    objc_msgSend(v5, "volume");
    -[BKAVPlayer _setInternalVolumeAndNotify:](self, "_setInternalVolumeAndNotify:");

  }
}

- (void)_processOutputContextVolumeNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  int v12;
  int v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  BKAVPlayer *v20;
  id v21;
  int v22;
  unsigned __int8 v23;
  id location;

  v4 = a3;
  v5 = objc_opt_class(AVOutputContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
    v10 = objc_msgSend(v9, "copy");

    objc_initWeak(&location, self);
    v11 = objc_msgSend(v8, "canSetVolume");
    objc_msgSend(v8, "volume");
    v13 = v12;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_95B8;
    v18[3] = &unk_38A70;
    objc_copyWeak(&v21, &location);
    v14 = v10;
    v19 = v14;
    v20 = self;
    v23 = v11;
    v22 = v13;
    v15 = objc_retainBlock(v18);
    if (v15)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v15[2])(v15);
      }
      else
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_9634;
        v16[3] = &unk_386C0;
        v17 = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  int *p_audibleDRMGroupID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  p_audibleDRMGroupID = &self->_audibleDRMGroupID;
  v6 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", p_audibleDRMGroupID, 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVContentKeyResponse contentKeyResponseWithAuthorizationTokenData:](AVContentKeyResponse, "contentKeyResponseWithAuthorizationTokenData:"));
  objc_msgSend(v6, "processContentKeyResponse:", v7);

  self->_isAudibleDRMGroupAuthorized = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer pendingAssetAuth](self, "pendingAssetAuth"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer pendingAssetAuth](self, "pendingAssetAuth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asset"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AVContentKeySession contentKeyRecipients](self->_contentKeySession, "contentKeyRecipients"));
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if ((v12 & 1) == 0)
      -[AVContentKeySession addContentKeyRecipient:](self->_contentKeySession, "addContentKeyRecipient:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer pendingAssetAuth](self, "pendingAssetAuth"));
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completion"));

    if (v14)
      ((void (**)(_QWORD, void *))v14)[2](v14, v10);

    -[BKAVPlayer setPendingAssetAuth:](self, "setPendingAssetAuth:", 0);
  }

}

- (void)updateTimeObservers
{
  id v3;
  char v4;
  uint64_t v5;
  double v6;
  void *i;
  uint64_t v8;
  double Seconds;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id obj;
  _QWORD v23[4];
  id v24[2];
  CMTime time;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  double v31;
  _BYTE v32[128];

  if (-[BKAVPlayer needsToUpdateTimeObservers](self, "needsToUpdateTimeObservers"))
  {
    -[BKAVPlayer _removeAllTimeObserversWithClearObservedTimes:](self, "_removeAllTimeObserversWithClearObservedTimes:", 0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[BKAVPlayer observedTimes](self, "observedTimes"));
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v3)
    {
      v4 = 0;
      v5 = *(_QWORD *)v27;
      v6 = 9.22337204e18;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v5)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (v8)
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "CMTimeValue");
          else
            memset(&time, 0, sizeof(time));
          Seconds = CMTimeGetSeconds(&time);
          v10 = BKAudiobooksBKAVLog();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v31 = Seconds;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "adding time observer: %.1f", buf, 0xCu);
          }

          objc_initWeak((id *)buf, self);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_9B4C;
          v23[3] = &unk_38800;
          v24[1] = *(id *)&Seconds;
          objc_copyWeak(v24, (id *)buf);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v13, 0, v23));

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer timeObservers](self, "timeObservers"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v8);

          if ((v4 & 1) != 0 || !-[BKAVPlayer isCurrentTimeValid](self, "isCurrentTimeValid"))
          {
            v4 = 1;
          }
          else
          {
            -[BKAVPlayer currentTime](self, "currentTime");
            v4 = 0;
            if (Seconds <= v16)
              v6 = Seconds;
          }

          objc_destroyWeak(v24);
          objc_destroyWeak((id *)buf);
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v3);

      -[BKAVPlayer setNeedsToUpdateTimeObservers:](self, "setNeedsToUpdateTimeObservers:", 0);
      if ((v4 & 1) != 0)
      {
        v17 = BKAudiobooksBKAVLog();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_216DC();

      }
      else if (v6 != 9.22337204e18)
      {
        v19 = BKAudiobooksBKAVLog();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v31 = v6;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "recently passed time: %.1f", buf, 0xCu);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer delegate](self, "delegate"));
        objc_msgSend(v21, "player:didReachPosition:", self, v6);

      }
    }
    else
    {

      -[BKAVPlayer setNeedsToUpdateTimeObservers:](self, "setNeedsToUpdateTimeObservers:", 0);
    }
  }
}

- (void)addTimeObserver:(double)a3
{
  id v3;
  NSObject *v4;
  void *v6;
  CMTime v7;

  if (a3 >= 0.0)
  {
    CMTimeMakeWithSeconds(&v7, a3, 1000000000);
    v4 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v7));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer observedTimes](self, "observedTimes"));
    objc_msgSend(v6, "addObject:", v4);

    -[BKAVPlayer setNeedsToUpdateTimeObservers:](self, "setNeedsToUpdateTimeObservers:", 1);
  }
  else
  {
    v3 = BKAudiobooksBKAVLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_21708(v4);
  }

}

- (void)removeTimeObserver:(double)a3
{
  void *v4;
  void *v5;
  CMTime v6;

  CMTimeMakeWithSeconds(&v6, a3, 1000000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer observedTimes](self, "observedTimes"));
  objc_msgSend(v5, "removeObject:", v4);

  -[BKAVPlayer setNeedsToUpdateTimeObservers:](self, "setNeedsToUpdateTimeObservers:", 1);
}

- (void)removeAllTimeObservers
{
  -[BKAVPlayer _removeAllTimeObserversWithClearObservedTimes:](self, "_removeAllTimeObserversWithClearObservedTimes:", 1);
}

- (void)_removeAllTimeObserversWithClearObservedTimes:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];

  v3 = a3;
  v5 = BKAudiobooksBKAVLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "remove time observers on player", buf, 2u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer timeObservers](self, "timeObservers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer timeObservers](self, "timeObservers"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
          objc_msgSend(v15, "removeTimeObserver:", v14);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer timeObservers](self, "timeObservers"));
  objc_msgSend(v16, "removeAllObjects");

  if (v3)
  {
    v17 = BKAudiobooksBKAVLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "clear observed times", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer observedTimes](self, "observedTimes"));
    objc_msgSend(v19, "removeAllObjects");

  }
}

- (void)_addPeriodicTimeObserver
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  CMTime v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    CMTimeMakeWithSeconds(&v8, 1.0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_A0A8;
    v6[3] = &unk_38A98;
    objc_copyWeak(&v7, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v8, 0, v6));

    -[BKAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_removePeriodicTimeObserver
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer player](self, "player"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVPlayer periodicTimeObserver](self, "periodicTimeObserver"));
    objc_msgSend(v4, "removeTimeObserver:", v5);

    -[BKAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", 0);
  }
}

- (int)audibleDRMGroupID
{
  return self->_audibleDRMGroupID;
}

- (void)setAudibleDRMGroupID:(int)a3
{
  self->_audibleDRMGroupID = a3;
}

- (BKAVPlayerDelegate)delegate
{
  return (BKAVPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isStalling
{
  return self->_isStalling;
}

- (BOOL)isLoadingResources
{
  return self->_isLoadingResources;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySession, a3);
}

- (AVAssetResourceLoaderDelegate)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (double)pendingCurrentTime
{
  return self->_pendingCurrentTime;
}

- (void)setPendingCurrentTime:(double)a3
{
  self->_pendingCurrentTime = a3;
}

- (float)playFadeInTime
{
  return self->_playFadeInTime;
}

- (void)setPlayFadeInTime:(float)a3
{
  self->_playFadeInTime = a3;
}

- (NSMutableDictionary)timeObservers
{
  return self->_timeObservers;
}

- (void)setTimeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_timeObservers, a3);
}

- (NSMutableArray)observedTimes
{
  return self->_observedTimes;
}

- (void)setObservedTimes:(id)a3
{
  objc_storeStrong((id *)&self->_observedTimes, a3);
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserver, a3);
}

- (BOOL)needsToUpdateTimeObservers
{
  return self->_needsToUpdateTimeObservers;
}

- (void)setNeedsToUpdateTimeObservers:(BOOL)a3
{
  self->_needsToUpdateTimeObservers = a3;
}

- (double)lastPosition
{
  return self->_lastPosition;
}

- (void)setLastPosition:(double)a3
{
  self->_lastPosition = a3;
}

- (double)lastSeekPosition
{
  return self->_lastSeekPosition;
}

- (void)setLastSeekPosition:(double)a3
{
  self->_lastSeekPosition = a3;
}

- (BOOL)wasPlayingBeforeScrubbing
{
  return self->_wasPlayingBeforeScrubbing;
}

- (void)setWasPlayingBeforeScrubbing:(BOOL)a3
{
  self->_wasPlayingBeforeScrubbing = a3;
}

- (unint64_t)scrubDispatchAfterGeneration
{
  return self->_scrubDispatchAfterGeneration;
}

- (void)setScrubDispatchAfterGeneration:(unint64_t)a3
{
  self->_scrubDispatchAfterGeneration = a3;
}

- (BOOL)isPlayingPreview
{
  return self->_playingPreview;
}

- (void)setPlayingPreview:(BOOL)a3
{
  self->_playingPreview = a3;
}

- (BOOL)isScrubPausable
{
  return self->_scrubPausable;
}

- (void)setScrubPausable:(BOOL)a3
{
  self->_scrubPausable = a3;
}

- (unint64_t)scrubPausableDispatchAfterGeneration
{
  return self->_scrubPausableDispatchAfterGeneration;
}

- (void)setScrubPausableDispatchAfterGeneration:(unint64_t)a3
{
  self->_scrubPausableDispatchAfterGeneration = a3;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (void)setWasInterrupted:(BOOL)a3
{
  self->_wasInterrupted = a3;
}

- (BOOL)wasInterruptedEarly
{
  return self->_wasInterruptedEarly;
}

- (void)setWasInterruptedEarly:(BOOL)a3
{
  self->_wasInterruptedEarly = a3;
}

- (OS_dispatch_queue)hlsQueue
{
  return self->_hlsQueue;
}

- (void)setHlsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hlsQueue, a3);
}

- (OS_dispatch_queue)outputContextQueue
{
  return self->_outputContextQueue;
}

- (void)setOutputContextQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputContextQueue, a3);
}

- (OS_dispatch_queue)accessLogQueue
{
  return self->_accessLogQueue;
}

- (void)setAccessLogQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessLogQueue, a3);
}

- (BKPendingAssetAuthorization)pendingAssetAuth
{
  return self->_pendingAssetAuth;
}

- (void)setPendingAssetAuth:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAssetAuth, a3);
}

- (BOOL)isAudibleDRMGroupAuthorized
{
  return self->_isAudibleDRMGroupAuthorized;
}

- (void)setIsAudibleDRMGroupAuthorized:(BOOL)a3
{
  self->_isAudibleDRMGroupAuthorized = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTolerance
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (NSArray)currentLoadedTimeRanges
{
  return self->_currentLoadedTimeRanges;
}

- (void)setCurrentLoadedTimeRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BUCoalescingCallBlock)coalescedLoadedTimeRanges
{
  return self->_coalescedLoadedTimeRanges;
}

- (void)setCoalescedLoadedTimeRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isStopping
{
  return self->_isStopping;
}

- (void)setIsStopping:(BOOL)a3
{
  self->_isStopping = a3;
}

- (float)lastBitrate
{
  return self->_lastBitrate;
}

- (void)setLastBitrate:(float)a3
{
  self->_lastBitrate = a3;
}

- (void)setOutputContextID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContextID, 0);
  objc_storeStrong((id *)&self->_coalescedLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_currentLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_pendingAssetAuth, 0);
  objc_storeStrong((id *)&self->_accessLogQueue, 0);
  objc_storeStrong((id *)&self->_outputContextQueue, 0);
  objc_storeStrong((id *)&self->_hlsQueue, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_observedTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
