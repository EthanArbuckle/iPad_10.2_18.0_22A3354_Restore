@implementation TSKAVPlayerController

- (TSKAVPlayerController)initWithPlayer:(id)a3 delegate:(id)a4
{
  void *v7;
  uint64_t v8;
  TSKAVPlayerController *v9;
  TSKAVPlayerController *v10;
  AVPlayer *v11;
  objc_super v13;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController initWithPlayer:delegate:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 59, CFSTR("Invalid parameter not satisfying: %s"), "player != nil");
  }
  v13.receiver = self;
  v13.super_class = (Class)TSKAVPlayerController;
  v9 = -[TSKAVPlayerController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->mRepeatMode = 0;
    v9->mVolume = 1.0;
    v9->mDelegate = (TSKAVPlayerControllerDelegate *)a4;
    v11 = (AVPlayer *)a3;
    v10->mPlayer = v11;
    -[AVPlayer setActionAtItemEnd:](v11, "setActionAtItemEnd:", 2);
    -[AVPlayer addObserver:forKeyPath:options:context:](v10->mPlayer, "addObserver:forKeyPath:options:context:", v10, CFSTR("currentItem"), 7, TSKAVPlayerControllerAVPlayerCurrentItemObserverContext);
    -[AVPlayer addObserver:forKeyPath:options:context:](v10->mPlayer, "addObserver:forKeyPath:options:context:", v10, CFSTR("rate"), 7, TSKAVPlayerControllerAVPlayerRateObserverContext);
    -[TSKAVPlayerController p_startObservingClosedCaptionDisplayEnabled](v10, "p_startObservingClosedCaptionDisplayEnabled");
  }
  return v10;
}

- (TSKAVPlayerController)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 82, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSKAVPlayerController init]"), 0));
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->mDelegate)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 88, CFSTR("-teardown must be called before dealloc"));
  }

  v5.receiver = self;
  v5.super_class = (Class)TSKAVPlayerController;
  -[TSKAVPlayerController dealloc](&v5, sel_dealloc);
}

- (void)addAdditionalReference
{
  ++self->mAdditionalReferences;
}

- (void)teardown
{
  unint64_t mAdditionalReferences;
  void *v4;
  uint64_t v5;
  AVPlayer *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  mAdditionalReferences = self->mAdditionalReferences;
  if (mAdditionalReferences)
  {
    self->mAdditionalReferences = mAdditionalReferences - 1;
  }
  else
  {
    if (-[TSKAVPlayerController isPlaying](self, "isPlaying")
      || -[TSKAVPlayerController isFastReversing](self, "isFastReversing")
      || -[TSKAVPlayerController isFastForwarding](self, "isFastForwarding"))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController teardown]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 107, CFSTR("player controller should not be playing when it is told to teardown"));
    }
    -[TSKAVPlayerController p_stopObservingClosedCaptionDisplayEnabled](self, "p_stopObservingClosedCaptionDisplayEnabled");
    v6 = -[TSKAVPlayerController player](self, "player");
    LODWORD(v7) = 0;
    -[AVPlayer setRate:](v6, "setRate:", v7);
    v8 = -[AVPlayer currentItem](v6, "currentItem");
    if (v8)
    {
      v9 = v8;
      v10 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], v9);
    }
    -[AVPlayer removeObserver:forKeyPath:context:](v6, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), TSKAVPlayerControllerAVPlayerCurrentItemObserverContext);
    -[AVPlayer removeObserver:forKeyPath:context:](v6, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), TSKAVPlayerControllerAVPlayerRateObserverContext);
    -[AVPlayer replaceCurrentItemWithPlayerItem:](v6, "replaceCurrentItemWithPlayerItem:", 0);

    self->mDelegate = 0;
  }
}

- (double)duration
{
  AVPlayerItem *v3;
  double v4;
  double v5;
  double v6;
  CMTime v8[2];

  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (!v3)
    return NAN;
  memset(&v8[1], 0, sizeof(CMTime));
  -[AVPlayerItem duration](v3, "duration");
  if ((unsigned __int128)0 >> 96 != 1)
    return NAN;
  -[TSKAVPlayerController endTime](self, "endTime");
  v8[0] = v8[1];
  v5 = fmin(v4, CMTimeGetSeconds(v8));
  -[TSKAVPlayerController startTime](self, "startTime");
  return fmax(v5 - v6, 0.0);
}

+ (id)keyPathsForValuesAffectingDuration
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("player.currentItem.duration"), CFSTR("startTime"), CFSTR("endTime"), 0);
}

