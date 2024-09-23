@implementation UIBezierPath

- (CGRect)pathBounds
{
  return CGPathGetPathBoundingBox(-[UIBezierPath CGPath](objc_retainAutorelease(self), "CGPath"));
}

@end
