@implementation RouteAdvisoriesView

- (RouteAdvisoriesView)init
{
  RouteAdvisoriesView *v2;
  RouteAdvisoriesView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteAdvisoriesView;
  v2 = -[RouteAdvisoriesView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
    -[RouteAdvisoriesView setupSubViews](v2, "setupSubViews");
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteAdvisoriesView;
  -[RouteAdvisoriesView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView window](self, "window"));

  if (v3)
    -[RouteAdvisoriesView _logAnalyticsIfNeeded](self, "_logAnalyticsIfNeeded");
}

- (void)setupSubViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  _QWORD v29[4];

  v3 = objc_alloc_init((Class)UIStackView);
  -[RouteAdvisoriesView setAdvisoryStackView:](self, "setAdvisoryStackView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v5, "setAxis:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v6, "setAlignment:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v7, "setDistribution:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v8, "setSpacing:", 3.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  -[RouteAdvisoriesView addSubview:](self, "addSubview:", v11);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView leadingAnchor](self, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v29[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v29[1] = v21;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v29[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView bottomAnchor](self, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v29[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  -[RouteAdvisoriesView addConstraints:](self, "addConstraints:", v20);

}

- (void)setOverrideTextColor:(id)a3 isSelected:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  UIColor **p_overrideTextColor;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a4;
  v7 = a3;
  p_overrideTextColor = &self->_overrideTextColor;
  v9 = self->_overrideTextColor;
  v10 = (unint64_t)v7;
  if (v10 | v9
    && (v11 = objc_msgSend((id)v9, "isEqual:", v10), (id)v10, (id)v9, !v11)
    || self->_isSelected != v4)
  {
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    self->_isSelected = v4;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrangedSubviews"));

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), "setOverrideTextColor:", *p_overrideTextColor);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (BOOL)isVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)setAdvisories:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  NSArray *viewModels;
  id v10;
  unsigned __int8 v11;
  unint64_t v12;

  v7 = a3;
  v8 = a4;
  viewModels = self->_viewModels;
  v12 = (unint64_t)v7;
  v10 = viewModels;
  if (v12 | (unint64_t)v10)
  {
    v11 = objc_msgSend((id)v12, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModels, a3);
      objc_storeWeak((id *)&self->_coordinator, v8);
      self->_hasLoggedAdvisoryAnalytics = 0;
      -[RouteAdvisoriesView refreshContent](self, "refreshContent");
    }
  }

}

- (void)_logAnalyticsIfNeeded
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_hasLoggedAdvisoryAnalytics)
  {
    if (-[NSArray count](self->_viewModels, "count"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView window](self, "window"));

      if (v3)
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v4 = self->_viewModels;
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(_QWORD *)v14 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advisory", (_QWORD)v13));

              if (v10)
              {
                v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advisory"));
                objc_msgSend(v11, "captureUserAction:onTarget:forAdvisory:", 247, 504, v12);

              }
            }
            v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v6);
        }

        self->_hasLoggedAdvisoryAnalytics = 1;
      }
    }
  }
}

- (void)refreshContent
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  RouteAdvisoryView *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *obj;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id from;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id location;
  _BYTE v27[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_viewModels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v8 = -[RouteAdvisoryView initWithViewModel:]([RouteAdvisoryView alloc], "initWithViewModel:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handler"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handler"));
          -[RouteAdvisoryView setActionHandler:](v8, "setActionHandler:", v10);

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advisory"));
          v12 = objc_msgSend(v11, "isClickable");

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advisory"));
            -[RouteAdvisoryView setAlwaysClickable:](v8, "setAlwaysClickable:", 1);
            objc_initWeak(&from, v8);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_100A85A54;
            v17[3] = &unk_1011E1190;
            objc_copyWeak(&v19, &location);
            v14 = v13;
            v18 = v14;
            objc_copyWeak(&v20, &from);
            -[RouteAdvisoryView setActionHandler:](v8, "setActionHandler:", v17);
            objc_destroyWeak(&v20);

            objc_destroyWeak(&v19);
            objc_destroyWeak(&from);

            goto LABEL_11;
          }
        }
        -[RouteAdvisoryView setAlwaysClickable:](v8, "setAlwaysClickable:", v9 != 0);
LABEL_11:
        -[RouteAdvisoryView setOverrideTextColor:](v8, "setOverrideTextColor:", self->_overrideTextColor);
        objc_msgSend(v3, "addObject:", v8);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  -[RouteAdvisoriesView _logAnalyticsIfNeeded](self, "_logAnalyticsIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoriesView advisoryStackView](self, "advisoryStackView"));
  objc_msgSend(v15, "_maps_setArrangedSubviews:", v3);

  objc_destroyWeak(&location);
}

- (UIStackView)advisoryStackView
{
  return self->_advisoryStackView;
}

- (void)setAdvisoryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryStackView, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (ActionCoordinator)coordinator
{
  return (ActionCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_advisoryStackView, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
}

@end
