@implementation SBAppSwitcherTransientOverlayPageContentView

- (SBAppSwitcherTransientOverlayPageContentView)initWithFrame:(CGRect)a3 appLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBAppSwitcherTransientOverlayPageContentView *v10;
  uint64_t v11;
  SBAppLayout *appLayout;
  id v13;
  uint64_t v14;
  BSUIOrientationTransformWrapperView *contentWrapperView;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBAppSwitcherTransientOverlayPageContentView;
  v10 = -[SBAppSwitcherTransientOverlayPageContentView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    appLayout = v10->_appLayout;
    v10->_appLayout = (SBAppLayout *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D01940]);
    -[SBAppSwitcherTransientOverlayPageContentView bounds](v10, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    contentWrapperView = v10->_contentWrapperView;
    v10->_contentWrapperView = (BSUIOrientationTransformWrapperView *)v14;

    -[BSUIOrientationTransformWrapperView setClipsToBounds:](v10->_contentWrapperView, "setClipsToBounds:", 1);
    -[SBAppSwitcherTransientOverlayPageContentView addSubview:](v10, "addSubview:", v10->_contentWrapperView);
  }

  return v10;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppSwitcherTransientOverlayPageContentView;
  -[SBAppSwitcherTransientOverlayPageContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBAppSwitcherTransientOverlayPageContentView bounds](self, "bounds");
  -[BSUIOrientationTransformWrapperView setFrame:](self->_contentWrapperView, "setFrame:");
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (double)cornerRadius
{
  double result;

  -[BSUIOrientationTransformWrapperView _continuousCornerRadius](self->_contentWrapperView, "_continuousCornerRadius");
  return result;
}

- (int64_t)contentOrientation
{
  return -[BSUIOrientationTransformWrapperView contentOrientation](self->_contentWrapperView, "contentOrientation");
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_contentWrapperView, "setContentOrientation:", a3);
}

- (void)setOrientation:(int64_t)a3
{
  id v4;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_contentWrapperView, "setContainerOrientation:");
    -[SBAppSwitcherTransientOverlayPageContentView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "appSwitcherTransientOverlayPageContentViewDidChangeContainerOrientation:", self);

  }
}

- (void)setActive:(BOOL)a3
{
  id v4;

  if (self->_active != a3)
  {
    self->_active = a3;
    -[SBAppSwitcherTransientOverlayPageContentView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "appSwitcherTransientOverlayPageContentViewDidChangeActive:", self);

  }
}

- (void)setCornerRadius:(double)a3
{
  -[BSUIOrientationTransformWrapperView _setContinuousCornerRadius:](self->_contentWrapperView, "_setContinuousCornerRadius:", a3);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4;

  -[BSUIOrientationTransformWrapperView layer](self->_contentWrapperView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (unint64_t)maskedCorners
{
  void *v2;
  unint64_t v3;

  -[BSUIOrientationTransformWrapperView layer](self->_contentWrapperView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    if (-[UIView isDescendantOfView:](contentView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      -[BSUIOrientationTransformWrapperView addContentView:](self->_contentWrapperView, "addContentView:");
      -[SBAppSwitcherTransientOverlayPageContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SBAppSwitcherTransientOverlayPageContentViewDelegate)delegate
{
  return (SBAppSwitcherTransientOverlayPageContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end
