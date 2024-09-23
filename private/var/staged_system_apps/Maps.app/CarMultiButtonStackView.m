@implementation CarMultiButtonStackView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[CarMultiButtonStackView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -8.5, -8.5);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

@end
