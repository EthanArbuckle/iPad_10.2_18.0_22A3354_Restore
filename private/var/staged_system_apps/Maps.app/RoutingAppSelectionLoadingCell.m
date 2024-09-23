@implementation RoutingAppSelectionLoadingCell

- (RoutingAppSelectionLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[RoutingAppSelectionLoadingCell initWithMode:reuseIdentifier:](self, "initWithMode:reuseIdentifier:", 0, a4);
}

- (RoutingAppSelectionLoadingCell)initWithMode:(unint64_t)a3 reuseIdentifier:(id)a4
{
  RoutingAppSelectionLoadingCell *v5;
  RoutingAppSelectionLoadingCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  void *v16;

  v15.receiver = self;
  v15.super_class = (Class)RoutingAppSelectionLoadingCell;
  v5 = -[RoutingAppSelectionLoadingCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_mode = a3;
    -[RoutingAppSelectionLoadingCell _configureViewsForMode:](v5, "_configureViewsForMode:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RoutingAppSelectionLoadingCell setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](v6, "contentView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[RoutingAppSelectionLoadingCell setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](v6, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToConstant:", 50.0));
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  return v6;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[RoutingAppSelectionLoadingCell _configureViewsForMode:](self, "_configureViewsForMode:");
  }
}

- (void)_configureViewsForMode:(unint64_t)a3
{
  LoadingModeView *v4;
  void *v5;
  void *v6;
  LoadingModeView *v7;
  LoadingModeView *loadingView;
  void *v9;
  LoadingModeView *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *noAppsLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];

  if (a3 == 1)
  {
    if (!self->_noAppsLabel)
    {
      v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      noAppsLabel = self->_noAppsLabel;
      self->_noAppsLabel = v15;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noAppsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
      -[UILabel setFont:](self->_noAppsLabel, "setFont:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("No Matches for Routing Apps"), CFSTR("localized string not found"), 0));
      -[UILabel setText:](self->_noAppsLabel, "setText:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_noAppsLabel, "setTextColor:", v20);

    }
    -[LoadingModeView removeFromSuperview](self->_loadingView, "removeFromSuperview");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    objc_msgSend(v21, "addSubview:", self->_noAppsLabel);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_noAppsLabel, "topAnchor"));
    v39 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v40[0] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_noAppsLabel, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 16.0));
    v40[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_noAppsLabel, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v40[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_noAppsLabel, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 16.0));
    v40[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  }
  else if (!a3)
  {
    if (!self->_loadingView)
    {
      v4 = [LoadingModeView alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Loading Text for Routing Apps"), CFSTR("localized string not found"), 0));
      v7 = -[LoadingModeView initWithTitle:axis:](v4, "initWithTitle:axis:", v6, 0);
      loadingView = self->_loadingView;
      self->_loadingView = v7;

      -[LoadingModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    -[UILabel removeFromSuperview](self->_noAppsLabel, "removeFromSuperview");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    objc_msgSend(v9, "addSubview:", self->_loadingView);

    v10 = self->_loadingView;
    v11 = objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionLoadingCell contentView](self, "contentView"));
    LODWORD(v12) = 1148846080;
    v38 = (id)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView _maps_constraintsEqualToEdgesOfView:priority:](v10, "_maps_constraintsEqualToEdgesOfView:priority:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_noAppsLabel, 0);
}

@end
