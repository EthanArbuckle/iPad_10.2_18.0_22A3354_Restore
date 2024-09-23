@implementation MCDTableViewController

- (MCDTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDTableViewController *v4;
  MCDTableViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDTableViewController;
  v4 = -[MCDTableViewController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_limitedUI = a3;
    v4->_alwaysHideNowPlayingButton = 0;
    -[MCDTableViewController setClearsSelectionOnViewWillAppear:](v4, "setClearsSelectionOnViewWillAppear:", 1);
  }
  return v5;
}

- (void)loadView
{
  MCDTableView *v3;

  v3 = -[MCDTableView initWithFrame:style:]([MCDTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MCDTableView setDataSource:](v3, "setDataSource:", self);
  -[MCDTableView setDelegate:](v3, "setDelegate:", self);
  -[MCDTableViewController setView:](self, "setView:", v3);

}

- (void)setLimitedUI:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  self->_limitedUI = a3;
  if (-[MCDTableViewController viewHasAppeared](self, "viewHasAppeared"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v6, "setFrame:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
    objc_msgSend(v10, "addSubview:", v6);

  }
  else
  {
    v6 = 0;
  }
  -[MCDTableViewController _limitedUIDidChange](self, "_limitedUIDidChange");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001ABD4;
    v14[3] = &unk_1010A8DD8;
    v15 = v6;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001ABE0;
    v12[3] = &unk_1010A8F68;
    v13 = v15;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v12, 0.4);

  }
}

+ (void)removeImageFromCell:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setSeparatorInset:", UITableViewAutomaticDimension, UITableViewAutomaticDimension, UITableViewAutomaticDimension, UITableViewAutomaticDimension);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewWithTag:", 1000));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "removeFromSuperview");
    v4 = v5;
  }

}

+ (void)setPlaceholderImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 toCell:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "artworkImageView"));
  if (v17)
  {
    objc_msgSend(v12, "sizeForArtwork");
    objc_msgSend(v12, "setSeparatorInset:", 0.0, v14 + 4.0 + 8.0, 0.0, 0.0);
    if (!v13)
    {
      v13 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v17);
      objc_msgSend(v13, "setTag:", 1000);
    }
    objc_msgSend(a1, "addLeadingView:toCell:", v13, v12);
    objc_msgSend(v13, "setContentMode:", 4);
    objc_msgSend(v12, "sizeForArtwork");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v15 * 0.5));
    objc_msgSend(v13, "setPreferredSymbolConfiguration:", v16);

    objc_msgSend(v12, "setPlaceholderTintColor:", v10);
    objc_msgSend(v12, "setPlaceholderHighlightedTintColor:", v11);
  }

}

+ (void)addLeadingView:(id)a3 toCell:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v26 = a4;
  v5 = a3;
  v6 = objc_opt_class(_MCDReusableCell);
  if ((objc_opt_isKindOfClass(v26, v6) & 1) != 0)
  {
    objc_msgSend(v26, "sizeForArtwork");
    v8 = v7;
  }
  else
  {
    v8 = 36.0;
  }
  objc_msgSend(v5, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v26, "addSubview:", v5);
  objc_msgSend(v26, "setSeparatorInset:", 0.0, v8 + 4.0 + 8.0, 0.0, 0.0);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  v17 = (v8 - CGRectGetWidth(v27)) * 0.5 + 4.0;
  objc_msgSend(v26, "frame");
  v18 = CGRectGetHeight(v28) * 0.5 - v16 * 0.5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v19, "setContentsGravity:", kCAGravityResizeAspect);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentView"));
  v21 = objc_msgSend(v20, "frame");
  MPURectByApplyingUserInterfaceLayoutDirectionInRect(v21, v17, v18, v14, v16, v22, v23, v24, v25);
  objc_msgSend(v5, "setFrame:");

}

