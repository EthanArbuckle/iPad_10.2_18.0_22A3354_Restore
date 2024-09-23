@implementation VUILibraryCollectionViewCell

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_viewController, a3);
    -[VUILibraryCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_viewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[VUILibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setTopSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView **p_topSeparatorView;
  VUISeparatorView *topSeparatorView;
  void *v8;
  VUISeparatorView *v9;

  v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v9 = v5;
    -[VUISeparatorView removeFromSuperview](topSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      -[VUILibraryCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_topSeparatorView);

    }
    -[VUILibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  VUISeparatorView *topSeparatorView;
  double v17;
  double v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)VUILibraryCollectionViewCell;
  -[VUILibraryCollectionViewCell layoutSubviews](&v20, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v4 = v3;
  v6 = v5;
  -[VUILibraryCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView)
  {
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v21) - v4 - v6, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v4, 0.0, v17, v18);
  }
  -[UIViewController view](self->_viewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);

}

- (void)prepareForReuse
{
  UIViewController *viewController;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryCollectionViewCell;
  -[VUILibraryCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  viewController = self->_viewController;
  self->_viewController = 0;

  -[VUILibraryCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
