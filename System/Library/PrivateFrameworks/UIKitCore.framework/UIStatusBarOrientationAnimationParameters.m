@implementation UIStatusBarOrientationAnimationParameters

- (UIStatusBarOrientationAnimationParameters)initWithDefaultParameters
{
  UIStatusBarOrientationAnimationParameters *v2;
  UIStatusBarOrientationAnimationParameters *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarOrientationAnimationParameters;
  v2 = -[UIStatusBarAnimationParameters initWithDefaultParameters](&v6, sel_initWithDefaultParameters);
  v3 = v2;
  if (v2)
  {
    v2->_orientationAnimation = 2;
    objc_msgSend((id)UIApp, "statusBarOrientationAnimationDuration");
    v3->super._duration = v4;
  }
  return v3;
}

- (BOOL)shouldAnimate
{
  objc_super v3;

  if (!self->_orientationAnimation)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarOrientationAnimationParameters;
  return -[UIStatusBarAnimationParameters shouldAnimate](&v3, sel_shouldAnimate);
}

- (int)orientationAnimation
{
  return self->_orientationAnimation;
}

- (void)setOrientationAnimation:(int)a3
{
  self->_orientationAnimation = a3;
}

@end
