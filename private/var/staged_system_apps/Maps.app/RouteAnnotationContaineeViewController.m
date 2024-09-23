@implementation RouteAnnotationContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRouteAnnotation:(id)a3
{
  VKRouteAnnotation *v5;
  VKRouteAnnotation *v6;

  v5 = (VKRouteAnnotation *)a3;
  if (self->_routeAnnotation != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_routeAnnotation, a3);
    -[RouteAnnotationContaineeViewController _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  void *v52;
  _QWORD v53[7];

  v51.receiver = self;
  v51.super_class = (Class)RouteAnnotationContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v51, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RouteAnnotationContaineeViewController setHeaderView:](self, "setHeaderView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  v50 = v3;
  objc_msgSend(v3, "addSubview:", v7);

  v8 = objc_alloc((Class)UITableView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  v10 = objc_msgSend(v8, "initWithFrame:style:", 0);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setDataSource:", self);
  objc_msgSend(v10, "setAllowsSelection:", 0);
  objc_msgSend(v10, "setBackgroundView:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "setSeparatorStyle:", 0);
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(RouteAnnotationCell), CFSTR("Cell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", v10);

  -[RouteAnnotationContaineeViewController setTableView:](self, "setTableView:", v10);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v53[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v53[1] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v53[2] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v53[3] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v53[4] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v14));
  v53[5] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v53[6] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  if (sub_1002A8AA0(self) == 5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 0.0));
    v52 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    self->_didStartObservingTableViewContentSize = 1;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, &unk_1014D39F0);

  }
  -[RouteAnnotationContaineeViewController _updateContent](self, "_updateContent");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_didStartObservingTableViewContentSize)
  {
    self->_didStartObservingTableViewContentSize = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), &unk_1014D39F0);

  }
  v4.receiver = self;
  v4.super_class = (Class)RouteAnnotationContaineeViewController;
  -[RouteAnnotationContaineeViewController dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &unk_1014D39F0)
  {
    -[RouteAnnotationContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)RouteAnnotationContaineeViewController;
    -[RouteAnnotationContaineeViewController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updateContent
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation"));
  if (v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController infoCard](self, "infoCard"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v3));
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v7, "setTitle:", v6);

  if (v5)
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

  -[RouteAnnotationContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (sub_1002A8AA0(self) == 5)
  {
    -[RouteAnnotationContaineeViewController preferredContentSize](self, "preferredContentSize");
    v4 = v3;
    v6 = v5;
    -[RouteAnnotationContaineeViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
    if (v4 != v8 || v6 != v7)
      -[RouteAnnotationContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (CGSize)calculatePreferredContentSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  v3 = 0x4071A00000000000;
  if (-[RouteAnnotationContaineeViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = 0x4071A00000000000;
    if (sub_1002A8AA0(self) == 5)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController view](self, "view"));
      objc_msgSend(v4, "layoutIfNeeded");

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController tableView](self, "tableView"));
      objc_msgSend(v5, "contentSize");
      v3 = v6;

    }
  }
  v7 = 282.0;
  v8 = *(double *)&v3;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateContentInCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (v20)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation"));

    if (v4)
    {
      -[RouteAnnotationContaineeViewController _updateImageInCell:](self, "_updateImageInCell:", v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController infoCard](self, "infoCard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detail"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "detailsLabel"));
      objc_msgSend(v8, "setText:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController infoCard](self, "infoCard"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataLabel"));
      objc_msgSend(v12, "setText:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
      v15 = objc_msgSend(v14, "length") == 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataLabel"));
      objc_msgSend(v16, "setHidden:", v15);

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "iconImageView"));
      objc_msgSend(v17, "setImage:", 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "detailsLabel"));
      objc_msgSend(v18, "setText:", 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataLabel"));
      objc_msgSend(v19, "setText:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataLabel"));
      objc_msgSend(v13, "setHidden:", 1);
    }

  }
}

- (void)_updateImageInCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "styleAttributes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForRouteAnnotationWithAttributes:](GEOFeatureStyleAttributes, "styleAttributesForRouteAnnotationWithAttributes:", v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController traitCollection](self, "traitCollection"));
      objc_msgSend(v9, "displayScale");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController traitCollection](self, "traitCollection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:nightMode:", v8, 4, 0, 0, objc_msgSend(v12, "userInterfaceStyle") == (id)2, v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "iconImageView"));
      objc_msgSend(v14, "setImage:", v13);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "iconImageView"));
      objc_msgSend(v8, "setImage:", 0);
    }

    v4 = v15;
  }

}

- (void)updateTheme
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteAnnotationContaineeViewController;
  -[MapsThemeViewController updateTheme](&v4, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (GEOMiniCard)infoCard
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infoCard"));

  return (GEOMiniCard *)v3;
}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteAnnotationContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v5, "setHairLineAlpha:", a3);

}

- (void)handleDismissAction:(id)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteAnnotationContaineeViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController dismissHandler](self, "dismissHandler"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController dismissHandler](self, "dismissHandler"));
    v5[2]();

  }
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double result;
  void *v10;
  double v11;
  CGRect v12;

  if (a3 == 2)
  {
    sub_1005EC2E4();
  }
  else
  {
    if (a3 == 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v4, "bottomSafeOffset");
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController headerView](self, "headerView"));
      objc_msgSend(v7, "frame");
      v8 = v6 + CGRectGetHeight(v12);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "availableHeight");
      v8 = v11;

    }
    return v8;
  }
  return result;
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationContaineeViewController routeAnnotation](self, "routeAnnotation", a3, a4));
  v5 = v4 != 0;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), a4));
  -[RouteAnnotationContaineeViewController _updateContentInCell:](self, "_updateContentInCell:", v5);
  return v5;
}

- (VKRouteAnnotation)routeAnnotation
{
  return self->_routeAnnotation;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_routeAnnotation, 0);
}

@end
