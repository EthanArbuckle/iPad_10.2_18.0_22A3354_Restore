@implementation MTButtonWithTouchInsets

- (MTButtonWithTouchInsets)initWithFrame:(CGRect)a3
{
  MTButtonWithTouchInsets *result;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTButtonWithTouchInsets;
  result = -[MTButtonWithTouchInsets initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_touchInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_touchInsets.bottom = v4;
  }
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  if (self->_touchInsets.left != a3.left
    || self->_touchInsets.top != a3.top
    || self->_touchInsets.right != a3.right
    || self->_touchInsets.bottom != a3.bottom)
  {
    self->_touchInsets = a3;
    -[MTButtonWithTouchInsets updateDebugUI](self, "updateDebugUI");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTButtonWithTouchInsets;
  -[MTButtonWithTouchInsets layoutSubviews](&v3, "layoutSubviews");
  -[MTButtonWithTouchInsets updateDebugUI](self, "updateDebugUI");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MTButtonWithTouchInsets _boundsRelativeHitRect](self, "_boundsRelativeHitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGRect)_boundsRelativeHitRect
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  CGRect result;

  -[MTButtonWithTouchInsets bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MTButtonWithTouchInsets touchInsets](self, "touchInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
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

@end
