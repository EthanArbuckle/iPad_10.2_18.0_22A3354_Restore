@implementation CarShortcutsCardViewController

- (CarShortcutsCardViewController)init
{
  CarShortcutsCardViewController *v2;
  CarShortcutsCardViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CarShortcutsProvider *v9;
  CarShortcutsProvider *shortcutsProvider;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarShortcutsCardViewController;
  v2 = -[CarShortcutsCardViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    -[CarShortcutsCardViewController setShouldBeVisible:](v2, "setShouldBeVisible:", 0);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      objc_msgSend(v4, "registerObserver:", v3);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutsForCarplay"));
      -[CarShortcutsCardViewController setShouldBeVisible:](v3, "setShouldBeVisible:", objc_msgSend(v6, "count") != 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortcutsForCarplay"));
      -[CarShortcutsCardViewController setCanBeExpanded:](v3, "setCanBeExpanded:", (unint64_t)objc_msgSend(v8, "count") > 2);

    }
    else
    {
      v9 = objc_alloc_init(CarShortcutsProvider);
      shortcutsProvider = v3->_shortcutsProvider;
      v3->_shortcutsProvider = v9;

      -[CarShortcutsProvider setDelegate:](v3->_shortcutsProvider, "setDelegate:", v3);
      -[CarShortcutsProvider start](v3->_shortcutsProvider, "start");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  CarCollectionView *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CarCollectionView *collectionView;
  CarCollectionView *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *collectionHeight;
  double v18;
  double v19;
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
  objc_super v38;
  _QWORD v39[5];

  v38.receiver = self;
  v38.super_class = (Class)CarShortcutsCardViewController;
  -[CarShortcutsCardViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarShortcutsCard"));

  v4 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v4, "setMinimumLineSpacing:", 12.0);
  objc_msgSend(v4, "setMinimumInteritemSpacing:", 10.0);
  v37 = v4;
  objc_msgSend(v4, "setScrollDirection:", 0);
  v5 = -[CarCollectionView initWithFrame:collectionViewLayout:]([CarCollectionView alloc], "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarCollectionView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  v7 = objc_opt_class(CarShortcutCollectionViewCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](CarShortcutCollectionViewCell, "cellReuseIdentifier"));
  -[CarCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  v9 = objc_opt_class(CarShortcutCompactCollectionViewCell);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](CarShortcutCompactCollectionViewCell, "cellReuseIdentifier"));
  -[CarCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  -[CarCollectionView setScrollEnabled:](v5, "setScrollEnabled:", self->_expanded);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", v5);

  collectionView = self->_collectionView;
  self->_collectionView = v5;
  v13 = v5;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
  collectionHeight = self->_collectionHeight;
  self->_collectionHeight = v16;

  LODWORD(v18) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_collectionHeight, "setPriority:", v18);
  -[CarShortcutsCardViewController _updateHeightConstraint](self, "_updateHeightConstraint");
  v39[0] = self->_collectionHeight;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView topAnchor](v13, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarShortcutCollectionViewCell, "focusRingTopOverhang");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -v19));
  v39[1] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView leadingAnchor](v13, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v39[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView trailingAnchor](v13, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v39[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView bottomAnchor](v13, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v39[4] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  -[CarCollectionView setDataSource:](v13, "setDataSource:", self);
  -[CarCollectionView setDelegate:](v13, "setDelegate:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v3, "unregisterObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider stop](self->_shortcutsProvider, "stop");
  }
  v4.receiver = self;
  v4.super_class = (Class)CarShortcutsCardViewController;
  -[CarShortcutsCardViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarShortcutsCardViewController;
  -[CarShortcutsCardViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  -[CarShortcutsCardViewController _cellSizeUsingCompactLayout:](self, "_cellSizeUsingCompactLayout:", -[CarShortcutsCardViewController _useCompactLayout](self, "_useCompactLayout"));
  if (v3 != self->_cellSize.width || v4 != self->_cellSize.height)
  {
    self->_cellSize.width = v3;
    self->_cellSize.height = v4;
    -[CarCollectionView reloadData](self->_collectionView, "reloadData");
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BAB7DC;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
}

- (int64_t)_numberOfItems
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutsForCarplay"));
    v5 = (int64_t)objc_msgSend(v4, "count");

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
    v5 = (int64_t)objc_msgSend(v3, "count");
  }

  v6 = 2;
  if (v5 < 2)
    v6 = v5;
  if (self->_expanded)
    return v5;
  else
    return v6;
}

- (int64_t)_numberOfRows
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;

  v2 = -[CarShortcutsCardViewController _numberOfItems](self, "_numberOfItems");
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = v2 + 1;
  v4 = v3 >> 1;
  if ((v2 & 0x8000000000000001) == 1)
    return v4 + 1;
  else
    return v4;
}

- (double)_preferredHeightUsingCompactLayout:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v6;
  double v7;

  v3 = a3;
  v5 = -[CarShortcutsCardViewController _numberOfRows](self, "_numberOfRows");
  if (v5 < 1)
    return 0.0;
  v6 = (double)v5;
  -[CarShortcutsCardViewController _cellSizeUsingCompactLayout:](self, "_cellSizeUsingCompactLayout:", v3);
  return (v6 + -1.0) * 12.0 + v7 * v6;
}

