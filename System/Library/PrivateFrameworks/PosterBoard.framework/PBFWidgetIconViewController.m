@implementation PBFWidgetIconViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFWidgetIconViewController;
  -[PBFWidgetIconViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PBFWidgetIconViewController iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFWidgetIconViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)setIconImageView:(id)a3
{
  UIImageView *v4;
  UIImageView *iconImageView;
  UIImageView *v6;
  id v7;

  v4 = (UIImageView *)a3;
  -[UIImageView removeFromSuperview](self->_iconImageView, "removeFromSuperview");
  iconImageView = self->_iconImageView;
  self->_iconImageView = v4;
  v6 = v4;

  -[PBFWidgetIconViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_iconImageView);

}

- (BOOL)wantsLabelHidden
{
  return 1;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  self->_iconImageInfo.size.width = v3;
  self->_iconImageInfo.size.height = v4;
  self->_iconImageInfo.scale = v5;
  self->_iconImageInfo.continuousCornerRadius = v6;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
