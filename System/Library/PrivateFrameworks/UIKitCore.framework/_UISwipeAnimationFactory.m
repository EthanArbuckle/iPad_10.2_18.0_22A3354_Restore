@implementation _UISwipeAnimationFactory

+ (id)animatorForMoveWithOccurrence:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 2 || (objc_msgSend(v4, "offset"), fabs(v5) <= 0.00000011920929))
  {
    objc_msgSend(v4, "velocity");
    v7 = v8;
    v6 = 1.0;
  }
  else
  {
    v6 = 2.0;
    v7 = 0.0;
  }
  objc_msgSend(a1, "_animatorForStiffnessFactor:initialVelocity:", v6, v7, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)animatorForTentativeWithOccurrence:(id)a3
{
  return (id)objc_msgSend(a1, "animatorForTentativeWithOccurrence:additivelyAnimatedViews:", a3, 0);
}

+ (id)animatorForTentativeWithOccurrence:(id)a3 additivelyAnimatedViews:(id)a4
{
  id v6;
  double v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "velocity");
  objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 0, 0.4, v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addViewsToAnimateAdditively:", v6);

  return v8;
}

+ (id)animatorForCollapse
{
  return (id)objc_msgSend(a1, "animatorForCollapseWithAdditivelyAnimatedViews:", 0);
}

+ (id)animatorForCollapseWithAdditivelyAnimatedViews:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 0, 0.4, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addViewsToAnimateAdditively:", v4);

  return v5;
}

+ (id)animatorForScanlineCollapse
{
  return (id)objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 1, 0.4, 0.0, 0.0);
}

+ (id)animatorForGenericUpdates
{
  UICubicTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 0);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.3);

  return v3;
}

+ (id)_animatorForStiffnessFactor:(double)a3 initialVelocity:(CGVector)a4
{
  double dy;
  double dx;
  UISpringTimingParameters *v7;
  double v8;
  double v9;
  double v10;
  UISpringTimingParameters *v11;
  UIViewPropertyAnimator *v12;
  UIViewPropertyAnimator *v13;

  dy = a4.dy;
  dx = a4.dx;
  v7 = [UISpringTimingParameters alloc];
  +[_UISwipeActionSpringAnimationParameters defaultStiffness](_UISwipeActionSpringAnimationParameters, "defaultStiffness");
  v9 = v8 * a3;
  +[_UISwipeActionSpringAnimationParameters defaultDamping](_UISwipeActionSpringAnimationParameters, "defaultDamping");
  v11 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v7, "initWithMass:stiffness:damping:initialVelocity:", 2.0, v9, v10, dx, dy);
  v12 = [UIViewPropertyAnimator alloc];
  -[UISpringTimingParameters settlingDuration](v11, "settlingDuration");
  v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v12, "initWithDuration:timingParameters:", v11);

  return v13;
}

+ (id)_animatorForDuration:(double)a3 initialVelocity:(CGVector)a4 shouldLayoutSubviews:(BOOL)a5
{
  _BOOL8 v5;
  UISpringTimingParameters *v7;
  _UISwipePropertyAnimator *v8;

  v5 = a5;
  v7 = -[UISpringTimingParameters initWithDampingRatio:initialVelocity:]([UISpringTimingParameters alloc], "initWithDampingRatio:initialVelocity:", 1.0, a4.dx, a4.dy);
  v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([_UISwipePropertyAnimator alloc], "initWithDuration:timingParameters:", v7, a3);
  -[UIViewPropertyAnimator _setShouldLayoutSubviews:](v8, "_setShouldLayoutSubviews:", v5);

  return v8;
}

@end
