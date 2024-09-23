@implementation _UIPreviewInteractionStateRecognizer

- (_UIPreviewInteractionStateRecognizer)init
{
  _UIPreviewInteractionStateRecognizer *v2;
  _UIPreviewInteractionStateRecognizer *v3;
  void *v4;
  _UIPreviewInteractionStateRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  v2 = -[_UIPreviewInteractionStateRecognizer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldDelayReveal = 1;
    *(_OWORD *)&v2->_standardThreshold = xmmword_186681EE0;
    v2->_minimumPreviewDuration = 0.075;
    *(_OWORD *)&v2->_popOffsetInitial = xmmword_186681EF0;
    *(_OWORD *)&v2->_popOffsetDecayAlpha = xmmword_186681F00;
    v2->_popReductionForce = 60.0;
    v2->_popAlwaysThreshold = 5000.0;
    -[_UIPreviewInteractionStateRecognizer reset](v2, "reset");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__accessibilityForceSensitivityChanged_, CFSTR("UIAccessibilityForceTouchSensitivityChangedNotification"), 0);

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityForceTouchSensitivityChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  -[_UIPreviewInteractionStateRecognizer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewInteractionStateRecognizer;
  -[_UIPreviewInteractionStateRecognizer description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIPreviewInteractionStateRecognizer currentState](self, "currentState");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("_UILegacyPreviewInteractionStateInactive");
  else
    v6 = off_1E16DAAB8[v5 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {currentState = %@}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setShouldDelayReveal:(BOOL)a3
{
  if (self->_shouldDelayReveal != a3)
  {
    self->_shouldDelayReveal = a3;
    -[_UIPreviewInteractionStateRecognizer reset](self, "reset");
  }
}

- (double)currentProgressToState:(int64_t)a3
{
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  result = 0.0;
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 3)
    {
      return self->_progressToStrongThreshold;
    }
    else
    {
      -[_UIPreviewInteractionStateRecognizer _thresholdForForceLevel:](self, "_thresholdForForceLevel:", 0.0);
      v6 = v5;
      -[_UIPreviewInteractionStateRecognizer currentTouchForce](self, "currentTouchForce");
      v8 = v7;
      -[_UIPreviewInteractionStateRecognizer _thresholdForForceLevel:](self, "_thresholdForForceLevel:", 1);
      v10 = v6 - v9;
      result = 1.0;
      if (v10 > 0.0)
        return 1.0 - (v6 - v8) / v10;
    }
  }
  return result;
}

- (double)velocity
{
  double v2;
  double result;
  double v5;
  double v6;
  double v7;

  v2 = self->_currentTime - self->_previousTime;
  result = 0.0;
  if (v2 > 0.00000011920929)
  {
    -[_UIPreviewInteractionStateRecognizer currentTouchForce](self, "currentTouchForce", 0.0);
    v6 = v5;
    -[_UIPreviewInteractionStateRecognizer _normalizedTouchForceValue:](self, "_normalizedTouchForceValue:", self->_previousEffectiveTouchForce);
    return (v6 * 0.25 + v7 * 0.75) / v2;
  }
  return result;
}

- (void)evaluateWithTouchForce:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  double v7;
  double saturationForce;
  double timeMark;
  double currentTime;
  double v11;
  double maximumForce;
  double smoothedForce;
  double v14;
  double v15;
  float lowpassForceAlpha;
  float v17;
  double v18;
  unint64_t deepPressCount;
  double actualPeekTime;
  double v21;
  double v22;
  BOOL v23;
  int64_t v24;
  float popOffsetDecayAlpha;
  float v26;
  double v27;
  double previousPopThreshold;
  double popOffsetLongterm;
  double v30;
  double v31;
  double v32;
  double highPopThreshold;
  double v34;
  double v35;
  _UIPreviewInteractionStateRecognizer *v36;
  uint64_t v37;
  double standardThreshold;
  double v39;

  -[_UIPreviewInteractionStateRecognizer _denormalizedTouchForceValue:](self, "_denormalizedTouchForceValue:", a3, a4, a5.x, a5.y);
  if (v7 <= self->_saturationForce)
    saturationForce = v7;
  else
    saturationForce = self->_saturationForce;
  timeMark = self->_timeMark;
  if (timeMark == 0.0)
  {
    self->_timeMark = a4;
    timeMark = a4;
    currentTime = a4;
  }
  else
  {
    currentTime = self->_currentTime;
  }
  self->_currentTime = a4;
  self->_previousTime = currentTime;
  v11 = a4 - currentTime;
  smoothedForce = self->_smoothedForce;
  maximumForce = self->_maximumForce;
  if (saturationForce >= maximumForce)
    v14 = saturationForce;
  else
    v14 = self->_maximumForce;
  self->_maximumForce = v14;
  self->_previousEffectiveTouchForce = saturationForce;
  v15 = saturationForce;
  if (saturationForce > smoothedForce)
  {
    lowpassForceAlpha = self->_lowpassForceAlpha;
    v17 = v11 / 0.00800000038;
    v18 = powf(lowpassForceAlpha, v17);
    v15 = smoothedForce * v18 + saturationForce * (1.0 - v18);
  }
  self->_smoothedForce = v15;
  -[_UIPreviewInteractionStateRecognizer _normalizedTouchForceValue:](self, "_normalizedTouchForceValue:", saturationForce);
  -[_UIPreviewInteractionStateRecognizer setCurrentTouchForce:](self, "setCurrentTouchForce:");
  deepPressCount = self->_deepPressCount;
  if (deepPressCount)
  {
    actualPeekTime = self->_actualPeekTime;
    if (actualPeekTime < self->_actualPopTime)
      actualPeekTime = self->_actualPopTime;
    v21 = self->_minimumPreviewDuration + actualPeekTime;
    v22 = self->_currentTime;
    if (self->_allowsPopOffsetDecay
      || (v21 >= v22 ? (v23 = saturationForce + self->_popReductionForce < self->_maximumForce) : (v23 = 1), v23))
    {
      self->_allowsPopOffsetDecay = 1;
    }
    else
    {
      self->_popDecayingOffset = self->_popOffsetInitial;
    }
    if (v21 >= v22)
    {
      highPopThreshold = self->_highPopThreshold;
      if (self->_strongThreshold >= highPopThreshold)
        highPopThreshold = self->_strongThreshold;
    }
    else
    {
      popOffsetDecayAlpha = self->_popOffsetDecayAlpha;
      v26 = v11 / 0.00800000038;
      v27 = powf(popOffsetDecayAlpha, v26);
      previousPopThreshold = self->_previousPopThreshold;
      popOffsetLongterm = self->_popOffsetLongterm;
      v30 = self->_smoothedForce;
      v31 = self->_saturationForce + -15.0 + popOffsetLongterm * -0.5 - v30;
      if (v31 > popOffsetLongterm)
        v31 = self->_popOffsetLongterm;
      v32 = self->_popDecayingOffset * v27 + (1.0 - v27) * v31;
      self->_popDecayingOffset = v32;
      highPopThreshold = self->_strongThreshold;
      v34 = previousPopThreshold * 0.6 + (v30 + v32) * 0.4;
      if (highPopThreshold < v34)
        highPopThreshold = v34;
    }
    self->_previousPopThreshold = highPopThreshold;
    v35 = saturationForce / highPopThreshold;
    self->_progressToStrongThreshold = saturationForce / highPopThreshold;
    if (saturationForce > highPopThreshold)
    {
      self->_timeMark = v22;
      self->_deepPressCount = deepPressCount + 1;
      self->_actualPopTime = v22;
      self->_actualPopForce = saturationForce;
      if (v35 < 1.0)
        v35 = 1.0;
      self->_progressToStrongThreshold = v35;
      v36 = self;
      v37 = 3;
LABEL_37:
      -[_UIPreviewInteractionStateRecognizer setCurrentState:](v36, "setCurrentState:", v37);
    }
  }
  else
  {
    v24 = -[_UIPreviewInteractionStateRecognizer currentState](self, "currentState");
    if (a4 - timeMark >= self->_hintAndPeekInterval)
    {
      if (saturationForce - maximumForce < -self->_hintReductionForce)
      {
        self->_maximumForce = saturationForce;
        self->_timeMark = self->_currentTime;
        return;
      }
      if (!v24 && saturationForce >= self->_revealThreshold)
      {
        self->_actualHintTime = self->_currentTime;
        self->_actualHintForce = saturationForce;
        -[_UIPreviewInteractionStateRecognizer setCurrentState:](self, "setCurrentState:", 1);
      }
      standardThreshold = self->_standardThreshold;
      if (saturationForce >= standardThreshold)
      {
        v39 = self->_currentTime;
        self->_timeMark = v39;
        self->_deepPressCount = 1;
        self->_actualPeekTime = v39;
        self->_actualPeekForce = saturationForce;
        if (self->_hintAndPeekInterval <= 0.05)
          standardThreshold = saturationForce;
        self->_highPopThreshold = self->_popOffsetInitial + standardThreshold;
        v36 = self;
        v37 = 2;
        goto LABEL_37;
      }
    }
  }
}

