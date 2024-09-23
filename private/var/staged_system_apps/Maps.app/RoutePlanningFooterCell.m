@implementation RoutePlanningFooterCell

- (RoutePlanningFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RoutePlanningFooterCell *v4;
  void *v5;
  void *v6;
  void *v7;
  RoutePlanningFooterView *v8;
  void *v9;
  RoutePlanningFooterView *v10;
  RoutePlanningFooterView *footerView;
  void *v12;
  RoutePlanningFooterView *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningFooterCell;
  v4 = -[RoutePlanningFooterCell initWithStyle:reuseIdentifier:](&v19, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RoutePlanningFooterCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell contentView](v4, "contentView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = [RoutePlanningFooterView alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell contentView](v4, "contentView"));
    objc_msgSend(v9, "bounds");
    v10 = -[RoutePlanningFooterView initWithFrame:](v8, "initWithFrame:");
    footerView = v4->_footerView;
    v4->_footerView = v10;

    -[RoutePlanningFooterView setTranslatesAutoresizingMaskIntoConstraints:](v4->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v4->_footerView);

    v13 = v4->_footerView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell contentView](v4, "contentView"));
    LODWORD(v15) = 1148846080;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView _maps_constraintsEqualToEdgesOfView:priority:](v13, "_maps_constraintsEqualToEdgesOfView:priority:", v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
  return v4;
}

- (RoutePlanningFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
