@implementation BKAppearanceFontViewController

- (BKAppearanceFontViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKAppearanceFontViewController *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKAppearanceFontViewController;
  v4 = -[BKViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = AEBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Fonts"), &stru_1C3088, 0));
    -[BKAppearanceFontViewController setTitle:](v4, "setTitle:", v7);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BKAppearanceFontViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKAppearanceFontViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  UITableView *v7;
  UITableView *tableView;
  id v9;
  void *v10;
  UIView *v11;
  UIView *arrowBackgroundView;
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
  objc_super v40;
  _QWORD v41[8];

  v40.receiver = self;
  v40.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController loadView](&v40, "loadView");
  v3 = objc_alloc((Class)UITableView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v7;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 45.0, 0.0, 0.0);
  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController view](self, "view"));
  v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  arrowBackgroundView = self->_arrowBackgroundView;
  self->_arrowBackgroundView = v11;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_arrowBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addSubview:", self->_arrowBackgroundView);
  objc_msgSend(v10, "addSubview:", self->_tableView);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v41[0] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v41[1] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safeAreaLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v41[2] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v41[3] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_arrowBackgroundView, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v41[4] = v22;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_arrowBackgroundView, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v41[5] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_arrowBackgroundView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v41[6] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_arrowBackgroundView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v41[7] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 8));

  objc_msgSend(v10, "addConstraints:", v23);
}

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
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[4];

  v22.receiver = self;
  v22.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewDidLoad](&v22, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "fontDownloadFailed:", BEFontDownloadFailedNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController dividerView](self, "dividerView"));
  objc_msgSend(v5, "_setHidesShadow:", 1);
  objc_msgSend(v5, "addSubview:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v23[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v7));
  v23[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v23[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", v15));
  v23[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewWillAppear:](&v14, "viewWillAppear:");
  -[BKAppearanceFontViewController stylizeForTheme](self, "stylizeForTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v5)
    v6 = -[BKAppearanceFontViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("ContentFontSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setNavigationBarHidden:animated:", 0, v3);

  -[BKAppearanceFontViewController preferredContentSize](self, "preferredContentSize");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController presentingViewController](self, "presentingViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));
  objc_msgSend(v13, "setPreferredContentSize:", v9, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewDidAppear:](&v6, "viewDidAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController indexPathForSelectedFont](self, "indexPathForSelectedFont"));
  if (v5)
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 0, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKAppearanceFontViewController setDisappearing:](self, "setDisappearing:", 1);
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKAppearanceFontViewController setDisappearing:](self, "setDisappearing:", 0);
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)releaseViews
{
  void *v3;
  UITableView *tableView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  -[BKViewController releaseViews](&v5, "releaseViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BEFontDownloadFailedNotification, 0);

  tableView = self->_tableView;
  self->_tableView = 0;

}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController tableView](self, "tableView"));
  objc_msgSend(v3, "layoutIfNeeded");

  -[BKAppearanceFontViewController contentSize](self, "contentSize");
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController tableView](self, "tableView"));
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v7, "frame");
  v8 = v5 + CGRectGetHeight(v14);

  -[BKAppearanceFontViewController desiredContentSize](self, "desiredContentSize");
  v10 = v9;
  -[BKAppearanceFontViewController desiredContentSize](self, "desiredContentSize");
  if (v8 >= v11)
    v11 = v8;
  v12 = v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)estimatedContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v10 = (double)(unint64_t)objc_msgSend(v9, "count");
  +[IMRadialProgressButton minimumBoundingBox](IMRadialProgressButton, "minimumBoundingBox");
  v12 = v11;
  v13 = _BKFontCellAppearanceFontHeight() * 0.55;
  if (v12 >= v13)
    v13 = v12;
  if (v8 >= v13)
    v13 = v8;
  v14 = v13 * v10;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));

  v17 = _BKFontTableViewSizePaddingForContentSizeCategory(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navigationBar"));
  objc_msgSend(v19, "frame");
  v20 = v17 + v14 + CGRectGetHeight(v27);

  -[BKAppearanceFontViewController desiredContentSize](self, "desiredContentSize");
  v22 = v21;
  -[BKAppearanceFontViewController desiredContentSize](self, "desiredContentSize");
  if (v20 < v23)
    v20 = v23;

  v24 = v22;
  v25 = v20;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSUInteger v13;
  objc_super v14;
  _QWORD block[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("state")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("downloadProgress")))
  {
    if (-[BKAppearanceFontViewController isVisible](self, "isVisible"))
    {
      v13 = -[NSArray indexOfObject:](self->_fonts, "indexOfObject:", v11);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E6564;
      block[3] = &unk_1C03B0;
      block[4] = self;
      block[5] = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKAppearanceFontViewController;
    -[BKAppearanceFontViewController observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (id)styleManager
{
  return -[AEBookInfo styleManager](self->_book, "styleManager");
}

- (id)indexPathForSelectedFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController styleManager](self, "styleManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v7));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "familyName"));
      v12 = objc_msgSend(v4, "isEqualToString:", v11);

      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));

        v8 = (void *)v13;
      }

      ++v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
      v15 = objc_msgSend(v14, "count");

    }
    while ((unint64_t)v15 > v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BEHairlineDividerView)dividerView
{
  BEHairlineDividerView *dividerView;
  BEHairlineDividerView *v4;
  BEHairlineDividerView *v5;

  dividerView = self->_dividerView;
  if (!dividerView)
  {
    v4 = (BEHairlineDividerView *)objc_msgSend(objc_alloc((Class)BEHairlineDividerView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_dividerView;
    self->_dividerView = v4;

    -[BEHairlineDividerView setTranslatesAutoresizingMaskIntoConstraints:](self->_dividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    dividerView = self->_dividerView;
  }
  return dividerView;
}

- (void)setTheme:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController theme](self, "theme"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKAppearanceFontViewController;
    -[BKAppearanceFontViewController setTheme:](&v6, "setTheme:", v4);
    -[BKAppearanceFontViewController stylizeForTheme](self, "stylizeForTheme");
  }

}

- (void)stylizeForTheme
{
  void *v3;
  id v4;
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
  NSAttributedStringKey v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController themePage](self, "themePage"));
  v4 = -[BKAppearanceFontViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setOverrideUserInterfaceStyle:", v4);

  objc_msgSend(v3, "stylizeTableView:", self->_tableView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableViewCellBackgroundColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));

  objc_msgSend(v8, "setOverrideUserInterfaceStyle:", -[BKAppearanceFontViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
  objc_msgSend(v8, "setTintColor:", v9);

  objc_msgSend(v8, "setBackgroundColor:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController arrowBackgroundView](self, "arrowBackgroundView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v18 = NSForegroundColorAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryTextColor"));
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  objc_msgSend(v8, "setTitleTextAttributes:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "separatorColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController dividerView](self, "dividerView"));
  objc_msgSend(v15, "setBackgroundColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController navigationController](self, "navigationController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewIfLoaded"));
  objc_msgSend(v17, "setBackgroundColor:", v6);

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (double)fontSizeForFontFamilyName:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Iowan Old Style")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Charter")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Athelas")) & 1) != 0
    || (v4 = 20.0, objc_msgSend(v3, "isEqualToString:", CFSTR("Seravek"))))
  {
    v4 = 22.0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v5, "_scaledValueForValue:", v4);
  v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  BKFontTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BKFontTableViewCell *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char isKindOfClass;
  id v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v6 = a4;
  v7 = (BKFontTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BKFontTableViewCell")));
  if (!v7)
    v7 = -[BKFontTableViewCell initWithStyle:reuseIdentifier:]([BKFontTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("BKFontTableViewCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController book](self, "book"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "useGlobalContentStyle"));
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v10)
  {
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    v53 = v8;
    v54 = v6;
    if (objc_msgSend(v9, "kind") == (char *)&dword_0 + 1)
    {
      v16 = AEBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Original"), &stru_1C3088, 0));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      objc_msgSend(v19, "_scaledValueForValue:", 20.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
      -[BKFontTableViewCell setLabelFont:](v14, "setLabelFont:", v20);

      v21 = v13 ^ 1;
LABEL_16:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](v14, "label"));
      objc_msgSend(v29, "setText:", v18);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController themePage](self, "themePage"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "keyColor"));

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell selectionView](v14, "selectionView"));
      objc_msgSend(v32, "setHidden:", v21 ^ 1u);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell selectionView](v14, "selectionView"));
      objc_msgSend(v33, "setTintColor:", v31);

      if ((v21 & 1) == 0)
      {
        v52 = v18;
        if (objc_msgSend(v9, "state") == 3)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell accessoryView](v14, "accessoryView"));
          objc_opt_class(IMRadialProgressButton);
          isKindOfClass = objc_opt_isKindOfClass(v34, v35);

          if ((isKindOfClass & 1) != 0)
          {
            v37 = (id)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell accessoryView](v14, "accessoryView"));
          }
          else
          {
            v37 = objc_alloc_init((Class)IMRadialProgressButton);
            objc_msgSend(v37, "addTarget:action:forControlEvents:", self, "stopDownloadingFont:", 64);
          }
          v40 = v54;
          objc_msgSend(v9, "downloadProgress");
          objc_msgSend(v37, "setProgress:");
        }
        else if (objc_msgSend(v9, "state") == 2)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
          v39 = objc_msgSend(v38, "isEqualToString:", &stru_1C3088);

          v40 = v54;
          if ((v39 & 1) != 0)
          {
            v37 = 0;
          }
          else
          {
            v37 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
            objc_msgSend(v37, "addTarget:action:forControlEvents:", self, "downloadFont:", 64);
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleTitle3));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.and.arrow.down")));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bc_imageWithConfiguration:limitedToContentSizeCategory:", v41, UIContentSizeCategoryAccessibilityExtraLarge));

            objc_msgSend(v37, "setImage:forState:", v43, 0);
            objc_msgSend(v37, "setTintColor:", v31);

          }
        }
        else
        {
          v37 = 0;
          v40 = v54;
        }
        objc_msgSend(v37, "setTag:", objc_msgSend(v40, "row"));
        if (v37)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell buttonContainerView](v14, "buttonContainerView"));
          objc_msgSend(v44, "addSubview:", v37);

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bc_constraintsToFitInSuperviewCentered"));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

          +[IMRadialProgressButton minimumBoundingBox](IMRadialProgressButton, "minimumBoundingBox");
          v47 = v46;
          v48 = _BKFontCellAppearanceFontHeight() * 0.55;
          if (v47 < v48)
            v47 = v48;
        }
        else
        {
          v47 = 0.0;
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell buttonContainerWidthConstraint](v14, "buttonContainerWidthConstraint"));
        objc_msgSend(v49, "setConstant:", v47);

        v18 = v52;
      }

      v8 = v53;
      v6 = v54;
      goto LABEL_34;
    }
    -[BKAppearanceFontViewController fontSizeForFontFamilyName:](self, "fontSizeForFontFamilyName:", v10);
    v23 = v22;
    -[BKFontTableViewCell setFont:](v14, "setFont:", v9);
    v51 = v15;
    if (objc_msgSend(v9, "kind") && objc_msgSend(v9, "kind") != (char *)&dword_0 + 2)
    {
      if (objc_msgSend(v9, "kind") != &dword_4)
      {
        objc_msgSend(v9, "kind");
        goto LABEL_14;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", kCTFontUIFontDesignSerif, v23, UIFontWeightRegular));
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v10, v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_fontAdjustedForCurrentContentSizeCategory"));

    }
    if (v25)
    {
LABEL_15:
      -[BKFontTableViewCell setLabelFont:](v14, "setLabelFont:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController styleManager](self, "styleManager"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "font"));
      v28 = objc_msgSend(v27, "isEqualToString:", v10);

      v21 = v28 & v13;
      v18 = v51;
      goto LABEL_16;
    }
LABEL_14:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v23));
    goto LABEL_15;
  }
