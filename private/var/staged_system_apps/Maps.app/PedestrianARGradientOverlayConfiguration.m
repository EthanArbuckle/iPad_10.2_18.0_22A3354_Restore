@implementation PedestrianARGradientOverlayConfiguration

+ (PedestrianARGradientOverlayConfiguration)defaultConfiguration
{
  PedestrianARGradientOverlayConfiguration *v2;

  v2 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v2, "setPortraitStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v2, "setPortraitEndPoint:", 0.5, 1.0);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v2, "setLandscapeStartPoint:", 0.5, 0.2);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v2, "setLandscapeEndPoint:", 0.5, 1.0);
  return v2;
}

+ (PedestrianARGradientOverlayConfiguration)safetyViewConfiguration
{
  PedestrianARGradientOverlayConfiguration *v2;

  v2 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v2, "setPortraitStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v2, "setPortraitEndPoint:", 0.5, 1.0);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v2, "setLandscapeStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v2, "setLandscapeEndPoint:", 0.5, 1.0);
  return v2;
}

- (id)copy
{
  PedestrianARGradientOverlayConfiguration *v3;

  v3 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v3, "setPortraitStartPoint:", self->_portraitStartPoint.x, self->_portraitStartPoint.y);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v3, "setPortraitEndPoint:", self->_portraitEndPoint.x, self->_portraitEndPoint.y);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v3, "setLandscapeStartPoint:", self->_landscapeStartPoint.x, self->_landscapeStartPoint.y);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v3, "setLandscapeEndPoint:", self->_landscapeEndPoint.x, self->_landscapeEndPoint.y);
  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromCGPoint(self->_portraitStartPoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromCGPoint(self->_portraitEndPoint);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = NSStringFromCGPoint(self->_landscapeStartPoint);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = NSStringFromCGPoint(self->_landscapeEndPoint);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, portraitStartPoint: %@, portraitEndPoint: %@, landscapeStartPoint: %@, landscapeEndPoint: %@>"), v5, self, v7, v9, v11, v13));

  return v14;
}

- (CGPoint)portraitStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_portraitStartPoint.x;
  y = self->_portraitStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPortraitStartPoint:(CGPoint)a3
{
  self->_portraitStartPoint = a3;
}

- (CGPoint)portraitEndPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_portraitEndPoint.x;
  y = self->_portraitEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPortraitEndPoint:(CGPoint)a3
{
  self->_portraitEndPoint = a3;
}

- (CGPoint)landscapeStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_landscapeStartPoint.x;
  y = self->_landscapeStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLandscapeStartPoint:(CGPoint)a3
{
  self->_landscapeStartPoint = a3;
}

- (CGPoint)landscapeEndPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_landscapeEndPoint.x;
  y = self->_landscapeEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLandscapeEndPoint:(CGPoint)a3
{
  self->_landscapeEndPoint = a3;
}

@end
