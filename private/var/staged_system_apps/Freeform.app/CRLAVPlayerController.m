@implementation CRLAVPlayerController

- (id)newRenderable
{
  id v2;
  void *v3;

  v2 = -[CRLAVPlayerController newLayer](self, "newLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v2));

  return v3;
}

+ (void)initialize
{
  double v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLAVPlayerController, a2).n128_u64[0];
  if (v4 == a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v3));
    v7 = CFSTR("CRLAVPlayerControllerDisableGaplessLooping");
    v8 = &__kCFBooleanFalse;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    objc_msgSend(v5, "registerDefaults:", v6);

  }
}

- (CRLAVPlayerController)initWithPlayerItem:(id)a3 delegate:(id)a4
{
  return -[CRLAVPlayerController initWithInitialPlayerItem:enqueuedAssets:initialEnqueuedAssetIndex:delegate:](self, "initWithInitialPlayerItem:enqueuedAssets:initialEnqueuedAssetIndex:delegate:", a3, &__NSArray0__struct, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (CRLAVPlayerController)initWithAssets:(id)a3 initialAssetIndex:(unint64_t)a4 delegate:(id)a5
{
  return -[CRLAVPlayerController initWithInitialPlayerItem:enqueuedAssets:initialEnqueuedAssetIndex:delegate:](self, "initWithInitialPlayerItem:enqueuedAssets:initialEnqueuedAssetIndex:delegate:", 0, a3, a4, a5);
}

- (CRLAVPlayerController)initWithInitialPlayerItem:(id)a3 enqueuedAssets:(id)a4 initialEnqueuedAssetIndex:(unint64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  CRLAVPlayerController *v13;
  NSArray *v14;
  NSArray *mEnqueuedAssets;
  AVQueuePlayer *v16;
  AVQueuePlayer *mPlayer;
  NSMutableSet *v18;
  NSMutableSet *mObservationTokens;
  double v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRLAVPlayerController;
  v13 = -[CRLAVPlayerController init](&v22, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v11, "copy");
    mEnqueuedAssets = v13->mEnqueuedAssets;
    v13->mEnqueuedAssets = v14;

    v13->mRepeatMode = 0;
    v13->mVolume = 1.0;
    v13->mPendingRate = NAN;
    objc_storeStrong((id *)&v13->mDelegate, a6);
    v16 = (AVQueuePlayer *)objc_alloc_init((Class)AVQueuePlayer);
    mPlayer = v13->mPlayer;
    v13->mPlayer = v16;

    -[AVQueuePlayer setActionAtItemEnd:](v13->mPlayer, "setActionAtItemEnd:", 2 * (-[NSArray count](v13->mEnqueuedAssets, "count") == 0));
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](v13->mPlayer, "addObserver:forKeyPath:options:context:", v13, CFSTR("currentItem"), 7, off_1013DB568);
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](v13->mPlayer, "addObserver:forKeyPath:options:context:", v13, CFSTR("rate"), 7, off_1013DB570);
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](v13->mPlayer, "addObserver:forKeyPath:options:context:", v13, CFSTR("status"), 4, off_1013DB578);
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](v13->mPlayer, "addObserver:forKeyPath:options:context:", v13, CFSTR("currentItem.status"), 4, off_1013DB580);
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mObservationTokens = v13->mObservationTokens;
    v13->mObservationTokens = v18;

    LODWORD(v20) = 1.0;
    -[AVQueuePlayer setVolume:](v13->mPlayer, "setVolume:", v20);
    if (v10)
      -[AVQueuePlayer replaceCurrentItemWithPlayerItem:](v13->mPlayer, "replaceCurrentItemWithPlayerItem:", v10);
    if (a5 != 0x7FFFFFFFFFFFFFFFLL)
      -[CRLAVPlayerController p_enqueueAssetsFromIndex:](v13, "p_enqueueAssetsFromIndex:", a5);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->mDelegate || self->mPlayerItemMediator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F6F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D2BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F718);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 172, 0, "-teardown must be called before dealloc");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLAVPlayerController;
  -[CRLAVPlayerController dealloc](&v6, "dealloc");
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  AVPlayerLooper *mPlayerLooper;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  CRLMediaPlayerControllerDelegate *mDelegate;
  CRLAVPlayerControllerPlayerItemMediating *mPlayerItemMediator;
  NSMutableSet *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  AVPlayerItem *mVolumeRampPlayerItem;
  id mVolumeRampBoundaryTimeObserver;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  CRLAVPlayerController *v32;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F738);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D3BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F758);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController teardown]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 176, 0, "This operation must only be performed on the main thread.");

  }
  if (-[CRLAVPlayerController isPlaying](self, "isPlaying")
    || -[CRLAVPlayerController isFastReversing](self, "isFastReversing")
    || -[CRLAVPlayerController isFastForwarding](self, "isFastForwarding"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F778);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D33C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F798);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController teardown]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 178, 0, "player controller should not be playing when it is told to teardown");

  }
  if (qword_10147E5C8 != -1)
    dispatch_once(&qword_10147E5C8, &stru_10124F7B8);
  v9 = off_1013DB560;
  if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: teardown", buf, 0xCu);
  }
  v10 = *(_OWORD *)&kCMTimeRangeInvalid.start.epoch;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.value = *(_OWORD *)&kCMTimeRangeInvalid.start.value;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch = v10;
  *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale = *(_OWORD *)&kCMTimeRangeInvalid.duration.timescale;
  self->mIsPlayerItemTimeRangeForScrubbing = 0;
  -[AVPlayerLooper disableLooping](self->mPlayerLooper, "disableLooping");
  mPlayerLooper = self->mPlayerLooper;
  self->mPlayerLooper = 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setRate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentItem"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "removeObserver:name:object:", self, AVPlayerItemTimeJumpedNotification, v14);

  }
  objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), off_1013DB568);
  objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), off_1013DB570);
  objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), off_1013DB580);
  objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("status"), off_1013DB578);
  objc_msgSend(v12, "replaceCurrentItemWithPlayerItem:", 0);
  mDelegate = self->mDelegate;
  self->mDelegate = 0;

  mPlayerItemMediator = self->mPlayerItemMediator;
  self->mPlayerItemMediator = 0;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->mObservationTokens;
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        -[CRLAVPlayerController crl_removeObserverForToken:](self, "crl_removeObserverForToken:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), (_QWORD)v26);
      }
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v21);
  }

  mVolumeRampPlayerItem = self->mVolumeRampPlayerItem;
  self->mVolumeRampPlayerItem = 0;

  if (self->mVolumeRampBoundaryTimeObserver)
  {
    objc_msgSend(v12, "removeTimeObserver:");
    mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
    self->mVolumeRampBoundaryTimeObserver = 0;

  }
}

- (void)attachAVPlayerViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  objc_msgSend(v4, "setPlayer:", v5);

}

- (AVAsset)currentAsset
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));

  return (AVAsset *)v4;
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackCoordinator"));

  return (AVPlayerPlaybackCoordinator *)v3;
}

+ (id)keyPathsForValuesAffectingCurrentAsset
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.currentItem.asset"));
}

- (BOOL)isExternalPlaybackActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = objc_msgSend(v2, "isExternalPlaybackActive");

  return v3;
}

+ (id)keyPathsForValuesAffectingExternalPlaybackActive
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.externalPlaybackActive"));
}

- (id)newLayer
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)AVPlayerLayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  objc_msgSend(v3, "setPlayer:", v4);

  objc_msgSend(v3, "setVideoGravity:", AVLayerVideoGravityResize);
  return v3;
}