LABEL_34:

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row")));

  if (!objc_msgSend(v7, "isInstalled")
    || objc_msgSend(v7, "state") == 2
    || (v8 = v5, objc_msgSend(v7, "state") == 4))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
    v10 = objc_msgSend(v9, "isEqualToString:", &stru_1C3088);

    v8 = v5;
    if ((v10 & 1) == 0)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row")));

  -[BKAppearanceFontViewController useSelectedFont:](self, "useSelectedFont:", v9);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  objc_msgSend(v7, "reloadData");
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController theme](self, "theme"));
  objc_msgSend(v8, "stylizeTableViewCell:", v16);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v10 = objc_msgSend(v7, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textColor"));

  if (objc_msgSend(v11, "state") == 4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorWithAlphaComponent:", 0.5));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "label"));
    objc_msgSend(v15, "setTextColor:", v14);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "label"));
    objc_msgSend(v14, "setTextColor:", v13);
  }

}

- (void)useSelectedFont:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController styleManager](self, "styleManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "familyName"));
  v6 = objc_msgSend(v5, "length") != 0;
  v7 = objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController book](self, "book"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  objc_msgSend((id)v7, "setUseGlobalContentStyle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  LOBYTE(v7) = objc_msgSend(v5, "isEqualToString:", v9);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "notifyStyleChanged");
  }
  else
  {
    objc_msgSend(v4, "setFont:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
    objc_msgSend(v10, "appearanceFontViewController:didChangeToFontWithName:", self, v11);

  }
}

- (void)downloadFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v6 = objc_msgSend(v4, "tag");

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  self->_shownCannotDownloadFontAlert = 0;
  objc_msgSend(v7, "download");

}

