@implementation KPFMovie

- (BOOL)showsClosedCaptions
{
  CFArrayRef v2;
  CFArrayRef v3;

  v2 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (KPFMovie)initWithURL:(id)a3 looping:(id)a4 volume:(double)a5 name:(id)a6 audioOnly:(BOOL)a7 drmContext:(id)a8
{
  _BOOL4 v9;
  KPFMovie *v14;
  int v15;
  AVPlayerItem *v16;
  AVPlayerLayer *v17;
  objc_super v19;

  v9 = a7;
  v19.receiver = self;
  v19.super_class = (Class)KPFMovie;
  v14 = -[KPFMovie init](&v19, "init");
  if (v14)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("looping")))
    {
      v15 = 2;
    }
    else if (objc_msgSend(a4, "isEqualToString:", CFSTR("loopBackAndForth")))
    {
      v15 = 3;
    }
    else
    {
      v15 = 1;
    }
    v14->mLooping = v15;
    v14->mVolume = a5;
    v14->mName = (NSString *)a6;
    v16 = +[AVPlayerItem playerItemWithURL:](AVPlayerItem, "playerItemWithURL:", a3);
    v14->mPlayerItem = v16;
    objc_msgSend(a8, "authorizeAVPlayerItemForPlayback:", v16);
    v14->mPlayer = (AVPlayer *)objc_msgSend(objc_alloc((Class)AVPlayer), "initWithPlayerItem:", v14->mPlayerItem);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[AVPlayer setActionAtItemEnd:](v14->mPlayer, "setActionAtItemEnd:", 2);
    -[AVPlayer addObserver:forKeyPath:options:context:](v14->mPlayer, "addObserver:forKeyPath:options:context:", v14, CFSTR("currentItem"), 7, off_53BA40);
    -[AVPlayer addObserver:forKeyPath:options:context:](v14->mPlayer, "addObserver:forKeyPath:options:context:", v14, CFSTR("currentItem.status"), 0, off_53BA48);
    v14->mIsObservingPlayerItemStatus = 1;
    *(_WORD *)&v14->mMoviePlaybackIsQueued = 0;
    v14->mAudioOnly = v9;
    if (v9)
    {
      v14->mPlayerLayer = 0;
    }
    else
    {
      if (-[KPFMovie p_canLoadEnhancedCaptionsInformationForURL:](v14, "p_canLoadEnhancedCaptionsInformationForURL:", a3))
      {
        -[KPFMovie p_setupEnhancedCaptionsInformation](v14, "p_setupEnhancedCaptionsInformation");
      }
      v17 = (AVPlayerLayer *)objc_alloc_init((Class)AVPlayerLayer);
      v14->mPlayerLayer = v17;
      -[AVPlayerLayer setPlayer:](v17, "setPlayer:", v14->mPlayer);
      -[AVPlayerLayer setVideoGravity:](v14->mPlayerLayer, "setVideoGravity:", AVLayerVideoGravityResize);
      -[AVPlayerLayer setName:](v14->mPlayerLayer, "setName:", CFSTR("movieLayer"));
    }
    +[CATransaction commit](CATransaction, "commit");
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[KPFMovie stop](self, "stop");

  self->mPlayerItem = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFMovie;
  -[KPFMovie dealloc](&v3, "dealloc");
}

- (BOOL)p_showsClosedCaptions
{
  return -[AVMediaSelection selectedMediaOptionInMediaSelectionGroup:](-[AVPlayerItem currentMediaSelection](self->mPlayerItem, "currentMediaSelection"), "selectedMediaOptionInMediaSelectionGroup:", -[AVAsset mediaSelectionGroupForMediaCharacteristic:](-[AVPlayerItem asset](self->mPlayerItem, "asset"), "mediaSelectionGroupForMediaCharacteristic:", AVMediaCharacteristicLegible)) != 0;
}

- (void)p_setShowsClosedCaptions:(BOOL)a3
{
  _BOOL4 v3;
  AVMediaSelectionGroup *v5;
  AVMediaSelectionGroup *v6;
  NSArray *v7;
  NSArray *v8;

  v3 = a3;
  v5 = -[AVAsset mediaSelectionGroupForMediaCharacteristic:](-[AVPlayerItem asset](self->mPlayerItem, "asset"), "mediaSelectionGroupForMediaCharacteristic:", AVMediaCharacteristicLegible);
  v6 = v5;
  if (v3)
  {
    v7 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMediaSelectionGroup, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", -[AVMediaSelectionGroup options](v5, "options"), +[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    if (v7)
    {
      v8 = v7;
      if (-[NSArray count](v7, "count"))
        -[AVPlayerItem selectMediaOption:inMediaSelectionGroup:](self->mPlayerItem, "selectMediaOption:inMediaSelectionGroup:", -[NSArray objectAtIndex:](v8, "objectAtIndex:", 0), v6);
    }
  }
  else
  {
    -[AVPlayerItem selectMediaOption:inMediaSelectionGroup:](self->mPlayerItem, "selectMediaOption:inMediaSelectionGroup:", 0, v5);
  }
}