- (BOOL)p_shouldUsePlayerLooperAtRate:(float)a3 timeRange:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  unsigned int v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  CMTimeEpoch epoch;
  unsigned int var2;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  CMTime time2;
  CMTime time1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentItem"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset"));
  v10 = -[CRLAVPlayerController repeatMode](self, "repeatMode");
  LOBYTE(v11) = 0;
  if (a3 >= 0.0 && v10 == 1 && v8)
  {
    if ((a4->var0.var2 & 1) != 0 && (a4->var1.var2 & 1) != 0 && !a4->var1.var3)
    {
      p_var1 = &a4->var1;
      if ((a4->var1.var0 & 0x8000000000000000) == 0)
      {
        *(_OWORD *)&time1.value = *(_OWORD *)&p_var1->var0;
        time1.epoch = a4->var1.var3;
        v23 = *(_OWORD *)&kCMTimeZero.value;
        *(_OWORD *)&time2.value = *(_OWORD *)&kCMTimeZero.value;
        epoch = kCMTimeZero.epoch;
        time2.epoch = epoch;
        if (CMTimeCompare(&time1, &time2))
        {
          var2 = a4->var0.var2;
          if ((var2 & 1) == 0
            || (v16 = a4->var1.var2, (v16 & 1) == 0)
            || a4->var1.var3
            || p_var1->var0 < 0
            || ((v16 | var2) & 0x10) == 0)
          {
            time1 = (CMTime)a4->var0;
            *(_OWORD *)&time2.value = v23;
            time2.epoch = epoch;
            if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0
              && !-[CRLAVPlayerController isScrubbing](self, "isScrubbing")
              && !-[NSArray count](self->mEnqueuedAssets, "count"))
            {
              objc_opt_class(AVURLAsset, v17);
              v19 = sub_100221D0C(v18, v9);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
              if (!v21)
              {
                LOBYTE(v11) = 0;
LABEL_28:

                goto LABEL_8;
              }
              v22 = v21;
              if (objc_msgSend(v21, "isFileURL"))
              {

              }
              else
              {
                v11 = objc_msgSend(v22, "isFileReferenceURL");

                if (!v11)
                  goto LABEL_8;
              }
              if (objc_msgSend(v9, "providesPreciseDurationAndTiming", v23)
                && objc_msgSend(v9, "statusOfValueForKey:error:", CFSTR("duration"), 0) == (id)2)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                v11 = objc_msgSend(v20, "BOOLForKey:", CFSTR("CRLAVPlayerControllerDisableGaplessLooping")) ^ 1;
                goto LABEL_28;
              }
            }
          }
        }
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_8:

  return v11;
}

- (void)p_updatePlayerItemsAndApplyRate:(float)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  AVPlayerLooper **p_mPlayerLooper;
  AVPlayerLooper *mPlayerLooper;
  unsigned int v10;
  __int128 v11;
  double v12;
  $84F8E50C92EC89EE5A13019615FAB1D5 *p_mPlayerItemTimeRange;
  __int128 v14;
  double v15;
  double v16;
  AVPlayerLooper *v17;
  id v18;
  __int128 v19;
  AVPlayerLooper *v20;
  AVPlayerLooper *v21;
  void *v22;
  AVPlayerLooper *v23;
  void *v24;
  __int128 v25;
  const CMTime *v26;
  const CMTime *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTimeEpoch v41;
  __int128 v42;
  CMTimeEpoch v43;
  __int128 v44;
  CMTimeEpoch v45;
  __int128 v46;
  CMTimeEpoch epoch;
  CMTime v48;
  CMTime time;
  CMTime v50;
  CMTimeRange end;
  CMTimeRange v52;
  __int128 v53;
  CMTimeEpoch v54;
  __int128 v55;
  CMTimeEpoch v56;
  _BYTE v57[128];
  CMTimeRange start;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  v55 = 0uLL;
  v56 = 0;
  -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
  v53 = 0uLL;
  v54 = 0;
  -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
  memset(&v52, 0, sizeof(v52));
  *(_OWORD *)&start.start.value = v55;
  start.start.epoch = v56;
  *(_OWORD *)&end.start.value = v53;
  end.start.epoch = v54;
  CMTimeRangeFromTimeToTime(&v52, &start.start, &end.start);
  v7 = -[CRLAVPlayerController isScrubbing](self, "isScrubbing");
  p_mPlayerLooper = &self->mPlayerLooper;
  mPlayerLooper = self->mPlayerLooper;
  start = v52;
  v10 = -[CRLAVPlayerController p_shouldUsePlayerLooperAtRate:timeRange:](self, "p_shouldUsePlayerLooperAtRate:timeRange:", &start, COERCE_DOUBLE(__PAIR64__(v52.duration.flags, LODWORD(a3))));
  v11 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
  *(_OWORD *)&start.start.value = *(_OWORD *)&self->mPlayerItemTimeRange.start.value;
  *(_OWORD *)&start.start.epoch = v11;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
  end = v52;
  if (CMTimeRangeEqual(&start, &end) && self->mIsPlayerItemTimeRangeForScrubbing == v7 && (mPlayerLooper != 0) == v10)
    goto LABEL_43;
  p_mPlayerItemTimeRange = &self->mPlayerItemTimeRange;
  self->mIsUpdatingPlayerItems = 1;
  v14 = *(_OWORD *)&v52.start.epoch;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.value = *(_OWORD *)&v52.start.value;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch = v14;
  HIDWORD(v15) = v52.duration.flags;
  *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale = *(_OWORD *)&v52.duration.timescale;
  self->mIsPlayerItemTimeRangeForScrubbing = v7;
  LODWORD(v15) = 0;
  -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:", v15);
  LODWORD(v16) = 0;
  objc_msgSend(v5, "setRate:", v16);
  memset(&end, 0, 24);
  if (v6)
    objc_msgSend(v6, "currentTime");
  if (mPlayerLooper)
  {
    -[AVPlayerLooper disableLooping](*p_mPlayerLooper, "disableLooping");
    v17 = *p_mPlayerLooper;
    *p_mPlayerLooper = 0;

  }
  if (v10)
  {
    v18 = objc_alloc((Class)AVPlayerLooper);
    v19 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
    *(_OWORD *)&start.start.value = *(_OWORD *)&p_mPlayerItemTimeRange->start.value;
    *(_OWORD *)&start.start.epoch = v19;
    *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
    v20 = (AVPlayerLooper *)objc_msgSend(v18, "initWithPlayer:templateItem:timeRange:", v5, v6, &start);
    v21 = *p_mPlayerLooper;
    *p_mPlayerLooper = v20;

    if ((id)-[AVPlayerLooper status](*p_mPlayerLooper, "status") == (id)2)
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_10124F7D8);
      v22 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_ERROR))
        sub_100E1D43C((uint64_t)self, (id *)&self->mPlayerLooper, v22);
      -[AVPlayerLooper disableLooping](*p_mPlayerLooper, "disableLooping");
      v23 = *p_mPlayerLooper;
      *p_mPlayerLooper = 0;

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  if (v24)
  {
    memset(&v50, 0, sizeof(v50));
    time = end.start;
    v25 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
    *(_OWORD *)&start.start.value = *(_OWORD *)&p_mPlayerItemTimeRange->start.value;
    *(_OWORD *)&start.start.epoch = v25;
    *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
    CMTimeClampToRange(&v50, &time, &start);
    if ((v50.flags & 0x1D) == 1)
    {
      start.start = v50;
      time = kCMTimeZero;
      v48 = time;
      objc_msgSend(v24, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &start, &time, &v48, 0);
    }
    if (!*p_mPlayerLooper)
    {
      v26 = (const CMTime *)&v55;
      if (self->mIsPlayerItemTimeRangeForScrubbing)
        v26 = &kCMTimeInvalid;
      v46 = *(_OWORD *)&v26->value;
      epoch = v26->epoch;
      v44 = v46;
      v45 = epoch;
      objc_msgSend(v24, "setReversePlaybackEndTime:", &v44);
      v27 = (const CMTime *)&v53;
      if (self->mIsPlayerItemTimeRangeForScrubbing)
        v27 = &kCMTimeInvalid;
      v42 = *(_OWORD *)&v27->value;
      v43 = v27->epoch;
      v40 = v42;
      v41 = v43;
      objc_msgSend(v24, "setForwardPlaybackEndTime:", &v40);
    }
  }
  self->mIsUpdatingPlayerItems = 0;
  if (self->mPlayerLooper)
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F7F8);
    v28 = off_1013DB560;
    if (!os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    LODWORD(start.start.value) = 134217984;
    *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)self;
    v29 = "CRLAVPlayerController %p: Did set up new player looper.";
  }
  else
  {
    if (!mPlayerLooper)
      goto LABEL_35;
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F818);
    v28 = off_1013DB560;
    if (!os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    LODWORD(start.start.value) = 134217984;
    *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)self;
    v29 = "CRLAVPlayerController %p: Did tear down player looper.";
  }
  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&start, 0xCu);