- (double)absoluteDuration
{
  AVPlayerItem *v2;
  CMTime v4[2];

  v2 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (!v2)
    return NAN;
  memset(&v4[1], 0, sizeof(CMTime));
  -[AVPlayerItem duration](v2, "duration");
  if ((unsigned __int128)0 >> 96 != 1)
    return NAN;
  v4[0] = v4[1];
  return CMTimeGetSeconds(v4);
}

+ (id)keyPathsForValuesAffectingAbsoluteDuration
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("player.currentItem.duration"), 0);
}

- (double)startTime
{
  AVPlayerItem *v2;
  double result;
  CMTime v4[2];

  v2 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (!v2)
    return NAN;
  memset(&v4[1], 0, sizeof(CMTime));
  -[AVPlayerItem reversePlaybackEndTime](v2, "reversePlaybackEndTime");
  result = 0.0;
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v4[0] = v4[1];
    return CMTimeGetSeconds(v4);
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  AVPlayerItem *v4;
  AVPlayerItem *v5;
  CMTime v6;
  CMTime time2;
  CMTime time1;
  CMTime v9;
  CMTime v10;

  v4 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (v4)
  {
    v5 = v4;
    memset(&v10, 0, sizeof(v10));
    CMTimeMakeWithSeconds(&v10, a3, 90000);
    memset(&v9, 0, sizeof(v9));
    -[AVPlayerItem currentTime](v5, "currentTime");
    time1 = v9;
    time2 = v10;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      time1 = v10;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      v6 = time2;
      -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:](v5, "seekToTime:toleranceBefore:toleranceAfter:", &time1, &time2, &v6);
    }
    time1 = v10;
    -[AVPlayerItem setReversePlaybackEndTime:](v5, "setReversePlaybackEndTime:", &time1);
  }
}

+ (BOOL)automaticallyNotifiesObserversOfStartTime
{
  return 0;
}

+ (id)keyPathsForValuesAffectingStartTime
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("player.currentItem.reversePlaybackEndTime"));
}

- (double)endTime
{
  AVPlayerItem *v2;
  AVPlayerItem *v3;
  CMTime *p_time;
  AVAsset *v6;
  CMTime time;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v2 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (!v2)
    return NAN;
  v3 = v2;
  v10 = 0uLL;
  v11 = 0;
  -[AVPlayerItem forwardPlaybackEndTime](v2, "forwardPlaybackEndTime");
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v8 = v10;
    v9 = v11;
    p_time = (CMTime *)&v8;
  }
  else
  {
    v6 = -[AVPlayerItem asset](v3, "asset");
    if (v6)
      -[AVAsset duration](v6, "duration");
    else
      memset(&time, 0, sizeof(time));
    p_time = &time;
  }
  return CMTimeGetSeconds(p_time);
}

- (void)setEndTime:(double)a3
{
  AVPlayerItem *v4;
  AVPlayerItem *v5;
  CMTime v6;
  CMTime time2;
  CMTime time1;
  CMTime v9;
  CMTime v10;

  v4 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (v4)
  {
    v5 = v4;
    memset(&v10, 0, sizeof(v10));
    CMTimeMakeWithSeconds(&v10, a3, 90000);
    memset(&v9, 0, sizeof(v9));
    -[AVPlayerItem currentTime](v5, "currentTime");
    time1 = v9;
    time2 = v10;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      time1 = v10;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      v6 = time2;
      -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:](v5, "seekToTime:toleranceBefore:toleranceAfter:", &time1, &time2, &v6);
    }
    time1 = v10;
    -[AVPlayerItem setForwardPlaybackEndTime:](v5, "setForwardPlaybackEndTime:", &time1);
  }
}

+ (BOOL)automaticallyNotifiesObserversOfEndTime
{
  return 0;
}

+ (id)keyPathsForValuesAffectingEndTime
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("player.currentItem.forwardPlaybackEndTime"), CFSTR("player.currentItem.asset.duration"), 0);
}

- (void)setRepeatMode:(int64_t)a3
{
  AVPlayer *v4;
  AVPlayer *v5;
  double v6;

  if (self->mRepeatMode != a3)
  {
    self->mRepeatMode = a3;
    v4 = -[TSKAVPlayerController player](self, "player");
    if (self->mRepeatMode != 2)
    {
      v5 = v4;
      -[AVPlayer rate](v4, "rate");
      if (*(float *)&v6 < 0.0)
      {
        LODWORD(v6) = 1.0;
        -[AVPlayer setRate:](v5, "setRate:", v6);
      }
    }
  }
}