- (BOOL)p_canLoadEnhancedCaptionsInformationForURL:(id)a3
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "pathExtension"), "compare:options:", CFSTR("m4v"), 1) == 0;
}

- (void)p_setupEnhancedCaptionsInformation
{
  AVAsset *v3;
  _QWORD v4[5];

  if (-[AVAsset statusOfValueForKey:error:](-[AVPlayerItem asset](self->mPlayerItem, "asset"), "statusOfValueForKey:error:", CFSTR("tracks"), 0) != (char *)&dword_0 + 2)
  {
    v3 = -[AVPlayerItem asset](self->mPlayerItem, "asset");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_71CC0;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v3, "loadValuesAsynchronouslyForKeys:completionHandler:", &off_469868, v4);
  }
}

- (void)playAfterDelay:(double)a3
{
  if ((char *)-[AVPlayerItem status](-[AVPlayer currentItem](self->mPlayer, "currentItem"), "status") == (char *)&dword_0 + 1)
  {
    -[KPFMovie performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_playMovie", 0, a3);
  }
  else if ((char *)-[AVPlayerItem status](-[AVPlayer currentItem](self->mPlayer, "currentItem"), "status") != (char *)&dword_0 + 2)
  {
    self->mMoviePlaybackIsQueued = 1;
    self->mQueuedPlaybackTime = CACurrentMediaTime() + a3;
  }
}

- (void)stop
{
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->mPlayer)
    -[KPFMovie p_tearDownMoviePlayback](self, "p_tearDownMoviePlayback");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)pause
{
  double v2;

  if (!self->mMoviePlaybackIsPaused)
  {
    self->mMoviePlaybackIsPaused = 1;
    if (self->mMoviePlaybackHasStarted)
    {
      LODWORD(v2) = 0;
      -[AVPlayer setRate:](self->mPlayer, "setRate:", v2);
    }
  }
}

- (void)resume
{
  double v2;

  if (self->mMoviePlaybackIsPaused)
  {
    self->mMoviePlaybackIsPaused = 0;
    if (self->mMoviePlaybackHasStarted)
    {
      LODWORD(v2) = 1.0;
      -[AVPlayer setRate:](self->mPlayer, "setRate:", v2);
    }
  }
}

- (void)registerForMovieEndCallback:(SEL)a3 target:(id)a4
{
  self->mMovieEndCallbackTarget = a4;
  self->mMovieEndCallbackSelector = a3;
}