LABEL_35:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_workingPlayerItems](self, "p_workingPlayerItems", 0));
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(v30);
        -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
    }
    while (v32);
  }

LABEL_43:
  *(float *)&v12 = a3;
  -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:", v12);
  *(float *)&v35 = a3;
  -[CRLAVPlayerController p_applyRate:](self, "p_applyRate:", v35);

}

- (id)p_workingPlayerItems
{
  AVPlayerLooper *mPlayerLooper;
  void *v4;
  void *v5;

  mPlayerLooper = self->mPlayerLooper;
  if (mPlayerLooper)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerLooper loopingPlayerItems](mPlayerLooper, "loopingPlayerItems"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));

  }
  return v4;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CMTime v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));

  if (v4 && (memset(&v10[1], 0, sizeof(CMTime)), objc_msgSend(v4, "duration"), (unsigned __int128)0 >> 96 == 1))
  {
    -[CRLAVPlayerController endTime](self, "endTime");
    v10[0] = v10[1];
    v6 = fmin(v5, CMTimeGetSeconds(v10));
    -[CRLAVPlayerController startTime](self, "startTime");
    v8 = fmax(v6 - v7, 0.0);
  }
  else
  {
    v8 = NAN;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingDuration
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("player.currentItem.duration"), CFSTR("startTime"), CFSTR("endTime"), 0);
}

- (double)absoluteDuration
{
  void *v2;
  void *v3;
  double Seconds;
  CMTime v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));

  if (v3 && (memset(&v6[1], 0, sizeof(CMTime)), objc_msgSend(v3, "duration"), (unsigned __int128)0 >> 96 == 1))
  {
    v6[0] = v6[1];
    Seconds = CMTimeGetSeconds(v6);
  }
  else
  {
    Seconds = NAN;
  }

  return Seconds;
}

+ (id)keyPathsForValuesAffectingAbsoluteDuration
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("player.currentItem.duration"), 0);
}

- (double)startTime
{
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
  if ((unsigned __int128)0 >> 96 != 1)
    return NAN;
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_startCMTime
{
  void *v5;
  _QWORD *p_value;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;

  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)kCMTimeInvalid;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));

  if (v8)
  {
    if ((self->mStartCMTime.flags & 0x1D) == 1)
      p_value = &self->mStartCMTime.value;
    else
      p_value = &kCMTimeZero;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)p_value;
    retstr->var3 = p_value[2];
  }

  return result;
}

- (void)setStartTime:(double)a3
{
  CMTime v4;
  CMTime time1;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  time1 = (CMTime)self->mStartCMTime;
  v4 = v6;
  if (CMTimeCompare(&time1, &v4))
  {
    self->mStartCMTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    -[CRLAVPlayerController rate](self, "rate");
    -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:");
  }
}

+ (id)keyPathsForValuesAffectingStartTime
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.currentItem"));
}

- (double)endTime
{
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
  if ((unsigned __int128)0 >> 96 != 1)
    return NAN;
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_endCMTime
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v10;
  int64_t v11;

  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)kCMTimeInvalid;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));

  if (v6)
  {
    if ((self->mEndCMTime.flags & 0x1D) == 1)
    {
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->mEndCMTime.value;
      retstr->var3 = self->mEndCMTime.epoch;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asset"));
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "duration");
      }
      else
      {
        v10 = 0uLL;
        v11 = 0;
      }
      *(_OWORD *)&retstr->var0 = v10;
      retstr->var3 = v11;

    }
  }

  return result;
}

- (void)setEndTime:(double)a3
{
  CMTime v4;
  CMTime time1;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  time1 = (CMTime)self->mEndCMTime;
  v4 = v6;
  if (CMTimeCompare(&time1, &v4))
  {
    self->mEndCMTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    -[CRLAVPlayerController rate](self, "rate");
    -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:");
  }
}

+ (id)keyPathsForValuesAffectingEndTime
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.currentItem.asset.duration"));
}

- (void)setRepeatMode:(int64_t)a3
{
  float v4;
  int64_t mRepeatMode;
  float v7;
  AVPlayerLooper *mPlayerLooper;
  AVPlayerLooper *v9;
  double v10;

  if (self->mRepeatMode != a3)
  {
    self->mRepeatMode = a3;
    -[CRLAVPlayerController rate](self, "rate");
    mRepeatMode = self->mRepeatMode;
    if (v4 >= 0.0 || mRepeatMode == 2)
      v7 = v4;
    else
      v7 = 1.0;
    if (mRepeatMode != 1)
    {
      mPlayerLooper = self->mPlayerLooper;
      if (mPlayerLooper)
      {
        -[AVPlayerLooper disableLooping](mPlayerLooper, "disableLooping");
        v9 = self->mPlayerLooper;
        self->mPlayerLooper = 0;

      }
    }
    -[CRLAVPlayerController p_updateAutomaticallyWaitsToMinimizeStalling](self, "p_updateAutomaticallyWaitsToMinimizeStalling");
    -[CRLAVPlayerController rate](self, "rate");
    if (*(float *)&v10 != v7)
    {
      *(float *)&v10 = v7;
      -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:", v10);
    }
  }
}

- (void)setVolume:(float)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->mVolume != a3)
  {
    self->mVolume = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_workingPlayerItems](self, "p_workingPlayerItems", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setVolume:(float)a3 rampDuration:(double)a4
{
  AVPlayerItem *mVolumeRampPlayerItem;
  AVPlayerItem **p_mVolumeRampPlayerItem;
  void *v9;
  id mVolumeRampBoundaryTimeObserver;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  AVQueuePlayer *mPlayer;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTime rhs;
  CMTime lhs;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  _BYTE v51[128];
  _BYTE v52[128];

  if (self->mVolume != a3)
  {
    p_mVolumeRampPlayerItem = &self->mVolumeRampPlayerItem;
    mVolumeRampPlayerItem = self->mVolumeRampPlayerItem;
    self->mVolumeRampPlayerItem = 0;

    if (p_mVolumeRampPlayerItem[1])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      objc_msgSend(v9, "removeTimeObserver:", self->mVolumeRampBoundaryTimeObserver);
      mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
      self->mVolumeRampBoundaryTimeObserver = 0;

    }
    -[CRLAVPlayerController volume](self, "volume");
    v12 = v11;
    self->mVolume = a3;
    *(_QWORD *)&v14 = objc_opt_class(self, v13).n128_u64[0];
    v16 = v15;
    -[CRLAVPlayerController rate](self, "rate", v14);
    if (objc_msgSend(v16, "p_canApplyVolumeRampAtRate:"))
    {
      memset(&v50, 0, sizeof(v50));
      CMTimeMakeWithSeconds(&v50, a4, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
      memset(&v49, 0, sizeof(v49));
      mPlayer = self->mPlayer;
      if (mPlayer)
        -[AVQueuePlayer currentTime](mPlayer, "currentTime");
      memset(&v48, 0, sizeof(v48));
      lhs = v49;
      rhs = v50;
      CMTimeAdd(&v48, &lhs, &rhs);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AVQueuePlayer currentItem](self->mPlayer, "currentItem"));
      if (v18)
      {
        v36 = objc_alloc_init((Class)AVMutableAudioMix);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asset"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tracksWithMediaType:", AVMediaTypeAudio));

        v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v20, "count"));
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v22 = v20;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
              v28 = objc_alloc_init((Class)AVMutableAudioMixInputParameters);
              objc_msgSend(v28, "setTrackID:", objc_msgSend(v27, "trackID"));
              lhs = v49;
              objc_msgSend(v28, "setVolume:atTime:", &lhs, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.value), v12)));
              lhs = v48;
              objc_msgSend(v28, "setVolume:atTime:", &lhs, COERCE_DOUBLE(__PAIR64__(HIDWORD(v48.value), LODWORD(a3))));
              objc_msgSend(v21, "addObject:", v28);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v24);
        }

        objc_msgSend(v36, "setInputParameters:", v21);
        objc_msgSend(v18, "setAudioMix:", v36);
        objc_storeStrong((id *)p_mVolumeRampPlayerItem, v18);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1002F526C;
        v41[3] = &unk_10122D110;
        v41[4] = self;
        lhs = v48;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_addTimeObserverForTime:handler:](self, "p_addTimeObserverForTime:handler:", &lhs, v41));
        v30 = self->mVolumeRampBoundaryTimeObserver;
        self->mVolumeRampBoundaryTimeObserver = v29;

      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_workingPlayerItems](self, "p_workingPlayerItems"));
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(v31);
          if (*(AVPlayerItem **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j) != *p_mVolumeRampPlayerItem)
            -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:");
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v33);
    }

  }
}

