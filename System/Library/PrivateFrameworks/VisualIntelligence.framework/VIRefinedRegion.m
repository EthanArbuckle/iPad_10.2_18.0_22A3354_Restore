@implementation VIRefinedRegion

- (VIRefinedRegion)initWithRegionOfInterest:(CGRect)a3 confidence:(float)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VIRefinedRegion *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VIRefinedRegion;
  result = -[VIRefinedRegion init](&v10, sel_init);
  if (result)
  {
    result->_regionOfInterest.origin.x = x;
    result->_regionOfInterest.origin.y = y;
    result->_regionOfInterest.size.width = width;
    result->_regionOfInterest.size.height = height;
    result->_confidence = a4;
  }
  return result;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

@end
