@implementation BKBookReloadAnimator

- (void)bookContentDidLoad
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001AB9A4;
  v6[3] = &unk_1008E74C8;
  objc_copyWeak(&v7, &location);
  v2 = objc_retainBlock(v6);
  ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v2[2])(v2, v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_loadStateFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BKBookReloadAnimator setTransitionContext:](self, "setTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  -[BKBookReloadAnimator setFromViewController:](self, "setFromViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  -[BKBookReloadAnimator setToViewController:](self, "setToViewController:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  -[BKBookReloadAnimator setContainerView:](self, "setContainerView:", v7);

}

- (double)transitionDuration:(id)a3
{
  -[BKBookReloadAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  return 0.85;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BKBookReloadAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator containerView](self, "containerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator toViewController](self, "toViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "insertSubview:atIndex:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator toViewController](self, "toViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "layoutIfNeeded");

  -[BKBookReloadAnimator _setupSpinner](self, "_setupSpinner");
  -[BKBookReloadAnimator _performCrossFade](self, "_performCrossFade");
}

- (void)_performCrossFade
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[BKBookReloadAnimator contentLoaded](self, "contentLoaded"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_startSpinner", 0);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "bookContentDidLoad", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator fromViewController](self, "fromViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    objc_msgSend(v4, "setAlpha:", 1.0);

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001ABCB4;
    v5[3] = &unk_1008E77C8;
    v5[4] = self;
    -[BKBookReloadAnimator _showSpinner:completion:](self, "_showSpinner:completion:", 0, v5);
  }
  else
  {
    -[BKBookReloadAnimator setWaitingForContentLoaded:](self, "setWaitingForContentLoaded:", 1);
    -[BKBookReloadAnimator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startSpinner", 0, 0.4);
    -[BKBookReloadAnimator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "bookContentDidLoad", 0, 5.0);
  }
}

- (void)_startSpinner
{
  -[BKBookReloadAnimator _showSpinner:completion:](self, "_showSpinner:completion:", 1, 0);
}

- (double)aspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  NSString *v8;
  void *v9;
  CGSize v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator containerView](self, "containerView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 > 0.0 && v6 > 0.0)
    return v4 / v6;
  v10.width = v4;
  v10.height = v6;
  v8 = NSStringFromCGSize(v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookReloadAnimator.m", 122, "-[BKBookReloadAnimator aspectRatio]", "size.width > 0.0 && size.height > 0.0", CFSTR("Invalid container view size: %@"));

  return 1.0;
}

- (void)_setupSpinner
{
  UIView *v3;
  UIView *spinnerView;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 112.0, 112.0);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator containerView](self, "containerView"));
  v6 = objc_msgSend(v5, "bounds");
  -[UIView setCenter:](self->_spinnerView, "setCenter:", CGRectGetCenterNoRounding(v6, v7, v8, v9, v10));

  -[UIView frame](self->_spinnerView, "frame");
  v22 = CGRectIntegral(v21);
  -[UIView setFrame:](self->_spinnerView, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerView, "layer"));
  objc_msgSend(v11, "setCornerRadius:", 8.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.8));
  -[UIView setBackgroundColor:](self->_spinnerView, "setBackgroundColor:", v12);

  v20 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v20, "setColor:", v13);

  v14 = -[UIView bounds](self->_spinnerView, "bounds");
  objc_msgSend(v20, "setCenter:", CGRectGetCenterNoRounding(v14, v15, v16, v17, v18));
  objc_msgSend(v20, "frame");
  v24 = CGRectIntegral(v23);
  objc_msgSend(v20, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  objc_msgSend(v20, "startAnimating");
  -[UIView addSubview:](self->_spinnerView, "addSubview:", v20);
  -[UIView setAlpha:](self->_spinnerView, "setAlpha:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookReloadAnimator containerView](self, "containerView"));
  objc_msgSend(v19, "addSubview:", self->_spinnerView);

}

- (void)_showSpinner:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001AC05C;
  v4[3] = &unk_1008E83C0;
  v4[4] = self;
  v5 = a3;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, a4, 0.3);
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (UIView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
