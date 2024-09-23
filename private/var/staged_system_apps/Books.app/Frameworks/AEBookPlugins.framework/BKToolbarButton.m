@implementation BKToolbarButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)BKToolbarButton;
  -[BKToolbarButton sizeThatFits:](&v11, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (self->_inMiniBar)
    -[BKToolbarButton miniHeight](self, "miniHeight");
  else
    -[BKToolbarButton height](self, "height");
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (BOOL)_isModernButton
{
  return 1;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4 allowAnimation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _BOOL8 v9;

  v5 = a5;
  v8 = a3;
  v9 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v5);
  -[BKToolbarButton setTitle:forState:](self, "setTitle:forState:", v8, a4);

  -[BKToolbarButton layoutIfNeeded](self, "layoutIfNeeded");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v9);
}

- (unint64_t)popoverArrowDirections
{
  return 3;
}

- (CGRect)popoverPresentationRect
{
  void *v3;
  double top;
  double left;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKToolbarButton imageView](self, "imageView"));
  objc_msgSend(v3, "frame");
  top = self->_popoverPresentationEdgeInsets.top;
  left = self->_popoverPresentationEdgeInsets.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_popoverPresentationEdgeInsets.right);
  v13 = v12 - (top + self->_popoverPresentationEdgeInsets.bottom);

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)miniHeight
{
  return self->_miniHeight;
}

- (void)setMiniHeight:(double)a3
{
  self->_miniHeight = a3;
}

- (UIEdgeInsets)popoverPresentationEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_popoverPresentationEdgeInsets.top;
  left = self->_popoverPresentationEdgeInsets.left;
  bottom = self->_popoverPresentationEdgeInsets.bottom;
  right = self->_popoverPresentationEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPopoverPresentationEdgeInsets:(UIEdgeInsets)a3
{
  self->_popoverPresentationEdgeInsets = a3;
}

@end
