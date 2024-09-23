@implementation _UIIndexBarStaticScrollAccessory

- (void)setShowIndexBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIIndexBarAccessoryView *v6;
  UIView *v7;
  UIIndexBarAccessoryView *indexBarView;
  UIIndexBarAccessoryView *v9;
  UIView *containerView;
  UIView *v11;
  UIIndexBarAccessoryView *v12;
  UIView *v13;
  id v14;
  id v15;

  if (self->_showIndexBar != a3)
  {
    v3 = a3;
    self->_showIndexBar = a3;
    -[_UIStaticScrollBar setShouldInsetButtonsForIndex:](self, "setShouldInsetButtonsForIndex:");
    if (v3)
    {
      v14 = 0;
      v15 = 0;
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIIndexBarView makeIndexBarView:containerView:forTraits:](UIIndexBarAccessoryView, "makeIndexBarView:containerView:forTraits:", &v15, &v14, v5);
      v6 = (UIIndexBarAccessoryView *)v15;
      v7 = (UIView *)v14;

      indexBarView = self->_indexBarView;
      self->_indexBarView = v6;
      v9 = v6;

      containerView = self->_containerView;
      self->_containerView = v7;
      v11 = v7;

      -[UIView addSubview:](self, "addSubview:", self->_containerView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_containerView, "removeFromSuperview");
      v12 = self->_indexBarView;
      self->_indexBarView = 0;

      v13 = self->_containerView;
      self->_containerView = 0;

    }
  }
}

- (void)update
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  -[_UIStaticScrollBar update](&v3, sel_update);
  -[UIIndexBarAccessoryView update](self->_indexBarView, "update");
}

- (int64_t)desiredAccessoryEdge
{
  objc_super v4;

  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  return -[_UIStaticScrollBar desiredAccessoryEdge](&v4, sel_desiredAccessoryEdge);
}

- (void)layoutSubviews
{
  void *v3;
  double MinY;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  -[_UIStaticScrollBar layoutSubviews](&v11, sel_layoutSubviews);
  -[_UIStaticScrollBar downButton](self, "downButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MinY = CGRectGetMinY(v12);
  -[_UIStaticScrollBar upButton](self, "upButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = MinY - CGRectGetMaxY(v13);

  if (v6 <= 0.0)
    v6 = 64.0;
  -[_UIStaticScrollBar centeringBounds](self, "centeringBounds");
  -[UIView setFrame:](self->_containerView, "setFrame:", round(v8 + (v7 - v7) * 0.5), round(v10 + (v9 - v6) * 0.5));
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (BOOL)overlay
{
  return self->_overlay;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (BOOL)showIndexBar
{
  return self->_showIndexBar;
}

- (UIIndexBarAccessoryView)indexBarView
{
  return self->_indexBarView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_indexBarView, 0);
}

@end