- (void)p_playMovie
{
  double v2;
  id v4;

  if (self->mPlayer)
  {
    self->mMoviePlaybackHasStarted = 1;
    if (!self->mAudioOnly)
    {
      -[AVPlayerLayer setHidden:](self->mPlayerLayer, "setHidden:", 0);
      v4 = -[AVPlayerLayer valueForKey:](self->mPlayerLayer, "valueForKey:", CFSTR("textureLayer"));
      if (v4)
        objc_msgSend(v4, "setHidden:", 1);
    }
    if (!self->mMoviePlaybackIsPaused)
    {
      LODWORD(v2) = 1.0;
      -[AVPlayer setRate:](self->mPlayer, "setRate:", v2);
    }
  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  double v3;
  int mLooping;
  AVPlayerItem *v6;
  double v7;
  AVPlayer *mPlayer;
  AVPlayerItem *v9;
  AVPlayerItem *v10;
  id mMovieEndCallbackTarget;
  id v12;
  int32_t v13;
  CMTime v14;
  CMTime time1;
  __int128 v16;
  CMTimeEpoch v17;
  __int128 v18;
  CMTimeEpoch epoch;
  CMTime v20;
  CMTime v21;

  mLooping = self->mLooping;
  if (mLooping == 3)
  {
    v9 = -[AVPlayer currentItem](self->mPlayer, "currentItem", a3);
    if (v9)
    {
      v10 = v9;
      -[AVPlayerItem currentTime](v9, "currentTime");
      -[AVPlayerItem forwardPlaybackEndTime](v10, "forwardPlaybackEndTime");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&v14, 0, sizeof(v14));
    }
    v13 = CMTimeCompare(&time1, &v14);
    mPlayer = self->mPlayer;
    if ((v13 & 0x80000000) == 0)
    {
      LODWORD(v7) = -1.0;
LABEL_14:
      -[AVPlayer setRate:](mPlayer, "setRate:", v7, v14.value, *(_QWORD *)&v14.timescale, v14.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
      return;
    }
LABEL_13:
    LODWORD(v7) = 1.0;
    goto LABEL_14;
  }
  if (mLooping == 2)
  {
    memset(&v21, 0, sizeof(v21));
    CMTimeMakeWithSeconds(&v21, 0.0, 90000);
    v6 = -[AVPlayer currentItem](self->mPlayer, "currentItem");
    v20 = v21;
    v18 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    v16 = v18;
    v17 = epoch;
    -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v6, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v20, &v18, &v16, 0);
    mPlayer = self->mPlayer;
    goto LABEL_13;
  }
  LODWORD(v3) = 0;
  -[AVPlayer setRate:](self->mPlayer, "setRate:", a3, v3);
  mMovieEndCallbackTarget = self->mMovieEndCallbackTarget;
  if (mMovieEndCallbackTarget)
  {
    self->mMoviePlaybackHasStarted = 0;
    v12 = objc_msgSend(mMovieEndCallbackTarget, "methodSignatureForSelector:", self->mMovieEndCallbackSelector);
    if (v12)
    {
      if (objc_msgSend(v12, "numberOfArguments") == (char *)&dword_0 + 3)
        objc_msgSend(self->mMovieEndCallbackTarget, "performSelector:withObject:afterDelay:", self->mMovieEndCallbackSelector, self, 0.0);
    }
  }
}

