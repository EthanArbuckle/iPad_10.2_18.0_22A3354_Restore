@implementation CarAdvisoriesView

- (CarAdvisoriesView)initWithFrame:(CGRect)a3
{
  CarAdvisoriesView *v3;
  CarAdvisoriesView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarAdvisoriesView;
  v3 = -[CarAdvisoriesView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarAdvisoriesView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarAdvisoriesView"));
    -[CarAdvisoriesView _setupViews](v4, "_setupViews");
  }
  return v4;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_advisoriesStackView, "arrangedSubviews"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)_setupViews
{
  UIStackView *v3;
  UIStackView *advisoriesStackView;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  advisoriesStackView = self->_advisoriesStackView;
  self->_advisoriesStackView = v3;

  -[UIStackView setAccessibilityIdentifier:](self->_advisoriesStackView, "setAccessibilityIdentifier:", CFSTR("AdvisoriesStackView"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoriesStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_advisoriesStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_advisoriesStackView, "setAlignment:", 0);
  -[UIStackView setDistribution:](self->_advisoriesStackView, "setDistribution:", 2);
  -[UIStackView setSpacing:](self->_advisoriesStackView, "setSpacing:", 3.0);
  -[UIStackView setClipsToBounds:](self->_advisoriesStackView, "setClipsToBounds:", 1);
  LODWORD(v5) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_advisoriesStackView, "setContentHuggingPriority:forAxis:", 1, v5);
  -[CarAdvisoriesView addSubview:](self, "addSubview:", self->_advisoriesStackView);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_advisoriesStackView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v19[0] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_advisoriesStackView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v6));
  v19[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_advisoriesStackView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v19[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_advisoriesStackView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v19[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));
  -[CarAdvisoriesView addConstraints:](self, "addConstraints:", v14);

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *v6;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[CarAdvisoriesView refreshContent](self, "refreshContent");
    v5 = v6;
  }

}

- (void)refreshContent
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIStackView *advisoriesStackView;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute advisories](self->_route, "advisories"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A1E394;
  v9[3] = &unk_1011DFCA0;
  v9[4] = self;
  v4 = sub_10039DCD4(v3, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if ((unint64_t)objc_msgSend(v5, "count") > 3)
    v6 = 4;
  else
    v6 = (uint64_t)objc_msgSend(v5, "count");
  advisoriesStackView = self->_advisoriesStackView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 0, v6));
  -[UIStackView _maps_setArrangedSubviews:](advisoriesStackView, "_maps_setArrangedSubviews:", v8);

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_advisoriesStackView, 0);
}

@end