+ (BOOL)p_canApplyVolumeRampAtRate:(float)a3
{
  return a3 >= 0.0;
}

- (void)p_clearVolumeRampFromPlayerItem
{
  if (self->mVolumeRampPlayerItem)
    -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:");
}

- (void)p_applyConstantVolumeToPlayerItem:(id)a3
{
  AVPlayerItem *v4;
  float v5;
  float v6;
  void *v7;
  id mVolumeRampBoundaryTimeObserver;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  CMTimeEpoch epoch;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  CMTimeEpoch v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = (AVPlayerItem *)a3;
  -[CRLAVPlayerController volume](self, "volume");
  v6 = v5;
  if (self->mVolumeRampPlayerItem == v4)
  {
    self->mVolumeRampPlayerItem = 0;

    if (self->mVolumeRampBoundaryTimeObserver)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      objc_msgSend(v7, "removeTimeObserver:", self->mVolumeRampBoundaryTimeObserver);
      mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
      self->mVolumeRampBoundaryTimeObserver = 0;

    }
  }
  if (v6 == 1.0)
  {
    v20 = 0;
  }
  else
  {
    v21 = objc_alloc_init((Class)AVMutableAudioMix);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerItem asset](v4, "asset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tracksWithMediaType:", AVMediaTypeAudio));

    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      v22 = *(_OWORD *)&kCMTimeZero.value;
      epoch = kCMTimeZero.epoch;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v17);
          v19 = objc_alloc_init((Class)AVMutableAudioMixInputParameters);
          objc_msgSend(v19, "setTrackID:", objc_msgSend(v18, "trackID"));
          v23 = v22;
          v24 = epoch;
          objc_msgSend(v19, "setVolume:atTime:", &v23, COERCE_DOUBLE(__PAIR64__(DWORD1(v22), LODWORD(v6))));
          objc_msgSend(v11, "addObject:", v19);

          v17 = (char *)v17 + 1;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v20 = v21;
    objc_msgSend(v21, "setInputParameters:", v11);

  }
  -[AVPlayerItem setAudioMix:](v4, "setAudioMix:", v20);

}

- (BOOL)hasCurrentTime
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));

  if (v3)
    v4 = objc_msgSend(v3, "status") == (id)1;
  else
    v4 = 0;

  return v4;
}

+ (id)keyPathsForValuesAffectingHasCurrentTime
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.currentItem.status"));
}

- (double)absoluteCurrentTime
{
  double v3;
  void *v4;
  void *v5;
  CMTime time;

  v3 = 0.0;
  if (-[CRLAVPlayerController hasCurrentTime](self, "hasCurrentTime"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));

    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    v3 = fmax(CMTimeGetSeconds(&time), 0.0);

  }
  return v3;
}

- (double)currentTime
{
  double v3;
  void *v4;
  void *v5;
  double Seconds;
  double v7;
  double v8;
  double v9;
  CMTime time;

  v3 = 0.0;
  if (-[CRLAVPlayerController hasCurrentTime](self, "hasCurrentTime"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));

    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    -[CRLAVPlayerController startTime](self, "startTime");
    v8 = Seconds - v7;
    -[CRLAVPlayerController endTime](self, "endTime");
    v3 = sub_1003C65EC(v8, 0.0, v9);

  }
  return v3;
}

- (double)remainingTime
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  CMTime time;

  v3 = 0.0;
  if (-[CRLAVPlayerController hasCurrentTime](self, "hasCurrentTime"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));

    -[CRLAVPlayerController endTime](self, "endTime");
    v7 = v6;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    v3 = fmax(v7 - fmax(CMTimeGetSeconds(&time), 0.0), 0.0);

  }
  return v3;
}

- (BOOL)isScrubbing
{
  return self->mScrubbingCount != 0;
}

- (void)beginScrubbing
{
  unint64_t mScrubbingCount;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  float v7;
  double v8;
  int v9;
  CRLAVPlayerController *v10;
  __int16 v11;
  unint64_t v12;

  mScrubbingCount = self->mScrubbingCount;
  if (!mScrubbingCount)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerWillBeginScrubbingNotification"), self);

    mScrubbingCount = self->mScrubbingCount;
  }
  self->mScrubbingCount = mScrubbingCount + 1;
  if (qword_10147E5C8 != -1)
    dispatch_once(&qword_10147E5C8, &stru_10124F838);
  v5 = off_1013DB560;
  if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->mScrubbingCount;
    v9 = 134218240;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: beginScrubbing count %tu", (uint8_t *)&v9, 0x16u);
  }
  if (self->mScrubbingCount == 1)
  {
    -[CRLAVPlayerController rate](self, "rate");
    self->mRateBeforeScrubbing = v7;
    LODWORD(v8) = 0;
    -[CRLAVPlayerController setRate:](self, "setRate:", v8);
  }
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
  -[CRLAVPlayerController scrubToTime:withTolerance:completionHandler:](self, "scrubToTime:withTolerance:completionHandler:", 0, a3, a4);
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;

  v8 = a5;
  if (!-[CRLAVPlayerController isScrubbing](self, "isScrubbing"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F858);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D58C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F878);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController scrubToTime:withTolerance:completionHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 768, 0, "scrubbed to time when not in a scrubbing operation");

  }
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeWithSeconds(&v19, a3, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  memset(&v18, 0, sizeof(v18));
  CMTimeMakeWithSeconds(&v18, a4, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  memset(&v17, 0, sizeof(v17));
  CMTimeMakeWithSeconds(&v17, a4, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v13 = v12;
  v16 = v19;
  v15 = v18;
  v14 = v17;
  if (v8)
    objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v16, &v15, &v14, v8);
  else
    objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:", &v16, &v15, &v14);

}

- (void)cancelPendingSeeks
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  objc_msgSend(v2, "cancelPendingSeeks");

}

