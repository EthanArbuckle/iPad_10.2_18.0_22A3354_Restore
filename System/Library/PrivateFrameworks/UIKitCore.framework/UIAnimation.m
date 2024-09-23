@implementation UIAnimation

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setAnimationCurve:(int)a3
{
  *(_BYTE *)&self->_animationFlags = *(_BYTE *)&self->_animationFlags & 0xF0 | a3 & 0xF;
}

- (UIAnimation)initWithTarget:(id)a3
{
  id v5;
  UIAnimation *v6;
  UIAnimation *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  UIScreen *screen;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIAnimation;
  v6 = -[UIAnimation init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_target, a3);
    -[UIAnimation target](v7, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIAnimation target](v7, "target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "screen");
      v12 = objc_claimAutoreleasedReturnValue();
      screen = v7->_screen;
      v7->_screen = (UIScreen *)v12;

    }
    -[UIScreen _displayID](v7->_screen, "_displayID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (__CFString *)v14;
    else
      v16 = CFSTR("mainDisplay");
    objc_storeStrong((id *)&v7->_screenIdentifier, v16);

  }
  return v7;
}

- (int)state
{
  return self->_state;
}

- (id)_screenIdentifier
{
  return self->_screenIdentifier;
}

- (float)fractionForTime:(double)a3
{
  double startTime;
  float result;
  BOOL v5;
  double v6;

  startTime = self->_startTime;
  if (self->_state == 1)
  {
    result = fmax((a3 - startTime) / self->_duration, 0.0);
    if (result > 1.0 || 1.0 - result < 0.00100000005)
      return 1.0;
  }
  else
  {
    v5 = startTime < a3;
    v6 = 0.0;
    if (v5)
      return 1.0;
    return v6;
  }
  return result;
}

- (id)target
{
  return self->_target;
}

- (float)progressForFraction:(float)result
{
  int v3;
  float v4;
  float v5;
  float v6;

  v3 = *(_BYTE *)&self->_animationFlags & 0xF;
  if (v3 == 2)
  {
    v5 = sin(result * 0.785398163);
    return (float)(v5 + v5) * v5;
  }
  else if (v3 == 1)
  {
    v6 = sin((1.0 - result) * 0.785398163);
    return 1.0 - (float)((float)(v6 + v6) * v6);
  }
  else if ((*(_BYTE *)&self->_animationFlags & 0xF) == 0)
  {
    v4 = sin(result * 1.57079633);
    return v4 * v4;
  }
  return result;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  self->_state = 0;
}

- (void)markStop
{
  self->_state = 0;
}

- (void)markStart:(double)a3
{
  self->_state = 1;
  self->_startTime = a3;
}

- (id)completion
{
  return _Block_copy(self->_completion);
}

- (SEL)action
{
  return self->_action;
}

- (id)_screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenIdentifier, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong(&self->_target, 0);
}

- (void)stopAnimation
{
  id v3;

  +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation:", self);

}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void)setCompletion:(id)a3
{
  void *v4;
  id completion;

  v4 = _Block_copy(a3);
  completion = self->_completion;
  self->_completion = v4;

}

@end