- (void)p_setupPosterFrame
{
  AVPlayerItem *v3;
  AVAsset *v4;
  Float64 v5;
  id v6;
  CMTimeEpoch v7;
  CGImage *v8;
  CALayer *v9;
  AVPlayerLayer *mPlayerLayer;
  __int128 v11;
  _OWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTime start;
  CMTime duration;
  CMTimeRange range;
  CMTime v24;
  CMTime v25;
  __int128 v26;
  CMTimeEpoch v27;
  __int128 v28;
  CMTimeEpoch epoch;
  CMTime time;

  v3 = -[AVPlayer currentItem](self->mPlayer, "currentItem");
  v4 = -[AVPlayerItem asset](v3, "asset");
  if (v3)
    -[AVPlayerItem currentTime](v3, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  v5 = CMTimeGetSeconds(&time) + 0.05;
  v6 = objc_msgSend(objc_alloc((Class)AVAssetImageGenerator), "initWithAsset:", v4);
  v28 = *(_OWORD *)&kCMTimeZero.value;
  v11 = v28;
  epoch = kCMTimeZero.epoch;
  v7 = epoch;
  objc_msgSend(v6, "setRequestedTimeToleranceAfter:", &v28);
  v26 = v11;
  v27 = v7;
  objc_msgSend(v6, "setRequestedTimeToleranceBefore:", &v26);
  objc_msgSend(v6, "setAppliesPreferredTrackTransform:", 1);
  CMTimeMakeWithSeconds(&v24, v5, 90000);
  if (v4)
    -[AVAsset duration](v4, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  *(_OWORD *)&start.value = v11;
  start.epoch = v7;
  CMTimeRangeMake(&range, &start, &duration);
  CMTimeClampToRange(&v25, &v24, &range);
  v8 = (CGImage *)objc_msgSend(v6, "copyCGImageAtTime:actualTime:error:", &v25, 0, 0);

  if (v8)
  {
    v9 = +[CALayer layer](CALayer, "layer");
    -[AVPlayerLayer bounds](self->mPlayerLayer, "bounds");
    -[CALayer setBounds:](v9, "setBounds:");
    -[AVPlayerLayer position](self->mPlayerLayer, "position");
    -[CALayer setPosition:](v9, "setPosition:");
    mPlayerLayer = self->mPlayerLayer;
    if (mPlayerLayer)
    {
      -[AVPlayerLayer transform](mPlayerLayer, "transform");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
    }
    v12[4] = v17;
    v12[5] = v18;
    v12[6] = v19;
    v12[7] = v20;
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    v12[3] = v16;
    -[CALayer setTransform:](v9, "setTransform:", v12);
    -[AVPlayerLayer zPosition](self->mPlayerLayer, "zPosition");
    -[CALayer setZPosition:](v9, "setZPosition:");
    -[CALayer setContents:](v9, "setContents:", v8);
    -[CALayer setName:](v9, "setName:", CFSTR("posterImage"));
    CGImageRelease(v8);
    objc_msgSend(-[AVPlayerLayer superlayer](self->mPlayerLayer, "superlayer"), "insertSublayer:above:", v9, self->mPlayerLayer);
  }
}

- (void)p_tearDownMoviePlayback
{
  double v2;
  AVPlayer *mPlayer;
  AVPlayerItem *v5;
  AVPlayerLayer *mPlayerLayer;
  id v7;

  mPlayer = self->mPlayer;
  if (mPlayer)
  {
    LODWORD(v2) = 0;
    -[AVPlayer setRate:](mPlayer, "setRate:", v2);
    self->mMoviePlaybackHasStarted = 0;
    if (self->mIsObservingPlayerItemStatus)
    {
      -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("currentItem.status"));
      self->mIsObservingPlayerItemStatus = 0;
    }
    -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("currentItem"));
    v5 = -[AVPlayer currentItem](self->mPlayer, "currentItem");
    if (v5)
      -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, v5);
    -[KPFMovie p_setupPosterFrame](self, "p_setupPosterFrame");

    self->mPlayer = 0;
  }
  mPlayerLayer = self->mPlayerLayer;
  if (mPlayerLayer)
  {
    v7 = -[AVPlayerLayer valueForKey:](mPlayerLayer, "valueForKey:", CFSTR("textureLayer"));
    -[AVPlayerLayer setValue:forKey:](self->mPlayerLayer, "setValue:forKey:", 0, CFSTR("textureLayer"));
    objc_msgSend(v7, "setValue:forKey:", 0, CFSTR("movieLayer"));
    -[AVPlayerLayer removeFromSuperlayer](self->mPlayerLayer, "removeFromSuperlayer");

    self->mPlayerLayer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVPlayerItemStatus v8;
  AVPlayer *mPlayer;
  double mQueuedPlaybackTime;
  double v11;
  NSNotificationCenter *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  objc_super v21;

  if (off_53BA48 == a6)
  {
    v8 = -[AVPlayerItem status](-[AVPlayer currentItem](self->mPlayer, "currentItem", a3, a4, a5), "status");
    mPlayer = self->mPlayer;
    if (v8 == AVPlayerItemStatusReadyToPlay)
    {
      -[AVPlayer removeObserver:forKeyPath:](mPlayer, "removeObserver:forKeyPath:", self, CFSTR("currentItem.status"));
      self->mIsObservingPlayerItemStatus = 0;
      if (!self->mMoviePlaybackIsQueued)
        return;
      mQueuedPlaybackTime = self->mQueuedPlaybackTime;
      v11 = mQueuedPlaybackTime - CACurrentMediaTime();
      if (v11 < 0.0)
        v11 = 0.0;
      -[KPFMovie performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_playMovie", 0, v11);
    }
    else
    {
      if ((char *)-[AVPlayerItem status](-[AVPlayer currentItem](mPlayer, "currentItem"), "status") != (char *)&dword_0 + 2)
        return;
      -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("currentItem.status"));
      self->mIsObservingPlayerItemStatus = 0;
    }
    self->mMoviePlaybackIsQueued = 0;
  }
  else if (off_53BA40 == a6)
  {
    v12 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3, a4);
    v13 = objc_msgSend(a5, "objectForKey:", NSKeyValueChangeOldKey);
    if (v13)
    {
      v15 = v13;
      v16 = objc_opt_class(AVPlayerItem, v14);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        -[NSNotificationCenter removeObserver:name:object:](v12, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, v15);
    }
    v17 = objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey);
    if (v17)
    {
      v19 = v17;
      v20 = objc_opt_class(AVPlayerItem, v18);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        -[NSNotificationCenter addObserver:selector:name:object:](v12, "addObserver:selector:name:object:", self, "p_playerItemDidPlayToEndTime:", AVPlayerItemDidPlayToEndTimeNotification, v19);
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)KPFMovie;
    -[KPFMovie observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (AVPlayerLayer)playerLayer
{
  return self->mPlayerLayer;
}

- (NSString)name
{
  return self->mName;
}

- (BOOL)isPlaying
{
  return self->mMoviePlaybackHasStarted;
}

@end