- (void)endScrubbing
{
  unint64_t mScrubbingCount;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _BOOL4 v11;
  float mRateBeforeScrubbing;
  int v13;
  double v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  CMTime v21;
  CMTime time2;
  CMTime time1;
  CMTime v24;
  CMTime buf;

  mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124F898);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E1D60C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124F8B8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController endScrubbing]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 786, 0, "Uneven begin/end scrubbing calls!");

  mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount)
  {
LABEL_11:
    v7 = mScrubbingCount - 1;
    self->mScrubbingCount = v7;
    if (!v7)
    {
      memset(&buf, 0, sizeof(buf));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "currentTime");
      else
        memset(&buf, 0, sizeof(buf));

      memset(&v24, 0, sizeof(v24));
      -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
      if ((unsigned __int128)0 >> 96 == 1)
      {
        time1 = buf;
        time2 = v24;
        v10 = CMTimeCompare(&time1, &time2) >> 31;
      }
      else
      {
        v10 = 1;
      }
      memset(&time1, 0, sizeof(time1));
      -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
      if ((time1.flags & 0x1D) == 1)
      {
        time2 = buf;
        v21 = time1;
        v11 = CMTimeCompare(&time2, &v21) < 1;
      }
      else
      {
        v11 = 0;
      }
      mRateBeforeScrubbing = self->mRateBeforeScrubbing;
      if (mRateBeforeScrubbing <= 0.0)
        v13 = 1;
      else
        v13 = v10;
      if (mRateBeforeScrubbing >= 0.0)
        v11 = 0;
      if (v13 == 1 && !v11)
      {
        -[CRLAVPlayerController setRate:](self, "setRate:");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v18, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerDidEndScrubbingNotification"), self);

      }
      else
      {
        if (-[CRLAVPlayerController repeatMode](self, "repeatMode"))
        {
          *(float *)&v15 = self->mRateBeforeScrubbing;
          -[CRLAVPlayerController setRate:](self, "setRate:", v15);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerDidEndScrubbingNotification"), self);

        *(float *)&v17 = self->mRateBeforeScrubbing;
        -[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:](self, "p_playerItemDidPlayToEndTimeAtRate:", v17);
      }
    }
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F8D8);
    v19 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->mScrubbingCount;
      LODWORD(buf.value) = 134218240;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2048;
      *(_QWORD *)((char *)&buf.flags + 2) = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: endScrubbing count %tu", (uint8_t *)&buf, 0x16u);
    }
  }
}

- (void)seekForwardByOneFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));

  if (v4
    && (memset(&v10, 0, sizeof(v10)),
        -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime"),
        (unsigned __int128)0 >> 96 == 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time1, 0, sizeof(time1));
    v8 = v10;
    v7 = CMTimeCompare(&time1, &v8) >= 0;

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v4, "canStepForward") && !v7)
    objc_msgSend(v4, "stepByCount:", 1);

}

- (void)seekBackwardByOneFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));

  if (v4
    && (memset(&v10, 0, sizeof(v10)),
        -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime"),
        (unsigned __int128)0 >> 96 == 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time1, 0, sizeof(time1));
    v8 = v10;
    v7 = CMTimeCompare(&time1, &v8) < 1;

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v4, "canStepBackward") && !v7)
    objc_msgSend(v4, "stepByCount:", -1);

}

- (void)seekToBeginning
{
  void *v3;
  _BYTE v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
  objc_msgSend(v3, "seekToTime:", v4);

}

- (void)seekToEnd
{
  void *v3;
  _BYTE v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
  objc_msgSend(v3, "seekToTime:", v4);

}

- (void)updatePlayingToMatchPlayer
{
  void *v3;
  float v4;
  BOOL v5;
  void *v6;
  float v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v8 = v3;
  if (!self->mPlaying)
    goto LABEL_5;
  objc_msgSend(v3, "rate");
  if (v4 == 0.0)
  {
    v5 = 0;
    v6 = v8;
LABEL_7:
    self->mPlaying = v5;
    goto LABEL_8;
  }
  v6 = v8;
  if (!self->mPlaying)
  {
LABEL_5:
    objc_msgSend(v8, "rate");
    v6 = v8;
    if (v7 > 0.0)
    {
      v5 = 1;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)setPlaying:(BOOL)a3
{
  CMTimeFlags v3;
  NSObject *v5;
  NSObject *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  CMTime v13;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v18;
  CMTime v19;
  CMTime buf;

  v3 = a3;
  if (a3
    && -[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded"))
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F8F8);
    v5 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not playing because a playback error occurred.", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (self->mPlaying != v3)
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F918);
    v6 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 134218240;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: setPlaying %i", (uint8_t *)&buf, 0x12u);
    }
    self->mPlaying = v3;
    if (v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      objc_msgSend(v8, "rate");
      if (*(float *)&v9 == 0.0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentItem"));
        v11 = v10;
        memset(&buf, 0, sizeof(buf));
        if (v10)
          objc_msgSend(v10, "currentTime");
        memset(&v19, 0, sizeof(v19));
        -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
        memset(&v18, 0, sizeof(v18));
        -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
        CMTimeMake(&rhs, 1, 100);
        CMTimeSubtract(&v18, &lhs, &rhs);
        time1 = buf;
        time2 = v19;
        if (CMTimeCompare(&time1, &time2) < 0 || (time1 = buf, time2 = v18, CMTimeCompare(&time1, &time2) >= 1))
        {
          time1 = v19;
          time2 = kCMTimeZero;
          v13 = time2;
          objc_msgSend(v11, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time1, &time2, &v13, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v12, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerWillPlayFromStartNotification"), self);

        }
      }
      LODWORD(v9) = 1.0;
      -[CRLAVPlayerController p_applyRate:](self, "p_applyRate:", v9);

    }
    else
    {
      LODWORD(v7) = 0;
      -[CRLAVPlayerController p_applyRate:](self, "p_applyRate:", v7);
    }
    -[CRLAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
    -[CRLAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
  }
}

+ (BOOL)automaticallyNotifiesObserversOfRate
{
  return 0;
}

+ (id)keyPathsForValuesAffectingRate
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("player.rate"));
}

- (float)rate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  float v7;
  float mPendingRate;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = v3;
  if (fabsf(self->mPendingRate) == INFINITY
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem")),
        v6 = objc_msgSend(v5, "status"),
        v5,
        v6 == (id)1))
  {
    objc_msgSend(v4, "rate");
    mPendingRate = v7;
  }
  else
  {
    mPendingRate = self->mPendingRate;
  }

  return mPendingRate;
}

- (void)setRate:(float)a3
{
  NSObject *v5;
  double v6;
  int v7;
  CRLAVPlayerController *v8;
  __int16 v9;
  double v10;

  if (a3 == 0.0
    || !-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded"))
  {
    *(float *)&v6 = a3;
    -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:", v6);
  }
  else
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F938);
    v5 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 2048;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not setting rate to %f because a playback error occurred.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)p_applyRate:(float)a3
{
  void *v5;
  float v6;
  void *v7;
  id v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  int v12;
  CRLAVPlayerController *v13;
  __int16 v14;
  double v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  -[CRLAVPlayerController rate](self, "rate");
  if (v6 != a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
    v8 = objc_msgSend(v7, "status");

    if (v8)
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_10124F978);
      v9 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218240;
        v13 = self;
        v14 = 2048;
        v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Applying rate %f.", (uint8_t *)&v12, 0x16u);
      }
      *(float *)&v10 = a3;
      objc_msgSend(v5, "setRate:", v10);
      -[CRLAVPlayerController updateNowPlaying](self, "updateNowPlaying");
    }
    else
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_10124F958);
      v11 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218240;
        v13 = self;
        v14 = 2048;
        v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Saving pending rate %f because the current player item is not yet ready.", (uint8_t *)&v12, 0x16u);
      }
      -[CRLAVPlayerController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
      self->mPendingRate = a3;
      -[CRLAVPlayerController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
    }
  }

}

- (void)p_applyPendingRateIfNeeded
{
  NSObject *v3;
  double mPendingRate;
  float v5;
  void *v6;
  double v7;
  int v8;
  CRLAVPlayerController *v9;
  __int16 v10;
  double v11;

  if (fabsf(self->mPendingRate) != INFINITY)
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124F998);
    v3 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      mPendingRate = self->mPendingRate;
      v8 = 134218240;
      v9 = self;
      v10 = 2048;
      v11 = mPendingRate;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Applying pending rate %f.", (uint8_t *)&v8, 0x16u);
    }
    v5 = self->mPendingRate;
    self->mPendingRate = NAN;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    *(float *)&v7 = v5;
    objc_msgSend(v6, "setRate:", v7);

  }
}