- (void)reset
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double *v15;

  v3 = -[_UIPreviewInteractionStateRecognizer shouldDelayReveal](self, "shouldDelayReveal");
  v4 = 70.0;
  if (!v3)
    v4 = 0.0;
  v5 = 0.2;
  if (!v3)
    v5 = 0.0;
  self->_revealThreshold = v4;
  if (v3)
    v6 = 30.0;
  else
    v6 = 0.0;
  self->_hintAndPeekInterval = v5;
  self->_hintReductionForce = v6;
  -[_UIPreviewInteractionStateRecognizer setCurrentState:](self, "setCurrentState:", 0);
  -[_UIPreviewInteractionStateRecognizer setCurrentTouchForce:](self, "setCurrentTouchForce:", 0.0);
  self->_deepPressCount = 0;
  self->_smoothedForce = 0.0;
  self->_maximumForce = 0.0;
  *(_OWORD *)&self->_actualHintForce = 0u;
  *(_OWORD *)&self->_actualPopForce = 0u;
  *(_OWORD *)&self->_actualPeekTime = 0u;
  self->_popDecayingOffset = self->_popOffsetInitial;
  self->_allowsPopOffsetDecay = 0;
  self->_progressToStrongThreshold = 0.0;
  self->_currentTime = 0.0;
  self->_previousTime = 0.0;
  self->_timeMark = 0.0;
  v7 = (void *)UIApp;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_keyWindowForScreen:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "_touchesEventForWindow:", v9);

  objc_msgSend(v10, "allTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v15 = (double *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (fabs(v15[36]) >= 2.22044605e-16)
      v12 = v15[36];
    else
      v12 = 600.0;
  }
  else
  {
    v12 = 600.0;
  }
  -[_UIPreviewInteractionStateRecognizer _currentTouchForceMultiplier](self, "_currentTouchForceMultiplier");
  v14 = v12 * v13;
  if (v14 >= v12)
    v14 = v12;
  self->_saturationForce = v14;

}