- (void)setVolume:(float)a3
{
  if (self->mVolume != a3)
  {
    self->mVolume = a3;
    -[TSKAVPlayerController p_applyVolumeToPlayerItem](self, "p_applyVolumeToPlayerItem");
  }
}

- (void)p_applyVolumeToPlayerItem
{
  float v3;
  float v4;
  AVPlayerItem *v5;
  AVPlayerItem *v6;
  AVAsset *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[TSKAVPlayerController volume](self, "volume");
  v4 = v3;
  v5 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (v5)
  {
    v6 = v5;
    if (v4 == 1.0)
    {
      v17 = 0;
    }
    else
    {
      v18 = objc_alloc_init(MEMORY[0x24BDB25A0]);
      v7 = -[AVPlayerItem asset](v6, "asset");
      v8 = -[AVAsset tracksWithMediaType:](v7, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](v8, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        v19 = *MEMORY[0x24BDC0D88];
        v13 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
            v16 = objc_alloc_init(MEMORY[0x24BDB25A8]);
            objc_msgSend(v16, "setTrackID:", objc_msgSend(v15, "trackID"));
            v20 = v19;
            v21 = v13;
            objc_msgSend(v16, "setVolume:atTime:", &v20, COERCE_DOUBLE(__PAIR64__(DWORD1(v19), LODWORD(v4))));
            objc_msgSend(v9, "addObject:", v16);

            ++v14;
          }
          while (v11 != v14);
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }
      v17 = v18;
      objc_msgSend(v18, "setInputParameters:", v9);

    }
    -[AVPlayerItem setAudioMix:](v6, "setAudioMix:", v17);

  }
}

- (double)absoluteCurrentTime
{
  AVPlayerItem *v3;
  AVPlayerItem *v4;
  CMTime time;

  self->_absoluteCurrentTime = 0.0;
  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  if (v3)
  {
    v4 = v3;
    if (-[AVPlayerItem status](v3, "status") == AVPlayerItemStatusReadyToPlay)
    {
      -[AVPlayerItem currentTime](v4, "currentTime");
      self->_absoluteCurrentTime = fmax(CMTimeGetSeconds(&time), 0.0);
    }
  }
  return self->_absoluteCurrentTime;
}

- (double)currentTime
{
  AVPlayerItem *v3;
  double v4;
  AVPlayerItem *v5;
  double v6;
  CMTime time;

  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    if (-[AVPlayerItem status](v3, "status") == AVPlayerItemStatusReadyToPlay)
    {
      -[AVPlayerItem currentTime](v5, "currentTime");
      CMTimeGetSeconds(&time);
      -[TSKAVPlayerController startTime](self, "startTime");
      -[TSKAVPlayerController endTime](self, "endTime");
      TSUClamp();
      return v6;
    }
  }
  return v4;
}

- (double)remainingTime
{
  AVPlayerItem *v3;
  double v4;
  AVPlayerItem *v5;
  double v6;
  double v7;
  CMTime time;

  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    if (-[AVPlayerItem status](v3, "status") == AVPlayerItemStatusReadyToPlay)
    {
      -[TSKAVPlayerController endTime](self, "endTime");
      v7 = v6;
      -[AVPlayerItem currentTime](v5, "currentTime");
      return fmax(v7 - fmax(CMTimeGetSeconds(&time), 0.0), 0.0);
    }
  }
  return v4;
}

- (BOOL)isScrubbing
{
  return self->mScrubbingCount != 0;
}

- (void)beginScrubbing
{
  unint64_t mScrubbingCount;
  unint64_t v4;
  AVPlayer *v5;
  float v6;
  double v7;

  mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount)
  {
    self->mScrubbingCount = mScrubbingCount + 1;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerWillBeginScrubbingNotification"), self);
    v4 = self->mScrubbingCount;
    self->mScrubbingCount = v4 + 1;
    if (!v4)
    {
      v5 = -[TSKAVPlayerController player](self, "player");
      -[AVPlayer rate](v5, "rate");
      self->mRateBeforeScrubbing = v6;
      LODWORD(v7) = 0;
      -[AVPlayer setRate:](v5, "setRate:", v7);
    }
  }
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
  -[TSKAVPlayerController scrubToTime:withTolerance:completionHandler:](self, "scrubToTime:withTolerance:completionHandler:", 0, a3, a4);
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  void *v9;
  uint64_t v10;
  AVPlayer *v11;
  CMTime v12;
  CMTime v13;
  CMTime v14;

  if (!-[TSKAVPlayerController isScrubbing](self, "isScrubbing"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController scrubToTime:withTolerance:completionHandler:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 416, CFSTR("scrubbed to time when not in a scrubbing operation"));
  }
  v11 = -[TSKAVPlayerController player](self, "player");
  CMTimeMakeWithSeconds(&v14, a3, 90000);
  CMTimeMakeWithSeconds(&v13, a4, 90000);
  CMTimeMakeWithSeconds(&v12, a4, 90000);
  -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v11, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v14, &v13, &v12, a5);
}

