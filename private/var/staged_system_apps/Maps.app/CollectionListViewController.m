@implementation CollectionListViewController

- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CollectionListViewController *v4;
  CollectionListViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CollectionListViewController;
  v4 = -[CollectionListViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

  }
  return v5;
}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CollectionListViewController;
  v3 = -[ContaineeViewController keyCommands](&v13, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListViewController presentedViewController](self, "presentedViewController"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Guide] Add New Guide"), CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, "_createNewCollectionAction", CFSTR("a"), 0x100000, 0));
    objc_msgSend(v5, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource keyCommands](self->_collectionListDataSource, "keyCommands"));
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  v11 = objc_msgSend(v5, "copy");

  return v11;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  CollectionListDataSource *v9;
  id v10;
  CollectionListDataSource *v11;
  objc_super v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource keyCommands](self->_collectionListDataSource, "keyCommands"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_collectionListDataSource;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CollectionListViewController;
    v10 = -[CollectionListViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v6);
    v9 = (CollectionListDataSource *)objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = v9;

  return v11;
}

- (id)preferredFocusEnvironments
{
  MapsThemeTableView *tableView;

  tableView = self->_tableView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tableView, 1));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ContainerHeaderView *v8;
  double y;
  double width;
  double height;
  ContainerHeaderView *v12;
  ContainerHeaderView *titleHeaderView;
  void *v14;
  void *v15;
  MapsThemeTableView *v16;
  MapsThemeTableView *tableView;
  void *v18;
  UIView *v19;
  UIView *hideableFooterView;
  CollectionFooterToolBarView *v21;
  CollectionFooterToolBarView *footerContentView;
  double v23;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v76;
  _QWORD v77[16];

  v76.receiver = self;
  v76.super_class = (Class)CollectionListViewController;
  -[ContaineeViewController viewDidLoad](&v76, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListViewController view](self, "view"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CollectionListView"));

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("CollectionListContent"));
  v8 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[ContainerHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v12;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](self->_titleHeaderView, "setHeaderSize:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Guide] Collections"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](self->_titleHeaderView, "setTitle:", v15);

  objc_msgSend(v5, "addSubview:", self->_titleHeaderView);
  v16 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v16;

  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v18);

  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MapsThemeTableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CollectionListTable"));
  objc_msgSend(v6, "addSubview:", self->_tableView);
  v19 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v19;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hideableFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", self->_hideableFooterView);
  v21 = -[FooterToolBarView initWithFrame:]([CollectionFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footerContentView = self->_footerContentView;
  self->_footerContentView = v21;

  -[CollectionFooterToolBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FooterToolBarView setDelegate:](self->_footerContentView, "setDelegate:", self);
  -[UIView addSubview:](self->_hideableFooterView, "addSubview:", self->_footerContentView);
  -[FooterToolBarView setState:](self->_footerContentView, "setState:", 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v77[0] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v77[1] = v70;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListViewController view](self, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "bottomAnchor"));
  LODWORD(v23) = 1140457472;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:priority:", v67, 0.0, v23));
  v77[2] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_hideableFooterView, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v64));
  v77[3] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v77[4] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v77[5] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v63 = v5;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v77[6] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v77[7] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](self->_tableView, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v77[8] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v77[9] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v55 = v6;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v77[10] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v77[11] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_hideableFooterView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView topAnchor](self->_footerContentView, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v77[12] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView bottomAnchor](self->_footerContentView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v24));
  v77[13] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView leadingAnchor](self->_footerContentView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v77[14] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionFooterToolBarView trailingAnchor](self->_footerContentView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  v77[15] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  -[CollectionListViewController loadDataSource](self, "loadDataSource");
  -[CollectionListViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionListViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CollectionListViewController _updateFooterInset](self, "_updateFooterInset");
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionListViewController;
  -[ContaineeViewController didChangeLayout:](&v4, "didChangeLayout:", a3);
  -[CollectionListViewController _updateFooterInset](self, "_updateFooterInset");
}

