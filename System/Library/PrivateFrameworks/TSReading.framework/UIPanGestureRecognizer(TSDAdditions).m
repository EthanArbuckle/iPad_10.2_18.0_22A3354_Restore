@implementation UIPanGestureRecognizer(TSDAdditions)

- (double)direction
{
  double v1;
  double v2;

  objc_msgSend(a1, "velocityInView:", objc_msgSend(a1, "view"));
  return TSDNormalizePoint(v1, v2);
}

@end
