@implementation NCAppPickerViewController

+ (id)appPickerViewControllerWithContentProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NCAppPickerViewController _initWithContentProvider:]([NCAppPickerViewController alloc], "_initWithContentProvider:", v3);

  return v4;
}

- (id)_initWithContentProvider:(id)a3
{
  id v5;
  NCAppPickerViewController *v6;
  NCAppPickerViewController *v7;
  NSMutableSet *v8;
  NSMutableSet *mutableShownBundleIdentifiers;
  void *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  BOOL IsAX;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NCAppPickerViewController;
  v6 = -[NCOnboardingViewController initWithTitle:detailText:contentLayout:](&v16, sel_initWithTitle_detailText_contentLayout_, &stru_1E8D21F60, &stru_1E8D21F60, 3);
  v7 = v6;
  if (v6)
  {
    v6->_contentCollapsedCellCount = 0;
    v6->_contentCollapsable = 0;
    v6->_contentCollapsed = 1;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableShownBundleIdentifiers = v7->_mutableShownBundleIdentifiers;
    v7->_mutableShownBundleIdentifiers = v8;

    v7->_showMoreButtonWasPressed = 0;
    objc_storeStrong((id *)&v7->_contentProvider, a3);
    -[NCAppPickerViewController traitCollection](v7, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    v12 = *MEMORY[0x1E0DC48F0];
    v17[0] = *MEMORY[0x1E0DC48F8];
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v11) & 1) != 0)
    {

      IsAX = 1;
    }
    else
    {
      IsAX = _NCSizeCategoryIsAX(v11);

    }
    v7->_largerTextSize = IsAX;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  UICollectionView *v13;
  UICollectionView *collectionView;
  UICollectionView *v15;
  uint64_t v16;
  void *v17;
  UICollectionView *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  UICollectionView *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *heightConstraint;
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
  NSLayoutConstraint *v48;
  NSLayoutConstraint *topConstraint;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;

  -[NCAppPickerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 1);

  v54.receiver = self;
  v54.super_class = (Class)NCAppPickerViewController;
  -[NCOnboardingViewController viewDidLoad](&v54, sel_viewDidLoad);
  -[NCAppPickerViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v5, "setMinimumLineSpacing:", 8.0);
  -[NCAppPickerViewController _availableContentWidth](self, "_availableContentWidth");
  v7 = v6;
  -[NCAppPickerContentProvider longestAppName](self->_contentProvider, "longestAppName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCAppPickerViewCell preferredHeightForText:cellWidth:](NCAppPickerViewCell, "preferredHeightForText:cellWidth:", v8, v7);
  self->_cellHeight = v9;

  objc_msgSend(v5, "setItemSize:", v7, self->_cellHeight);
  +[NCAppPickerViewHeader preferredHeightForWidth:supportsSortByAvgNumberOfNotifications:](NCAppPickerViewHeader, "preferredHeightForWidth:supportsSortByAvgNumberOfNotifications:", -[NCAppPickerContentProvider isAbleToSortByAvgNumberOfNotifications](self->_contentProvider, "isAbleToSortByAvgNumberOfNotifications"), v7);
  self->_headerHeight = v10;
  objc_msgSend(v5, "setHeaderReferenceSize:", v7, v10);
  +[NCAppPickerViewFooter preferredHeightForWidth:showMoreButton:](NCAppPickerViewFooter, "preferredHeightForWidth:showMoreButton:", self->_contentCollapsed, v7);
  self->_footerHeight = v11;
  objc_msgSend(v5, "setFooterReferenceSize:", v7, v11);
  v12 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v13 = (UICollectionView *)objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setAutomaticallyAdjustsScrollIndicatorInsets:](self->_collectionView, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  v15 = self->_collectionView;
  v16 = objc_opt_class();
  +[NCAppPickerViewCell reuseIdentifier](NCAppPickerViewCell, "reuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v15, "registerClass:forCellWithReuseIdentifier:", v16, v17);

  v18 = self->_collectionView;
  v19 = objc_opt_class();
  v20 = *MEMORY[0x1E0DC48A8];
  +[NCAppPickerViewHeader reuseIdentifier](NCAppPickerViewHeader, "reuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v18, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v19, v20, v21);

  v22 = self->_collectionView;
  v23 = objc_opt_class();
  v24 = *MEMORY[0x1E0DC48A0];
  +[NCAppPickerViewFooter reuseIdentifier](NCAppPickerViewFooter, "reuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v22, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v23, v24, v25);

  -[NCAppPickerViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", self->_collectionView);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidesBackButton:", 1);

  v28 = objc_alloc(MEMORY[0x1E0DC34F0]);
  NCUserNotificationsUIKitFrameworkBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_APP_PICKER_CANCEL"), &stru_1E8D21F60, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithTitle:style:target:action:", v30, 0, self, sel__cancelButtonPressed_);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLeftBarButtonItem:", v31);

  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UICollectionView heightAnchor](self->_collectionView, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 0.0);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v35;

  objc_msgSend(v33, "addObject:", self->_heightConstraint);
  -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCAppPickerViewController contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v40);

  -[NCAppPickerViewController contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v44);

  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCAppPickerViewController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v48;

  objc_msgSend(v33, "addObject:", self->_topConstraint);
  -[NCAppPickerViewController contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v53);

  -[NCAppPickerViewController _updateHeightConstraintAndLayoutIfNeeded:](self, "_updateHeightConstraintAndLayoutIfNeeded:", 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCAppPickerViewController;
  -[NCAppPickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[NCAppPickerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateHeightConstraintAndLayout, 0, 0.0);
  -[NCAppPickerViewController _refreshNextButton](self, "_refreshNextButton");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCAppPickerViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_viewHasAppeared = 1;
  -[NCAppPickerViewController _saveCellsSeen](self, "_saveCellsSeen");
}

- (NSArray)selectedBundleIdentifiers
{
  NCAppPickerContentProvider *contentProvider;
  id v3;

  contentProvider = self->_contentProvider;
  if (contentProvider)
  {
    -[NCAppPickerContentProvider selectedBundleIdentifiers](contentProvider, "selectedBundleIdentifiers");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return (NSArray *)v3;
}

- (NSSet)shownBundleIdentifiers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableShownBundleIdentifiers, "copy");
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollapsable && self->_contentCollapsed)
    return self->_contentCollapsedCellCount;
  else
    return -[NCAppPickerContentProvider totalCount](self->_contentProvider, "totalCount", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  +[NCAppPickerViewCell reuseIdentifier](NCAppPickerViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "item");
  -[NCAppPickerContentProvider nameForIndex:](self->_contentProvider, "nameForIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCAppPickerViewCell preferredImageDimension](NCAppPickerViewCell, "preferredImageDimension");
  -[NCAppPickerContentProvider imageForIndex:size:](self->_contentProvider, "imageForIndex:size:", v10, v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithName:image:avgNumberOfNotificationsCount:maxAvgNumberOfNotificationsCount:selected:", v11, v13, -[NCAppPickerContentProvider avgNumberOfNotificationsForIndex:](self->_contentProvider, "avgNumberOfNotificationsForIndex:", v10), -[NCAppPickerContentProvider maxAvgNumberOfNotifications](self->_contentProvider, "maxAvgNumberOfNotifications"), -[NCAppPickerContentProvider isSelectedForIndex:](self->_contentProvider, "isSelectedForIndex:", v10));

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    +[NCAppPickerViewHeader reuseIdentifier](NCAppPickerViewHeader, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "configureSupportsSortByAvgNumberOfNotifications:", -[NCAppPickerContentProvider isAbleToSortByAvgNumberOfNotifications](self->_contentProvider, "isAbleToSortByAvgNumberOfNotifications"));
  }
  else
  {
    v14 = *MEMORY[0x1E0DC48A0];
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A0]))
    {
      +[NCAppPickerViewFooter reuseIdentifier](NCAppPickerViewFooter, "reuseIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v14, v15, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "configureWithShowMoreButton:delegate:", self->_contentCollapsed, self);
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  NCAppPickerContentProvider *contentProvider;
  id v6;
  UICollectionView *collectionView;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  contentProvider = self->_contentProvider;
  v6 = a4;
  -[NCAppPickerContentProvider toggleSelectedForIndex:](contentProvider, "toggleSelectedForIndex:", objc_msgSend(v6, "item"));
  -[NCAppPickerViewController _refreshNextButton](self, "_refreshNextButton");
  collectionView = self->_collectionView;
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView reconfigureItemsAtIndexPaths:](collectionView, "reconfigureItemsAtIndexPaths:", v8);

}

- (void)appPickViewFooterShowMoreButtonPressed:(id)a3
{
  id v4;
  unint64_t i;
  void *v6;
  UICollectionView *collectionView;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = self->_contentCollapsedCellCount;
        i < -[NCAppPickerContentProvider totalCount](self->_contentProvider, "totalCount");
        ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  collectionView = self->_collectionView;
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke;
  v10[3] = &unk_1E8D1B3A0;
  v10[4] = self;
  v11 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke_2;
  v9[3] = &unk_1E8D1CDC0;
  v8 = v4;
  -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v10, v9);

}

