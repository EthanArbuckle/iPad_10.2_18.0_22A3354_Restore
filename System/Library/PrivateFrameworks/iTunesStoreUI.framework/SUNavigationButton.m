@implementation SUNavigationButton

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationButton;
  -[UINavigationButton dealloc](&v3, sel_dealloc);
}

- (void)setAccessoryView:(id)a3
{
  UIView *accessoryView;
  UIView *v6;

  accessoryView = self->_accessoryView;
  if (accessoryView != a3)
  {
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_accessoryView = v6;
    if (v6)
      -[SUNavigationButton addSubview:](self, "addSubview:", v6);
  }
}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  if (self->_accessoryViewInsets.left != a3.left
    || self->_accessoryViewInsets.top != a3.top
    || self->_accessoryViewInsets.right != a3.right
    || self->_accessoryViewInsets.bottom != a3.bottom)
  {
    self->_accessoryViewInsets = a3;
    -[SUNavigationButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  UIView *accessoryView;
  objc_super v4;

  if (self->_accessoryView)
  {
    -[SUNavigationButton bounds](self, "bounds");
    -[SUNavigationButton contentRectForBounds:](self, "contentRectForBounds:");
    accessoryView = self->_accessoryView;
    -[SUNavigationButton _accessoryViewRectForContentRect:](self, "_accessoryViewRectForContentRect:");
    -[UIView setFrame:](accessoryView, "setFrame:");
  }
  v4.receiver = self;
  v4.super_class = (Class)SUNavigationButton;
  -[UINavigationButton layoutSubviews](&v4, sel_layoutSubviews);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *accessoryView;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)SUNavigationButton;
  -[UINavigationButton sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView frame](accessoryView, "frame");
    if (v7 < v10 + self->_accessoryViewInsets.top + self->_accessoryViewInsets.bottom)
      v7 = v10 + self->_accessoryViewInsets.top + self->_accessoryViewInsets.bottom;
    v5 = v5 + v9 + self->_accessoryViewInsets.left + self->_accessoryViewInsets.right;
  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  float v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUNavigationButton;
  -[SUNavigationButton titleRectForContentRect:](&v24, sel_titleRectForContentRect_);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (self->_accessoryView)
  {
    -[SUNavigationButton _accessoryViewRectForContentRect:](self, "_accessoryViewRectForContentRect:", x, y, width, height);
    v16 = v15;
    -[SUNavigationButton titleEdgeInsets](self, "titleEdgeInsets");
    v18 = x + v17;
    v19 = v16 - (x + v17);
    if (v12 >= v19)
      v12 = v19;
    v20 = (v19 - v12) * 0.5;
    v8 = v18 + floorf(v20);
  }
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v8;
  return result;
}

- (CGRect)_accessoryViewRectForContentRect:(CGRect)a3
{
  double y;
  double top;
  double left;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  y = a3.origin.y;
  top = self->_accessoryViewInsets.top;
  left = self->_accessoryViewInsets.left;
  v6 = a3.origin.x + left;
  v7 = y + top;
  v8 = a3.size.width - (left + self->_accessoryViewInsets.right);
  v9 = a3.size.height - (top + self->_accessoryViewInsets.bottom);
  -[UIView frame](self->_accessoryView, "frame");
  v11 = v10;
  v13 = v12;
  v19.origin.x = v6;
  v19.origin.y = v7;
  v19.size.width = v8;
  v19.size.height = v9;
  v14 = CGRectGetMaxX(v19) - v11;
  v15 = (v9 - v13) * 0.5;
  v16 = y + floorf(v15);
  v17 = v11;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIEdgeInsets)accessoryViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_accessoryViewInsets.top;
  left = self->_accessoryViewInsets.left;
  bottom = self->_accessoryViewInsets.bottom;
  right = self->_accessoryViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