- (void)stopSynchronously
{
  double v3;
  CRLAVPlayerControllerVideoDisplayBarrier *v4;
  void *v5;
  CRLAVPlayerControllerVideoDisplayBarrier *v6;

  -[CRLAVPlayerController p_clearVolumeRampFromPlayerItem](self, "p_clearVolumeRampFromPlayerItem");
  -[CRLAVPlayerController setPlaying:](self, "setPlaying:", 0);
  LODWORD(v3) = 0;
  -[CRLAVPlayerController setRate:](self, "setRate:", v3);
  v4 = [CRLAVPlayerControllerVideoDisplayBarrier alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v6 = -[CRLAVPlayerControllerVideoDisplayBarrier initWithPlayer:](v4, "initWithPlayer:", v5);

  -[CRLAVPlayerControllerVideoDisplayBarrier waitUntilAllVideoFramesAreDisplayed](v6, "waitUntilAllVideoFramesAreDisplayed");
}

+ (id)keyPathsForValuesAffectingCanFastReverse
{
  if (qword_1014153A8 != -1)
    dispatch_once(&qword_1014153A8, &stru_10124F9B8);
  return (id)qword_1014153A0;
}

- (BOOL)canFastReverse
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));
  v4 = objc_msgSend(v3, "canPlayFastReverse");

  return v4;
}

- (BOOL)p_canFastReverseAtCurrentTime
{
  void *v3;
  void *v4;
  float v5;
  BOOL v6;
  CMTime v8;
  CMTime time1;
  CMTime v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  if (objc_msgSend(v4, "canPlayFastReverse"))
  {
    objc_msgSend(v3, "rate");
    if (v5 == 0.0)
    {
      memset(&v10[1], 0, sizeof(CMTime));
      if (v4)
        objc_msgSend(v4, "currentTime");
      memset(v10, 0, 24);
      -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
      time1 = v10[1];
      v8 = v10[0];
      v6 = CMTimeCompare(&time1, &v8) > 0;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setFastReversing:(BOOL)a3
{
  NSObject *v4;
  double v5;
  double v6;
  int v7;
  CRLAVPlayerController *v8;

  if (a3)
  {
    if (-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded"))
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_10124F9D8);
      v4 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not fast reversing because a playback error occurred.", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (!self->mFastReversing
           && -[CRLAVPlayerController p_canFastReverseAtCurrentTime](self, "p_canFastReverseAtCurrentTime"))
    {
      self->mFastReversing = 1;
      LODWORD(v6) = -2.0;
      -[CRLAVPlayerController setRate:](self, "setRate:", v6);
      -[CRLAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
    }
  }
  else if (self->mFastReversing)
  {
    self->mFastReversing = 0;
    if (!-[CRLAVPlayerController isFastForwarding](self, "isFastForwarding"))
    {
      if (-[CRLAVPlayerController isPlaying](self, "isPlaying"))
        LODWORD(v5) = 1.0;
      else
        LODWORD(v5) = 0;
      -[CRLAVPlayerController setRate:](self, "setRate:", v5);
    }
  }
}

+ (id)keyPathsForValuesAffectingCanFastForward
{
  if (qword_1014153B8 != -1)
    dispatch_once(&qword_1014153B8, &stru_10124F9F8);
  return (id)qword_1014153B0;
}

- (BOOL)canFastForward
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));
  v4 = objc_msgSend(v3, "canPlayFastForward");

  return v4;
}

- (BOOL)p_canFastForwardAtCurrentTime
{
  void *v3;
  void *v4;
  float v5;
  unsigned int v6;
  CMTime v8;
  CMTime time1;
  CMTime v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  if (objc_msgSend(v4, "canPlayFastForward"))
  {
    objc_msgSend(v3, "rate");
    if (v5 == 0.0)
    {
      memset(&v10[1], 0, sizeof(CMTime));
      if (v4)
        objc_msgSend(v4, "currentTime");
      memset(v10, 0, 24);
      -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
      time1 = v10[1];
      v8 = v10[0];
      v6 = CMTimeCompare(&time1, &v8) >> 31;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)setFastForwarding:(BOOL)a3
{
  NSObject *v4;
  double v5;
  double v6;
  int v7;
  CRLAVPlayerController *v8;

  if (a3)
  {
    if (-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded"))
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_10124FA18);
      v4 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not fast forwarding because a playback error occurred.", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (!self->mFastForwarding
           && -[CRLAVPlayerController p_canFastForwardAtCurrentTime](self, "p_canFastForwardAtCurrentTime"))
    {
      self->mFastForwarding = 1;
      LODWORD(v6) = 2.0;
      -[CRLAVPlayerController setRate:](self, "setRate:", v6);
      -[CRLAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
    }
  }
  else if (self->mFastForwarding)
  {
    self->mFastForwarding = 0;
    if (!-[CRLAVPlayerController isFastReversing](self, "isFastReversing"))
    {
      if (-[CRLAVPlayerController isPlaying](self, "isPlaying"))
        LODWORD(v5) = 1.0;
      else
        LODWORD(v5) = 0;
      -[CRLAVPlayerController setRate:](self, "setRate:", v5);
    }
  }
}

- (void)skipToAssetAtIndex:(unint64_t)a3
{
  id v5;

  -[CRLAVPlayerController setPlaying:](self, "setPlaying:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  objc_msgSend(v5, "removeAllItems");
  -[CRLAVPlayerController p_enqueueAssetsFromIndex:](self, "p_enqueueAssetsFromIndex:", a3);

}

- (void)p_enqueueAssetsFromIndex:(unint64_t)a3
{
  void *v5;
  NSUInteger v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v6 = -[NSArray count](self->mEnqueuedAssets, "count");
  if (v6 > a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->mEnqueuedAssets, "subarrayWithRange:", a3, v6 - a3));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v5, "insertItem:afterItem:", v12, 0);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_workingPlayerItems](self, "p_workingPlayerItems", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  -[CRLAVPlayerController rate](self, "rate");
  -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:");

}

- (id)p_addTimeObserverForTime:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  void *v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v12 = *a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](NSValue, "valueWithCMTime:", &v12));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v9, &_dispatch_main_q, v6));

  return v10;
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  CMTime v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  CMTimeMakeWithSeconds(&v13, a3, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F7768;
  v11[3] = &unk_10124FA40;
  v12 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, &_dispatch_main_q, v11));

  return v9;
}

- (void)removePeriodicTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  objc_msgSend(v5, "removeTimeObserver:", v4);

}

- (void)addObservationToken:(id)a3
{
  -[NSMutableSet addObject:](self->mObservationTokens, "addObject:", a3);
}

- (void)removeObservationToken:(id)a3
{
  -[NSMutableSet removeObject:](self->mObservationTokens, "removeObject:", a3);
}

- (void)setPlayerItemMediator:(id)a3
{
  CRLAVPlayerControllerPlayerItemMediating *v5;
  CRLAVPlayerControllerPlayerItemMediating *v6;

  v5 = (CRLAVPlayerControllerPlayerItemMediating *)a3;
  if (self->mPlayerItemMediator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPlayerItemMediator, a3);
    -[CRLAVPlayerController rate](self, "rate");
    -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:");
    v5 = v6;
  }

}

- (void)p_notifyPlayerItemMediatorWithRate:(float)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[2];
  __int128 v12;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FA60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D68C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FA80);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1203, 0, "This operation must only be performed on the main thread.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController playerItemMediator](self, "playerItemMediator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController p_workingPlayerItems](self, "p_workingPlayerItems"));
  v10 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
  v11[0] = *(_OWORD *)&self->mPlayerItemTimeRange.start.value;
  v11[1] = v10;
  v12 = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
  objc_msgSend(v8, "playerController:willUsePlayerItems:atRate:timeRangeForEachPlayerItem:", self, v9, v11, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(a3))));

}

