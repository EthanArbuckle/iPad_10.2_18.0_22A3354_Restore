@implementation BKMousePointerAnimationDriver

- (BKMousePointerAnimationDriver)initWithRelativeTranslation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BKMousePointerAnimationDriver *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)BKMousePointerAnimationDriver;
  result = -[BKMousePointerAnimationDriver init](&v6, "init");
  if (result)
  {
    result->_relativeTranslation.x = x;
    result->_relativeTranslation.y = y;
    result->_currentTranslation = CGPointZero;
  }
  return result;
}

- (void)applyForTime:(double)a3
{
  uint64_t v5;

  v5 = objc_opt_class(self, a2);
  NSRequestConcreteImplementation(self, a2, v5);
}

- (BOOL)isComplete
{
  uint64_t v4;

  v4 = objc_opt_class(self, a2);
  NSRequestConcreteImplementation(self, a2, v4);
  return 1;
}

- (CGPoint)relativeTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_relativeTranslation.x;
  y = self->_relativeTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
