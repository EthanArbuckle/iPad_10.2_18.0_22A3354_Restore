@implementation _TVRelatedContentShelfView

- (_TVRelatedContentShelfView)initWithFrame:(CGRect)a3
{
  _TVRelatedContentShelfView *v3;
  _TVRelatedWrappingView *v4;
  uint64_t v5;
  _TVRelatedWrappingView *relatedWrappingView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVRelatedContentShelfView;
  v3 = -[_TVRelatedContentShelfView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVRelatedWrappingView alloc];
    v5 = -[_TVFocusRedirectView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    relatedWrappingView = v3->_relatedWrappingView;
    v3->_relatedWrappingView = (_TVRelatedWrappingView *)v5;

    -[_TVRelatedContentShelfView addSubview:](v3, "addSubview:", v3->_relatedWrappingView);
  }
  return v3;
}

- (void)setShelfView:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_shelfView);
    objc_msgSend(v5, "removeFromSuperview");

    v6 = objc_storeWeak((id *)&self->_shelfView, obj);
    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_shelfView);
      -[_TVRelatedContentShelfView addSubview:](self, "addSubview:", v7);

    }
  }
  -[_TVRelatedContentShelfView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setRelatedView:(id)a3
{
  UIView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  double v13;
  void *v14;
  UIView *v15;

  v5 = (UIView *)a3;
  if (self->_relatedView != v5)
  {
    v15 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView containerGuide](v15, "containerGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 0);

    }
    objc_storeStrong((id *)&self->_relatedView, a3);
    if (self->_relatedView)
    {
      -[_TVRelatedContentShelfView bounds](self, "bounds");
      v8 = v7;
      v10 = v9;
      WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
      objc_msgSend(WeakRetained, "bounds");
      v13 = v12;

      if (v8 <= 0.0 || v10 <= 0.0 || v13 <= 0.0)
        -[_TVRelatedContentShelfView setNeedsLayout](self, "setNeedsLayout");
      else
        -[_TVRelatedContentShelfView _layoutRelatedView](self, "_layoutRelatedView");
    }
    else
    {
      -[_TVRelatedWrappingView relatedView](self->_relatedWrappingView, "relatedView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      -[_TVRelatedWrappingView setRelatedView:](self->_relatedWrappingView, "setRelatedView:", 0);
    }
    v5 = v15;
  }

}

- (id)preferredFocusEnvironments
{
  UIView *lastFocusedView;
  UIView *WeakRetained;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  lastFocusedView = self->_lastFocusedView;
  if (lastFocusedView)
  {
    WeakRetained = lastFocusedView;
  }
  else
  {
    WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_shelfView);
    if (!WeakRetained)
      return 0;
  }
  v6[0] = WeakRetained;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  int v9;
  UIView *v10;
  UIView *lastFocusedView;
  UIView *relatedView;
  UIView *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusedView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_shelfView);
    v9 = objc_msgSend(v8, "isDescendantOfView:", v14);

    if (v9)
    {
      v10 = (UIView *)objc_loadWeakRetained((id *)&self->_shelfView);
      lastFocusedView = self->_lastFocusedView;
      self->_lastFocusedView = v10;
LABEL_7:

      goto LABEL_8;
    }
  }
  relatedView = self->_relatedView;
  if (relatedView && -[UIView isDescendantOfView:](relatedView, "isDescendantOfView:", v14))
  {
    v13 = self->_relatedView;
    lastFocusedView = self->_lastFocusedView;
    self->_lastFocusedView = v13;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  UIView *relatedView;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TVRelatedContentShelfView;
  -[_TVRelatedContentShelfView layoutSubviews](&v15, sel_layoutSubviews);
  -[_TVRelatedContentShelfView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(WeakRetained, "sizeThatFits:", v4, v6);
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);

  relatedView = self->_relatedView;
  if (relatedView)
  {
    -[UIView superview](relatedView, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[_TVRelatedContentShelfView _layoutRelatedView](self, "_layoutRelatedView");
  }
}

- (void)_layoutRelatedView
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double Width;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _TVRelatedContentShelfView *v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[_TVRelatedContentShelfView bounds](self, "bounds");
  v40 = v4;
  v41 = v3;
  v38 = v6;
  v39 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(WeakRetained, "bounds");
  v9 = v8;

  -[_TVRelatedWrappingView relatedView](self->_relatedWrappingView, "relatedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRelatedWrappingView setRelatedView:](self->_relatedWrappingView, "setRelatedView:", self->_relatedView);
  -[_TVFocusRedirectView containerGuide](self->_relatedWrappingView, "containerGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 1);

  -[_TVRelatedWrappingView addSubview:](self->_relatedWrappingView, "addSubview:", self->_relatedView);
  if (v10)
  {
    -[UIView setAlpha:](self->_relatedView, "setAlpha:", 0.0);
    v12 = (void *)MEMORY[0x24BDF6F90];
    v13 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke;
    v44[3] = &unk_24EB848C0;
    v45 = v10;
    v46 = self;
    v42[0] = v13;
    v42[1] = 3221225472;
    v42[2] = __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke_2;
    v42[3] = &unk_24EB85A38;
    v43 = v45;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 5244932, v44, v42, 0.3, 0.0);

  }
  -[UIView tv_itemWidth](self->_relatedView, "tv_itemWidth");
  v15 = v14;
  -[UIView tv_maxHeight](self->_relatedView, "tv_maxHeight");
  v17 = v16;
  -[UIView tv_margin](self->_relatedView, "tv_margin");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v36 = v24;
  v25 = MEMORY[0x24BDBF090];
  v26 = *MEMORY[0x24BDBF090];
  v27 = v9 + v18;
  v47.origin.y = v40;
  v47.origin.x = v41;
  v47.size.height = v38;
  v47.size.width = v39;
  Width = CGRectGetWidth(v47);
  v29 = fmin(v17, self->_relatedHeight - v23 - v19);
  if (v17 <= 0.0)
    v30 = self->_relatedHeight - v23 - v19;
  else
    v30 = v29;
  -[_TVRelatedWrappingView setFrame:](self->_relatedWrappingView, "setFrame:", v26, v27, Width, v30, v36);
  v31 = -[_TVRelatedContentShelfView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v15 == 0.0)
  {
    v48.origin.x = v26;
    v48.origin.y = v27;
    v48.size.width = Width;
    v48.size.height = v30;
    v15 = CGRectGetWidth(v48) - v21 - v37;
  }
  v32 = *(double *)(v25 + 8);
  if (v31 == 1)
  {
    v49.origin.y = v40;
    v49.origin.x = v41;
    v49.size.height = v38;
    v49.size.width = v39;
    v33 = CGRectGetWidth(v49);
    v50.origin.x = v26;
    v50.origin.y = v32;
    v50.size.width = v15;
    v50.size.height = v30;
    v21 = v33 - CGRectGetWidth(v50) - v37;
  }
  -[UIView setFrame:](self->_relatedView, "setFrame:", v21, v32, v15, v30);
  v51.origin.x = v26;
  v51.origin.y = v27;
  v51.size.width = Width;
  v51.size.height = v30;
  v34 = CGRectGetWidth(v51);
  -[_TVFocusRedirectView containerGuide](self->_relatedWrappingView, "containerGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_setManualLayoutFrame:", 0.0, v32, v34, v30);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v10 + self->_relatedHeight;
  v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (UIView)shelfView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_shelfView);
}

- (UIView)relatedView
{
  return self->_relatedView;
}

- (double)relatedHeight
{
  return self->_relatedHeight;
}

- (void)setRelatedHeight:(double)a3
{
  self->_relatedHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedView, 0);
  objc_destroyWeak((id *)&self->_shelfView);
  objc_storeStrong((id *)&self->_relatedWrappingView, 0);
  objc_storeStrong((id *)&self->_lastFocusedView, 0);
}

@end
