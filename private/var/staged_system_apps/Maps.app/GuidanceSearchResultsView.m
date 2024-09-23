@implementation GuidanceSearchResultsView

- (GuidanceSearchResultsView)initWithFrame:(CGRect)a3
{
  GuidanceSearchResultsView *v3;
  void *v4;
  MapsThemeTableView *v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *activityIndicatorView;
  void *v17;
  void *v18;
  void *v19;
  UILayoutGuide *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UILayoutGuide *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;
  _QWORD v68[11];

  v67.receiver = self;
  v67.super_class = (Class)GuidanceSearchResultsView;
  v3 = -[GuidanceSearchResultsView initWithFrame:](&v67, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[GuidanceSearchResultsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[GuidanceSearchResultsView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("GuidanceSearchResultsView"));
    v5 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v3->_tableView;
    v3->_tableView = &v5->super;

    -[UITableView setAccessibilityIdentifier:](v3->_tableView, "setAccessibilityIdentifier:", CFSTR("GuidanceSearchResultsTable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView backgroundColor](v3, "backgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v10, "setShowsVerticalScrollIndicator:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v11, "setCellLayoutMarginsFollowReadableWidth:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v12, "setRowHeight:", 80.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    objc_msgSend(v13, "setPreservesSuperviewLayoutMargins:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    -[GuidanceSearchResultsView addSubview:](v3, "addSubview:", v14);

    v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    objc_msgSend(v18, "setHidesWhenStopped:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    -[GuidanceSearchResultsView addSubview:](v3, "addSubview:", v19);

    v20 = objc_opt_new(UILayoutGuide);
    -[GuidanceSearchResultsView addLayoutGuide:](v3, "addLayoutGuide:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v20, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23));

    LODWORD(v24) = 1148846080;
    objc_msgSend(v66, "setPriority:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v20, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));

    LODWORD(v29) = 1144750080;
    v46 = v28;
    objc_msgSend(v28, "setPriority:", v29);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView leadingAnchor](v3, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
    v68[0] = v62;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView topAnchor](v3, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
    v68[1] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView trailingAnchor](v3, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v68[2] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](v3, "tableView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView bottomAnchor](v3, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v68[3] = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v20, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView leadingAnchor](v3, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v68[4] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v20, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView trailingAnchor](v3, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v68[5] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v20, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView topAnchor](v3, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v68[6] = v30;
    v49 = v20;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v20, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView bottomAnchor](v3, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v68[7] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](v3, "activityIndicatorView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v20, "centerXAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
    v68[8] = v37;
    v68[9] = v66;
    v68[10] = v28;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

  }
  return v3;
}

- (void)updateTheme
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultsView;
  -[MapsThemeView updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView theme](self, "theme"));
  v4 = objc_msgSend(v3, "activityIndicatorStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v5, "setActivityIndicatorViewStyle:", v4);

}

- (void)setLoading:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_loading != a3)
  {
    v3 = a3;
    self->_loading = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView tableView](self, "tableView"));
    objc_msgSend(v5, "setHidden:", v3);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsView activityIndicatorView](self, "activityIndicatorView"));
    v7 = v6;
    if (v3)
      objc_msgSend(v6, "startAnimating");
    else
      objc_msgSend(v6, "stopAnimating");

  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
