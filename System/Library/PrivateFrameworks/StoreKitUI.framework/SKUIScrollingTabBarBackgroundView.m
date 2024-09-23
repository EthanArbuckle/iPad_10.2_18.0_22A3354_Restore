@implementation SKUIScrollingTabBarBackgroundView

- (void)layoutSubviews
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarBackgroundView layoutSubviews]";
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabBarBackgroundView;
  v4 = a3;
  -[SKUIScrollingTabBarBackgroundView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[SKUIScrollingTabBarBackgroundView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
    -[SKUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackdropBarGroupName:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *backdropBarGroupName;
  _UIBackdropView *backdropView;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_backdropBarGroupName != v4)
  {
    v9 = v4;
    v6 = (NSString *)-[NSString copy](v4, "copy");
    backdropBarGroupName = self->_backdropBarGroupName;
    self->_backdropBarGroupName = v6;

    v5 = v9;
    backdropView = self->_backdropView;
    if (backdropView)
    {
      -[_UIBackdropView setGroupName:](backdropView, "setGroupName:", v9);
      v5 = v9;
    }
  }

}

- (void)setShowsBackdrop:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  _UIBackdropView *v6;
  _UIBackdropView *backdropView;

  if (self->_showsBackdrop != a3)
  {
    self->_showsBackdrop = a3;
    if (a3)
    {
      if (self->_backdropView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x1E0DC4028]);
        -[SKUIScrollingTabBarBackgroundView bounds](self, "bounds");
        v6 = (_UIBackdropView *)objc_msgSend(v5, "initWithFrame:privateStyle:", 2010);
        backdropView = self->_backdropView;
        self->_backdropView = v6;

        -[_UIBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
        if (self->_backdropBarGroupName)
          -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");
        -[SKUIScrollingTabBarBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);
        -[SKUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsBackdrop;
      }
    }
    else
    {
      v4 = 1;
    }
    -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", v4);
  }
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  UIView *v6;
  UIView *bottomHairlineView;
  UIView *v8;
  void *v9;

  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    if (a3)
    {
      if (self->_bottomHairlineView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        bottomHairlineView = self->_bottomHairlineView;
        self->_bottomHairlineView = v6;

        v8 = self->_bottomHairlineView;
        objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

        -[UIView setUserInteractionEnabled:](self->_bottomHairlineView, "setUserInteractionEnabled:", 0);
        -[SKUIScrollingTabBarBackgroundView addSubview:](self, "addSubview:", self->_bottomHairlineView);
        -[SKUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsBottomHairline;
      }
    }
    else
    {
      v4 = 1;
    }
    -[UIView setHidden:](self->_bottomHairlineView, "setHidden:", v4);
  }
}

- (void)setShowsTopHairline:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  UIView *v6;
  UIView *topHairlineView;

  if (self->_showsTopHairline != a3)
  {
    self->_showsTopHairline = a3;
    if (a3)
    {
      if (self->_topHairlineView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        topHairlineView = self->_topHairlineView;
        self->_topHairlineView = v6;

        -[UIView setUserInteractionEnabled:](self->_topHairlineView, "setUserInteractionEnabled:", 0);
        -[SKUIScrollingTabBarBackgroundView _updateTopHairlineColor](self, "_updateTopHairlineColor");
        -[SKUIScrollingTabBarBackgroundView addSubview:](self, "addSubview:", self->_topHairlineView);
        -[SKUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsTopHairline;
      }
    }
    else
    {
      v4 = 1;
    }
    -[UIView setHidden:](self->_topHairlineView, "setHidden:", v4);
  }
}

- (void)setUsesOpaqueColorForTopHairline:(BOOL)a3
{
  if (self->_usesOpaqueColorForTopHairline != a3)
  {
    self->_usesOpaqueColorForTopHairline = a3;
    -[SKUIScrollingTabBarBackgroundView _updateTopHairlineColor](self, "_updateTopHairlineColor");
  }
}

- (void)_updateTopHairlineColor
{
  id v3;

  if (self->_usesOpaqueColorForTopHairline)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.615686275, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topHairlineView, "setBackgroundColor:", v3);

}

- (NSString)backdropBarGroupName
{
  return self->_backdropBarGroupName;
}

- (BOOL)showsBackdrop
{
  return self->_showsBackdrop;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (BOOL)showsTopHairline
{
  return self->_showsTopHairline;
}

- (BOOL)usesOpaqueColorForTopHairline
{
  return self->_usesOpaqueColorForTopHairline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropBarGroupName, 0);
  objc_storeStrong((id *)&self->_topHairlineView, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
