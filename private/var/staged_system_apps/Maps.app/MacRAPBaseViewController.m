@implementation MacRAPBaseViewController

- (UISearchBar)searchBar
{
  UISearchBar *searchBar;
  UISearchBar *v4;
  UIImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UISearchBar *v10;

  searchBar = self->_searchBar;
  if (!searchBar)
  {
    v4 = (UISearchBar *)objc_alloc_init((Class)UISearchBar);
    -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UISearchBar setDelegate:](v4, "setDelegate:", self);
    v5 = objc_opt_new(UIImage);
    -[UISearchBar setBackgroundImage:](v4, "setBackgroundImage:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
    -[UISearchBar setBackgroundColor:](v4, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar layer](v4, "layer"));
    objc_msgSend(v7, "setCornerRadius:", 15.0);

    -[UISearchBar setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Enter an Address [RAP]"), CFSTR("localized string not found"), 0));
    -[UISearchBar setPlaceholder:](v4, "setPlaceholder:", v9);

    -[UISearchBar setReturnKeyType:](v4, "setReturnKeyType:", 9);
    v10 = self->_searchBar;
    self->_searchBar = v4;

    searchBar = self->_searchBar;
  }
  return searchBar;
}

- (void)setSearchBarPlaceholder:(id)a3
{
  NSString **p_searchBarPlaceholder;
  void *v6;
  id v7;

  p_searchBarPlaceholder = &self->_searchBarPlaceholder;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", *p_searchBarPlaceholder) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController searchBar](self, "searchBar"));
    objc_msgSend(v6, "setPlaceholder:", v7);

    objc_storeStrong((id *)p_searchBarPlaceholder, a3);
  }

}

- (void)setHeaderTitle:(id)a3
{
  NSString **p_headerTitle;
  void *v6;
  id v7;

  p_headerTitle = &self->_headerTitle;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", *p_headerTitle) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
    objc_msgSend(v6, "setTitle:", v7);

    objc_storeStrong((id *)p_headerTitle, a3);
  }

}

- (void)setRightButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v5, "setRightButtonEnabled:", v3);

  self->_rightButtonEnabled = v3;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacRAPBaseViewController;
  -[MacRAPBaseViewController viewDidLoad](&v4, "viewDidLoad");
  -[MacRAPBaseViewController _addHeaderView](self, "_addHeaderView");
  -[MacRAPBaseViewController _addFooterView](self, "_addFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavigationBarHidden:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MacRAPBaseViewController;
  -[MacRAPBaseViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v9, "frame");
  -[MacRAPBaseViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", v8, 0.0, v10, 0.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v11, "bringSubviewToFront:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v13, "bringSubviewToFront:", v14);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MacRAPBaseViewController;
  -[MacRAPBaseViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (-[MacRAPBaseViewController hasSearchBar](self, "hasSearchBar"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10084C9F8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_addHeaderView
{
  MacRAPHeaderView *v3;
  MacRAPHeaderView *v4;
  MacRAPHeaderView *v5;
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
  _QWORD v27[3];

  if (-[MacRAPBaseViewController hasSearchBar](self, "hasSearchBar"))
  {
    v3 = [MacRAPHeaderView alloc];
    v4 = (MacRAPHeaderView *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController searchBar](self, "searchBar"));
    v5 = -[MacRAPHeaderView initWithSearchBar:](v3, "initWithSearchBar:", v4);
    -[MacRAPBaseViewController setHeaderView:](self, "setHeaderView:", v5);

  }
  else
  {
    v4 = objc_alloc_init(MacRAPHeaderView);
    -[MacRAPBaseViewController setHeaderView:](self, "setHeaderView:", v4);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerTitle](self, "headerTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v8, "setTitle:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  objc_msgSend(v9, "addSubview:", v10);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v27[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v27[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController headerView](self, "headerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v27[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)_addFooterView
{
  MacFooterView *v3;
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
  _QWORD v25[3];

  v3 = -[MacFooterView initWithNoBlurRightSideButtonsOfType:]([MacFooterView alloc], "initWithNoBlurRightSideButtonsOfType:", -[MacRAPBaseViewController footerRightButtonType](self, "footerRightButtonType"));
  -[MacRAPBaseViewController setFooterView:](self, "setFooterView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v6, "setRightButtonEnabled:", self->_rightButtonEnabled);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  objc_msgSend(v7, "addSubview:", v8);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController footerView](self, "footerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v25[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[MacRAPBaseViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacRAPBaseViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)rightButtonEnabled
{
  return self->_rightButtonEnabled;
}

- (NSString)searchBarPlaceholder
{
  return self->_searchBarPlaceholder;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (int64_t)footerRightButtonType
{
  return self->_footerRightButtonType;
}

- (void)setFooterRightButtonType:(int64_t)a3
{
  self->_footerRightButtonType = a3;
}

- (BOOL)hasSearchBar
{
  return self->_hasSearchBar;
}

- (void)setHasSearchBar:(BOOL)a3
{
  self->_hasSearchBar = a3;
}

- (MacRAPHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (MacFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchBarPlaceholder, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
