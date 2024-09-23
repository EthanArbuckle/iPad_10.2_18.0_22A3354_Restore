@implementation THToolbarButton

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
  double v16;
  double v17;
  double v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[THToolbarButton touchPadding](self, "touchPadding", a4);
  v8 = v7;
  v10 = v9;
  v12 = -v11;
  v14 = -v13;
  -[THToolbarButton bounds](self, "bounds");
  v21.origin.x = v15 - v10;
  v21.origin.y = v16 - v8;
  v21.size.width = v17 - (v14 - v10);
  v21.size.height = v18 - (v12 - v8);
  v20.x = x;
  v20.y = y;
  return CGRectContainsPoint(v21, v20);
}

- (UIEdgeInsets)touchPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchPadding.top;
  left = self->_touchPadding.left;
  bottom = self->_touchPadding.bottom;
  right = self->_touchPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchPadding:(UIEdgeInsets)a3
{
  self->_touchPadding = a3;
}

@end
