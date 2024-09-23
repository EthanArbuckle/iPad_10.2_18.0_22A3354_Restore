@implementation WLEasyToHitCustomView

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[WLEasyToHitCustomView bounds](self, "bounds", a4);
  -[WLEasyToHitCustomView margins](self, "margins");
  UIRectInset();
  v8.x = x;
  v8.y = y;
  return CGRectContainsPoint(v9, v8);
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