- (double)_thresholdForForceLevel:(int64_t)a3
{
  double strongThreshold;
  double result;

  switch(a3)
  {
    case 3:
      strongThreshold = self->_strongThreshold;
LABEL_6:
      -[_UIPreviewInteractionStateRecognizer _normalizedTouchForceValue:](self, "_normalizedTouchForceValue:", strongThreshold);
      return result;
    case 2:
      strongThreshold = self->_actualPeekForce;
      if (strongThreshold <= 0.0)
        strongThreshold = self->_standardThreshold;
      goto LABEL_6;
    case 1:
      strongThreshold = self->_actualHintForce;
      if (strongThreshold <= 0.0)
        strongThreshold = self->_revealThreshold;
      goto LABEL_6;
  }
  return 0.0;
}

- (double)_denormalizedTouchForceValue:(double)a3
{
  double v4;

  -[_UIPreviewInteractionStateRecognizer _currentTouchForceMultiplier](self, "_currentTouchForceMultiplier");
  return a3 * 60.0 * v4;
}

- (double)_normalizedTouchForceValue:(double)a3
{
  double v4;

  -[_UIPreviewInteractionStateRecognizer _currentTouchForceMultiplier](self, "_currentTouchForceMultiplier");
  return v4 * a3 / 60.0;
}

- (double)_currentTouchForceMultiplier
{
  float v2;

  _AXSForceTouchSensitivity();
  return v2;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (double)minimumPreviewDuration
{
  return self->_minimumPreviewDuration;
}

- (void)setMinimumPreviewDuration:(double)a3
{
  self->_minimumPreviewDuration = a3;
}

- (BOOL)shouldDelayReveal
{
  return self->_shouldDelayReveal;
}

- (double)currentTouchForce
{
  return self->_currentTouchForce;
}

- (void)setCurrentTouchForce:(double)a3
{
  self->_currentTouchForce = a3;
}

@end
