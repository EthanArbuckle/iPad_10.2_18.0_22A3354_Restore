@implementation BKBookZoomRevealOpenAnimator

- (double)zoomDuration
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 48, "-[BKBookZoomRevealOpenAnimator zoomDuration]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  return 0.0;
}

- (double)revealDuration
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 54, "-[BKBookZoomRevealOpenAnimator revealDuration]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

  return 0.0;
}

- (void)setupViewsForZoom
{
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  v3 = NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 60, "-[BKBookZoomRevealOpenAnimator setupViewsForZoom]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (void)animateZoomWithCompletion:(id)a3
{
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;

  v4 = NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 65, "-[BKBookZoomRevealOpenAnimator animateZoomWithCompletion:]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (void)setupViewsForReveal
{
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  v3 = NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 70, "-[BKBookZoomRevealOpenAnimator setupViewsForReveal]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (void)animateRevealWithCompletion:(id)a3
{
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;

  v4 = NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookZoomRevealOpenAnimator.m", 75, "-[BKBookZoomRevealOpenAnimator animateRevealWithCompletion:]", "NO", CFSTR("Missing implementation. method: class: %@ - %@"));

}

- (CAMediaTimingFunction)zoomTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1051371084;
  LODWORD(v4) = 1045220557;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (CAMediaTimingFunction)revealTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1057674284;
  LODWORD(v4) = 1051928088;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.0;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (BOOL)zoomRequiresContentLoaded
{
  return 0;
}

- (void)teardownViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator spinnerView](self, "spinnerView"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKBookZoomRevealOpenAnimator setSpinnerView:](self, "setSpinnerView:", 0);
  v6.receiver = self;
  v6.super_class = (Class)BKBookZoomRevealOpenAnimator;
  -[BKBookOpenAnimator teardownViews:](&v6, "teardownViews:", v3);
}

- (void)bookContentDidLoad
{
  _QWORD *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000FF2CC;
  v3[3] = &unk_1008E72C0;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  ((void (*)(void))v2[2])();

}

- (double)_spinnerScale
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v10;

  -[BKBookOpenAnimator coverAspectRatio](self, "coverAspectRatio");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v5, "bounds");
  if (v4 > 0.9)
    v10 = CGRectGetHeight(*(CGRect *)&v6) / 768.0;
  else
    v10 = CGRectGetWidth(*(CGRect *)&v6) * 0.0009765625;

  return v10;
}

- (void)setupSpinner
{
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
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

  -[BKBookZoomRevealOpenAnimator _spinnerScale](self, "_spinnerScale");
  v4 = round(v3 * 112.0);
  v20 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v6 = objc_msgSend(v5, "bounds");
  objc_msgSend(v20, "setCenter:", CGRectGetCenterNoRounding(v6, v7, v8, v9, v10));

  objc_msgSend(v20, "frame");
  v22 = CGRectIntegral(v21);
  objc_msgSend(v20, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
  objc_msgSend(v11, "setCornerRadius:", 8.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.8));
  objc_msgSend(v20, "setBackgroundColor:", v12);

  -[BKBookZoomRevealOpenAnimator setSpinnerView:](self, "setSpinnerView:", v20);
  v13 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v14 = objc_msgSend(v20, "bounds");
  objc_msgSend(v13, "setCenter:", CGRectGetCenterNoRounding(v14, v15, v16, v17, v18));
  objc_msgSend(v13, "frame");
  v24 = CGRectIntegral(v23);
  objc_msgSend(v13, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  objc_msgSend(v13, "startAnimating");
  objc_msgSend(v20, "addSubview:", v13);
  objc_msgSend(v20, "setAlpha:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v19, "addSubview:", v20);

}

- (void)_showSpinner:(BOOL)a3 delay:(double)a4 completion:(id)a5
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FF8CC;
  v5[3] = &unk_1008E83C0;
  v5[4] = self;
  v6 = a3;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v5, a5, 0.3, a4);
}

