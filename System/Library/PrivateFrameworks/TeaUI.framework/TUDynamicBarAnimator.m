@implementation TUDynamicBarAnimator

- (int64_t)state
{
  return self->_state;
}

- (void)setTopBarHeight:(double)a3 forState:(int64_t)a4
{
  if (self->_topBarHeightForState[a4] != a3)
  {
    self->_topBarHeightForState[a4] = a3;
    if (self->_state == a4)
    {
      self->_targetTopBarHeight = a3;
      self->_unroundedTopBarHeight = a3;
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TUDynamicBarAnimator)init
{
  TUDynamicBarAnimator *v2;
  TUDynamicBarAnimator *v3;
  TUDynamicBarAnimator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUDynamicBarAnimator;
  v2 = -[TUDynamicBarAnimator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    v2->_inSteadyState = 1;
    v4 = v2;
  }

  return v3;
}

- (void)attemptTransitionToState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[TUDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:"))
  {
    self->_didHideOrShowBarsExplicitly = 1;
    self->_targetTopBarHeight = self->_topBarHeightForState[a3];
    if (!v4 || (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled") & 1) == 0)
      self->_unroundedTopBarHeight = self->_topBarHeightForState[a3];
    -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (BOOL)canTransitionToState:(int64_t)a3
{
  double *v3;
  double v4;

  v3 = (double *)(&self->super.isa + a3);
  -[TUDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", v3[1]);
  return v4 == v3[1];
}

- (void)_updateOutputs
{
  double v3;
  double v4;
  float unroundedTopBarHeight;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL8 v12;
  int64_t v13;
  id WeakRetained;

  -[TUDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_unroundedTopBarHeight);
  self->_unroundedTopBarHeight = v3;
  -[TUDynamicBarAnimator _constrainTopBarHeight:](self, "_constrainTopBarHeight:", self->_targetTopBarHeight);
  self->_targetTopBarHeight = v4;
  if (!self->_dragging && v4 != self->_topBarHeightForState[0])
    self->_targetTopBarHeight = self->_topBarHeightForState[1];
  -[TUDynamicBarAnimator _updateDisplayLink](self, "_updateDisplayLink");
  unroundedTopBarHeight = self->_unroundedTopBarHeight;
  v6 = (double)(uint64_t)llroundf(unroundedTopBarHeight);
  -[TUDynamicBarAnimator _bottomBarOffsetForTopBarHeight:](self, "_bottomBarOffsetForTopBarHeight:");
  *(float *)&v7 = v7;
  v8 = (double)(uint64_t)llroundf(*(float *)&v7);
  v9 = vabdd_f64(v8, self->_bottomBarOffsetForState[0]) < 0.001 && vabdd_f64(v6, self->_topBarHeightForState[0]) < 0.001;
  v10 = vabdd_f64(v8, self->_bottomBarOffsetForState[1]) < 0.001
     && vabdd_f64(v6, self->_topBarHeightForState[1]) < 0.001;
  v11 = v9 || v10;
  v12 = (v9 || v10) && self->_displayLink == 0;
  -[TUDynamicBarAnimator _setInSteadyState:](self, "_setInSteadyState:", v12);
  v13 = !v9;
  if (self->_topBarHeight != v6 || self->_bottomBarOffset != v8 || self->_state != v13)
  {
    self->_state = v13;
    self->_topBarHeight = v6;
    self->_bottomBarOffset = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dynamicBarAnimatorOutputsDidChange:", self);

    if (!v11 && !self->_dragging && !self->_displayLink)
      -[TUDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
  }
}

- (double)_constrainTopBarHeight:(double)a3
{
  return fmin(fmax(a3, self->_topBarHeightForState[0]), self->_topBarHeightForState[1]);
}

- (void)_updateDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *v4;
  double topBarHeight;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;

  if (vabdd_f64(self->_topBarHeight, self->_targetTopBarHeight) >= 0.1
    || vabdd_f64(self->_lastUnroundedTopBarHeight, self->_unroundedTopBarHeight) >= 10.0)
  {
    if (!self->_displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v6;

      v8 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

      self->_lastUnroundedTopBarHeight = self->_unroundedTopBarHeight;
    }
  }
  else
  {
    v3 = self->_displayLink;
    if (v3)
    {
      -[CADisplayLink invalidate](v3, "invalidate");
      v4 = self->_displayLink;
      self->_displayLink = 0;

      topBarHeight = self->_topBarHeight;
      self->_targetTopBarHeight = topBarHeight;
      self->_unroundedTopBarHeight = topBarHeight;
      self->_lastUnroundedTopBarHeight = topBarHeight;
      -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
    }
  }
}

- (void)_setInSteadyState:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  id v6;

  if (((!self->_inSteadyState ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_inSteadyState = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = WeakRetained;
    if (v3)
      objc_msgSend(WeakRetained, "dynamicBarAnimatorWillEnterSteadyState:", self);
    else
      objc_msgSend(WeakRetained, "dynamicBarAnimatorWillLeaveSteadyState:", self);

  }
}

- (double)_bottomBarOffsetForTopBarHeight:(double)a3
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;

  v3 = self->_topBarHeightForState[0];
  v4 = a3 - v3;
  v5 = self->_topBarHeightForState[1] - v3;
  v6 = v5 == 0.0 && v4 == 0.0;
  v7 = v4 / v5;
  if (v6)
    v7 = 1.0;
  return self->_bottomBarOffsetForState[1] * v7 + (1.0 - v7) * self->_bottomBarOffsetForState[0];
}

- (void)_moveBarsWithDelta:(double)a3
{
  double unroundedTopBarHeight;
  double v6;
  double v7;
  double v8;

  unroundedTopBarHeight = self->_unroundedTopBarHeight;
  v6 = self->_targetTopBarHeight - a3;
  self->_targetTopBarHeight = v6;
  v7 = self->_topBarHeightForState[1] - self->_topBarHeightForState[0];
  v8 = vabdd_f64(unroundedTopBarHeight, v6);
  self->_unroundedTopBarHeight = unroundedTopBarHeight - exp(-(v8 * 3.0 / v7 * (v8 * 3.0 / v7))) * a3;
  -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)_transitionToSteadyState
{
  BOOL v3;
  uint64_t v4;

  if (self->_topBarHeight >= self->_topBarHeightForState[1] * 0.9
    || (v3 = -[TUDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0), v4 = 0, !v3))
  {
    v4 = 1;
  }
  -[TUDynamicBarAnimator attemptTransitionToState:animated:](self, "attemptTransitionToState:animated:", v4, 1);
}

- (int64_t)targetState
{
  return self->_targetTopBarHeight != self->_topBarHeightForState[0];
}

- (void)_displayLinkFired:(id)a3
{
  double unroundedTopBarHeight;
  double v5;

  objc_msgSend(a3, "duration");
  unroundedTopBarHeight = self->_unroundedTopBarHeight;
  self->_unroundedTopBarHeight = unroundedTopBarHeight
                               - ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5
                                + ((self->_lastUnroundedTopBarHeight - unroundedTopBarHeight) / v5 * -50.0
                                 + (unroundedTopBarHeight - self->_targetTopBarHeight) * 900.0)
                                * v5)
                               * v5;
  self->_lastUnroundedTopBarHeight = unroundedTopBarHeight;
  -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
}

- (void)beginScrollingWithOffset:(double)a3
{
  self->_dragging = 1;
  *(_WORD *)&self->_didHideBarsByMoving = 0;
  self->_lastOffset = a3;
}

- (void)updateScrollingWithOffset:(double)a3
{
  double v5;
  double v6;
  id WeakRetained;
  int v8;

  if (!self->_didHideOrShowBarsExplicitly)
  {
    v5 = a3 - self->_lastOffset;
    v6 = fmax(self->_topBarHeight - self->_topBarHeightForState[0] - v5, 0.0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "dynamicBarAnimator:canHideBarsByDraggingWithOffset:", self, v6);

    if (v8)
    {
      -[TUDynamicBarAnimator _moveBarsWithDelta:](self, "_moveBarsWithDelta:", v5);
      if (!self->_state)
        self->_didHideBarsByMoving = 1;
    }
  }
  self->_lastOffset = a3;
}

- (void)endScrollingWithTargetOffset:(double)a3 velocity:(double)a4
{
  TUDynamicBarAnimator *v5;
  uint64_t v6;

  self->_dragging = 0;
  if (self->_didHideOrShowBarsExplicitly)
  {
    if (!-[TUDynamicBarAnimator targetState](self, "targetState", a3, a4)
      && -[TUDynamicBarAnimator canTransitionToState:](self, "canTransitionToState:", 0))
    {
      v5 = self;
      v6 = 0;
LABEL_7:
      -[TUDynamicBarAnimator attemptTransitionToState:animated:](v5, "attemptTransitionToState:animated:", v6, 1);
      return;
    }
LABEL_6:
    v5 = self;
    v6 = 1;
    goto LABEL_7;
  }
  if (a4 < -250.0)
    goto LABEL_6;
  -[TUDynamicBarAnimator _transitionToSteadyState](self, "_transitionToSteadyState");
}

- (double)maximumTopBarHeight
{
  return self->_topBarHeightForState[1];
}

- (double)minimumTopBarHeight
{
  return self->_topBarHeightForState[0];
}

- (double)minimumBottomBarOffset
{
  return self->_bottomBarOffsetForState[0];
}

- (void)setBottomBarOffset:(double)a3 forState:(int64_t)a4
{
  if (self->_bottomBarOffsetForState[a4] != a3)
  {
    self->_bottomBarOffsetForState[a4] = a3;
    if (self->_state == a4)
      -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (void)setMaximumBottomBarOffset:(double)a3
{
  if (self->_maximumBottomBarOffset != a3)
  {
    self->_maximumBottomBarOffset = a3;
    -[TUDynamicBarAnimator _updateOutputs](self, "_updateOutputs");
  }
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (void)setMinimumTopBarHeight:(double)a3
{
  self->_minimumTopBarHeight = a3;
}

- (double)maximumBottomBarOffset
{
  return self->_maximumBottomBarOffset;
}

- (TUDynamicBarAnimatorDelegate)delegate
{
  return (TUDynamicBarAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
