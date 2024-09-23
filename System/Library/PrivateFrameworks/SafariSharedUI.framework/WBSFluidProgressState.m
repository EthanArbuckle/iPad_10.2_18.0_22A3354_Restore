@implementation WBSFluidProgressState

- (WBSFluidProgressState)initWithType:(int64_t)a3
{
  WBSFluidProgressState *v4;
  WBSFluidProgressState *v5;
  WBSFluidProgressState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSFluidProgressState;
  v4 = -[WBSFluidProgressState init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_fluidProgressType = a3;
    v4->_startTimeForFluidProgress = CFAbsoluteTimeGetCurrent();
    -[WBSFluidProgressState setMinProgressPosition:](v5, "setMinProgressPosition:", 0.1);
    v5->_fluidProgressAnimationPhase = 1;
    v5->_shouldAnimateUsingInitialPosition = 1;
    v6 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t fluidProgressAnimationPhase;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase > 5)
    v3 = 0;
  else
    v3 = off_1E5443600[fluidProgressAnimationPhase];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WBSFluidProgressState;
  -[WBSFluidProgressState description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, animation phase: %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)fluidProgressAnimationPhase
{
  return self->_fluidProgressAnimationPhase;
}

- (void)setFluidProgressAnimationPhase:(int64_t)a3
{
  self->_fluidProgressAnimationPhase = a3;
}

- (void)setWebKitProgressValue:(double)a3
{
  if (self->_minProgressPosition <= a3
    && self->_webKitProgressValue != a3
    && (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFELL) != 4
    && !self->_hasCompletedLoad
    && self->_previousDestinationPosition != 0.4)
  {
    self->_fluidProgressAnimationPhase = 1;
    self->_webKitProgressValue = a3;
    self->_lastTimeProgressValueWasUpdated = CFAbsoluteTimeGetCurrent();
    -[WBSFluidProgressState _updateLinearFunction](self, "_updateLinearFunction");
  }
}

- (void)setMinProgressPosition:(double)a3
{
  double v3;
  BOOL v4;
  double v5;

  v3 = a3 / 0.4;
  v4 = a3 <= 0.4;
  v5 = 1.0;
  if (v4)
    v5 = v3;
  self->_minProgressPosition = v5;
}

- (double)minProgressPosition
{
  return self->_minProgressPosition;
}

- (void)updateFluidProgressValue
{
  int64_t fluidProgressAnimationPhase;
  objc_class *v4;
  BOOL v5;
  uint64_t v6;
  double webKitProgressValue;

  fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  v4 = 0;
  if (fluidProgressAnimationPhase
    && (fluidProgressAnimationPhase != 5 ? (v5 = !self->_hasCompletedLoad) : (v5 = 0), v5))
  {
    if (self->_fluidProgressType)
    {
      webKitProgressValue = self->_webKitProgressValue;
    }
    else
    {
      -[WBSFluidProgressState secondsElapsedSinceLoadBegan](self, "secondsElapsedSinceLoadBegan", 0.0);
      -[WBSFluidProgressState _fractionCompleteAtElapsedTime:](self, "_fractionCompleteAtElapsedTime:");
    }
    -[WBSFluidProgressState _adjustProgressPosition:](self, "_adjustProgressPosition:", webKitProgressValue);
    *(_QWORD *)&self->_fluidProgressValue = v4;
    v6 = 56;
  }
  else
  {
    v6 = 88;
  }
  *(Class *)((char *)&self->super.isa + v6) = v4;
}

- (void)updateNextFluidProgressAnimation
{
  WBSFluidProgressAnimation *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  double previousDestinationPosition;
  double v8;
  double v9;
  WBSFluidProgressAnimation *nextFluidProgressAnimation;

  v3 = objc_alloc_init(WBSFluidProgressAnimation);
  if (self->_fluidProgressType)
    goto LABEL_2;
  v6 = -[WBSFluidProgressState isFluidProgressStalled](self, "isFluidProgressStalled");
  if (self->_previousDestinationPosition > 0.37 && self->_fluidProgressAnimationPhase == 1)
  {
    self->_fluidProgressAnimationPhase = 3;
    self->_previousDestinationPosition = 0.4;
    if (v6)
      goto LABEL_18;
LABEL_2:
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_2;
  self->_fluidProgressAnimationPhase = 3;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  -[WBSFluidProgressAnimation setTimingFunction:](v3, "setTimingFunction:", v4);

  -[WBSFluidProgressState _animationDuration](self, "_animationDuration");
  -[WBSFluidProgressAnimation setAnimationDuration:](v3, "setAnimationDuration:");
  if (self->_shouldAnimateUsingInitialPosition)
    -[WBSFluidProgressState fluidProgressValue](self, "fluidProgressValue");
  else
    v5 = 0.0;
  -[WBSFluidProgressAnimation setInitialPosition:](v3, "setInitialPosition:", v5);
  -[WBSFluidProgressAnimation animationDuration](v3, "animationDuration");
  -[WBSFluidProgressState _nextProgressPosition:](self, "_nextProgressPosition:");
  -[WBSFluidProgressAnimation setDestinationPosition:](v3, "setDestinationPosition:");
  if (self->_fluidProgressType == 1)
  {
    previousDestinationPosition = self->_previousDestinationPosition;
    -[WBSFluidProgressAnimation destinationPosition](v3, "destinationPosition");
    if (previousDestinationPosition == v8)
      self->_fluidProgressAnimationPhase = 2;
  }
  -[WBSFluidProgressAnimation destinationPosition](v3, "destinationPosition");
  self->_previousDestinationPosition = v9;
  if (!self->_fluidProgressAnimationPhase)
    self->_fluidProgressAnimationPhase = 1;
  nextFluidProgressAnimation = self->_nextFluidProgressAnimation;
  self->_nextFluidProgressAnimation = v3;

}

- (BOOL)isFluidProgressStalled
{
  return (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFELL) != 4
      && CFAbsoluteTimeGetCurrent() - self->_lastTimeProgressValueWasUpdated > 1.5
      && (self->_fluidProgressAnimationPhase & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (double)secondsElapsedSinceLoadBegan
{
  return CFAbsoluteTimeGetCurrent() - self->_startTimeForFluidProgress;
}

- (double)fluidProgressValue
{
  return self->_fluidProgressValue;
}

- (WBSFluidProgressAnimation)nextFluidProgressAnimation
{
  return self->_nextFluidProgressAnimation;
}

- (int64_t)fluidProgressType
{
  return self->_fluidProgressType;
}

- (void)setFluidProgressType:(int64_t)a3
{
  self->_fluidProgressType = a3;
}

- (NSString)loadURL
{
  return self->_loadURL;
}

- (void)setLoadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)hasCompletedLoad
{
  return self->_hasCompletedLoad;
}

- (void)setHasCompletedLoad:(BOOL)a3
{
  self->_hasCompletedLoad = a3;
}

- (BOOL)hasCanceledLoad
{
  return self->_hasCanceledLoad;
}

- (void)setHasCanceledLoad:(BOOL)a3
{
  self->_hasCanceledLoad = a3;
}

- (BOOL)hasCommittedLoad
{
  return self->_hasCommittedLoad;
}

- (void)setHasCommittedLoad:(BOOL)a3
{
  self->_hasCommittedLoad = a3;
}

- (BOOL)shouldAnimateUsingInitialPosition
{
  return self->_shouldAnimateUsingInitialPosition;
}

- (void)setShouldAnimateUsingInitialPosition:(BOOL)a3
{
  self->_shouldAnimateUsingInitialPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadURL, 0);
  objc_storeStrong((id *)&self->_nextFluidProgressAnimation, 0);
}

- (double)_adjustProgressPosition:(double)minProgressPosition
{
  double v3;

  if (self->_minProgressPosition > minProgressPosition)
    minProgressPosition = self->_minProgressPosition;
  v3 = 0.4;
  if (self->_fluidProgressType == 1)
    v3 = 1.0;
  return minProgressPosition * v3;
}

- (double)_animationDuration
{
  int64_t fluidProgressAnimationPhase;

  fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase == 3)
    return 0.7;
  if (fluidProgressAnimationPhase == 4)
    return (1.0 - self->_previousDestinationPosition) * 0.2;
  return 0.2;
}

+ (double)_estimatedLoadTimeRemainingFromProgressValue:(double)a3
{
  double v3;

  v3 = 2.5;
  if (a3 <= 0.85)
  {
    v3 = 3.0;
    if (a3 <= 0.8)
    {
      v3 = 5.0;
      if (a3 <= 0.5)
        return 30.0;
    }
  }
  return v3;
}

- (double)_estimatedLoadTimeRemaining
{
  double result;

  +[WBSFluidProgressState _estimatedLoadTimeRemainingFromProgressValue:](WBSFluidProgressState, "_estimatedLoadTimeRemainingFromProgressValue:", self->_webKitProgressValue);
  return result;
}

- (double)_fractionCompleteAtElapsedTime:(double)a3
{
  double v3;
  double v4;

  v3 = 1.0;
  if (self->_fluidProgressAnimationPhase != 4)
  {
    v4 = self->_linearFunctionB + self->_linearFunctionM * a3;
    if (v4 < 0.0)
      v4 = 0.0;
    v3 = 1.0;
    if (v4 <= 1.0)
      return v4;
  }
  return v3;
}

- (double)_nextProgressPosition:(double)a3
{
  int64_t fluidProgressAnimationPhase;
  double result;
  double webKitProgressValue;
  double v8;

  fluidProgressAnimationPhase = self->_fluidProgressAnimationPhase;
  if (fluidProgressAnimationPhase == 4)
    return 1.0;
  if (fluidProgressAnimationPhase == 3)
  {
    result = self->_previousDestinationPosition + 0.02;
    if (result > 0.4)
      return 0.4;
  }
  else
  {
    if (self->_fluidProgressType)
    {
      webKitProgressValue = self->_webKitProgressValue;
    }
    else
    {
      -[WBSFluidProgressState secondsElapsedSinceLoadBegan](self, "secondsElapsedSinceLoadBegan");
      -[WBSFluidProgressState _fractionCompleteAtElapsedTime:](self, "_fractionCompleteAtElapsedTime:", v8 + a3);
    }
    -[WBSFluidProgressState _adjustProgressPosition:](self, "_adjustProgressPosition:", webKitProgressValue);
  }
  return result;
}

- (void)_updateLinearFunction
{
  double v3;
  double v4;
  double v5;
  double v6;
  double minProgressPosition;
  double v8;

  -[WBSFluidProgressState secondsElapsedSinceLoadBegan](self, "secondsElapsedSinceLoadBegan");
  v4 = v3;
  -[WBSFluidProgressState _estimatedLoadTimeRemaining](self, "_estimatedLoadTimeRemaining");
  v6 = v5;
  -[WBSFluidProgressState secondsElapsedSinceLoadBegan](self, "secondsElapsedSinceLoadBegan");
  -[WBSFluidProgressState _fractionCompleteAtElapsedTime:](self, "_fractionCompleteAtElapsedTime:");
  if (minProgressPosition < self->_minProgressPosition)
    minProgressPosition = self->_minProgressPosition;
  if (minProgressPosition < self->_previousDestinationPosition / 0.4)
    minProgressPosition = self->_previousDestinationPosition / 0.4;
  v8 = (minProgressPosition + -1.0) / (v4 - (v4 + v6));
  self->_linearFunctionM = v8;
  self->_linearFunctionB = 1.0 - v8 * (v4 + v6);
}

@end
