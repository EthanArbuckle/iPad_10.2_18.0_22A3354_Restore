@implementation UIRotationGestureRecognizer

- (void)_setPreRecognitionWeight:(double)a3
{
  -[_UIRotationGestureRecognizerDriver _setPreRecognitionWeight:]((uint64_t)self->_driver, a3);
}

- (CGPoint)anchorPoint
{
  _UIRotationGestureRecognizerDriver *driver;
  double *p_x;
  double v4;
  double v5;
  CGPoint result;

  driver = self->_driver;
  if (driver)
  {
    p_x = &driver->_anchorPoint.x;
    v4 = *p_x;
    v5 = p_x[1];
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)setRotation:(CGFloat)rotation
{
  -[_UIRotationGestureRecognizerDriver setRotation:]((uint64_t)self->_driver, rotation);
}

- (CGFloat)rotation
{
  _UIRotationGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_initialTouchAngle - driver->_currentTouchAngle + (double)driver->_currentRotationCount * 6.28318531;
  else
    return 0.0;
}

- (CGFloat)velocity
{
  _UIRotationGestureRecognizerDriver *driver;
  double previousVelocity;
  CGFloat result;

  driver = self->_driver;
  if (!driver)
    return 0.0;
  previousVelocity = driver->_previousVelocity;
  result = driver->_velocity;
  if (previousVelocity != 0.0)
    return previousVelocity * 0.75 + result * 0.25;
  return result;
}

- (double)_preRecognitionWeight
{
  _UIRotationGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_preRecognitionWeight;
  else
    return 0.0;
}

- (double)_postRecognitionWeight
{
  _UIRotationGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_postRecognitionWeight;
  else
    return 0.0;
}

- (void)_setPostRecognitionWeight:(double)a3
{
  -[_UIRotationGestureRecognizerDriver _setPostRecognitionWeight:]((uint64_t)self->_driver, a3);
}

- (id)_driver
{
  _UIRotationGestureRecognizerDriver *driver;
  _UIRotationGestureRecognizerDriver *v4;
  _UIRotationGestureRecognizerDriver *v5;

  driver = self->_driver;
  if (driver)
    v4 = driver;
  else
    v4 = (_UIRotationGestureRecognizerDriver *)objc_opt_new();
  v5 = self->_driver;
  self->_driver = v4;

  return self->_driver;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 20;
}

- (CGPoint)locationInView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  _UIRotationGestureRecognizerDriver *driver;
  double *p_x;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIRotationGestureRecognizer;
    -[UIGestureRecognizer locationInView:](&v12, sel_locationInView_, a3);
  }
  else
  {
    driver = self->_driver;
    if (driver)
    {
      p_x = &driver->_anchorPoint.x;
      v10 = *p_x;
      v11 = p_x[1];
    }
    else
    {
      v11 = 0.0;
      v10 = 0.0;
    }
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, v10, v11);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driver, 0);
}

@end
