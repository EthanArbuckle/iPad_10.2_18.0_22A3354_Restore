@implementation ExtensionModalTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ExtensionModalTableViewController;
  -[ContaineeViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setBlurInCardView:", 0);

  -[ExtensionModalTableViewController initNavBarContainer](self, "initNavBarContainer");
  -[ExtensionModalTableViewController initNavBar](self, "initNavBar");
  -[ExtensionModalTableViewController initTableView](self, "initTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  objc_msgSend(v4, "setClipsToBounds:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v9, "addSubview:", v10);

  -[ExtensionModalTableViewController setupConstraints](self, "setupConstraints");
}

- (void)initNavBarContainer
{
  MKViewWithHairline *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_opt_new(MKViewWithHairline);
  -[ExtensionModalTableViewController setNavigationBarContainerView:](self, "setNavigationBarContainerView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  objc_msgSend(v7, "addSubview:", v6);

}

- (void)initNavBar
{
  UINavigationBar *v3;
  void *v4;
  UIImage *v5;
  UIImage *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_opt_new(UINavigationBar);
  -[ExtensionModalTableViewController setNavigationBar:](self, "setNavigationBar:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  v5 = objc_opt_new(UIImage);
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v5, 0);

  v6 = objc_opt_new(UIImage);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v7, "setShadowImage:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v8, "setTranslucent:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

}

- (void)initTableView
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  -[ExtensionModalTableViewController setTableView:](self, "setTableView:", v5);

  v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setTableFooterView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setDataSource:", self);

}

- (void)setupConstraints
{
  void *v3;
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
  _QWORD v61[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v61[0] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v61[1] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v61[2] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "heightAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 60.0));
  v61[3] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v61[4] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v61[5] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBar](self, "navigationBar"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v61[6] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v61[7] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v61[8] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v61[9] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v61[10] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ExtensionModalTableViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionModalTableViewController;
  -[MapsThemeViewController updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionModalTableViewController navigationBarContainerView](self, "navigationBarContainerView"));
  objc_msgSend(v5, "setHairlineColor:", v4);

}

- (BOOL)allowsLongPressToMarkLocation
{
  return 0;
}

- (BOOL)allowsQuickActionMenuInMap
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_opt_new(UITableViewCell);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (MKViewWithHairline)navigationBarContainerView
{
  return self->_navigationBarContainerView;
}

- (void)setNavigationBarContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarContainerView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
