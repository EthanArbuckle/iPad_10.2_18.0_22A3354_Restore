@implementation RouteStepListView

- (RouteStepListView)initWithFrame:(CGRect)a3
{
  RouteStepListView *v3;
  UIView *v4;
  UIView *hairlineView;
  void *v6;
  void *v7;
  uint64_t v8;
  NSLayoutConstraint *hairlineLeadingConstraint;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *hairlineTrailingConstraint;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *hairlineHeightConstraint;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[4];

  v22.receiver = self;
  v22.super_class = (Class)RouteStepListView;
  v3 = -[RouteStepListView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(UIView);
    hairlineView = v3->_hairlineView;
    v3->_hairlineView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RouteStepListView addSubview:](v3, "addSubview:", v3->_hairlineView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_hairlineView, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView leadingAnchor](v3, "leadingAnchor"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    hairlineLeadingConstraint = v3->_hairlineLeadingConstraint;
    v3->_hairlineLeadingConstraint = (NSLayoutConstraint *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_hairlineView, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView trailingAnchor](v3, "trailingAnchor"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    hairlineTrailingConstraint = v3->_hairlineTrailingConstraint;
    v3->_hairlineTrailingConstraint = (NSLayoutConstraint *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3->_hairlineView, "heightAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 1.0));
    hairlineHeightConstraint = v3->_hairlineHeightConstraint;
    v3->_hairlineHeightConstraint = (NSLayoutConstraint *)v15;

    v23[0] = v3->_hairlineLeadingConstraint;
    v23[1] = v3->_hairlineTrailingConstraint;
    v23[2] = v3->_hairlineHeightConstraint;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_hairlineView, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView bottomAnchor](v3, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v23[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

    -[RouteStepListView _updateHairline](v3, "_updateHairline");
  }
  return v3;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;

  v3 = sub_1004318FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass should override")));
    v9 = 136315906;
    v10 = "-[RouteStepListView setShouldUseTextToBottomConstraint:]";
    v11 = 2080;
    v12 = "RouteStepListCell.m";
    v13 = 1024;
    v14 = 54;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v9, 0x26u);

  }
  if (sub_100A70734())
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (BOOL)shouldUseTextToBottomConstraint
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass should override")));
    v9 = 136315906;
    v10 = "-[RouteStepListView shouldUseTextToBottomConstraint]";
    v11 = 2080;
    v12 = "RouteStepListCell.m";
    v13 = 1024;
    v14 = 60;
    v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v9, 0x26u);

  }
  if (sub_100A70734())
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

    }
  }
  return 0;
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  v5 = sub_1004318FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass should override")));
    v12 = 136315906;
    v13 = "+[RouteStepListView heightForItem:width:maximumHeight:]";
    v14 = 2080;
    v15 = "RouteStepListCell.m";
    v16 = 1024;
    v17 = 66;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v12, 0x26u);

  }
  if (sub_100A70734())
  {
    v8 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

    }
  }
  return 0.0;
}

- (void)setItem:(id)a3
{
  RouteStepItem *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  RouteStepItem *v10;

  v5 = (RouteStepItem *)a3;
  if (self->_item != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    if (v10)
      v6 = -[RouteStepItem showsHairline](v10, "showsHairline") ^ 1;
    else
      v6 = 1;
    -[UIView setHidden:](self->_hairlineView, "setHidden:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v10, "metrics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hairlineColor"));
    -[UIView setBackgroundColor:](self->_hairlineView, "setBackgroundColor:", v8);

    -[RouteStepItem hairlineLeadingInset](v10, "hairlineLeadingInset");
    -[NSLayoutConstraint setConstant:](self->_hairlineLeadingConstraint, "setConstant:");
    -[RouteStepItem hairlineTrailingInset](v10, "hairlineTrailingInset");
    -[NSLayoutConstraint setConstant:](self->_hairlineTrailingConstraint, "setConstant:", -v9);
    v5 = v10;
  }

}

- (void)_updateHairline
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self->_hairlineView, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = 1.0;
  if (v5 > 0.0)
    v6 = 1.0 / v5;
  -[NSLayoutConstraint setConstant:](self->_hairlineHeightConstraint, "setConstant:", v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RouteStepListView;
  v4 = a3;
  -[RouteStepListView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
    -[RouteStepListView _updateHairline](self, "_updateHairline");
}

- (RouteStepItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_hairlineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end
