@implementation SKUIViewControllerContainerCollectionViewCell

- (SKUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIViewControllerContainerCollectionViewCell *v8;
  SKUIViewControllerContainerCollectionViewCell *v9;
  void *v10;
  SKUIViewControllerContainerView *v11;
  uint64_t v12;
  SKUIViewControllerContainerView *viewControllerContainerView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewControllerContainerCollectionViewCell initWithFrame:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  v8 = -[SKUIViewControllerContainerCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_managesViewControllerContainerViewLayout = 1;
    -[SKUIViewControllerContainerCollectionViewCell setPreservesSuperviewLayoutMargins:](v8, "setPreservesSuperviewLayoutMargins:", 1);
    -[SKUIViewControllerContainerCollectionViewCell contentView](v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreservesSuperviewLayoutMargins:", 1);
    v11 = [SKUIViewControllerContainerView alloc];
    objc_msgSend(v10, "bounds");
    v12 = -[SKUIViewControllerContainerView initWithFrame:](v11, "initWithFrame:");
    viewControllerContainerView = v9->_viewControllerContainerView;
    v9->_viewControllerContainerView = (SKUIViewControllerContainerView *)v12;

    -[SKUIViewControllerContainerView setPreservesSuperviewLayoutMargins:](v9->_viewControllerContainerView, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v10, "addSubview:", v9->_viewControllerContainerView);

  }
  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  -[SKUIViewControllerContainerCollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  if (self->_managesViewControllerContainerViewLayout)
  {
    -[SKUIViewControllerContainerCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    if (self->_maximumContentWidth > 0.00000011920929)
    {
      -[SKUIViewControllerContainerCollectionViewCell traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayScale");
      v14 = v13;
      if (v13 <= 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scale");
        v14 = v16;

      }
      v23.origin.x = v5;
      v23.origin.y = v7;
      v23.size.width = v9;
      v23.size.height = v11;
      CGRectGetWidth(v23);
      v21 = v14;
      UIRectCenteredXInRectScale();
      v5 = v17;
      v7 = v18;
      v9 = v19;
      v11 = v20;

    }
    -[SKUIViewControllerContainerView setFrame:](self->_viewControllerContainerView, "setFrame:", v5, v7, v9, v11, *(_QWORD *)&v21);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  NSIndexPath *v5;
  NSIndexPath *indexPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  v4 = a3;
  -[SKUIViewControllerContainerCollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath", v7.receiver, v7.super_class);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  indexPath = self->_indexPath;
  self->_indexPath = v5;

}

- (void)setViewController:(id)a3
{
  -[SKUIViewControllerContainerView setViewController:](self->_viewControllerContainerView, "setViewController:", a3);
}

- (void)setMaximumContentWidth:(double)a3
{
  if (vabdd_f64(self->_maximumContentWidth, a3) > 0.00000011920929)
  {
    self->_maximumContentWidth = a3;
    -[SKUIViewControllerContainerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3
{
  if (self->_managesViewControllerContainerViewLayout != a3)
  {
    self->_managesViewControllerContainerViewLayout = a3;
    if (a3)
      -[SKUIViewControllerContainerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIViewController)viewController
{
  return -[SKUIViewControllerContainerView viewController](self->_viewControllerContainerView, "viewController");
}

- (UIView)viewControllerContainerView
{
  return (UIView *)self->_viewControllerContainerView;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (BOOL)managesViewControllerContainerViewLayout
{
  return self->_managesViewControllerContainerViewLayout;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_viewControllerContainerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewControllerContainerCollectionViewCell initWithFrame:]";
}

@end