- (void)stopDownloadingFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceFontViewController fonts](self, "fonts"));
  v6 = objc_msgSend(v4, "tag");

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  objc_msgSend(v7, "cancelDownload");

}

- (void)fontDownloadFailed:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (!self->_shownCannotDownloadFontAlert)
  {
    v4 = a3;
    v5 = MGGetBoolAnswer(CFSTR("wapi"));
    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5)
      v9 = CFSTR("To download fonts, connect to WLAN.");
    else
      v9 = CFSTR("To download fonts, connect to Wi-Fi.");
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1C3088, 0));

    v10 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Couldn’t Download"), &stru_1C3088, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v19, 1));

    v14 = AEBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1C3088, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, 0));
    objc_msgSend(v13, "addAction:", v17);

    -[BKAppearanceFontViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    self->_shownCannotDownloadFontAlert = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

    objc_msgSend(v18, "checkStateSynchronously:", 0);
    -[UITableView reloadData](self->_tableView, "reloadData");

  }
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
  objc_storeStrong((id *)&self->_book, a3);
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
  objc_storeStrong((id *)&self->_fonts, a3);
}

- (BOOL)isDisappearing
{
  return self->_disappearing;
}

- (void)setDisappearing:(BOOL)a3
{
  self->_disappearing = a3;
}

- (BKAppearanceFontViewControllerDelegate)delegate
{
  return (BKAppearanceFontViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)desiredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredContentSize.width;
  height = self->_desiredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredContentSize:(CGSize)a3
{
  self->_desiredContentSize = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (BOOL)shownCannotDownloadFontAlert
{
  return self->_shownCannotDownloadFontAlert;
}

- (void)setShownCannotDownloadFontAlert:(BOOL)a3
{
  self->_shownCannotDownloadFontAlert = a3;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (UIView)arrowBackgroundView
{
  return self->_arrowBackgroundView;
}

- (void)setArrowBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_book, 0);
}

@end
