@implementation PUTimedAnimationGroup

- (PUTimedAnimationGroup)init
{
  PUTimedAnimationGroup *v2;
  PUTimedAnimationGroup *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUTimedAnimationGroup;
  v2 = -[PUTimedAnimationGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUTimedAnimationGroup currentTime](v2, "currentTime");
    v3->_beginTime = v4;
  }
  return v3;
}

- (double)elapsedTime
{
  double v4;
  double v5;
  double v6;

  if (-[PUAnimationGroup isPaused](self, "isPaused"))
    return self->_pausedElapsedTime;
  -[PUTimedAnimationGroup currentTime](self, "currentTime");
  v5 = v4;
  -[PUTimedAnimationGroup beginTime](self, "beginTime");
  return v5 - v6;
}

- (void)setElapsedTime:(double)a3
{
  void *v6;

  if (!-[PUAnimationGroup isPaused](self, "isPaused"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTimedAnimationGroup.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isPaused]"));

  }
  if (self->_pausedElapsedTime != a3)
  {
    self->_pausedElapsedTime = a3;
    -[PUTimedAnimationGroup _update](self, "_update");
  }
}

- (void)pauseAnimations
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUTimedAnimationGroup;
  -[PUAnimationGroup pauseAnimations](&v6, sel_pauseAnimations);
  -[PUTimedAnimationGroup currentTime](self, "currentTime");
  v4 = v3;
  -[PUTimedAnimationGroup beginTime](self, "beginTime");
  self->_pausedElapsedTime = v4 - v5;
  -[PUTimedAnimationGroup _update](self, "_update");
}

- (void)resumeAnimations
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTimedAnimationGroup;
  -[PUAnimationGroup resumeAnimations](&v4, sel_resumeAnimations);
  -[PUTimedAnimationGroup currentTime](self, "currentTime");
  self->_beginTime = v3 - self->_pausedElapsedTime;
  -[PUTimedAnimationGroup _update](self, "_update");
}

- (double)currentTime
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)_update
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[PUAnimationGroup isPaused](self, "isPaused");
  v4 = v3;
  if (self->_areAnimationsPaused != v3 || -[PUAnimationGroup isPaused](self, "isPaused"))
  {
    self->_areAnimationsPaused = v4;
    -[PUTimedAnimationGroup updateAnimations](self, "updateAnimations");
    -[PUAnimationGroup completeIfNeeded](self, "completeIfNeeded");
  }
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

@end