- (void)p_playerItemDidPlayToEndTimeAtRate:(float)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  double v11;
  double v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  __int128 v25;
  CMTimeEpoch v26;
  __int128 v27;
  CMTimeEpoch epoch;
  __int128 v29;
  uint64_t v30;
  uint8_t buf[24];

  if (qword_10147E5C8 != -1)
    dispatch_once(&qword_10147E5C8, &stru_10124FAA0);
  v5 = off_1013DB560;
  if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: playerItemDidPlayToEndTimeAtRate: %f", buf, 0x16u);
  }
  if (-[NSArray count](self->mEnqueuedAssets, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
    v8 = objc_msgSend(v7, "count");

    if (v8 == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerDidPlayToEndNotification"), self);

      v10 = -[CRLAVPlayerController repeatMode](self, "repeatMode");
      if (!v10 || v10 == 2)
      {
        LODWORD(v11) = 0;
        -[CRLAVPlayerController setRate:](self, "setRate:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController delegate](self, "delegate"));
        objc_msgSend(v15, "playbackDidStopForPlayerController:", self);

      }
      else if (v10 == 1)
      {
        -[CRLAVPlayerController p_enqueueAssetsFromIndex:](self, "p_enqueueAssetsFromIndex:", 0);
        *(float *)&v12 = a3;
        -[CRLAVPlayerController setRate:](self, "setRate:", v12);
      }
    }
    goto LABEL_30;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("CRLAVPlayerControllerDidPlayToEndNotification"), self);

  v14 = -[CRLAVPlayerController repeatMode](self, "repeatMode");
  if (v14)
  {
    if (v14 == 2)
    {
      if (self->mPlayerLooper)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124FAC0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1D70C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124FAE0);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1234, 0, "expected nil value for '%{public}s'", "mPlayerLooper");

      }
      memset(buf, 0, sizeof(buf));
      if (a3 >= 0.0)
        -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
      else
        -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      *(float *)&v23 = -a3;
      v29 = *(_OWORD *)buf;
      v30 = *(_QWORD *)&buf[16];
      v27 = *(_OWORD *)&kCMTimeInvalid.value;
      epoch = kCMTimeInvalid.epoch;
      objc_msgSend(v22, "setRate:time:atHostTime:", &v29, &v27, v23);
      goto LABEL_48;
    }
    if (v14 == 1 && !self->mPlayerLooper)
    {
      memset(buf, 0, sizeof(buf));
      if (a3 >= 0.0)
        -[CRLAVPlayerController p_startCMTime](self, "p_startCMTime");
      else
        -[CRLAVPlayerController p_endCMTime](self, "p_endCMTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentItem"));
      v29 = *(_OWORD *)buf;
      v30 = *(_QWORD *)&buf[16];
      v27 = *(_OWORD *)&kCMTimeZero.value;
      epoch = kCMTimeZero.epoch;
      v25 = v27;
      v26 = epoch;
      objc_msgSend(v24, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v29, &v27, &v25, 0);

LABEL_48:
    }
  }
  else
  {
    if (self->mPlayerLooper)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FB00);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1D798();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FB20);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1242, 0, "expected nil value for '%{public}s'", "mPlayerLooper");

    }
    -[CRLAVPlayerController setPlaying:](self, "setPlaying:", 0);
    -[CRLAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
    -[CRLAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
    if (a3 > 0.0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController delegate](self, "delegate"));
      objc_msgSend(v6, "playbackDidStopForPlayerController:", self);
LABEL_30:

    }
  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  int v4;
  int v5;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player", a3));
  objc_msgSend(v7, "rate");
  v5 = v4;
  -[CRLAVPlayerController p_clearVolumeRampFromPlayerItem](self, "p_clearVolumeRampFromPlayerItem");
  LODWORD(v6) = v5;
  -[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:](self, "p_playerItemDidPlayToEndTimeAtRate:", v6);

}

- (BOOL)p_notifyDelegateOfPlaybackErrorIfNeeded
{
  BOOL mDidNotifyDelegateOfPlaybackError;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!self->mDidNotifyDelegateOfPlaybackError)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
    if (objc_msgSend(v4, "status") == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
      if (v5)
        goto LABEL_17;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FB40);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1D9A4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FB60);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1303, 0, "invalid nil value for '%{public}s'", "error");

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));
    if (objc_msgSend(v5, "status") != (id)2)
    {
LABEL_30:

      mDidNotifyDelegateOfPlaybackError = self->mDidNotifyDelegateOfPlaybackError;
      return mDidNotifyDelegateOfPlaybackError;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
    if (!v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FB80);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1D824();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FBA0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1310, 0, "invalid nil value for '%{public}s'", "error");

      goto LABEL_30;
    }
    v10 = (void *)v9;

    v5 = v10;
LABEL_17:
    self->mDidNotifyDelegateOfPlaybackError = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController delegate](self, "delegate"));
    objc_msgSend(v11, "playerController:playbackDidFailWithError:", self, v5);

    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_10124FBC0);
    v12 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_ERROR))
      sub_100E1D8B0((uint64_t)self, v12, v5);
    goto LABEL_30;
  }
  return 1;
}

