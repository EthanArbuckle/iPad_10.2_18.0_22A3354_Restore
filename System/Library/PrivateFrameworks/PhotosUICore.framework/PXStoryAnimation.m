@implementation PXStoryAnimation

- (PXStoryAnimation)initWithIdentifier:(id)a3
{
  void *v3;
  id v5;
  PXStoryAnimation *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  PXUpdater *updater;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryAnimation;
  v6 = -[PXStoryAnimation init](&v16, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v6->_identifier, v8);
    if (!v7)
    {

    }
    *(_QWORD *)&v6->_elapsedTime.timescale = 0;
    v6->_elapsedTime.epoch = 0;
    v6->_elapsedTime.value = 0;
    *(_QWORD *)&v6->_lastElapsedTime.timescale = 0;
    v6->_lastElapsedTime.epoch = 0;
    v6->_lastElapsedTime.value = 0;
    *(_QWORD *)&v6->_time.timescale = 0;
    v6->_time.epoch = 0;
    v6->_time.value = 0;
    v6->_velocity = 1.0;
    v6->_canBePaused = 1;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "movementAnimationPauseDeceleration");
    v6->_pauseDeceleration = v10;
    objc_msgSend(v9, "movementAnimationPausedVelocity");
    v6->_pausedVelocity = v11;
    objc_msgSend(v9, "movementAnimationResumeAcceleration");
    v6->_resumeAcceleration = v12;
    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v6, sel__setNeedsUpdate);
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateTime);
  }

  return v6;
}

- (PXStoryAnimation)init
{
  return -[PXStoryAnimation initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryAnimation;
  -[PXStoryAnimation performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryAnimation;
  -[PXStoryAnimation didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryAnimation updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setElapsedTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_elapsedTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 elapsedTime;
  CMTime time1;

  p_elapsedTime = &self->_elapsedTime;
  time1 = *(CMTime *)a3;
  elapsedTime = self->_elapsedTime;
  if (CMTimeCompare(&time1, (CMTime *)&elapsedTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_elapsedTime->epoch = a3->var3;
    *(_OWORD *)&p_elapsedTime->value = v6;
    -[PXStoryAnimation _invalidateTime](self, "_invalidateTime");
  }
}

- (void)setIsPaused:(BOOL)a3
{
  if (self->_isPaused != a3)
  {
    self->_isPaused = a3;
    -[PXStoryAnimation _invalidateTime](self, "_invalidateTime");
  }
}

- (void)setTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_time;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 time;
  CMTime time1;

  p_time = &self->_time;
  time1 = *(CMTime *)a3;
  time = self->_time;
  if (CMTimeCompare(&time1, (CMTime *)&time))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_time->epoch = a3->var3;
    *(_OWORD *)&p_time->value = v6;
    -[PXStoryAnimation signalChange:](self, "signalChange:", 1);
    -[PXStoryAnimation timeDidChange](self, "timeDidChange");
  }
}

- (void)stop
{
  -[PXStoryAnimation setIsStopped:](self, "setIsStopped:", 1);
}

- (void)setIsStopped:(BOOL)a3
{
  if (self->_isStopped != a3)
  {
    self->_isStopped = a3;
    -[PXStoryAnimation signalChange:](self, "signalChange:", 2);
    if (self->_isStopped)
      -[PXStoryAnimation wasStopped](self, "wasStopped");
  }
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  Float64 Seconds;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  CMTime v12;
  CMTime time;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAnimation time](self, "time");
  time = v12;
  Seconds = CMTimeGetSeconds(&time);
  v7 = -[PXStoryAnimation isStopped](self, "isStopped");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = v8;
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; t=%0.1f, stopped = %@>"),
                  v5,
                  self,
                  *(_QWORD *)&Seconds,
                  v9);

  return v10;
}

- (NSString)shortDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CMTime v9;
  CMTime time;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "px_removePrefix:", CFSTR("PXStory"));
  objc_msgSend(v5, "px_removeSuffix:", CFSTR("Animation"));
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PXStoryAnimation time](self, "time");
  time = v9;
  v7 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@: %0.1fs"), v5, CMTimeGetSeconds(&time));

  return (NSString *)v7;
}

- (void)_setNeedsUpdate
{
  -[PXStoryAnimation signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateTime
{
  id v2;

  -[PXStoryAnimation updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTime);

}

- (void)_updateTime
{
  -[PXStoryAnimation elapsedTime](self, "elapsedTime");
}

- (NSString)identifier
{
  return self->_identifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastElapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setLastElapsedTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_lastElapsedTime.value = *(_OWORD *)&a3->var0;
  self->_lastElapsedTime.epoch = var3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (BOOL)canBePaused
{
  return self->_canBePaused;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (double)pauseDeceleration
{
  return self->_pauseDeceleration;
}

- (void)setPauseDeceleration:(double)a3
{
  self->_pauseDeceleration = a3;
}

- (double)pausedVelocity
{
  return self->_pausedVelocity;
}

- (void)setPausedVelocity:(double)a3
{
  self->_pausedVelocity = a3;
}

- (double)resumeAcceleration
{
  return self->_resumeAcceleration;
}

- (void)setResumeAcceleration:(double)a3
{
  self->_resumeAcceleration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
