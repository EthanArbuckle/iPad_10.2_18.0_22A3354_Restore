@implementation RoutePlanningWrapperViewController

- (RoutePlanningWrapperViewController)initWithDataCoordination:(id)a3
{
  id v4;
  RoutePlanningWrapperViewController *v5;
  RoutePlanningWrapperViewController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningWrapperViewController;
  v5 = -[RoutePlanningWrapperViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCoordinator, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v7, "setPresentedModally:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setTakesAvailableHeight:", 1);

  }
  return v6;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double left;
  double bottom;
  double right;
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
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
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
  objc_super v46;
  _QWORD v47[4];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;

  v46.receiver = self;
  v46.super_class = (Class)RoutePlanningWrapperViewController;
  -[ContaineeViewController viewDidLoad](&v46, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));

  if (!v3)
  {
    v29 = sub_1004318FC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v49 = "-[RoutePlanningWrapperViewController viewDidLoad]";
      v50 = 2080;
      v51 = "RoutePlanningWrapperViewController.m";
      v52 = 1024;
      v53 = 44;
      v54 = 2080;
      v55 = "self.wrappedViewController != nil";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v49 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (sub_1002A8AA0(self) != 5)
  {
    v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[RoutePlanningWrapperViewController setTitleHeaderView:](self, "setTitleHeaderView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v7, "setHairLineAlpha:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v8, "setHeaderSize:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v12, "setTitle:", v11);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v16, "setTitleViewInsets:", UIEdgeInsetsZero.top, left, bottom, right);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v17, "addSubview:", v18);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v47[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v47[1] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v20));
    v47[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    v47[3] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  -[RoutePlanningWrapperViewController _setupChildViewControllerIfNeeded:](self, "_setupChildViewControllerIfNeeded:", v28);

}

- (void)updateHeaderTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));

  if (v3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v6, "setTitle:", v5);

  }
}

- (void)_setupChildViewControllerIfNeeded:(id)a3
{
  id v4;
  RoutePlanningWrapperViewController *v5;
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
  _QWORD v30[4];

  v4 = a3;
  if (-[RoutePlanningWrapperViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (RoutePlanningWrapperViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));

    if (v4)
    {
      if (v5 != self)
      {
        -[RoutePlanningWrapperViewController addChildViewController:](self, "addChildViewController:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        objc_msgSend(v6, "addSubview:", v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
        v30[0] = v25;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
        v30[1] = v20;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v9));
        v30[2] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
        v30[3] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

        objc_msgSend(v4, "didMoveToParentViewController:", self);
      }
    }
  }

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate", a3, a4));
  objc_msgSend(v5, "containeeViewControllerGoToPreviousState:withSender:", self, self);

}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UIViewController)wrappedViewController
{
  return self->_wrappedViewController;
}

- (void)setWrappedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedViewController, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_dataCoordinator);
}

@end
