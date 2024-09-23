@implementation _VUISBInstallProgressStateTransition

+ (id)newTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_classForTransitionFromState:toState:")), "_initWithFromState:toState:", a3, a4);
}

+ (Class)_classForTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (a3 == 2)
  {
    if ((unint64_t)a4 > 1)
      return 0;
  }
  else if (a3 == 1)
  {
    if (a4 && a4 != 2)
      return 0;
  }
  else if (a3 || a4 != 1 && a4 != 2)
  {
    return 0;
  }
  return (Class)objc_opt_class();
}

- (id)_initWithFromState:(int64_t)a3 toState:(int64_t)a4
{
  _VUISBInstallProgressStateTransition *v6;
  _VUISBInstallProgressStateTransition *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_VUISBInstallProgressStateTransition;
  v6 = -[_VUISBInstallProgressStateTransition init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fromState = a3;
    v6->_toState = a4;
    if (v6->_fromState >= a4)
      v8 = (_QWORD *)MEMORY[0x1E0CD3040];
    else
      v8 = (_QWORD *)MEMORY[0x1E0CD3050];
    v6->_timingFunction = (CAMediaTimingFunction *)(id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v8);
    v7->_duration = 0.5;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_VUISBInstallProgressStateTransition;
  -[_VUISBInstallProgressStateTransition dealloc](&v3, sel_dealloc);
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
  double v6;
  double duration;
  double v8;
  double v9;
  float v10;

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
  -[_VUISBInstallProgressStateTransition _updateView:](self, "_updateView:", a3);
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  self->_fraction = 1.0;
  -[_VUISBInstallProgressStateTransition _updateView:](self, "_updateView:", a3);
}

- (BOOL)isCompleteWithView:(id)a3
{
  return self->_fraction == 1.0;
}

- (void)_updateView:(id)a3
{
  objc_msgSend(a3, "setDisplayedState:", self->_toState);
  if (-[_VUISBInstallProgressStateTransition isCompleteWithView:](self, "isCompleteWithView:", a3))
  {
    if (self->_toState != 2)
      objc_msgSend(a3, "setDisplayedFraction:", 0.0);
  }
}

@end
