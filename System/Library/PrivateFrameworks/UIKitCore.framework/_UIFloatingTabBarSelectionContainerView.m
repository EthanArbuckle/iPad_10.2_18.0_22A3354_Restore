@implementation _UIFloatingTabBarSelectionContainerView

- (_UIFloatingTabBarSelectionContainerView)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBarSelectionContainerView *v3;
  _UIFloatingTabBarSelectionContainerView *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *selectionView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIFloatingTabBarSelectionContainerView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [UIView alloc];
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v9 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v9);

    -[UIView layer](v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);

    -[UIView layer](v8, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowPathIsBounds:", 1);

    objc_msgSend(v6, "selectionBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v13);

    objc_msgSend(v6, "selectionShadow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applyToView:", v8);

    -[UIView addSubview:](v4, "addSubview:", v8);
    selectionView = v4->_selectionView;
    v4->_selectionView = v8;

  }
  return v4;
}

- (void)setSelectionViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_selectionViewFrame;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_selectionViewFrame = &self->_selectionViewFrame;
  if (!CGRectEqualToRect(a3, self->_selectionViewFrame))
  {
    p_selectionViewFrame->origin.x = x;
    p_selectionViewFrame->origin.y = y;
    p_selectionViewFrame->size.width = width;
    p_selectionViewFrame->size.height = height;
    -[UIView setBounds:](self->_selectionView, "setBounds:", 0.0, 0.0, width, height);
    -[UIView setCenter:](self->_selectionView, "setCenter:", x + width * 0.5, y + height * 0.5);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v9 = CGRectGetHeight(v11);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v10 = CGRectGetWidth(v12);
    if (v9 < v10)
      v10 = v9;
    -[UIView _setContinuousCornerRadius:](self->_selectionView, "_setContinuousCornerRadius:", v10 * 0.5);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  UIView *selectionView;
  CGAffineTransform *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
    {
      CGAffineTransformMakeScale(&v11, 0.95, 0.95);
      selectionView = self->_selectionView;
      v10 = v11;
      v5 = &v10;
    }
    else
    {
      selectionView = self->_selectionView;
      v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v7 = *MEMORY[0x1E0C9BAA8];
      v8 = v6;
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v5 = (CGAffineTransform *)&v7;
    }
    -[UIView setTransform:](selectionView, "setTransform:", v5, v7, v8, v9, *(_OWORD *)&v10.a, *(_OWORD *)&v10.c, *(_OWORD *)&v10.tx);
  }
}

- (BOOL)isAnimatingSelectionFrame
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
  CGRect v19;
  CGRect v20;

  -[_UIFloatingTabBarSelectionContainerView selectionView](self, "selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "frame");
    v20.origin.x = v13;
    v20.origin.y = v14;
    v20.size.width = v15;
    v20.size.height = v16;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    v17 = !CGRectEqualToRect(v19, v20);
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarSelectionContainerView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (CGRect)selectionViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionViewFrame.origin.x;
  y = self->_selectionViewFrame.origin.y;
  width = self->_selectionViewFrame.size.width;
  height = self->_selectionViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
}

@end
