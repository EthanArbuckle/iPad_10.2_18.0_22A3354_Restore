@implementation PreferencesValuesContaineeViewController

+ (BOOL)useCollectionView
{
  return 0;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PreferencesValuesContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v4, "viewDidLoad");
  -[PreferencesValuesContaineeViewController setupSubviews](self, "setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController initialConstraints](self, "initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 0;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  double leading;
  double top;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  if ((-[PreferencesValuesContaineeViewController collectionViewListLayoutAppearanceStyle](self, "collectionViewListLayoutAppearanceStyle", a3) & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    leading = 16.0;
    top = 0.0;
    bottom = 0.0;
    trailing = 16.0;
  }
  else
  {
    top = NSDirectionalEdgeInsetsZero.top;
    leading = NSDirectionalEdgeInsetsZero.leading;
    bottom = NSDirectionalEdgeInsetsZero.bottom;
    trailing = NSDirectionalEdgeInsetsZero.trailing;
  }
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)collectionViewLayoutBoundarySupplementaryItems
{
  return 0;
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return 0;
}

- (id)collectionViewDecorationItems
{
  return 0;
}

- (BOOL)shouldCollapseFirstCollectionViewSectionHeader
{
  return 0;
}

- (void)setupSubviews
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
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
  id v30;
  _QWORD v31[5];

  if (objc_msgSend((id)objc_opt_class(self), "useCollectionView"))
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100AD3ED4;
    v31[3] = &unk_1011AFFC0;
    v31[4] = self;
    v3 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v31);
    v4 = objc_alloc((Class)UICollectionView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
    -[PreferencesValuesContaineeViewController setCollectionView:](self, "setCollectionView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    objc_msgSend(v9, "setDataSource:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    objc_msgSend(v11, "setDelegate:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    +[PreferenceValuesDataSource registerCellsInCollectionView:](PreferenceValuesDataSource, "registerCellsInCollectionView:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    objc_msgSend(v13, "addSubview:", v14);

  }
  else
  {
    v15 = objc_alloc((Class)UITableView);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController view](self, "view"));
    objc_msgSend(v16, "bounds");
    v17 = objc_msgSend(v15, "initWithFrame:style:", 1);
    -[PreferencesValuesContaineeViewController setTableView:](self, "setTableView:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v20, "setDataSource:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v22, "setDelegate:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v23, "setBackgroundView:", 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v25, "setBackgroundColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController theme](self, "theme"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "groupTableViewHairlineColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v28, "setSeparatorColor:", v27);

    v30 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController tableView](self, "tableView"));
    objc_msgSend(v30, "addSubview:", v29);

  }
}

- (id)initialConstraints
{
  void *tableView;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  tableView = self->_tableView;
  if (!tableView)
    tableView = self->_collectionView;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  LODWORD(v4) = 1148846080;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(tableView, "_maps_constraintsEqualToEdgesOfView:priority:", v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allConstraints"));

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PreferencesValuesContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsThemeViewController updateTheme](self, "updateTheme");
}

- (PreferenceValuesDataSource)dataSource
{
  PreferenceValuesDataSource *dataSource;
  PreferenceValuesDataSource *v4;
  PreferenceValuesDataSource *v5;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = objc_alloc_init(PreferenceValuesDataSource);
    v5 = self->_dataSource;
    self->_dataSource = v4;

    -[PreferenceValuesDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)prepareContent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
  objc_msgSend(v2, "prepareContent");

}

- (void)addSection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "addSection:", v4);

}

- (void)addSectionWithTitle:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
  objc_msgSend(v8, "addSectionWithTitle:content:", v7, v6);

}

- (void)loadContentNowIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
  objc_msgSend(v2, "loadContentNowIfNeeded");

}

- (void)rebuildSections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController dataSource](self, "dataSource"));
  objc_msgSend(v2, "rebuildSections");

}

- (void)dataSourceDidRebuildSections:(id)a3
{
  -[UITableView reloadData](self->_tableView, "reloadData", a3);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
