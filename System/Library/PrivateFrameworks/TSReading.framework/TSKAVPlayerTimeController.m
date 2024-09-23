@implementation TSKAVPlayerTimeController

- (TSKAVPlayerTimeController)initWithPlayerController:(id)a3
{
  void *v5;
  uint64_t v6;
  TSKAVPlayerTimeController *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController initWithPlayerController:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 40, CFSTR("Invalid parameter not satisfying: %s"), "playerController != nil");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSKAVPlayerTimeController;
  v7 = -[TSKAVPlayerTimeController init](&v9, sel_init);
  if (v7)
  {
    v7->mPlayerController = (TSKAVPlayerController *)a3;
    -[TSKAVPlayerTimeController setUpdateInterval:](v7, "setUpdateInterval:", 1.0);
    -[TSKAVPlayerController addObserver:forKeyPath:options:context:](v7->mPlayerController, "addObserver:forKeyPath:options:context:", v7, CFSTR("player.currentItem.status"), 4, TSKAVPlayerTimeControllerPlayerItemStatusObserverContext);
    v7->mObservingPlayerStatus = 1;
  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->mObservingPlayerStatus)
    -[TSKAVPlayerController removeObserver:forKeyPath:context:](self->mPlayerController, "removeObserver:forKeyPath:context:", self, CFSTR("player.currentItem.status"), TSKAVPlayerTimeControllerPlayerItemStatusObserverContext);
  if (self->mTimeObserver)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 56, CFSTR("expected nil value for '%s'"), "mTimeObserver");
  }

  v5.receiver = self;
  v5.super_class = (Class)TSKAVPlayerTimeController;
  -[TSKAVPlayerTimeController dealloc](&v5, sel_dealloc);
}

- (void)startObservingTime
{
  void *v3;
  uint64_t v4;

  if (self->mTimeObserver)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController startObservingTime]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 67, CFSTR("expected nil value for '%s'"), "mTimeObserver");
  }
  -[TSKAVPlayerTimeController p_createTimeObserver](self, "p_createTimeObserver");
  -[TSKAVPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
}

- (void)stopObservingTime
{
  -[TSKAVPlayerTimeController p_teardownTimeObserver](self, "p_teardownTimeObserver");
  -[TSKAVPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
}

- (void)p_createTimeObserver
{
  void *v3;
  uint64_t v4;
  AVPlayer *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  CMTime v10;

  if (self->mTimeObserver)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController p_createTimeObserver]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 84, CFSTR("expected nil value for '%s'"), "mTimeObserver");
  }
  v5 = -[TSKAVPlayerController player](-[TSKAVPlayerTimeController playerController](self, "playerController"), "player");
  CMTimeMakeWithSeconds(&v10, self->mUpdateInterval, 90000);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TSKAVPlayerTimeController_p_createTimeObserver__block_invoke;
  v9[3] = &unk_24D82AB98;
  v9[4] = self;
  v6 = -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v5, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v10, MEMORY[0x24BDAC9B8], v9);
  self->mTimeObserver = v6;
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController p_createTimeObserver]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 90, CFSTR("invalid nil value for '%s'"), "mTimeObserver");
  }
}

uint64_t __49__TSKAVPlayerTimeController_p_createTimeObserver__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_setTimeValuesWithoutScrubbing");
}

