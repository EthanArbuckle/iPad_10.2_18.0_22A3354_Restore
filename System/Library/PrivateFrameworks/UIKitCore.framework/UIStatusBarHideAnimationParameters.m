@implementation UIStatusBarHideAnimationParameters

- (void)setHideAnimation:(int)a3
{
  self->_hideAnimation = a3;
}

- (int)hideAnimation
{
  return self->_hideAnimation;
}

- (BOOL)shouldAnimate
{
  objc_super v3;

  if (!self->_hideAnimation)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarHideAnimationParameters;
  return -[UIStatusBarAnimationParameters shouldAnimate](&v3, sel_shouldAnimate);
}

- (UIStatusBarHideAnimationParameters)initWithDefaultParameters
{
  UIStatusBarHideAnimationParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarHideAnimationParameters;
  result = -[UIStatusBarAnimationParameters initWithDefaultParameters](&v3, sel_initWithDefaultParameters);
  if (result)
  {
    result->_hideAnimation = 1;
    result->super._duration = 0.35;
  }
  return result;
}

- (double)additionalSlideHeight
{
  return self->_additionalSlideHeight;
}

- (void)setAdditionalSlideHeight:(double)a3
{
  self->_additionalSlideHeight = a3;
}

@end