- (void)_animateFirstHalf
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD *v9;
  _QWORD v10[4];
  BKBookZoomRevealOpenAnimator *v11;
  _QWORD *v12;
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FFAA8;
  v13[3] = &unk_1008E72C0;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FFD10;
  v10[3] = &unk_1008E7680;
  v11 = self;
  v12 = objc_retainBlock(v13);
  v3 = v12;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FFF88;
  v8[3] = &unk_1008E8058;
  v8[4] = v11;
  v9 = objc_retainBlock(v10);
  v4 = v9;
  v5 = objc_retainBlock(v8);
  -[BKBookZoomRevealOpenAnimator setSecondHalfStarted:](self, "setSecondHalfStarted:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  objc_msgSend(v6, "setNeedsStatusBarAppearanceUpdate");

  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    if (-[BKBookOpenAnimator skipZoomPhase](self, "skipZoomPhase"))
    {
      ((void (*)(_QWORD *, uint64_t))v5[2])(v5, 1);
    }
    else if (-[BKBookZoomRevealOpenAnimator zoomRequiresContentLoaded](self, "zoomRequiresContentLoaded")
           && !-[BKBookZoomRevealOpenAnimator contentLoaded](self, "contentLoaded"))
    {
      -[BKBookZoomRevealOpenAnimator setWaitingForContentLoaded:](self, "setWaitingForContentLoaded:", 1);
    }
    else
    {
      -[BKBookZoomRevealOpenAnimator _zoomWithCompletion:](self, "_zoomWithCompletion:", v5);
    }
  }
  else
  {
    -[BKBookZoomRevealOpenAnimator _revealWithCompletion:](self, "_revealWithCompletion:", v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v7, "postEvent:sender:", kBETestDriverOpenAnimationSetupEnd, self);

}

- (void)_animateSecondHalf
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001003C0;
  v5[3] = &unk_1008E77C8;
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  -[BKBookZoomRevealOpenAnimator setSecondHalfStarted:](self, "setSecondHalfStarted:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  objc_msgSend(v4, "setNeedsStatusBarAppearanceUpdate");

  if (-[BKBookOpenAnimator opening](self, "opening"))
    -[BKBookZoomRevealOpenAnimator _revealWithCompletion:](self, "_revealWithCompletion:", v3);
  else
    -[BKBookZoomRevealOpenAnimator _zoomWithCompletion:](self, "_zoomWithCompletion:", v3);

}

- (void)_zoomWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  BKBookZoomRevealOpenAnimator *v11;
  id v12;

  v4 = a3;
  -[BKBookZoomRevealOpenAnimator setupViewsForZoom](self, "setupViewsForZoom");
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100100530;
  v10 = &unk_1008E8058;
  v11 = self;
  v12 = v4;
  v5 = v4;
  -[BKBookZoomRevealOpenAnimator animateZoomWithCompletion:](self, "animateZoomWithCompletion:", &v7);
  kdebug_trace(725353052, 0, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared", v7, v8, v9, v10, v11));
  objc_msgSend(v6, "postEvent:sender:", kBETestDriverOpenAnimationZoomStart, self);

}

- (void)_revealWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  BKBookZoomRevealOpenAnimator *v11;
  id v12;

  v4 = a3;
  -[BKBookZoomRevealOpenAnimator setupViewsForReveal](self, "setupViewsForReveal");
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100100694;
  v10 = &unk_1008E8058;
  v11 = self;
  v12 = v4;
  v5 = v4;
  -[BKBookZoomRevealOpenAnimator animateRevealWithCompletion:](self, "animateRevealWithCompletion:", &v7);
  kdebug_trace(725353052, 0, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared", v7, v8, v9, v10, v11));
  objc_msgSend(v6, "postEvent:sender:", kBETestDriverOpenAnimationRevealStart, self);

}

- (void)animateNonInteractive
{
  -[BKBookOpenAnimator animateNavigationBarPrepare](self, "animateNavigationBarPrepare");
  -[BKBookZoomRevealOpenAnimator _animateFirstHalf](self, "_animateFirstHalf");
}

- (BOOL)isContentRevealed
{
  if (-[BKBookOpenAnimator opening](self, "opening")
    && -[BKBookZoomRevealOpenAnimator secondHalfStarted](self, "secondHalfStarted"))
  {
    return 1;
  }
  if (-[BKBookOpenAnimator opening](self, "opening"))
    return 0;
  return !-[BKBookZoomRevealOpenAnimator secondHalfStarted](self, "secondHalfStarted");
}

- (BOOL)defersBookViewSetupForOpening
{
  return 1;
}

- (id)viewControllerForStatusBarStyle
{
  void *v3;

  if (-[BKBookOpenAnimator opening](self, "opening")
    && !-[BKBookZoomRevealOpenAnimator secondHalfStarted](self, "secondHalfStarted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  }
  return v3;
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)secondHalfStarted
{
  return self->_secondHalfStarted;
}

- (void)setSecondHalfStarted:(BOOL)a3
{
  self->_secondHalfStarted = a3;
}

- (BOOL)skipReveal
{
  return self->_skipReveal;
}

- (void)setSkipReveal:(BOOL)a3
{
  self->_skipReveal = a3;
}

- (UIView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (double)spinnerStartTime
{
  return self->_spinnerStartTime;
}

- (void)setSpinnerStartTime:(double)a3
{
  self->_spinnerStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end
