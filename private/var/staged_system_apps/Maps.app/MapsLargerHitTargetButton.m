@implementation MapsLargerHitTargetButton

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
  -[MapsLargerHitTargetButton bounds](self, "bounds", a4);
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

- (void)_debugVisualizeTouchInsets
{
  id v3;
  UIView *v4;
  UIView *debugInsetsView;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  UIView *v12;
  UIView *debugFrameView;
  void *v14;
  void *v15;

  if (!self->_debugInsetsView)
  {
    v3 = objc_alloc((Class)UIView);
    -[MapsLargerHitTargetButton bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    debugInsetsView = self->_debugInsetsView;
    self->_debugInsetsView = v4;

    -[UIView setAutoresizingMask:](self->_debugInsetsView, "setAutoresizingMask:", 0);
    -[UIView setUserInteractionEnabled:](self->_debugInsetsView, "setUserInteractionEnabled:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.600000024)));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_debugInsetsView, "layer"));
    objc_msgSend(v9, "setBorderColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_debugInsetsView, "layer"));
    objc_msgSend(v10, "setBorderWidth:", 1.0);

    -[MapsLargerHitTargetButton addSubview:](self, "addSubview:", self->_debugInsetsView);
    v11 = objc_alloc((Class)UIView);
    -[MapsLargerHitTargetButton bounds](self, "bounds");
    v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
    debugFrameView = self->_debugFrameView;
    self->_debugFrameView = v12;

    -[UIView setAutoresizingMask:](self->_debugFrameView, "setAutoresizingMask:", 0);
    -[UIView setUserInteractionEnabled:](self->_debugFrameView, "setUserInteractionEnabled:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "colorWithAlphaComponent:", 0.400000006));
    -[UIView setBackgroundColor:](self->_debugFrameView, "setBackgroundColor:", v15);

    -[MapsLargerHitTargetButton addSubview:](self, "addSubview:", self->_debugFrameView);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsLargerHitTargetButton;
  -[MapsLargerHitTargetButton layoutSubviews](&v7, "layoutSubviews");
  if (self->_debugInsetsView)
  {
    -[MapsLargerHitTargetButton bounds](self, "bounds");
    -[UIView setFrame:](self->_debugInsetsView, "setFrame:", v3 + self->_touchInsets.left, v4 + self->_touchInsets.top, v5 - (self->_touchInsets.left + self->_touchInsets.right), v6 - (self->_touchInsets.top + self->_touchInsets.bottom));
    -[MapsLargerHitTargetButton bounds](self, "bounds");
    -[UIView setFrame:](self->_debugFrameView, "setFrame:");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFrameView, 0);
  objc_storeStrong((id *)&self->_debugInsetsView, 0);
}

@end
