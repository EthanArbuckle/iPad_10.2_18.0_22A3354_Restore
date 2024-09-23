@implementation THTOCViewController

- (THTOCViewController)initWithBookPropertiesDelegate:(id)a3 delegate:(id)a4
{
  uint64_t v7;

  v7 = THBundle();
  return -[THTOCViewController initWithNibName:bundle:bookPropertiesDelegate:delegate:](self, "initWithNibName:bundle:bookPropertiesDelegate:delegate:", 0, v7, a3, a4);
}

- (THTOCViewController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6
{
  THTOCViewController *result;

  result = -[THTOCViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", a3, a4);
  if (result)
  {
    result->_bookPropertiesDelegate = (THBookPropertiesProvider *)a5;
    result->mDelegate = (THTOCViewControllerDelegate *)a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTOCViewController;
  -[THTOCViewController dealloc](&v3, "dealloc");
}

- (TSWPassThroughView)shroudOverlayView
{
  return self->mShroudOverlayView;
}

- (void)relinquishIntroMediaViewController
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController relinquishIntroMediaViewController]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 50, CFSTR("Abstract method"));
}

- (void)takeIntroMediaViewController:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController takeIntroMediaViewController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 54, CFSTR("Abstract method"));
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController setIntroMediaViewController:showIt:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 58, CFSTR("Abstract method"));
}

- (BOOL)animatesPageDuringTransition
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController animatesPageDuringTransition]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 62, CFSTR("Abstract method"));
  return 0;
}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController willTransitionFromChapterIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 67, CFSTR("Abstract method"));
}

- (void)didTransitionFromCanvas
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController didTransitionFromCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 71, CFSTR("Abstract method"));
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController rectForPageThumbnailAtIndex:chapterIndex:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 75, CFSTR("Abstract method"));
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerMoviePlayerWillShowControls]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 80, CFSTR("Abstract method"));
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerMoviePlayerWillHideControls]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 84, CFSTR("Abstract method"));
}

- (void)setShroudedFraction:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v7;
  TSWPassThroughView *v9;
  id v10;
  double v11;
  CALayer *v12;
  int v13;
  int v14;
  float v15;
  id v16;
  double v17;
  CABasicAnimation *v18;
  double v19;
  double v20;
  CABasicAnimation *v21;
  CATransform3D v22;
  CATransform3D v23[2];
  CATransform3D v24;
  CATransform3D v25;

  if (self->mShroudedFraction != a3)
  {
    v7 = a4;
    self->mShroudedFraction = a3;
    memset(&v25, 0, sizeof(v25));
    CATransform3DMakeScale(&v25, a3 * 0.300000012 + 1.0, a3 * 0.300000012 + 1.0, 1.0);
    if (!self->mShroudOverlayView)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      v9 = [TSWPassThroughView alloc];
      objc_msgSend(-[THTOCViewController view](self, "view"), "bounds");
      self->mShroudOverlayView = -[TSWPassThroughView initWithFrame:](v9, "initWithFrame:");
      -[TSWPassThroughView setBackgroundColor:](self->mShroudOverlayView, "setBackgroundColor:", +[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", -[THTOCViewController traitCollection](self, "traitCollection")));
      -[TSWPassThroughView setAutoresizingMask:](self->mShroudOverlayView, "setAutoresizingMask:", 18);
      v10 = -[TSWPassThroughView layer](self->mShroudOverlayView, "layer");
      LODWORD(v11) = 0;
      objc_msgSend(v10, "setOpacity:", v11);
      objc_msgSend(-[THTOCViewController view](self, "view"), "addSubview:", self->mShroudOverlayView);
      +[CATransaction commit](CATransaction, "commit");
    }
    memset(&v24, 0, sizeof(v24));
    v12 = -[UIView layer](-[THTOCViewController viewToShroud](self, "viewToShroud"), "layer");
    if (v12)
      -[CALayer transform](v12, "transform");
    else
      memset(&v24, 0, sizeof(v24));
    objc_msgSend(-[TSWPassThroughView layer](self->mShroudOverlayView, "layer"), "opacity");
    v14 = v13;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v15 = a3;
    v16 = -[TSWPassThroughView layer](self->mShroudOverlayView, "layer");
    *(float *)&v17 = v15;
    objc_msgSend(v16, "setOpacity:", v17);
    if (-[THTOCViewController shouldZoomShroudedView](self, "shouldZoomShroudedView"))
    {
      v23[1] = v25;
      v23[0] = v25;
      -[CALayer setTransform:](-[UIView layer](-[THTOCViewController viewToShroud](self, "viewToShroud"), "layer"), "setTransform:", v23);
    }
    +[CATransaction commit](CATransaction, "commit");
    if (v7)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a5);
      v18 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
      LODWORD(v19) = v14;
      -[CABasicAnimation setFromValue:](v18, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
      *(float *)&v20 = v15;
      -[CABasicAnimation setToValue:](v18, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
      -[CABasicAnimation setRemovedOnCompletion:](v18, "setRemovedOnCompletion:", 1);
      objc_msgSend(-[TSWPassThroughView layer](self->mShroudOverlayView, "layer"), "addAnimation:forKey:", v18, CFSTR("shadeAnimation"));
      if (-[THTOCViewController shouldZoomShroudedView](self, "shouldZoomShroudedView"))
      {
        v21 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
        v22 = v24;
        -[CABasicAnimation setFromValue:](v21, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v22));
        v22 = v25;
        -[CABasicAnimation setToValue:](v21, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v22));
        -[CABasicAnimation setRemovedOnCompletion:](v21, "setRemovedOnCompletion:", 1);
        -[CALayer addAnimation:forKey:](-[UIView layer](-[THTOCViewController viewToShroud](self, "viewToShroud"), "layer"), "addAnimation:forKey:", v21, CFSTR("shadeAnimation"));
      }
      +[CATransaction commit](CATransaction, "commit");
    }
  }
}