- (void)_updateFooterInset
{
  CGRect v3;

  -[UIView frame](self->_hideableFooterView, "frame");
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", 0.0, 0.0, CGRectGetHeight(v3), 0.0);
  -[MapsThemeTableView contentInset](self->_tableView, "contentInset");
  -[MapsThemeTableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a3;
  v5 = -[MapsThemeTableView _maps_shouldShowTopHairline](self->_tableView, "_maps_shouldShowTopHairline");
  v6 = 0.0;
  if (v5)
    v6 = 1.0;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008D05C8;
  v8[3] = &unk_1011B22D8;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008D05DC;
  v7[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", v3, v8, v7, v6);
}

- (void)loadDataSource
{
  CollectionListDataSource *v3;
  CollectionListDataSource *collectionListDataSource;

  v3 = -[CollectionListDataSource initWithTableView:editSession:showsAddCollection:]([CollectionListDataSource alloc], "initWithTableView:editSession:showsAddCollection:", self->_tableView, 0, 0);
  collectionListDataSource = self->_collectionListDataSource;
  self->_collectionListDataSource = v3;

  -[CollectionListDataSource setCellsSize:](self->_collectionListDataSource, "setCellsSize:", 0);
  -[DataSource setDelegate:](self->_collectionListDataSource, "setDelegate:", self);
  -[MapsThemeTableView setDelegate:](self->_tableView, "setDelegate:", self->_collectionListDataSource);
  -[MapsThemeTableView setDataSource:](self->_tableView, "setDataSource:", self->_collectionListDataSource);
  -[DataSource setActive:](self->_collectionListDataSource, "setActive:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionListViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[CollectionListViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 1);
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_collectionListDataSource == a3)
  {
    -[MapsThemeTableView reloadData](self->_tableView, "reloadData");
    -[CollectionListViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
  {
    v6 = objc_opt_class(CuratedCollectionHandler);
    if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
    {
      v7 = v14;
      v8 = -[CollectionListDataSource indexForObject:](self->_collectionListDataSource, "indexForObject:", v7);
      if ((v8 & 0x8000000000000000) == 0)
      {
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "curatedCollectionIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "muid")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
        +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", 2099, 251, 0, 0, 0, v11, 0, &__kCFBooleanTrue, v12, 0, 0, 0, 0, 0);

      }
    }
    else
    {
      if (objc_msgSend(v14, "handlerType"))
      {
LABEL_8:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v13, "viewController:showCollection:", self, v14);

        goto LABEL_9;
      }
      v7 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 73, 251, 0);
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)dataSource:(id)a3 didChangeSelectedCollections:(id)a4
{
  CollectionFooterToolBarView *footerContentView;
  uint64_t v5;

  footerContentView = self->_footerContentView;
  if (objc_msgSend(a4, "count", a3))
    v5 = 5;
  else
    v5 = 6;
  -[FooterToolBarView setState:](footerContentView, "setState:", v5);
}

- (void)dataSource:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  id v17;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v17, "viewController:confirmDeleteCollections:sourceView:sourceRect:completion:", self, v16, v15, v14, x, y, width, height);

}

- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  switch(a4)
  {
    case 3uLL:
      -[CollectionListDataSource setEditing:](self->_collectionListDataSource, "setEditing:", 1);
      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 6);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2120, 251, 0);
      break;
    case 4uLL:
      -[CollectionListDataSource setEditing:](self->_collectionListDataSource, "setEditing:", 0);
      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 4);
      break;
    case 5uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource selected](self->_collectionListDataSource, "selected"));
      objc_initWeak(&location, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1008D0B34;
      v8[3] = &unk_1011AD4F0;
      objc_copyWeak(&v9, &location);
      -[CollectionListViewController _deleteCollections:completion:](self, "_deleteCollections:completion:", v7, v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

      break;
    case 8uLL:
      -[CollectionListViewController _createNewCollectionAction](self, "_createNewCollectionAction");
      break;
    default:
      break;
  }

}

- (void)_createNewCollectionAction
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "viewController:createNewCollectionWithSession:", self, 0);

}

- (void)_deleteCollections:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1008D0CB4;
    v9[3] = &unk_1011B81A8;
    v11 = v7;
    v10 = v6;
    objc_msgSend(v8, "viewController:confirmDeleteCollections:sourceView:sourceRect:completion:", self, v10, 0, v9, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)dataSource:(id)a3 shareCollection:(id)a4 sourceView:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  PersonalCollectionShareItemSource *v11;
  MapsActivityViewController *v12;
  _QWORD v13[4];
  PersonalCollectionShareItemSource *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  CollectionListViewController *v18;

  v7 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008D1098;
  v16[3] = &unk_1011DB0A8;
  v8 = a5;
  v17 = v8;
  v18 = self;
  v9 = objc_retainBlock(v16);
  if (objc_msgSend(v7, "canShare"))
  {
    v10 = objc_opt_class(CuratedCollectionHandler);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1008D116C;
      v13[3] = &unk_1011DB0D0;
      v14 = (PersonalCollectionShareItemSource *)v7;
      v15 = v9;
      -[PersonalCollectionShareItemSource retrieveGeoCollectionWithRefinedItems:](v14, "retrieveGeoCollectionWithRefinedItems:", v13);

      v11 = v14;
    }
    else
    {
      v11 = -[PersonalCollectionShareItemSource initWithCollectionHandlerInfo:]([PersonalCollectionShareItemSource alloc], "initWithCollectionHandlerInfo:", v7);
      if (v11)
      {
        v12 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v11);
        ((void (*)(_QWORD *, MapsActivityViewController *))v9[2])(v9, v12);

      }
    }

  }
}

- (void)pptPresentFirstCollection
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v3 = -[CollectionListDataSource entriesCount](self->_collectionListDataSource, "entriesCount");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    if ((uint64_t)objc_msgSend(v5, "row") < v4)
    {
      while (1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self->_collectionListDataSource, "objectAtIndexPath:", v5));
        v7 = objc_opt_class(CollectionHandler);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
          break;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v5, "row") + 1, 0));

        v8 = objc_msgSend(v11, "row");
        v9 = v11;
        v5 = v11;
        if ((uint64_t)v8 >= v4)
          goto LABEL_11;
      }
      v10 = v6;
      if (!objc_msgSend(v10, "handlerType"))
        -[CollectionListViewController dataSource:itemTapped:](self, "dataSource:itemTapped:", self->_collectionListDataSource, v10);

    }
    v9 = v5;
LABEL_11:

  }
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
}

@end