- (void)p_playerItemDidJumpTime:(id)a3
{
  id v4;

  -[CRLAVPlayerController p_clearVolumeRampFromPlayerItem](self, "p_clearVolumeRampFromPlayerItem", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CRLAVPlayerControllerTimeJumpedNotification"), self, 0);

}

- (void)p_applicationDidResignActive
{
  -[CRLAVPlayerController setupRemoteTransportControls](self, "setupRemoteTransportControls");
  -[CRLAVPlayerController updateNowPlaying](self, "updateNowPlaying");
}

- (void)p_updateAutomaticallyWaitsToMinimizeStalling
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  *(_QWORD *)&v4 = objc_opt_class(AVURLAsset, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentItem", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));

    if ((objc_msgSend(v12, "isEqual:", CFSTR("http")) & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v12, "isEqual:", CFSTR("https")) ^ 1;

  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(v14, "setAutomaticallyWaitsToMinimizeStalling:", (self->mRepeatMode != 2) & ~v13);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  float v26;
  void *v27;
  id v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  float v44;
  __n128 v45;
  id v46;
  NSObject *v47;
  double mPendingRate;
  void *v49;
  NSObject *v50;
  __CFRunLoop *v51;
  float v52;
  void *v53;
  NSObject *v54;
  __CFRunLoop *Main;
  objc_super v56;
  _QWORD v57[5];
  _QWORD block[5];
  _QWORD v59[4];
  id v60;
  CRLAVPlayerController *v61;
  uint8_t buf[4];
  CRLAVPlayerController *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if (off_1013DB568 == a6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeOldKey));
    if (v16)
    {
      objc_opt_class(AVPlayerItem, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        objc_msgSend(v14, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, v16);
        objc_msgSend(v14, "removeObserver:name:object:", self, AVPlayerItemTimeJumpedNotification, v16);
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeNewKey));
    if (v19)
    {
      objc_opt_class(AVPlayerItem, v18);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        if (!-[CRLAVPlayerController canPlay](self, "canPlay"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asset"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_playableKeysWithKeys:](AVAsset, "crl_playableKeysWithKeys:", &off_1012CB878));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_1002F8E90;
          v59[3] = &unk_10122D3D8;
          v60 = v21;
          v61 = self;
          v23 = v21;
          objc_msgSend(v23, "loadValuesAsynchronouslyForKeys:completionHandler:", v22, v59);

        }
        objc_msgSend(v14, "addObserver:selector:name:object:", self, "p_playerItemDidPlayToEndTime:", AVPlayerItemDidPlayToEndTimeNotification, v19);
        objc_msgSend(v14, "addObserver:selector:name:object:", self, "p_playerItemDidJumpTime:", AVPlayerItemTimeJumpedNotification, v19);
        -[CRLAVPlayerController p_updateAutomaticallyWaitsToMinimizeStalling](self, "p_updateAutomaticallyWaitsToMinimizeStalling");
        if (!self->mPlayerLooper)
          -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:", v19);
      }
    }
    goto LABEL_58;
  }
  if (off_1013DB578 != a6)
  {
    if (off_1013DB580 == a6)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentItem"));

      v28 = objc_msgSend(v16, "status");
      if (v28 == (id)2)
      {
        -[CRLAVPlayerController rate](self, "rate");
        if (v52 != 1.0)
          -[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded");
      }
      else if (v28 == (id)1)
      {
        -[CRLAVPlayerController p_applyPendingRateIfNeeded](self, "p_applyPendingRateIfNeeded");
      }
      goto LABEL_59;
    }
    if (off_1013DB570 != a6)
    {
      v56.receiver = self;
      v56.super_class = (Class)CRLAVPlayerController;
      -[CRLAVPlayerController observeValueForKeyPath:ofObject:change:context:](&v56, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
      goto LABEL_60;
    }
    *(_QWORD *)&v29 = objc_opt_class(NSNumber, v13).n128_u64[0];
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey, v29));
    v33 = sub_100221D0C(v31, v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v33);

    v35 = 0.0;
    v36 = 0.0;
    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v36 = v37;
    }
    *(_QWORD *)&v38 = objc_opt_class(NSNumber, v34).n128_u64[0];
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, v38));
    v42 = sub_100221D0C(v40, v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v42);

    if (v19)
    {
      objc_msgSend(v19, "floatValue");
      v35 = v44;
    }
    if (v36 != v35)
    {
      v45 = objc_opt_class(self, v43);
      v45.n128_f32[0] = v35;
      if ((objc_msgSend(v46, "p_canApplyVolumeRampAtRate:", v45.n128_f64[0]) & 1) == 0)
        -[CRLAVPlayerController p_clearVolumeRampFromPlayerItem](self, "p_clearVolumeRampFromPlayerItem");
      if (fabsf(self->mPendingRate) != INFINITY)
      {
        if (qword_10147E5C8 != -1)
          dispatch_once(&qword_10147E5C8, &stru_10124FBE0);
        v47 = off_1013DB560;
        if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
        {
          mPendingRate = self->mPendingRate;
          *(_DWORD *)buf = 134218496;
          v63 = self;
          v64 = 2048;
          v65 = mPendingRate;
          v66 = 2048;
          v67 = v35;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Clearing pending rate %f because the player rate changed to %f.", buf, 0x20u);
        }
        self->mPendingRate = NAN;
      }
    }
    if (v36 != 0.0 || v35 == 0.0)
    {
      if (v36 != 0.0 && v35 == 0.0)
      {
        objc_msgSend(v14, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMoviePlaybackRegistry sharedMoviePlaybackRegistry](CRLMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"));
        objc_msgSend(v53, "objectDidEndMoviePlayback:", self);

        if ((-[CRLAVPlayerController isPlaying](self, "isPlaying")
           || -[CRLAVPlayerController isFastReversing](self, "isFastReversing")
           || -[CRLAVPlayerController isFastForwarding](self, "isFastForwarding"))
          && !-[CRLAVPlayerController isScrubbing](self, "isScrubbing")
          && !self->mIsUpdatingPlayerItems)
        {
          if (qword_10147E5C8 != -1)
            dispatch_once(&qword_10147E5C8, &stru_10124FCC0);
          v54 = off_1013DB560;
          if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v63 = self;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Player rate changed to 0 while playing, fast reversing, or fast forwarding.", buf, 0xCu);
          }
          Main = CFRunLoopGetMain();
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_1002F9560;
          v57[3] = &unk_10122D110;
          v57[4] = self;
          CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, v57);
          CFRunLoopWakeUp(Main);
        }
      }
    }
    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMoviePlaybackRegistry sharedMoviePlaybackRegistry](CRLMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"));
      objc_msgSend(v49, "objectWillBeginMoviePlayback:", self);

      objc_msgSend(v14, "addObserver:selector:name:object:", self, "p_applicationDidResignActive", UIApplicationWillResignActiveNotification, 0);
      if (self->mWasPlayingBeforeChangeToZeroRate
        || self->mWasFastReversingBeforeChangeToZeroRate
        || self->mWasFastForwardingBeforeChangeToZeroRate)
      {
        if (qword_10147E5C8 != -1)
          dispatch_once(&qword_10147E5C8, &stru_10124FC00);
        v50 = off_1013DB560;
        if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v63 = self;
          v64 = 2048;
          v65 = v35;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Player rate changed to %f after changing to 0 while playing, fast reversing, or fast forwarding.", buf, 0x16u);
        }
        v51 = CFRunLoopGetMain();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1002F9064;
        block[3] = &unk_10122D110;
        block[4] = self;
        CFRunLoopPerformBlock(v51, kCFRunLoopCommonModes, block);
      }
    }
LABEL_58:

LABEL_59:
    goto LABEL_60;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v25 = objc_msgSend(v24, "status");

  if (v25 == (id)2)
  {
    -[CRLAVPlayerController rate](self, "rate");
    if (v26 != 1.0)
      -[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded](self, "p_notifyDelegateOfPlaybackErrorIfNeeded");
  }
LABEL_60:

}

- (void)updateNowPlaying
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  void *v14;
  NSNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  CMTime v19;
  CMTime time;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nowPlayingTitleWithPlaybackController:", self));

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, MPMediaItemPropertyTitle);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1002F9B48;
  v26 = sub_1002F9B58;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController delegate](self, "delegate"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nowPlayingImageProviderWithPlaybackController:", self));

  if (v23[5])
  {
    v7 = objc_alloc((Class)MPMediaItemArtwork);
    objc_msgSend((id)v23[5], "naturalSize");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002F9B60;
    v21[3] = &unk_10124FD48;
    v21[4] = &v22;
    v8 = objc_msgSend(v7, "initWithBoundsSize:requestHandler:", v21);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, MPMediaItemPropertyArtwork);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAVPlayerController player](self, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentItem"));

  if (v10)
    objc_msgSend(v10, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CMTimeGetSeconds(&time));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, MPNowPlayingInfoPropertyElapsedPlaybackTime);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asset"));
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "duration");
  else
    memset(&v19, 0, sizeof(v19));
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v19));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, MPMediaItemPropertyPlaybackDuration);

  -[CRLAVPlayerController rate](self, "rate");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, MPNowPlayingInfoPropertyPlaybackRate);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](MPNowPlayingInfoCenter, "defaultCenter"));
  objc_msgSend(v18, "setNowPlayingInfo:", v3);

  _Block_object_dispose(&v22, 8);
}

- (int64_t)remotePlay
{
  if (-[CRLAVPlayerController isPlaying](self, "isPlaying"))
    return 200;
  -[CRLAVPlayerController setPlaying:](self, "setPlaying:", 1);
  return 0;
}

- (int64_t)remotePause
{
  if (!-[CRLAVPlayerController isPlaying](self, "isPlaying"))
    return 200;
  -[CRLAVPlayerController setPlaying:](self, "setPlaying:", 0);
  return 0;
}

- (void)setupRemoteTransportControls
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playCommand"));
  objc_msgSend(v3, "addTarget:action:", self, "remotePlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pauseCommand"));
  objc_msgSend(v4, "addTarget:action:", self, "remotePause");

}

- (id)delegate
{
  return self->mDelegate;
}

- (AVQueuePlayer)player
{
  return self->mPlayer;
}

- (CRLAVPlayerControllerPlayerItemMediating)playerItemMediator
{
  return self->mPlayerItemMediator;
}

- (int64_t)repeatMode
{
  return self->mRepeatMode;
}

- (float)volume
{
  return self->mVolume;
}

- (BOOL)canPlay
{
  return self->mCanPlay;
}

- (BOOL)isPlaying
{
  return self->mPlaying;
}

- (BOOL)isFastReversing
{
  return self->mFastReversing;
}

- (BOOL)isFastForwarding
{
  return self->mFastForwarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPlayerItemMediator, 0);
  objc_storeStrong((id *)&self->mObservationTokens, 0);
  objc_storeStrong(&self->mVolumeRampBoundaryTimeObserver, 0);
  objc_storeStrong((id *)&self->mVolumeRampPlayerItem, 0);
  objc_storeStrong((id *)&self->mPlayerLooper, 0);
  objc_storeStrong((id *)&self->mEnqueuedAssets, 0);
  objc_storeStrong((id *)&self->mDelegate, 0);
  objc_storeStrong((id *)&self->mPlayer, 0);
}

@end