uint64_t __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1217) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1305) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadFooter");
}

uint64_t __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_saveCellsSeen");
  return result;
}

- (double)_availableContentWidth
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  -[NCAppPickerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[NCAppPickerViewController contentView](self, "contentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "frame");
  v9 = v8 + -32.0;

  return v9;
}

- (void)_reloadFooter
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[NCAppPickerViewController _availableContentWidth](self, "_availableContentWidth");
  v4 = v3;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[NCAppPickerViewFooter preferredHeightForWidth:showMoreButton:](NCAppPickerViewFooter, "preferredHeightForWidth:showMoreButton:", self->_contentCollapsed, v4);
  objc_msgSend(v8, "setFooterReferenceSize:", v4, v5);
  -[UICollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "configureWithShowMoreButton:delegate:", self->_contentCollapsed, self);
  }

}

- (void)_saveCellsSeen
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  NSInteger v18;
  double v19;
  unint64_t i;
  void *v21;

  if (self->_viewHasAppeared)
  {
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v4 = v3 - self->_headerHeight;
    v5 = fmax(v4, 0.0);
    v6 = fmax(v4 + self->_collectionViewVisibleHeight, 0.0);
    v7 = self->_cellHeight + 8.0;
    v8 = v5 / v7;
    v9 = floor(v5 / v7);
    v10 = ceil(v8);
    if (v8 - v9 <= 0.25)
      v11 = v9;
    else
      v11 = v10;
    v12 = v6 / v7;
    v13 = floor(v6 / v7);
    v14 = v12 - v13 >= 0.75 || v12 <= 0.0;
    v15 = floor(v12 + -1.0);
    if (!v14)
      v13 = v15;
    v16 = (uint64_t)v13;
    v17 = -[NCAppPickerContentProvider totalCount](self->_contentProvider, "totalCount") - 1;
    v18 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0) - 1;
    if (v18 >= v16)
      v18 = v16;
    if (v17 >= v18)
      v17 = v18;
    v19 = v12 - v8;
    if (v12 - v8 > 0.75)
    {
      for (i = (unint64_t)v11; i <= v17; ++i)
      {
        -[NCAppPickerContentProvider bundleIdentifierForIndex:](self->_contentProvider, "bundleIdentifierForIndex:", i, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          -[NSMutableSet addObject:](self->_mutableShownBundleIdentifiers, "addObject:", v21);

      }
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_refreshNextButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[NCAppPickerContentProvider selectedCount](self->_contentProvider, "selectedCount"))
  {
    v3 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NCAppPickerContentProvider selectedCount](self->_contentProvider, "selectedCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ADD_APPS_FORMAT_WITH_LOCALIZED_NUMBER"), &stru_1E8D21F60, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, -[NCAppPickerContentProvider selectedCount](self->_contentProvider, "selectedCount"), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCOnboardingViewController setNextButtonText:](self, "setNextButtonText:", v8);
    -[NCOnboardingViewController setNextButtonEnabled:](self, "setNextButtonEnabled:", 1);

  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_ADD_APPS"), &stru_1E8D21F60, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCOnboardingViewController setNextButtonText:](self, "setNextButtonText:", v10);

    -[NCOnboardingViewController setNextButtonEnabled:](self, "setNextButtonEnabled:", 0);
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id v3;

  -[NCAppPickerViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_updateHeightConstraintAndLayout
{
  -[NCAppPickerViewController _updateHeightConstraintAndLayoutIfNeeded:](self, "_updateHeightConstraintAndLayoutIfNeeded:", 1);
}

- (void)_updateHeightConstraintAndLayoutIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double cellHeight;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;

  v3 = a3;
  -[NCAppPickerViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  if (-[NCAppPickerViewController _shouldInlineButtontray](self, "_shouldInlineButtontray"))
  {
    -[NCAppPickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    -[NCAppPickerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v10 - v12;
    -[NCAppPickerViewController buttonTray](self, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v13 - v15;

    v17 = 0.0;
  }
  else
  {
    -[NCAppPickerViewController buttonTray](self, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    -[NCAppPickerViewController buttonTray](self, "buttonTray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v20 + v22;
    -[NCAppPickerViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaInsets");
    v16 = v23 - v25;

    -[NCAppPickerViewController buttonTray](self, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v17 = v26;
  }
  v27 = -v7;

  -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
  if (v16 != v28
    || (-[NSLayoutConstraint constant](self->_topConstraint, "constant"), v29 != v27)
    || (-[UICollectionView contentInset](self->_collectionView, "contentInset"), v30 != v17)
    || (-[UICollectionView verticalScrollIndicatorInsets](self->_collectionView, "verticalScrollIndicatorInsets"),
        v31 != v17))
  {
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 16.0, v17, 16.0);
    -[UICollectionView setVerticalScrollIndicatorInsets:](self->_collectionView, "setVerticalScrollIndicatorInsets:", 0.0, 0.0, v17, 0.0);
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v16);
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v27);
    self->_collectionViewVisibleHeight = v16 - v17;
    v32 = v16 - v17 - self->_footerHeight - self->_headerHeight;
    cellHeight = self->_cellHeight;
    v34 = v32 / (cellHeight + 8.0);
    if (v34 < 4.0)
      v34 = 4.0;
    if ((double)(unint64_t)v34 * 8.0 + (double)((unint64_t)v34 + 1) * cellHeight >= v32)
      v35 = (unint64_t)v34;
    else
      v35 = (unint64_t)v34 + 1;
    v36 = -[NCAppPickerContentProvider totalCount](self->_contentProvider, "totalCount");
    self->_contentCollapsable = v36 > v35;
    if (v36 <= v35)
      v37 = 0;
    else
      v37 = v35;
    self->_contentCollapsedCellCount = v37;
    if (v3)
    {
      -[NCAppPickerViewController contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "needsUpdateConstraints");

      -[NCAppPickerViewController contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setNeedsLayout");

      -[NCAppPickerViewController contentView](self, "contentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "layoutIfNeeded");

      -[UICollectionView reloadData](self->_collectionView, "reloadData");
    }
  }
}

- (BOOL)_shouldInlineButtontray
{
  return self->_largerTextSize;
}

- (BOOL)showMoreButtonWasPressed
{
  return self->_showMoreButtonWasPressed;
}

- (void)setShowMoreButtonWasPressed:(BOOL)a3
{
  self->_showMoreButtonWasPressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mutableShownBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
}

@end
