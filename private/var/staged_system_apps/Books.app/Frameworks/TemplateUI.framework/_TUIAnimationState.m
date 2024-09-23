@implementation _TUIAnimationState

+ (id)currentState
{
  id v2;

  os_unfair_lock_lock_with_options(&unk_2CB588, 0x10000);
  v2 = (id)qword_2CB578;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB588);
  return v2;
}

+ (void)pushState:(id)a3
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;

  v3 = a3;
  os_unfair_lock_lock_with_options(&unk_2CB588, 0x10000);
  if (qword_2CB578)
  {
    v4 = (void *)qword_2CB580;
    if (!qword_2CB580)
    {
      v5 = objc_opt_new(NSMutableArray);
      v6 = (void *)qword_2CB580;
      qword_2CB580 = (uint64_t)v5;

      v4 = (void *)qword_2CB580;
    }
    objc_msgSend(v4, "addObject:");
  }
  v7 = (void *)qword_2CB578;
  qword_2CB578 = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB588);
}

+ (void)popState
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  os_unfair_lock_lock_with_options(&unk_2CB588, 0x10000);
  if (!objc_msgSend((id)qword_2CB580, "count"))
  {
    v2 = &qword_2CB578;
LABEL_5:
    v5 = (void *)*v2;
    *v2 = 0;

    goto LABEL_6;
  }
  v2 = &qword_2CB580;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB580, "lastObject"));
  v4 = (void *)qword_2CB578;
  qword_2CB578 = v3;

  objc_msgSend((id)qword_2CB580, "removeLastObject");
  if (!objc_msgSend((id)qword_2CB580, "count"))
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB588);
}

- (_TUIAnimationState)initWithDuration:(double)a3 timingParameters:(id)a4
{
  id v7;
  _TUIAnimationState *v8;
  objc_super v10;

  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_TUIAnimationState;
  v8 = -[_TUIAnimationState init](&v10, "init");
  if (v8)
  {
    v8->_duration = UIAnimationDragCoefficient() * a3;
    objc_storeStrong((id *)&v8->_timingParameters, a4);
  }

  return v8;
}

- (id)animationForKeyPath:(id)a3
{
  UITimingCurveProvider *timingParameters;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  timingParameters = self->_timingParameters;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITimingCurveProvider springTimingParameters](timingParameters, "springTimingParameters"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", v5));

    objc_msgSend(v6, "mass");
    objc_msgSend(v7, "setMass:");
    objc_msgSend(v6, "stiffness");
    objc_msgSend(v7, "setStiffness:");
    objc_msgSend(v6, "damping");
    objc_msgSend(v7, "setDamping:");
    objc_msgSend(v7, "setDuration:", self->_duration);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
    objc_msgSend(v7, "setTimingFunction:", v8);

    objc_msgSend(v6, "initialVelocity");
    objc_msgSend(v7, "setInitialVelocity:");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v5));

    objc_msgSend(v7, "setDuration:", self->_duration);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v7, "setTimingFunction:", v9);

  }
  return v7;
}

- (id)customAnimationForContentOffset
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITimingCurveProvider springTimingParameters](self->_timingParameters, "springTimingParameters"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("bounds.origin")));
    objc_msgSend(v3, "mass");
    objc_msgSend(v4, "setMass:");
    objc_msgSend(v3, "stiffness");
    objc_msgSend(v4, "setStiffness:");
    objc_msgSend(v3, "damping");
    objc_msgSend(v4, "setDamping:");
    objc_msgSend(v4, "setDuration:", self->_duration);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
    objc_msgSend(v4, "setTimingFunction:", v5);

    objc_msgSend(v3, "initialVelocity");
    objc_msgSend(v4, "setInitialVelocity:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)animationForLayer:(id)a3 forKey:(id)a4
{
  void *v4;

  if (qword_2CB578)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB578, "animationForKeyPath:", a4));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", a3, a4));
  return v4;
}

- (BOOL)shouldCaptureCALayerAnimations
{
  if (self->_duration <= 0.0)
    return 0;
  else
    return +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
}

- (double)duration
{
  return self->_duration;
}

- (UITimingCurveProvider)timingParameters
{
  return self->_timingParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingParameters, 0);
}

@end