- (void)p_teardownTimeObserver
{
  void *v3;
  uint64_t v4;

  if (self->mTimeObserver
    || (v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAVPlayerTimeController p_teardownTimeObserver]"), objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 95, CFSTR("invalid nil value for '%s'"), "mTimeObserver"), self->mTimeObserver))
  {
    -[AVPlayer removeTimeObserver:](-[TSKAVPlayerController player](-[TSKAVPlayerTimeController playerController](self, "playerController"), "player"), "removeTimeObserver:", self->mTimeObserver);

    self->mTimeObserver = 0;
  }
}

- (void)p_setTimeValuesWithoutScrubbing
{
  double v3;
  double v4;
  double v5;

  -[TSKAVPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("absoluteCurrentTime"));
  -[TSKAVPlayerController absoluteCurrentTime](-[TSKAVPlayerTimeController playerController](self, "playerController"), "absoluteCurrentTime");
  self->mAbsoluteCurrentTime = v3;
  -[TSKAVPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("absoluteCurrentTime"));
  -[TSKAVPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentTime"));
  -[TSKAVPlayerController currentTime](-[TSKAVPlayerTimeController playerController](self, "playerController"), "currentTime");
  self->mCurrentTime = v4;
  -[TSKAVPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentTime"));
  -[TSKAVPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remainingTime"));
  -[TSKAVPlayerController remainingTime](-[TSKAVPlayerTimeController playerController](self, "playerController"), "remainingTime");
  self->mRemainingTime = v5;
  -[TSKAVPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remainingTime"));
}

- (void)setUpdateInterval:(double)a3
{
  if (self->mUpdateInterval != a3)
  {
    if (a3 < 0.0166666675)
      a3 = 0.0166666675;
    self->mUpdateInterval = a3;
    if (self->mTimeObserver)
    {
      -[TSKAVPlayerTimeController p_teardownTimeObserver](self, "p_teardownTimeObserver");
      -[TSKAVPlayerTimeController p_createTimeObserver](self, "p_createTimeObserver");
      -[TSKAVPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
    }
  }
}

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->mAbsoluteCurrentTime = a3;
  -[TSKAVPlayerTimeController p_beginScrubbingIfNeeded](self, "p_beginScrubbingIfNeeded");
  -[TSKAVPlayerController scrubToTime:withTolerance:](self->mPlayerController, "scrubToTime:withTolerance:", self->mAbsoluteCurrentTime, self->mUpdateInterval);
}

- (void)setCurrentTime:(double)a3
{
  double mUpdateInterval;
  double v6;

  self->mCurrentTime = a3;
  -[TSKAVPlayerTimeController p_beginScrubbingIfNeeded](self, "p_beginScrubbingIfNeeded");
  mUpdateInterval = self->mUpdateInterval;
  -[TSKAVPlayerController startTime](self->mPlayerController, "startTime");
  -[TSKAVPlayerController scrubToTime:withTolerance:](self->mPlayerController, "scrubToTime:withTolerance:", v6 + a3, mUpdateInterval);
}

- (void)p_beginScrubbingIfNeeded
{
  TSKAVPlayerController *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSKAVPlayerTimeController playerController](self, "playerController");
  if (!-[TSKAVPlayerController isScrubbing](v3, "isScrubbing"))
  {
    -[TSKAVPlayerController beginScrubbing](v3, "beginScrubbing");
    v4[0] = *MEMORY[0x24BDBCA90];
    -[TSKAVPlayerTimeController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_p_endScrubbing, 0, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1), 0.0);
  }
}

- (void)p_endScrubbing
{
  -[TSKAVPlayerController endScrubbing](self->mPlayerController, "endScrubbing");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)TSKAVPlayerTimeControllerPlayerItemStatusObserverContext == a6)
  {
    if (-[AVPlayerItem status](-[AVPlayer currentItem](-[TSKAVPlayerController player](-[TSKAVPlayerTimeController playerController](self, "playerController", a3, a4, a5), "player"), "currentItem"), "status") == AVPlayerItemStatusReadyToPlay)-[TSKAVPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSKAVPlayerTimeController;
    -[TSKAVPlayerTimeController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (double)absoluteCurrentTime
{
  return self->mAbsoluteCurrentTime;
}

- (double)currentTime
{
  return self->mCurrentTime;
}

- (double)remainingTime
{
  return self->mRemainingTime;
}

- (double)updateInterval
{
  return self->mUpdateInterval;
}

- (TSKAVPlayerController)playerController
{
  return self->mPlayerController;
}

@end