+ (id)addAlbumArtViewWithImage:(id)a3 radiusKind:(unint64_t)a4 toCell:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "artworkImageView"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "removeFromSuperview");
    objc_msgSend(v9, "sizeForArtwork");
    v14 = v13;
    objc_msgSend(v9, "setSeparatorInset:", 0.0, v13 + 4.0 + 8.0, 0.0, 0.0);
    v10 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v10, "setTag:", 1000);
    if (objc_msgSend(v7, "renderingMode") == (id)2)
    {
      objc_msgSend(v10, "setImage:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemWhiteColor](UIColor, "_externalSystemWhiteColor"));
      objc_msgSend(v10, "setTintColor:", v15);

      objc_msgSend(v10, "setContentMode:", 4);
    }
    else
    {
      objc_msgSend(v10, "setContentMode:", 1);
      objc_msgSend(v10, "setImage:", v7);
    }
    objc_msgSend(v10, "setClipsToBounds:", 1);
    if (a4 == 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v17, "setCornerRadius:", v14 * 0.5);
    }
    else
    {
      if (a4)
      {
LABEL_13:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
        v19 = objc_msgSend(v18, "frame");
        MPURectByApplyingUserInterfaceLayoutDirectionInRect(v19, 4.0, 4.0, v14, v14, v20, v21, v22, v23);
        objc_msgSend(v10, "setFrame:");

        objc_msgSend(v10, "setContentMode:", 1);
        objc_msgSend(v9, "addSubview:", v10);

        goto LABEL_14;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v16, "setCornerRadius:", 4.5);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v17, "setCornerCurve:", kCACornerCurveContinuous);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (BOOL)hasRowsToDisplay
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = -[MCDTableViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
    v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

    v6 = v5 - 1;
    if (v5 < 1)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
        v9 = objc_msgSend(v8, "numberOfRowsInSection:", v7);

        LOBYTE(v3) = (uint64_t)v9 > 0;
        if ((uint64_t)v9 > 0)
          break;
      }
      while (v6 != v7++);
    }
  }
  return v3;
}

+ (BOOL)wantsTallCells
{
  return 0;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  v4 = (void *)v3;
  if (v3)
  {
    v10 = v3;
    v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MCDTableViewController;
    v6 = -[MCDTableViewController preferredFocusEnvironments](&v9, "preferredFocusEnvironments");
    v5 = objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = (void *)v5;

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCDTableViewController;
  -[MCDTableViewController viewDidLoad](&v14, "viewDidLoad");
  -[MCDTableViewController _setFilteredDataType:](self, "_setFilteredDataType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedRowHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  v6 = objc_opt_class(MCDTableViewCell);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDTableViewCell, "reuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  v9 = objc_opt_class(MCDTallCell);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDTallCell, "reuseIdentifier"));
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setRemembersLastFocusedIndexPath:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  MCDTableViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIButton *v16;
  UIButton *nowPlayingButton;
  id v18;
  void *v19;
  _Unwind_Exception *v20;
  objc_super v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;

  v21.receiver = self;
  v21.super_class = (Class)MCDTableViewController;
  -[MCDTableViewController viewWillAppear:](&v21, "viewWillAppear:", a3);
  v4 = -[MCDTableViewController alwaysShowNavBar](self, "alwaysShowNavBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 1);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    objc_msgSend(v6, "setNavigationBarHidden:animated:", (unint64_t)objc_msgSend(v8, "count") < 2, 1);

  }
  if (!self->_nowPlayingButton)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v9 = (id *)qword_1011ECC08;
    v25 = (void *)qword_1011ECC08;
    if (!qword_1011ECC08)
    {
      v10 = (void *)sub_10001BD2C();
      v9 = (id *)dlsym(v10, "MCDMusicBundleIdentifier");
      v23[3] = (uint64_t)v9;
      qword_1011ECC08 = (uint64_t)v9;
    }
    _Block_object_dispose(&v22, 8);
    if (v9)
    {
      v11 = *v9;
      v12 = self;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v13 = off_1011ECBF8;
      v25 = off_1011ECBF8;
      if (!off_1011ECBF8)
      {
        v14 = (void *)sub_10001BD2C();
        v13 = dlsym(v14, "MCDGetNowPlayingButton");
        v23[3] = (uint64_t)v13;
        off_1011ECBF8 = v13;
      }
      _Block_object_dispose(&v22, 8);
      if (v13)
      {
        v15 = ((uint64_t (*)(id, MCDTableViewController *, const char *))v13)(v11, v12, "_nowPlayingButtonTapped:");
        v16 = (UIButton *)objc_claimAutoreleasedReturnValue(v15);

        nowPlayingButton = self->_nowPlayingButton;
        self->_nowPlayingButton = v16;

        v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_nowPlayingButton);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationItem](v12, "navigationItem"));
        objc_msgSend(v19, "setRightBarButtonItem:", v18);

        goto LABEL_12;
      }
    }
    else
    {
      sub_100DE9368();
    }
    v20 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v22, 8);
    _Unwind_Resume(v20);
  }
