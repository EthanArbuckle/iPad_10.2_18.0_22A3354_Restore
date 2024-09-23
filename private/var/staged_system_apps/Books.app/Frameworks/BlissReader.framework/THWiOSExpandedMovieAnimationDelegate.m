@implementation THWiOSExpandedMovieAnimationDelegate

- (THWiOSExpandedMovieAnimationDelegate)initWithMovieViewController:(id)a3
{
  THWiOSExpandedMovieAnimationDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWiOSExpandedMovieAnimationDelegate;
  result = -[THWiOSExpandedMovieAnimationDelegate init](&v5, "init");
  if (result)
    result->_movieViewController = (THWiOSExpandedMovieViewController *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  self->_movieViewController = 0;
  v2.receiver = self;
  v2.super_class = (Class)THWiOSExpandedMovieAnimationDelegate;
  -[THWiOSExpandedMovieAnimationDelegate dealloc](&v2, "dealloc");
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWiOSExpandedMovieViewController freeTransformController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "freeTransformController"), "isFreeTransformInProgress"))return objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "moviePlayerViewController"), "view"), "layer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWiOSExpandedMovieViewController freeTransformController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "freeTransformController"), "freeTransformLayer");
  if (!result)
    return objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "moviePlayerViewController"), "view"), "layer");
  return result;
}

- (id)shadowAnimationLayer
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  __int128 v5;
  CGAffineTransform *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWiOSExpandedMovieViewController freeTransformController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "freeTransformController"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWiOSExpandedMovieViewController freeTransformController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "freeTransformController");
    if (result)
    {
      result = (CGAffineTransform *)-[CGAffineTransform currentTransform](result, "currentTransform");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (BOOL)enforceAnimationLayer
{
  return 1;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  return objc_msgSend(-[THWiOSExpandedMovieViewController view](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "view"), "layer");
}

- (BOOL)shouldAnimateToFit
{
  return 1;
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  objc_msgSend(-[THWiOSExpandedMovieViewController view](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController", a3), "view"), "addSubview:", -[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "moviePlayerViewController"), "view"));
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "delegate"), "rootSuperview"), "addSubview:", -[THWiOSExpandedMovieViewController view](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "view"));
}

- (THWiOSExpandedMovieViewController)movieViewController
{
  return self->_movieViewController;
}

- (void)setMovieViewController:(id)a3
{
  self->_movieViewController = (THWiOSExpandedMovieViewController *)a3;
}

@end
