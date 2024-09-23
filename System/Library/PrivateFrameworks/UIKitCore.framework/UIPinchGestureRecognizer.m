@implementation UIPinchGestureRecognizer

- (void)_setEndsOnSingleTouch:(BOOL)a3
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    *(_BYTE *)&driver->_flags = *(_BYTE *)&driver->_flags & 0xFE | a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driver, 0);
}

- (void)setScale:(CGFloat)scale
{
  -[_UIPinchGestureRecognizerDriver setScale:]((double *)self->_driver, scale);
}

- (CGFloat)scale
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_transform.a;
  else
    return 0.0;
}

- (CGFloat)velocity
{
  _UIPinchGestureRecognizerDriver *driver;
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

- (CGPoint)anchorPoint
{
  _UIPinchGestureRecognizerDriver *driver;
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

- (void)setScaleThreshold:(double)a3
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    driver->_scaleThreshold = a3;
}

- (double)scaleThreshold
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_scaleThreshold;
  else
    return 0.0;
}

- (void)_setHysteresis:(double)a3
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    driver->_hysteresis = a3;
}

- (double)_hysteresis
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return driver->_hysteresis;
  else
    return 0.0;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  _UIPinchGestureRecognizerDriver *driver;
  _OWORD *p_a;
  __int128 v5;
  __int128 v6;

  driver = self->_driver;
  if (driver)
  {
    p_a = (_OWORD *)&driver->_transform.a;
    v5 = *(_OWORD *)&a3->a;
    v6 = *(_OWORD *)&a3->tx;
    p_a[1] = *(_OWORD *)&a3->c;
    p_a[2] = v6;
    *p_a = v5;
  }
}

- (CGAffineTransform)transform
{
  CGFloat tx;
  _OWORD *v4;
  __int128 v5;

  tx = self[5].tx;
  if (tx == 0.0)
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  else
  {
    v4 = (_OWORD *)(*(_QWORD *)&tx + 96);
    v5 = v4[1];
    *(_OWORD *)&retstr->a = *v4;
    *(_OWORD *)&retstr->c = v5;
    *(_OWORD *)&retstr->tx = v4[2];
  }
  return self;
}

- (BOOL)_endsOnSingleTouch
{
  _UIPinchGestureRecognizerDriver *driver;

  driver = self->_driver;
  if (driver)
    return *(_BYTE *)&driver->_flags & 1;
  else
    return 0;
}

- (id)_driver
{
  _UIPinchGestureRecognizerDriver *driver;
  _UIPinchGestureRecognizerDriver *v4;
  _UIPinchGestureRecognizerDriver *v5;

  driver = self->_driver;
  if (driver)
    v4 = driver;
  else
    v4 = (_UIPinchGestureRecognizerDriver *)objc_opt_new();
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

- (CGPoint)locationInView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  _UIPinchGestureRecognizerDriver *driver;
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
    v12.super_class = (Class)UIPinchGestureRecognizer;
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

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 18;
}

@end
