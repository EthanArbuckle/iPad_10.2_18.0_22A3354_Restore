@implementation MTTouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[MTTouchInsetsButton bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MTTouchInsetsButton touchInsets](self, "touchInsets");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

@end
