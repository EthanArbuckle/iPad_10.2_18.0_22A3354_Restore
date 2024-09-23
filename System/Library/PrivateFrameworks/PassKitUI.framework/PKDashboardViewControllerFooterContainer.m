@implementation PKDashboardViewControllerFooterContainer

- (PKDashboardViewControllerFooterContainer)initWithFrame:(CGRect)a3
{
  PKDashboardViewControllerFooterContainer *v3;
  PKDashboardViewControllerFooterContainer *v4;
  uint64_t v5;
  _UIBackdropView *backdropView;
  void *v7;
  UIView *v8;
  UIView *topSeparatorView;
  UIView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDashboardViewControllerFooterContainer;
  v3 = -[PKDashboardViewControllerFooterContainer initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_backdropStyle = -[PKDashboardViewControllerFooterContainer preferredBackdropStyle](v3, "preferredBackdropStyle");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", v4->_backdropStyle);
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v5;

    -[PKDashboardViewControllerFooterContainer addSubview:](v4, "addSubview:", v4->_backdropView);
    -[_UIBackdropView setUserInteractionEnabled:](v4->_backdropView, "setUserInteractionEnabled:", 1);
    -[_UIBackdropView contentView](v4->_backdropView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topSeparatorView = v4->_topSeparatorView;
    v4->_topSeparatorView = v8;

    v10 = v4->_topSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[_UIBackdropView contentView](v4->_backdropView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_topSeparatorView);

  }
  return v4;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardViewControllerFooterContainer;
  -[PKDashboardViewControllerFooterContainer _dynamicUserInterfaceTraitDidChange](&v4, sel__dynamicUserInterfaceTraitDidChange);
  v3 = -[PKDashboardViewControllerFooterContainer preferredBackdropStyle](self, "preferredBackdropStyle");
  if (self->_backdropStyle != v3)
  {
    self->_backdropStyle = v3;
    -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", v3);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKDashboardViewControllerFooterContainer layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewControllerFooterContainer;
  -[PKDashboardViewControllerFooterContainer layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardViewControllerFooterContainer bounds](self, "bounds");
  -[PKDashboardViewControllerFooterContainer layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 0);
}

- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxY;
  PKHorizontalScrollingFooterViewComparator *currentFooter;
  PKHorizontalScrollingFooterViewComparator *nextFooter;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKHorizontalScrollingFooterViewComparator sizeThatFits:](self->_currentFooter, "sizeThatFits:", a3.size.width, a3.size.height);
  v11 = v10;
  -[PKHorizontalScrollingFooterViewComparator sizeThatFits:](self->_nextFooter, "sizeThatFits:", width, height);
  v13 = fmax(fmax(v11, v12), 86.0);
  v18.origin.x = x;
  v18.origin.y = y + 0.0;
  v18.size.width = width;
  v18.size.height = v13;
  MaxY = CGRectGetMaxY(v18);
  if (!a4)
  {
    -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", x, y, width, height);
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, width, PKUIPixelLength() * 3.0);
    currentFooter = self->_currentFooter;
    if (currentFooter)
      -[PKHorizontalScrollingFooterViewComparator setFrame:](currentFooter, "setFrame:", x, y + 0.0, width, v13);
    nextFooter = self->_nextFooter;
    if (nextFooter)
      -[PKHorizontalScrollingFooterViewComparator setFrame:](nextFooter, "setFrame:", x, y + 0.0, width, v13);
  }
  return MaxY;
}

- (int64_t)preferredBackdropStyle
{
  void *v2;
  uint64_t v3;

  -[PKDashboardViewControllerFooterContainer traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    return 2030;
  else
    return 2010;
}

- (void)setTransitionProgress:(double)a3
{
  PKHorizontalScrollingFooterViewComparator *currentFooter;
  PKHorizontalScrollingFooterViewComparator **p_nextFooter;
  int v7;

  currentFooter = self->_currentFooter;
  if (currentFooter
    && (p_nextFooter = &self->_nextFooter, self->_nextFooter)
    && (v7 = -[PKHorizontalScrollingFooterViewComparator isEqualToFooter:](currentFooter, "isEqualToFooter:"),
        currentFooter = self->_currentFooter,
        v7))
  {
    -[PKHorizontalScrollingFooterViewComparator setAlpha:](currentFooter, "setAlpha:", 1.0);
    a3 = 0.0;
  }
  else
  {
    -[PKHorizontalScrollingFooterViewComparator setAlpha:](currentFooter, "setAlpha:", 1.0 - a3);
    p_nextFooter = &self->_nextFooter;
  }
  -[PKHorizontalScrollingFooterViewComparator setAlpha:](*p_nextFooter, "setAlpha:", a3);
}

- (void)setCurrentFooter:(id)a3
{
  PKHorizontalScrollingFooterViewComparator *v4;
  PKHorizontalScrollingFooterViewComparator *v5;
  PKHorizontalScrollingFooterViewComparator *currentFooter;
  BOOL v7;
  PKHorizontalScrollingFooterViewComparator *v8;
  void *v9;
  void *v10;

  v4 = (PKHorizontalScrollingFooterViewComparator *)a3;
  v5 = v4;
  currentFooter = self->_currentFooter;
  if (currentFooter)
    v7 = currentFooter == v4;
  else
    v7 = 1;
  if (!v7)
  {
    -[PKHorizontalScrollingFooterViewComparator removeFromSuperview](self->_currentFooter, "removeFromSuperview");
    currentFooter = self->_currentFooter;
  }
  self->_currentFooter = v5;
  v8 = v5;

  -[_UIBackdropView contentView](self->_backdropView, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_currentFooter);

  -[_UIBackdropView contentView](self->_backdropView, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", self->_currentFooter);

  -[PKDashboardViewControllerFooterContainer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNextFooter:(id)a3
{
  PKHorizontalScrollingFooterViewComparator *v4;
  PKHorizontalScrollingFooterViewComparator *v5;
  PKHorizontalScrollingFooterViewComparator *nextFooter;
  BOOL v7;
  PKHorizontalScrollingFooterViewComparator *v8;
  void *v9;
  void *v10;

  v4 = (PKHorizontalScrollingFooterViewComparator *)a3;
  v5 = v4;
  nextFooter = self->_nextFooter;
  if (nextFooter)
    v7 = nextFooter == v4;
  else
    v7 = 1;
  if (!v7)
  {
    -[PKHorizontalScrollingFooterViewComparator removeFromSuperview](self->_nextFooter, "removeFromSuperview");
    nextFooter = self->_nextFooter;
  }
  self->_nextFooter = v5;
  v8 = v5;

  -[_UIBackdropView contentView](self->_backdropView, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_nextFooter);

  -[_UIBackdropView contentView](self->_backdropView, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", self->_currentFooter);

  -[PKDashboardViewControllerFooterContainer setNeedsLayout](self, "setNeedsLayout");
}

- (PKHorizontalScrollingFooterViewComparator)currentFooter
{
  return self->_currentFooter;
}

- (PKHorizontalScrollingFooterViewComparator)nextFooter
{
  return self->_nextFooter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_nextFooter, 0);
  objc_storeStrong((id *)&self->_currentFooter, 0);
}

@end
