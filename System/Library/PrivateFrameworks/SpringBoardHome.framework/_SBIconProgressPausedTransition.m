@implementation _SBIconProgressPausedTransition

+ (id)newTransitionToPaused:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initToPaused:", a3);
}

- (id)_initToPaused:(BOOL)a3
{
  _SBIconProgressPausedTransition *v4;
  _SBIconProgressPausedTransition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SBIconProgressPausedTransition;
  v4 = -[_SBIconProgressPausedTransition init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_toPaused = a3;
    v4->_duration = 0.5;
    -[_SBIconProgressPausedTransition _updateTimingFunction](v4, "_updateTimingFunction");
  }
  return v5;
}

- (void)updateToPaused:(BOOL)a3
{
  if (self->_toPaused != a3)
  {
    self->_toPaused = a3;
    self->_fraction = 1.0 - self->_fraction;
    -[_SBIconProgressPausedTransition _updateTimingFunction](self, "_updateTimingFunction");
    -[_SBIconProgressPausedTransition _updateElapsedTimeFromFraction](self, "_updateElapsedTimeFromFraction");
  }
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
  double v6;
  double duration;
  double v8;
  double v9;
  float v10;
  id v11;

  v11 = a3;
  v6 = self->_totalElapsedTime + a4;
  self->_totalElapsedTime = v6;
  duration = self->_duration;
  v8 = 1.0;
  if (v6 < duration)
  {
    v9 = v6 / duration;
    *(float *)&v9 = v9;
    -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v9, 1.0);
    v8 = v10;
  }
  self->_fraction = v8;
  -[_SBIconProgressPausedTransition _updateView:](self, "_updateView:", v11);

}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  -[_SBIconProgressPausedTransition _updateView:](self, "_updateView:", a3);
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  id v4;
  double fraction;
  id v6;

  v4 = a3;
  v6 = v4;
  fraction = self->_fraction;
  if (!self->_toPaused)
    fraction = 1.0 - fraction;
  objc_msgSend(v4, "setPauseRadiusFraction:", fraction);
  if (-[_SBIconProgressPausedTransition isCompleteWithView:](self, "isCompleteWithView:", v6))
    objc_msgSend(v6, "setDisplayingPaused:", self->_toPaused);
  objc_msgSend(v6, "circleBoundingRect");
  objc_msgSend(v6, "setNeedsDisplayInRect:");

}

- (void)_updateTimingFunction
{
  _QWORD *v3;
  CAMediaTimingFunction *v4;
  CAMediaTimingFunction *timingFunction;

  if (self->_toPaused)
    v3 = (_QWORD *)MEMORY[0x1E0CD3050];
  else
    v3 = (_QWORD *)MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v3);
  v4 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  timingFunction = self->_timingFunction;
  self->_timingFunction = v4;

}

- (void)_updateElapsedTimeFromFraction
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double fraction;

  v3 = 1.0;
  v4 = 0.0;
  while (1)
  {
    v5 = v3 + v4;
    v6 = (v3 + v4) * 0.5;
    *(float *)&v5 = v6;
    -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v5);
    v8 = v7;
    fraction = self->_fraction;
    if (vabdd_f64(v8, fraction) < 0.01)
      break;
    if (fraction > v8)
      v4 = (v3 + v4) * 0.5;
    else
      v3 = (v3 + v4) * 0.5;
    if (v3 - v4 <= 0.01)
    {
      v6 = 0.0;
      break;
    }
  }
  self->_totalElapsedTime = v6 * self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