- (void)setShrouded:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v6;
  _BOOL4 v7;

  v6 = a4;
  v7 = a3;
  if (-[THTOCViewControllerDelegate tocViewControllerMayBeShrouded:](-[THTOCViewController delegate](self, "delegate"), "tocViewControllerMayBeShrouded:", self))
  {
    if (v7)
      -[THTOCViewController setShroudedFraction:animated:duration:](self, "setShroudedFraction:animated:duration:", v6, 1.0, a5);
    else
      -[THTOCViewController setShroudedFraction:animated:duration:](self, "setShroudedFraction:animated:duration:", v6, 0.0, a5);
  }
}

- (double)shroudedFraction
{
  return self->mShroudedFraction;
}

- (void)setShroudedFraction:(double)a3
{
  unsigned int v5;
  double v6;

  v5 = -[THTOCViewControllerDelegate tocViewControllerMayBeShrouded:](-[THTOCViewController delegate](self, "delegate"), "tocViewControllerMayBeShrouded:", self);
  v6 = 0.0;
  if (v5)
    v6 = a3;
  -[THTOCViewController setShroudedFraction:animated:duration:](self, "setShroudedFraction:animated:duration:", 0, v6, 0.0);
}

- (BOOL)statusBarShouldBeHidden
{
  return 0;
}

- (BOOL)closeButtonIsNeeded
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController closeButtonIsNeeded]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 198, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)introMediaControllerIsActive
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerIsActive]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 203, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)introMediaControllerIsOffscreen
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerIsOffscreen]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 208, CFSTR("Abstract method"));
  return 0;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerShouldAdvancePast:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"), 213, CFSTR("Abstract method"));
}

- (BOOL)paginatedTOCShowsStatusBar
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -[THTOCViewController theme](self, "theme") == 0;
}

- (id)childViewControllerForStatusBarHidden
{
  if (-[THTOCViewController introMediaControllerIsActive](self, "introMediaControllerIsActive")
    && !-[THTOCViewController forceStatusBarVisible](self, "forceStatusBarVisible"))
  {
    return -[THTOCViewController introMediaViewController](self, "introMediaViewController");
  }
  else
  {
    return 0;
  }
}

- (id)childViewControllerForStatusBarStyle
{
  if (-[THTOCViewController introMediaControllerIsActive](self, "introMediaControllerIsActive")
    && !-[THTOCViewController forceStatusBarVisible](self, "forceStatusBarVisible"))
  {
    return -[THTOCViewController introMediaViewController](self, "introMediaViewController");
  }
  else
  {
    return 0;
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (THTOCViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THTOCViewControllerDelegate *)a3;
}

- (THTOCViewControllerDataSource)dataSource
{
  return self->mDataSource;
}

- (void)setDataSource:(id)a3
{
  self->mDataSource = (THTOCViewControllerDataSource *)a3;
}

- (THBookPropertiesProvider)bookPropertiesDelegate
{
  return self->_bookPropertiesDelegate;
}

- (BOOL)forceStatusBarVisible
{
  return self->_forceStatusBarVisible;
}

- (void)setForceStatusBarVisible:(BOOL)a3
{
  self->_forceStatusBarVisible = a3;
}

@end
