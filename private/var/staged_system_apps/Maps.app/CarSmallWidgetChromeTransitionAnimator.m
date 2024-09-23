@implementation CarSmallWidgetChromeTransitionAnimator

- (CarSmallWidgetChromeTransitionAnimator)initWithOperation:(int64_t)a3
{
  CarSmallWidgetChromeTransitionAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarSmallWidgetChromeTransitionAnimator;
  result = -[CarSmallWidgetChromeTransitionAnimator init](&v5, "init");
  if (result)
    result->_operation = a3;
  return result;
}

- (double)transitionDuration:(id)a3
{
  return 0.449999988;
}

- (void)animateTransition:(id)a3
{
  if ((unint64_t)(self->_operation - 1) <= 1)
    -[CarSmallWidgetChromeTransitionAnimator _animateOperation:withTransitionContext:](self, "_animateOperation:withTransitionContext:");
}

- (void)_animateOperation:(int64_t)a3 withTransitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  if (a3 == 1)
  {
    objc_msgSend(v9, "addSubview:", v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v9, "insertSubview:belowSubview:", v10, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v12, "setAlpha:", 0.0);

  -[CarSmallWidgetChromeTransitionAnimator transitionDuration:](self, "transitionDuration:", v6);
  v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100582848;
  v21[3] = &unk_1011AC8B0;
  v22 = v7;
  v23 = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005828A4;
  v18[3] = &unk_1011ACCB8;
  v19 = v6;
  v20 = v22;
  v15 = v22;
  v16 = v6;
  v17 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v21, v18, v14, 0.0);

}

@end
