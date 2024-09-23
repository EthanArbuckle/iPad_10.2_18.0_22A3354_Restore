@implementation ZoomMapAction

- (ZoomMapAction)initWithZoomFactor:(double)a3
{
  ZoomMapAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ZoomMapAction;
  result = -[ZoomMapAction init](&v5, "init");
  if (result)
    result->_zoomFactor = a3;
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 33;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

@end