- (void)endScrubbing
{
  unint64_t mScrubbingCount;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  AVPlayer *v7;
  AVPlayerItem *v8;
  double v9;
  AVPlayerItem *v10;
  AVPlayer *v11;
  unsigned int v12;
  AVPlayer *v13;
  BOOL v14;
  int v15;
  double v16;
  CMTime v17;
  CMTime v18;
  CMTime time2;
  CMTime time1;
  CMTime v21;

  mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController endScrubbing]"),
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 423, CFSTR("Uneven begin/end scrubbing calls!")), (mScrubbingCount = self->mScrubbingCount) != 0))
  {
    v6 = mScrubbingCount - 1;
    self->mScrubbingCount = v6;
    if (!v6)
    {
      v7 = -[TSKAVPlayerController player](self, "player");
      v8 = -[AVPlayer currentItem](v7, "currentItem");
      if (!v8)
      {
        *(float *)&v9 = self->mRateBeforeScrubbing;
LABEL_25:
        -[AVPlayer setRate:](v7, "setRate:", v9);
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerDidEndScrubbingNotification"), self);
        return;
      }
      v10 = v8;
      memset(&v21, 0, sizeof(v21));
      -[AVPlayerItem forwardPlaybackEndTime](v8, "forwardPlaybackEndTime");
      if ((unsigned __int128)0 >> 96 == 1)
      {
        v11 = -[TSKAVPlayerController player](self, "player");
        if (v11)
          -[AVPlayer currentTime](v11, "currentTime");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = v21;
        v12 = CMTimeCompare(&time1, &time2) >> 31;
      }
      else
      {
        v12 = 1;
      }
      memset(&time2, 0, sizeof(time2));
      -[AVPlayerItem reversePlaybackEndTime](v10, "reversePlaybackEndTime");
      if ((time2.flags & 0x1D) == 1)
      {
        v13 = -[TSKAVPlayerController player](self, "player");
        if (v13)
          -[AVPlayer currentTime](v13, "currentTime");
        else
          memset(&v18, 0, sizeof(v18));
        v17 = time2;
        v14 = CMTimeCompare(&v18, &v17) < 1;
      }
      else
      {
        v14 = 0;
      }
      *(float *)&v9 = self->mRateBeforeScrubbing;
      if (*(float *)&v9 <= 0.0)
        v15 = 1;
      else
        v15 = v12;
      if (*(float *)&v9 >= 0.0)
        v14 = 0;
      if (v15 == 1 && !v14)
        goto LABEL_25;
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerDidEndScrubbingNotification"), self);
      *(float *)&v16 = self->mRateBeforeScrubbing;
      -[TSKAVPlayerController playerItemDidPlayToEndTimeAtRate:](self, "playerItemDidPlayToEndTimeAtRate:", v16);
    }
  }
}

- (void)seekForwardByOneFrame
{
  AVPlayerItem *v3;
  AVPlayerItem *v4;
  AVPlayer *v5;
  BOOL v6;
  CMTime v7;
  CMTime time1;
  CMTime v9;

  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  v4 = v3;
  if (v3
    && (memset(&v9, 0, sizeof(v9)),
        -[AVPlayerItem forwardPlaybackEndTime](v3, "forwardPlaybackEndTime"),
        (unsigned __int128)0 >> 96 == 1))
  {
    v5 = -[TSKAVPlayerController player](self, "player");
    if (v5)
      -[AVPlayer currentTime](v5, "currentTime");
    else
      memset(&time1, 0, sizeof(time1));
    v7 = v9;
    v6 = CMTimeCompare(&time1, &v7) >= 0;
  }
  else
  {
    v6 = 0;
  }
  if (-[AVPlayerItem canStepForward](v4, "canStepForward"))
  {
    if (!v6)
      -[AVPlayerItem stepByCount:](v4, "stepByCount:", 1);
  }
}