- (void)_updateHeightConstraint
{
  -[CarShortcutsCardViewController _preferredHeightUsingCompactLayout:](self, "_preferredHeightUsingCompactLayout:", 0);
  -[NSLayoutConstraint setConstant:](self->_collectionHeight, "setConstant:");
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[CarCollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:");
    -[CarShortcutsCardViewController _updateHeightConstraint](self, "_updateHeightConstraint");
    -[CarCollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)setShouldBeVisible:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldBeVisible != a3)
  {
    self->_shouldBeVisible = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carShortcutsCardViewController:visibilityUpdated:", self, self->_shouldBeVisible);

  }
}

- (void)setCanBeExpanded:(BOOL)a3
{
  id WeakRetained;

  if (self->_canBeExpanded != a3)
  {
    self->_canBeExpanded = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carShortcutsCardViewController:canBeExpandedUpdated:", self, self->_canBeExpanded);

  }
}

- (CGSize)_cellSizeUsingCompactLayout:(BOOL)a3
{
  __objc2_class *v4;
  void *v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;
  CGRect v18;

  if (a3)
    v4 = CarShortcutCompactCollectionViewCell;
  else
    v4 = CarShortcutCollectionViewCell;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController traitCollection](self, "traitCollection"));
  -[__objc2_class cellSizeWithTraitCollection:](v4, "cellSizeWithTraitCollection:", v5);
  v7 = v6;

  -[CarCollectionView bounds](self->_collectionView, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v12 = CGRectGetWidth(v17) + -12.0 + -20.0;
  v13 = 0.0;
  if (v12 >= 0.0)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v13 = (CGRectGetWidth(v18) + -12.0 + -20.0) * 0.5;
  }
  v14 = UIFloorToViewScale(self->_collectionView, v13);
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)_useCompactLayout
{
  if (-[CarShortcutsCardViewController expanded](self, "expanded"))
    return 0;
  else
    return -[CarShortcutsCardViewController _scrollsIfUsingCompactLayout:](self, "_scrollsIfUsingCompactLayout:", 0);
}

- (BOOL)_scrollsIfUsingCompactLayout:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  v3 = a3;
  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarShortcutCollectionViewCell, "focusRingTopOverhang");
  v6 = v5;
  -[CarShortcutsCardViewController _preferredHeightUsingCompactLayout:](self, "_preferredHeightUsingCompactLayout:", v3);
  v8 = v7;
  -[CarCollectionView bounds](self->_collectionView, "bounds");
  return v8 > CGRectGetHeight(v10) - v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarShortcutsCardViewController;
  v4 = a3;
  -[CarShortcutsCardViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController traitCollection](self, "traitCollection", v11.receiver, v11.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
  {
    -[CarShortcutsCardViewController _updateHeightConstraint](self, "_updateHeightConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout"));
    objc_msgSend(v10, "invalidateLayout");

  }
}

