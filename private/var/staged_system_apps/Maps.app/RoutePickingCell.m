@implementation RoutePickingCell

- (RoutePickingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RoutePickingCell *v4;
  RoutePickingCell *v5;
  void *v6;
  RoutePickingCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RoutePickingCell;
  v4 = -[CenteredTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CenteredTableViewCell setMinimumHorizontalMargins:](v4, "setMinimumHorizontalMargins:", 0.0, 16.0, 0.0, 16.0);
    -[RoutePickingCell _createSubviews](v5, "_createSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePickingCell _autolayoutConstraints](v5, "_autolayoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

    v7 = v5;
  }

  return v5;
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RoutePickingCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[RoutePickingCell setOpaque:](self, "setOpaque:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePickingCell contentView](self, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePickingCell contentView](self, "contentView"));
  objc_msgSend(v6, "setOpaque:", 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[RoutingAppearanceManager customGrayBlurCellBackgroundView](RoutingAppearanceManager, "customGrayBlurCellBackgroundView"));
  -[RoutePickingCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);

}

- (id)_autolayoutConstraints
{
  return +[NSMutableArray array](NSMutableArray, "array");
}

@end