- (void)seekBackwardByOneFrame
{
  AVPlayerItem *v3;
  AVPlayerItem *v4;
  AVPlayer *v5;
  BOOL v6;
  CMTime v7;
  CMTime time1;
  CMTime v9;

  v3 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
  v4 = v3;
  if (v3
    && (memset(&v9, 0, sizeof(v9)),
        -[AVPlayerItem reversePlaybackEndTime](v3, "reversePlaybackEndTime"),
        (unsigned __int128)0 >> 96 == 1))
  {
    v5 = -[TSKAVPlayerController player](self, "player");
    if (v5)
      -[AVPlayer currentTime](v5, "currentTime");
    else
      memset(&time1, 0, sizeof(time1));
    v7 = v9;
    v6 = CMTimeCompare(&time1, &v7) < 1;
  }
  else
  {
    v6 = 0;
  }
  if (-[AVPlayerItem canStepBackward](v4, "canStepBackward"))
  {
    if (!v6)
      -[AVPlayerItem stepByCount:](v4, "stepByCount:", -1);
  }
}

- (void)seekToBeginning
{
  AVPlayer *v2;
  AVPlayerItem *v3;
  _QWORD v4[3];

  v2 = -[TSKAVPlayerController player](self, "player");
  v3 = -[AVPlayer currentItem](v2, "currentItem");
  if (v3)
    -[AVPlayerItem reversePlaybackEndTime](v3, "reversePlaybackEndTime");
  else
    memset(v4, 0, sizeof(v4));
  -[AVPlayer seekToTime:](v2, "seekToTime:", v4);
}

