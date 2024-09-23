@implementation UIStatusBarStyleAnimationParameters

- (UIStatusBarStyleAnimationParameters)initWithDefaultParameters
{
  UIStatusBarStyleAnimationParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarStyleAnimationParameters;
  result = -[UIStatusBarAnimationParameters initWithDefaultParameters](&v3, sel_initWithDefaultParameters);
  if (result)
  {
    result->_styleAnimation = 1;
    result->super._duration = 0.35;
  }
  return result;
}

- (BOOL)shouldAnimate
{
  objc_super v3;

  if (!self->_styleAnimation)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarStyleAnimationParameters;
  return -[UIStatusBarAnimationParameters shouldAnimate](&v3, sel_shouldAnimate);
}

- (void)setStyleAnimation:(int)a3
{
  self->_styleAnimation = 1;
}

- (int)styleAnimation
{
  return self->_styleAnimation;
}

@end
