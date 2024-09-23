@implementation _PUVideoHighlightBarView

- (_PUVideoHighlightBarView)initWithFrame:(CGRect)a3
{
  _PUVideoHighlightBarView *v3;
  id v4;
  uint64_t v5;
  UIView *barView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PUVideoHighlightBarView;
  v3 = -[_PUVideoHighlightBarView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[_PUVideoHighlightBarView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    barView = v3->_barView;
    v3->_barView = (UIView *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_barView, "setBackgroundColor:", v7);

    -[_PUVideoHighlightBarView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[_PUVideoHighlightBarView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[_PUVideoHighlightBarView addSubview:](v3, "addSubview:", v3->_barView);
  }
  return v3;
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_highlightColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightColor, a3);
      -[UIView setBackgroundColor:](self->_barView, "setBackgroundColor:", v7);
    }
  }

}

- (void)setExpandedOutsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_expandedOutsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_expandedOutsets = &self->_expandedOutsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_expandedOutsets->top = top;
    p_expandedOutsets->left = left;
    p_expandedOutsets->bottom = bottom;
    p_expandedOutsets->right = right;
    -[_PUVideoHighlightBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[_PUVideoHighlightBarView setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _QWORD v7[5];
  _QWORD v8[5];

  if (self->_expanded != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_expanded = a3;
    -[_PUVideoHighlightBarView setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      if (v5)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __49___PUVideoHighlightBarView_setExpanded_animated___block_invoke;
        v8[3] = &unk_1E58ABD10;
        v8[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v8, 0, 0.95, 0.0, 0.45, 0.0);
      }
      else
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __49___PUVideoHighlightBarView_setExpanded_animated___block_invoke_2;
        v7[3] = &unk_1E58ABD10;
        v7[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.15);
      }
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_PUVideoHighlightBarView;
  -[_PUVideoHighlightBarView layoutSubviews](&v18, sel_layoutSubviews);
  -[_PUVideoHighlightBarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_PUVideoHighlightBarView expanded](self, "expanded");
  -[_PUVideoHighlightBarView expandedOutsets](self, "expandedOutsets");
  v12 = 1.0;
  if (v11)
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = 1.5;
  }
  -[UIView layer](self->_barView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v12);

  -[UIView setFrame:](self->_barView, "setFrame:", v4, v6, v8, v10);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIEdgeInsets)expandedOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expandedOutsets.top;
  left = self->_expandedOutsets.left;
  bottom = self->_expandedOutsets.bottom;
  right = self->_expandedOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_barView, 0);
}

@end