- (void)seekToEnd
{
  AVPlayer *v2;
  AVPlayerItem *v3;
  _QWORD v4[3];

  v2 = -[TSKAVPlayerController player](self, "player");
  v3 = -[AVPlayer currentItem](v2, "currentItem");
  if (v3)
    -[AVPlayerItem forwardPlaybackEndTime](v3, "forwardPlaybackEndTime");
  else
    memset(v4, 0, sizeof(v4));
  -[AVPlayer seekToTime:](v2, "seekToTime:", v4);
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  AVPlayer *v5;
  double v6;
  AVPlayer *v7;
  AVPlayerItem *v8;
  AVPlayerItem *v9;
  Float64 v10;
  double v11;
  CMTime v12;
  CMTime time2;
  CMTime time1;
  CMTime v15;
  CMTime v16;
  CMTime v17;

  if (self->mPlaying != a3)
  {
    v3 = a3;
    self->mPlaying = a3;
    v5 = -[TSKAVPlayerController player](self, "player");
    v7 = v5;
    if (v3)
    {
      -[AVPlayer rate](v5, "rate");
      if (*(float *)&v6 == 0.0)
      {
        v8 = -[AVPlayer currentItem](v7, "currentItem");
        v9 = v8;
        memset(&v17, 0, sizeof(v17));
        if (v8)
          -[AVPlayerItem currentTime](v8, "currentTime");
        memset(&v16, 0, sizeof(v16));
        -[TSKAVPlayerController startTime](self, "startTime");
        CMTimeMakeWithSeconds(&v16, v10, 90000);
        memset(&v15, 0, sizeof(v15));
        -[TSKAVPlayerController endTime](self, "endTime");
        CMTimeMakeWithSeconds(&v15, v11 + -0.01, 90000);
        time1 = v17;
        time2 = v16;
        if (CMTimeCompare(&time1, &time2) < 0 || (time1 = v17, time2 = v15, CMTimeCompare(&time1, &time2) >= 1))
        {
          time1 = v16;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
          v12 = time2;
          -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:](v9, "seekToTime:toleranceBefore:toleranceAfter:", &time1, &time2, &v12);
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerWillPlayFromStartNotification"), self);
        }
      }
      LODWORD(v6) = 1.0;
    }
    else
    {
      LODWORD(v6) = 0;
    }
    -[AVPlayer setRate:](v7, "setRate:", v6);
    -[TSKAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
    -[TSKAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
  }
}

- (BOOL)p_canFastReverse
{
  AVPlayer *v3;
  AVPlayerItem *v4;
  _BOOL4 v5;
  float v6;
  Float64 v7;
  CMTime v9;
  CMTime time1;
  CMTime v11;
  CMTime v12;

  v3 = -[TSKAVPlayerController player](self, "player");
  v4 = -[AVPlayer currentItem](v3, "currentItem");
  v5 = -[AVPlayerItem canPlayFastReverse](v4, "canPlayFastReverse");
  if (v5)
  {
    -[AVPlayer rate](v3, "rate");
    if (v6 == 0.0)
    {
      memset(&v12, 0, sizeof(v12));
      if (v4)
        -[AVPlayerItem currentTime](v4, "currentTime");
      memset(&v11, 0, sizeof(v11));
      -[TSKAVPlayerController startTime](self, "startTime");
      CMTimeMakeWithSeconds(&v11, v7, 90000);
      time1 = v12;
      v9 = v11;
      LOBYTE(v5) = CMTimeCompare(&time1, &v9) > 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setFastReversing:(BOOL)a3
{
  AVPlayer *v4;
  double v5;
  _BOOL4 v6;
  AVPlayer *v7;
  double v8;

  if (self->mFastReversing != a3)
  {
    if (a3)
    {
      if (-[TSKAVPlayerController p_canFastReverse](self, "p_canFastReverse"))
      {
        self->mFastReversing = 1;
        v4 = -[TSKAVPlayerController player](self, "player");
        LODWORD(v5) = -2.0;
        -[AVPlayer setRate:](v4, "setRate:", v5);
        -[TSKAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
      }
    }
    else
    {
      self->mFastReversing = 0;
      if (!-[TSKAVPlayerController isFastForwarding](self, "isFastForwarding"))
      {
        v6 = -[TSKAVPlayerController isPlaying](self, "isPlaying");
        v7 = -[TSKAVPlayerController player](self, "player");
        if (v6)
          LODWORD(v8) = 1.0;
        else
          LODWORD(v8) = 0;
        -[AVPlayer setRate:](v7, "setRate:", v8);
      }
    }
  }
}

- (BOOL)p_canFastForward
{
  AVPlayer *v3;
  AVPlayerItem *v4;
  _BOOL4 v5;
  float v6;
  Float64 v7;
  CMTime v9;
  CMTime time1;
  CMTime v11;
  CMTime v12;

  v3 = -[TSKAVPlayerController player](self, "player");
  v4 = -[AVPlayer currentItem](v3, "currentItem");
  v5 = -[AVPlayerItem canPlayFastForward](v4, "canPlayFastForward");
  if (v5)
  {
    -[AVPlayer rate](v3, "rate");
    if (v6 == 0.0)
    {
      memset(&v12, 0, sizeof(v12));
      if (v4)
        -[AVPlayerItem currentTime](v4, "currentTime");
      memset(&v11, 0, sizeof(v11));
      -[TSKAVPlayerController endTime](self, "endTime");
      CMTimeMakeWithSeconds(&v11, v7, 90000);
      time1 = v12;
      v9 = v11;
      return CMTimeCompare(&time1, &v9) >> 31;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setFastForwarding:(BOOL)a3
{
  AVPlayer *v4;
  double v5;
  _BOOL4 v6;
  AVPlayer *v7;
  double v8;

  if (self->mFastForwarding != a3)
  {
    if (a3)
    {
      if (-[TSKAVPlayerController p_canFastForward](self, "p_canFastForward"))
      {
        self->mFastForwarding = 1;
        v4 = -[TSKAVPlayerController player](self, "player");
        LODWORD(v5) = 2.0;
        -[AVPlayer setRate:](v4, "setRate:", v5);
        -[TSKAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
      }
    }
    else
    {
      self->mFastForwarding = 0;
      if (!-[TSKAVPlayerController isFastReversing](self, "isFastReversing"))
      {
        v6 = -[TSKAVPlayerController isPlaying](self, "isPlaying");
        v7 = -[TSKAVPlayerController player](self, "player");
        if (v6)
          LODWORD(v8) = 1.0;
        else
          LODWORD(v8) = 0;
        -[AVPlayer setRate:](v7, "setRate:", v8);
      }
    }
  }
}

- (void)p_startObservingClosedCaptionDisplayEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_closedCaptioningStatusDidChange_, *MEMORY[0x24BDF7208], 0);
  -[TSKAVPlayerController p_updateClosedCaptionDisplayEnabled](self, "p_updateClosedCaptionDisplayEnabled");
}

- (void)p_stopObservingClosedCaptionDisplayEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7208], 0);
}

- (void)p_updateClosedCaptionDisplayEnabled
{
  -[AVPlayer setClosedCaptionDisplayEnabled:](-[TSKAVPlayerController player](self, "player"), "setClosedCaptionDisplayEnabled:", UIAccessibilityIsClosedCaptioningEnabled());
}

- (void)playerItemDidPlayToEndTimeAtRate:(float)a3
{
  TSKAVPlayerController *v4;
  TSKAVPlayerController *v5;
  int64_t v6;
  Float64 v7;
  TSKAVPlayerController *v8;
  Float64 v9;
  AVPlayerItem *v10;
  AVPlayer *v11;
  double v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  CMTime v18;
  CMTime v19;

  v4 = self;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerDidPlayToEndNotification"), self);
  v5 = self;
  v6 = -[TSKAVPlayerController repeatMode](self, "repeatMode");
  if (v6)
  {
    if (v6 == 2)
    {
      if (a3 >= 0.0)
        -[TSKAVPlayerController endTime](self, "endTime");
      else
        -[TSKAVPlayerController startTime](self, "startTime");
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, v9, 90000);
      v11 = -[TSKAVPlayerController player](self, "player");
      *(float *)&v12 = -a3;
      v18 = v19;
      v16 = *MEMORY[0x24BDC0D40];
      v17 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      -[AVPlayer setRate:time:atHostTime:](v11, "setRate:time:atHostTime:", &v18, &v16, v12);
    }
    else if (v6 == 1)
    {
      if (a3 >= 0.0)
        -[TSKAVPlayerController startTime](self, "startTime");
      else
        -[TSKAVPlayerController endTime](self, "endTime");
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, v7, 90000);
      v10 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
      v18 = v19;
      v16 = *MEMORY[0x24BDC0D88];
      v17 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v14 = v16;
      v15 = v17;
      -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:](v10, "seekToTime:toleranceBefore:toleranceAfter:", &v18, &v16, &v14);
    }
  }
  else
  {
    v8 = self;
    -[TSKAVPlayerController setPlaying:](self, "setPlaying:", 0);
    -[TSKAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
    -[TSKAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
    if (a3 > 0.0)
      -[TSKAVPlayerControllerDelegate playbackDidStopForPlayerController:](-[TSKAVPlayerController delegate](self, "delegate"), "playbackDidStopForPlayerController:", self);

  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  -[AVPlayer rate](-[TSKAVPlayerController player](self, "player", a3), "rate");
  -[TSKAVPlayerController playerItemDidPlayToEndTimeAtRate:](self, "playerItemDidPlayToEndTimeAtRate:");
}

- (void)p_playbackDidFailWithError:(id)a3
{
  -[TSKAVPlayerControllerDelegate playerController:playbackDidFailWithError:](-[TSKAVPlayerController delegate](self, "delegate"), "playerController:playbackDidFailWithError:", self, a3);
}

- (void)p_applicationDidResignActive
{
  -[TSKAVPlayerController setPlaying:](self, "setPlaying:", 0);
  -[TSKAVPlayerController setFastReversing:](self, "setFastReversing:", 0);
  -[TSKAVPlayerController setFastForwarding:](self, "setFastForwarding:", 0);
  -[TSKAVPlayerControllerDelegate playbackDidStopForPlayerController:](-[TSKAVPlayerController delegate](self, "delegate"), "playbackDidStopForPlayerController:", self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSError *v17;
  void *v18;
  uint64_t v19;
  AVPlayerItem *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  AVPlayer *v29;
  float v30;
  AVPlayer *v31;
  __CFRunLoop *Main;
  const void *v33;
  objc_super v34;
  _QWORD block[5];
  _QWORD v36[6];

  v11 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  if ((void *)TSKAVPlayerControllerAVPlayerCurrentItemObserverContext != a6)
  {
    if ((void *)TSKAVPlayerControllerAVPlayerStatusObserverContext == a6)
    {
      if (-[AVPlayer status](-[TSKAVPlayerController player](self, "player"), "status") != AVPlayerStatusFailed)
        return;
      v17 = -[AVPlayer error](-[TSKAVPlayerController player](self, "player"), "error");
      if (!v17)
      {
        v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController observeValueForKeyPath:ofObject:change:context:]");
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 801, CFSTR("invalid nil value for '%s'"), "playerError");
      }
    }
    else
    {
      if ((void *)TSKAVPlayerControllerAVPlayerItemStatusObserverContext != a6)
      {
        if ((void *)TSKAVPlayerControllerAVPlayerRateObserverContext == a6)
        {
          objc_opt_class();
          objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
          v23 = (void *)TSUDynamicCast();
          v24 = 0.0;
          v25 = 0.0;
          if (v23)
          {
            objc_msgSend(v23, "floatValue");
            v25 = v26;
          }
          objc_opt_class();
          objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v27 = (void *)TSUDynamicCast();
          if (v27 && (objc_msgSend(v27, "floatValue"), v24 = v28, v25 == 0.0) && v28 != 0.0)
          {
            v29 = -[TSKAVPlayerController player](self, "player");
            objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectWillBeginMoviePlayback:", self);
            objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_p_applicationDidResignActive, *MEMORY[0x24BDF75D8], 0);
            if (!self->mIsObservingStatus)
            {
              -[AVPlayer addObserver:forKeyPath:options:context:](v29, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 4, TSKAVPlayerControllerAVPlayerStatusObserverContext);
              -[AVPlayer addObserver:forKeyPath:options:context:](v29, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.status"), 4, TSKAVPlayerControllerAVPlayerItemStatusObserverContext);
              self->mIsObservingStatus = 1;
            }
            -[AVPlayer rate](v29, "rate");
            if (v30 == 0.0 && self->mIsObservingStatus)
            {
              -[AVPlayer removeObserver:forKeyPath:context:](v29, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), TSKAVPlayerControllerAVPlayerItemStatusObserverContext);
              -[AVPlayer removeObserver:forKeyPath:context:](v29, "removeObserver:forKeyPath:context:", self, CFSTR("status"), TSKAVPlayerControllerAVPlayerStatusObserverContext);
              self->mIsObservingStatus = 0;
            }
          }
          else if (v25 != 0.0 && v24 == 0.0)
          {
            v31 = -[TSKAVPlayerController player](self, "player");
            objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);
            if (self->mIsObservingStatus)
            {
              -[AVPlayer removeObserver:forKeyPath:context:](v31, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), TSKAVPlayerControllerAVPlayerItemStatusObserverContext);
              -[AVPlayer removeObserver:forKeyPath:context:](v31, "removeObserver:forKeyPath:context:", self, CFSTR("status"), TSKAVPlayerControllerAVPlayerStatusObserverContext);
              self->mIsObservingStatus = 0;
            }
            objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectDidEndMoviePlayback:", self);
            if ((-[TSKAVPlayerController isPlaying](self, "isPlaying")
               || -[TSKAVPlayerController isFastReversing](self, "isFastReversing")
               || -[TSKAVPlayerController isFastForwarding](self, "isFastForwarding"))
              && !-[TSKAVPlayerController isScrubbing](self, "isScrubbing"))
            {
              Main = CFRunLoopGetMain();
              v33 = (const void *)*MEMORY[0x24BDBD598];
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
              block[3] = &unk_24D829278;
              block[4] = self;
              CFRunLoopPerformBlock(Main, v33, block);
              CFRunLoopWakeUp(Main);
            }
          }
        }
        else
        {
          v34.receiver = self;
          v34.super_class = (Class)TSKAVPlayerController;
          -[TSKAVPlayerController observeValueForKeyPath:ofObject:change:context:](&v34, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
        }
        return;
      }
      v20 = -[AVPlayer currentItem](-[TSKAVPlayerController player](self, "player"), "currentItem");
      if (-[AVPlayerItem status](v20, "status") != AVPlayerItemStatusFailed)
        return;
      v17 = -[AVPlayerItem error](v20, "error");
      if (!v17)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerController observeValueForKeyPath:ofObject:change:context:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 812, CFSTR("invalid nil value for '%s'"), "playerItemError");
      }
    }
    -[TSKAVPlayerController p_playbackDidFailWithError:](self, "p_playbackDidFailWithError:", v17);
    return;
  }
  v12 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDD0E80]);
  if (v12)
  {
    v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], v13);
  }
  v14 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDD0E70]);
  if (v14)
  {
    v15 = (void *)v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[TSKAVPlayerController canPlay](self, "canPlay"))
      {
        v16 = (void *)objc_msgSend(v15, "asset");
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v36[3] = &unk_24D82A5C8;
        v36[4] = v16;
        v36[5] = self;
        objc_msgSend(v16, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24D8FA260, v36);
      }
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_p_playerItemDidPlayToEndTime_, *MEMORY[0x24BDB1FA8], v15);
      -[TSKAVPlayerController p_applyVolumeToPlayerItem](self, "p_applyVolumeToPlayerItem");
    }
  }
}

void __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  __CFRunLoop *Main;
  const void *v3;
  _QWORD v4[4];
  __int128 v5;

  Main = CFRunLoopGetMain();
  v3 = (const void *)*MEMORY[0x24BDBD598];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v4[3] = &unk_24D82A5C8;
  v5 = *(_OWORD *)(a1 + 32);
  CFRunLoopPerformBlock(Main, v3, v4);
  CFRunLoopWakeUp(Main);
}

uint64_t __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "player"), "currentItem"), "asset");
  if (v2 == result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("playable"), 0);
    if (result == 2)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isPlayable");
      if ((_DWORD)result)
      {
        objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("canPlay"));
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 1;
        return objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("canPlay"));
      }
    }
  }
  return result;
}

uint64_t __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaying:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFastReversing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFastForwarding:", 0);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "playbackDidStopForPlayerController:", *(_QWORD *)(a1 + 32));
}

- (TSKAVPlayerControllerDelegate)delegate
{
  return self->mDelegate;
}

- (AVPlayer)player
{
  return self->mPlayer;
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

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->_absoluteCurrentTime = a3;
}

@end
