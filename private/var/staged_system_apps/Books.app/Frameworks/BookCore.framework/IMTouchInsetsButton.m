@implementation IMTouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[IMTouchInsetsButton bounds](self, "bounds", a4);
  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchInsets.right);
  v15.size.height = v12 - (top + self->_touchInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMTouchInsetsButton;
  -[IMTouchInsetsButton tintColorDidChange](&v4, "tintColorDidChange");
  if (!self->_titleDoesNotFollowTintColor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTouchInsetsButton tintColor](self, "tintColor"));
    -[IMTouchInsetsButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

  }
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

- (BOOL)titleDoesNotFollowTintColor
{
  return self->_titleDoesNotFollowTintColor;
}

- (void)setTitleDoesNotFollowTintColor:(BOOL)a3
{
  self->_titleDoesNotFollowTintColor = a3;
}

@end
