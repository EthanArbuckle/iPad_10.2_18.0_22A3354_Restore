@implementation _TVProductCollectionViewCell

- (id)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3 margins:(UIEdgeInsets)a4 show:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIView *v12;
  UIView **p_titleView;
  UIView *titleView;
  double v15;
  UIView *v16;

  v5 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12 = (UIView *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  v16 = v12;
  if (titleView != v12)
  {
    -[UIView removeFromSuperview](titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      -[_TVProductCollectionViewCell addSubview:](self, "addSubview:");
      v15 = 0.0;
      if (v5)
        v15 = 1.0;
      -[UIView setAlpha:](*p_titleView, "setAlpha:", v15);
      self->_activeMargins.top = top;
      self->_activeMargins.left = left;
      self->_activeMargins.bottom = bottom;
      self->_activeMargins.right = right;
    }
  }
  -[_TVProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)showTitleView:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  _QWORD v21[6];

  v3 = a3;
  -[UIView alpha](self->_titleView, "alpha");
  v6 = 0.0;
  if (v3)
    v7 = 1.0;
  else
    v7 = 0.0;
  if (self->_titleView)
    v8 = v5 == v7;
  else
    v8 = 1;
  if (!v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;

    if (v7 != 0.0)
      v6 = self->_activeMargins.top + 70.0 + self->_activeMargins.bottom;
    v17 = 0.2;
    if (v3)
      v17 = 0.3;
    v18 = 0.12;
    if (!v3)
      v18 = 0.0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __46___TVProductCollectionViewCell_showTitleView___block_invoke;
    v21[3] = &unk_24EB85540;
    v21[4] = self;
    *(double *)&v21[5] = v7;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2084, v21, 0, v17, v18);
    v19 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v12, v6, v14, v16);

  }
}

- (BOOL)isShowingTitleView
{
  double v2;

  -[UIView alpha](self->_titleView, "alpha");
  return v2 > 0.0;
}

- (void)enableWithMargins:(UIEdgeInsets)a3
{
  id WeakRetained;
  id v4;

  self->_activeMargins = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

}

- (void)disableMargins
{
  __int128 v2;
  id WeakRetained;
  id v4;

  v2 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  *(_OWORD *)&self->_activeMargins.top = *MEMORY[0x24BDF7718];
  *(_OWORD *)&self->_activeMargins.bottom = v2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
  -[_TVProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat left;
  CGFloat top;
  double v18;
  id WeakRetained;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat Width;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31.receiver = self;
  v31.super_class = (Class)_TVProductCollectionViewCell;
  -[_TVProductCollectionViewCell layoutSubviews](&v31, sel_layoutSubviews);
  -[_TVProductCollectionViewCell bounds](self, "bounds");
  v7 = v5;
  v8 = v6;
  if (self->_titleView)
  {
    v9 = v3;
    v10 = v4;
    v11 = CGRectGetWidth(*(CGRect *)&v3) - self->_activeMargins.left - self->_activeMargins.right;
    v30 = self->_activeMargins.top + self->_activeMargins.bottom;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v11, 70.0);
      v14 = v13;
      if (v11 >= v12)
        v11 = v12;
    }
    else
    {
      v14 = 70.0;
    }
    v26 = 70.0 - v14 + self->_activeMargins.top;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v26 + 14.0;
    v32.origin.x = v9;
    v32.origin.y = v10;
    v32.size.width = v7;
    v32.size.height = v8;
    -[UIView setFrame:](self->_titleView, "setFrame:", floor((CGRectGetWidth(v32) - v11) * 0.5), v26, v11, v14);
    -[UIView alpha](self->_titleView, "alpha");
    if (v27 == 0.0)
      v28 = 0.0;
    else
      v28 = v30 + 70.0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33.origin.x = v9;
    v33.origin.y = v10;
    v33.size.width = v7;
    v33.size.height = v8;
    Width = CGRectGetWidth(v33);
    v34.origin.x = v9;
    v34.origin.y = v10;
    v34.size.width = v7;
    v34.size.height = v8;
    v25 = CGRectGetHeight(v34) + -70.0 - v30;
    v22 = 0.0;
    v20 = v21;
    v23 = v28;
    v24 = Width;
  }
  else
  {
    v15 = v5 - self->_margins.left - self->_margins.right;
    top = self->_activeMargins.top;
    left = self->_activeMargins.left;
    v18 = v6 - self->_margins.top - self->_margins.bottom;
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = left;
    v23 = top;
    v24 = v15;
    v25 = v18;
  }
  objc_msgSend(v20, "setFrame:", v22, v23, v24, v25);

}

- (void)prepareForReuse
{
  UIView *titleView;
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVProductCollectionViewCell;
  -[_TVProductCollectionViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[_TVProductCollectionViewCell setViewController:](self, "setViewController:", 0);
  -[UIView removeFromSuperview](self->_titleView, "removeFromSuperview");
  titleView = self->_titleView;
  self->_titleView = 0;

  v4 = *MEMORY[0x24BDF7718];
  v5 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  *(_OWORD *)&self->_margins.top = *MEMORY[0x24BDF7718];
  *(_OWORD *)&self->_margins.bottom = v5;
  *(_OWORD *)&self->_partialMargins.top = v4;
  *(_OWORD *)&self->_partialMargins.bottom = v5;
  *(_OWORD *)&self->_activeMargins.top = v4;
  *(_OWORD *)&self->_activeMargins.bottom = v5;
  self->_marginActive = 0;
  -[_TVProductCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[_TVProductCollectionViewCell containsView:](self, "containsView:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[_TVProductCollectionViewCell viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "canBecomeFocused");

  }
  return v5;
}

- (id)preferredFocusEnvironments
{
  UIViewController **p_viewController;
  id WeakRetained;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[_TVProductCollectionViewCell layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_viewController);
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (UIEdgeInsets)partialMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_partialMargins.top;
  left = self->_partialMargins.left;
  bottom = self->_partialMargins.bottom;
  right = self->_partialMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPartialMargins:(UIEdgeInsets)a3
{
  self->_partialMargins = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