- (void)shortcutsProviderUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcuts"));
  -[CarShortcutsCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", objc_msgSend(v5, "count") != 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcuts"));
  -[CarShortcutsCardViewController setCanBeExpanded:](self, "setCanBeExpanded:", (unint64_t)objc_msgSend(v6, "count") > 2);

  -[CarShortcutsCardViewController _updateHeightConstraint](self, "_updateHeightConstraint");
  -[CarCollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcutsForCarplay"));
  -[CarShortcutsCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", objc_msgSend(v5, "count") != 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortcutsForCarplay"));
  -[CarShortcutsCardViewController setCanBeExpanded:](self, "setCanBeExpanded:", (unint64_t)objc_msgSend(v7, "count") > 2);

  -[CarShortcutsCardViewController _updateHeightConstraint](self, "_updateHeightConstraint");
  -[CarCollectionView reloadData](self->_collectionView, "reloadData");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  __objc2_class **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SuggestionShortcutsRowCellModel *v15;
  void *v16;
  SuggestionShortcutsRowCellModel *v17;

  v6 = a4;
  v7 = a3;
  v8 = -[CarShortcutsCardViewController _useCompactLayout](self, "_useCompactLayout");
  v9 = off_1011960B0;
  if (!v8)
    v9 = off_1011960A8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class cellReuseIdentifier](*v9, "cellReuseIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortcutsForCarplay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v15 = -[SuggestionShortcutsRowCellModel initWithMapsFavoriteItem:]([SuggestionShortcutsRowCellModel alloc], "initWithMapsFavoriteItem:", v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v15 = -[SuggestionShortcutsRowCellModel initWithMapsSuggestionsEntry:]([SuggestionShortcutsRowCellModel alloc], "initWithMapsSuggestionsEntry:", v14);
  }
  v17 = v15;

  objc_msgSend(v11, "setModel:", v17);
  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[CarShortcutsCardViewController _cellSizeUsingCompactLayout:](self, "_cellSizeUsingCompactLayout:", -[CarShortcutsCardViewController _useCompactLayout](self, "_useCompactLayout", a3, a4, a5));
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarShortcutCollectionViewCell, "focusRingTopOverhang", a3, a4, a5);
  v6 = 10.0;
  v7 = 0.0;
  v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a4;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortcutsForCarplay"));
    v8 = objc_msgSend(v5, "row");

    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v9, "displayRoutePlanningForDestination:", v13);

    -[CarShortcutsCardViewController _captureTapActionWithFavoriteItem:](self, "_captureTapActionWithFavoriteItem:", v13);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
    v11 = objc_msgSend(v5, "row");

    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v12, "displayRoutePlanningForDestination:", v13);

    -[CarShortcutsCardViewController _captureTapActionWithShortcut:](self, "_captureTapActionWithShortcut:", v13);
  }

}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v3;

  if (-[CarShortcutsCardViewController shouldBeVisible](self, "shouldBeVisible", a3))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  else
    v3 = 0;
  return v3;
}

- (id)_sortCells:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_1011E7D60);
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarShortcutsCardViewController shouldBeVisible](self, "shouldBeVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionView visibleCells](self->_collectionView, "visibleCells"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsCardViewController _sortCells:](self, "_sortCells:", v3));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (void)_captureTapActionWithShortcut:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "type");
  if (v3 == (id)18)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapsCategoryId"));

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2049, 1005, v6);
  }
  else
  {
    if (v3 == (id)2)
    {
      v4 = 2047;
      goto LABEL_7;
    }
    if (v3 == (id)1)
    {
      v4 = 2046;
LABEL_7:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, 1005, 0);
    }
  }

}

- (void)_captureTapActionWithFavoriteItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "type");
  if (v3 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapsCategoryId"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2049, 1005, v6);

  }
  else
  {
    if (v3 == (id)3)
    {
      v4 = 2047;
      goto LABEL_7;
    }
    if (v3 == (id)2)
    {
      v4 = 2046;
LABEL_7:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, 1005, 0);
    }
  }

}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v4, "registerObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider start](self->_shortcutsProvider, "start");
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v4, "unregisterObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider stop](self->_shortcutsProvider, "stop");
  }
}

- (CarShortcutsCardViewControllerDelegate)delegate
{
  return (CarShortcutsCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (BOOL)canBeExpanded
{
  return self->_canBeExpanded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shortcutsProvider, 0);
  objc_storeStrong((id *)&self->_collectionHeight, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