LABEL_12:
  -[MCDTableViewController _updateNowPlayingVisibility](self, "_updateNowPlayingVisibility");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCDTableViewController;
  -[MCDTableViewController viewDidAppear:](&v10, "viewDidAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController transitionCoordinator](self, "transitionCoordinator"));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "initiallyInteractive"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001B734;
    v8[3] = &unk_1010A8F90;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v6, "notifyWhenInteractionChangesUsingBlock:", v8);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController tableView](self, "tableView"));
    sub_10001B790(v7, v3);

  }
  -[MCDTableViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDTableViewController;
  -[MCDTableViewController viewWillDisappear:](&v9, "viewWillDisappear:", a3);
  v4 = -[MCDTableViewController alwaysShowNavBar](self, "alwaysShowNavBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 1);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    objc_msgSend(v6, "setNavigationBarHidden:animated:", (unint64_t)objc_msgSend(v8, "count") < 2, 1);

  }
  -[MCDTableViewController setViewHasAppeared:](self, "setViewHasAppeared:", 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", a4));
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "setPlayActivityFeatureNameSourceViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

    v5 = v7;
  }

}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedIndexPath"));

  v9 = objc_opt_class(UIButton);
  v12 = (objc_opt_isKindOfClass(v7, v9) & 1) == 0
     || (v10 = objc_msgSend(v8, "section"), (v11 = (char *)objc_msgSend(v8, "row")) == 0)
     || v11 == (char *)objc_msgSend(v5, "numberOfRowsInSection:", v10) - 1;

  return v12;
}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001BA8C;
  v3[3] = &unk_1010A8F68;
  v3[4] = self;
  -[MCDTableViewController _updateNowPlayingPlayingVisibilityWithCompletionHandler:](self, "_updateNowPlayingPlayingVisibilityWithCompletionHandler:", v3);
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MCDMusicNowPlayingViewController musicNowPlayingViewController](MCDMusicNowPlayingViewController, "musicNowPlayingViewController", a3));
  objc_msgSend(v5, "setPlayActivityFeatureNameSourceViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)_updateNowPlayingPlayingVisibilityWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nowPlayingContentManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentPlayingSong"));

  v7 = -[MCDTableViewController alwaysHideNowPlayingButton](self, "alwaysHideNowPlayingButton");
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  -[UIButton setHidden:](self->_nowPlayingButton, "setHidden:", v8);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v6 != 0);
    v9 = v10;
  }

}

- (void)_updateNowPlayingVisibility
{
  -[MCDTableViewController _updateNowPlayingPlayingVisibilityWithCompletionHandler:](self, "_updateNowPlayingPlayingVisibilityWithCompletionHandler:", 0);
}

- (BOOL)currentAppIsPlaying
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;

  if ((-[UIButton isHidden](self->_nowPlayingButton, "isHidden") & 1) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nowPlayingContentManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPlayingSong"));
  v2 = v5 != 0;

  return v2;
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)alwaysShowNavBar
{
  return self->_alwaysShowNavBar;
}

- (void)setAlwaysShowNavBar:(BOOL)a3
{
  self->_alwaysShowNavBar = a3;
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (BOOL)topLevel
{
  return self->_topLevel;
}

- (void)setTopLevel:(BOOL)a3
{
  self->_topLevel = a3;
}

- (BOOL)alwaysHideNowPlayingButton
{
  return self->_alwaysHideNowPlayingButton;
}

- (void)setAlwaysHideNowPlayingButton:(BOOL)a3
{
  self->_alwaysHideNowPlayingButton = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_nowPlayingButton, 0);
}

@end
