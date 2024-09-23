@implementation _SBIconProgressStateTransition

+ (id)newTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_classForTransitionFromState:toState:")), "_initWithFromState:toState:", a3, a4);
}

+ (Class)_classForTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v4;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (a4 && a4 != 2)
        goto LABEL_11;
    }
    else if (a3 || a4 != 1 && a4 != 2)
    {
      goto LABEL_11;
    }
LABEL_13:
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return (Class)v4;
  }
  if ((unint64_t)a4 <= 1)
    goto LABEL_13;
LABEL_11:
  v4 = 0;
  return (Class)v4;
}

- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4
{
  _SBIconProgressStateTransition *v6;
  _SBIconProgressStateTransition *v7;
  _QWORD *v8;
  uint64_t v9;
  CAMediaTimingFunction *timingFunction;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_SBIconProgressStateTransition;
  v6 = -[_SBIconProgressStateTransition init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fromState = a3;
    v6->_toState = a4;
    if (v6->_fromState >= a4)
      v8 = (_QWORD *)MEMORY[0x1E0CD3040];
    else
      v8 = (_QWORD *)MEMORY[0x1E0CD3050];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v8);
    v9 = objc_claimAutoreleasedReturnValue();
    timingFunction = v7->_timingFunction;
    v7->_timingFunction = (CAMediaTimingFunction *)v9;

    v7->_duration = 0.5;
  }
  return v7;
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
  -[_SBIconProgressStateTransition _updateView:](self, "_updateView:", v11);

}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  -[_SBIconProgressStateTransition _updateView:](self, "_updateView:", a3);
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDisplayedState:", self->_toState);
  if (-[_SBIconProgressStateTransition isCompleteWithView:](self, "isCompleteWithView:", v4) && self->_toState != 2)
    objc_msgSend(v4, "setDisplayedFraction:", 0.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
