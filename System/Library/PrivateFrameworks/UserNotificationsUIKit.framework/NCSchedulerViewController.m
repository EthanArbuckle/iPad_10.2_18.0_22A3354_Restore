@implementation NCSchedulerViewController

+ (id)schedulerWithDeliveryTimes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NCSchedulerViewController _initWithDeliveryTimes:]([NCSchedulerViewController alloc], "_initWithDeliveryTimes:", v3);

  return v4;
}

- (id)_initWithDeliveryTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NCSchedulerViewController *v9;
  uint64_t v10;
  NSMutableArray *mutableDeliveryTimes;
  NSMutableArray *v12;
  NSMutableArray *v13;
  objc_super v15;

  v4 = a3;
  NCRegisterUserNotificationsUILogging();
  NCUserNotificationsUIKitFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_TITLE"), &stru_1E8D21F60, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_DESCRIPTION"), &stru_1E8D21F60, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)NCSchedulerViewController;
  v9 = -[NCOnboardingViewController initWithTitle:detailText:contentLayout:](&v15, sel_initWithTitle_detailText_contentLayout_, v6, v8, 3);

  if (v9)
  {
    if (v4)
    {
      v10 = objc_msgSend(v4, "mutableCopy");
      mutableDeliveryTimes = v9->_mutableDeliveryTimes;
      v9->_mutableDeliveryTimes = (NSMutableArray *)v10;

    }
    else
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = v9->_mutableDeliveryTimes;
      v9->_mutableDeliveryTimes = v12;

      -[NCSchedulerViewController _insertNextTime](v9, "_insertNextTime");
      -[NCSchedulerViewController _insertNextTime](v9, "_insertNextTime");
    }
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  id v26;
  UICollectionView *v27;
  UICollectionView *collectionView;
  UICollectionView *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  UICollectionView *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
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
  double v54;
  double v55;
  void *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *heightConstraint;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)NCSchedulerViewController;
  -[NCOnboardingViewController viewDidLoad](&v59, sel_viewDidLoad);
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_NEXT_BUTTON"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCOnboardingViewController setNextButtonText:](self, "setNextButtonText:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_CANCEL"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__cancelButtonPressed_);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  -[NCSchedulerViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[NCSchedulerViewController contentView](self, "contentView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v14, "frame");
  v16 = v15 + -48.0;
  -[NCSchedulerViewController _addSummaryText](self, "_addSummaryText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCSchedulerViewCell preferredHeightForText:width:](NCSchedulerViewCell, "preferredHeightForText:width:", v17, v16);
  v19 = v18;

  -[NCSchedulerViewController _summaryTextForCount:](self, "_summaryTextForCount:", 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCSchedulerViewCell preferredHeightForText:width:](NCSchedulerViewCell, "preferredHeightForText:width:", v20, v16);
  v22 = v21;

  if (v19 >= v22)
    v23 = v19;
  else
    v23 = v22;
  self->_dynamicCellHeight = v23;
  v24 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v24, "setMinimumLineSpacing:", 0.0);
  objc_msgSend(v24, "setItemSize:", v16, self->_dynamicCellHeight);
  +[NCSchedulerViewHeader preferredHeightForWidth:](NCSchedulerViewHeader, "preferredHeightForWidth:", v16);
  self->_dynamicHeaderHeight = v25;
  objc_msgSend(v24, "setHeaderReferenceSize:", v16, v25);
  v26 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v27 = (UICollectionView *)objc_msgSend(v26, "initWithFrame:collectionViewLayout:", v24, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v27;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 24.0, 0.0, 24.0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
  -[UICollectionView setAutomaticallyAdjustsScrollIndicatorInsets:](self->_collectionView, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  v29 = self->_collectionView;
  v30 = objc_opt_class();
  v31 = *MEMORY[0x1E0DC48A8];
  +[NCSchedulerViewHeader reuseIdentifier](NCSchedulerViewHeader, "reuseIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v29, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v30, v31, v32);

  v33 = self->_collectionView;
  v34 = objc_opt_class();
  +[NCSchedulerViewCell reuseIdentifier](NCSchedulerViewCell, "reuseIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v33, "registerClass:forCellWithReuseIdentifier:", v34, v35);

  -[NCSchedulerViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", self->_collectionView);

  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSchedulerViewController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v41);

  -[NCSchedulerViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v45);

  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSchedulerViewController contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v49);

  -[NCSchedulerViewController contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v53);

  -[NCSchedulerViewController _heightThatFitsCollectionView](self, "_heightThatFitsCollectionView");
  v55 = v54;
  -[UICollectionView heightAnchor](self->_collectionView, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToConstant:", v55);
  v57 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v57;

  objc_msgSend(v37, "addObject:", self->_heightConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");

}

- (NSArray)deliveryTimes
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableDeliveryTimes, "copy");
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = *MEMORY[0x1E0DC48A8];
  v7 = a5;
  v8 = a3;
  +[NCSchedulerViewHeader reuseIdentifier](NCSchedulerViewHeader, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v6, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  BOOL v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  +[NCSchedulerViewCell reuseIdentifier](NCSchedulerViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCSchedulerViewController _isFirstIndexPath:](self, "_isFirstIndexPath:", v6);
  v11 = -[NCSchedulerViewController _isLastIndexPath:](self, "_isLastIndexPath:", v6);
  if (-[NCSchedulerViewController _isAddIndexPath:](self, "_isAddIndexPath:", v6))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewController _addSummaryText](self, "_addSummaryText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = v11;
    objc_msgSend(v9, "configureWithSymbolName:symbolColor:title:timeOfDay:delegate:top:bottom:", CFSTR("plus"), v12, v13, 0, self, v10, v18);
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  v14 = objc_msgSend(v6, "item");
  if (v14 < -[NSMutableArray count](self->_mutableDeliveryTimes, "count"))
  {
    -[NCSchedulerViewController _summaryTextForCount:](self, "_summaryTextForCount:", objc_msgSend(v6, "item") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v15 = 0;
    else
      v15 = CFSTR("minus");
    if (v10)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableArray objectAtIndex:](self->_mutableDeliveryTimes, "objectAtIndex:", objc_msgSend(v6, "item"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = v11;
    objc_msgSend(v9, "configureWithSymbolName:symbolColor:title:timeOfDay:delegate:top:bottom:", v15, v13, v12, v16, self, v10, v18);

    if (v10)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_13:

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  if (-[NCSchedulerViewController _isAddIndexPath:](self, "_isAddIndexPath:"))
    -[NCSchedulerViewController _handleAddOrRemoveActionForIndexPath:](self, "_handleAddOrRemoveActionForIndexPath:", v5);

}

- (void)schedulerCell:(id)a3 didChangeTime:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *mutableDeliveryTimes;
  NSMutableArray *v12;
  id v13;

  v13 = a4;
  -[NCSchedulerViewController _indexPathForCell:](self, "_indexPathForCell:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "item");
    if (v8 < -[NSMutableArray count](self->_mutableDeliveryTimes, "count"))
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableDeliveryTimes, "replaceObjectAtIndex:withObject:", objc_msgSend(v7, "item"), v13);
      -[NSMutableArray sortedArrayUsingComparator:](self->_mutableDeliveryTimes, "sortedArrayUsingComparator:", &__block_literal_global_17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");

      mutableDeliveryTimes = self->_mutableDeliveryTimes;
      self->_mutableDeliveryTimes = v10;
      v12 = v10;

      -[UICollectionView reloadData](self->_collectionView, "reloadData");
    }
  }

}

uint64_t __57__NCSchedulerViewController_schedulerCell_didChangeTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "hour");
  if (v6 <= objc_msgSend(v5, "hour"))
  {
    v8 = objc_msgSend(v4, "hour");
    v7 = -1;
    if (v8 == objc_msgSend(v5, "hour"))
    {
      v9 = objc_msgSend(v4, "minute");
      if (v9 >= objc_msgSend(v5, "minute"))
        v7 = 1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)schedulerCellButtonPressed:(id)a3
{
  void *v4;
  void *v5;

  -[NCSchedulerViewController _indexPathForCell:](self, "_indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NCSchedulerViewController _handleAddOrRemoveActionForIndexPath:](self, "_handleAddOrRemoveActionForIndexPath:", v4);
    v4 = v5;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCSchedulerViewController;
  -[NCSchedulerViewController touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
}

- (unint64_t)_currentDailyDigestCount
{
  return -[NSMutableArray count](self->_mutableDeliveryTimes, "count");
}

- (void)_insertNextTime
{
  NCSchedulerViewController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;

  if (!-[NCSchedulerViewController _currentDailyDigestCount](self, "_currentDailyDigestCount"))
  {
    v3 = self;
    v4 = 8;
    goto LABEL_5;
  }
  if (-[NCSchedulerViewController _currentDailyDigestCount](self, "_currentDailyDigestCount") == 1)
  {
    v3 = self;
    v4 = 18;
LABEL_5:
    v5 = 0;
LABEL_6:
    -[NCSchedulerViewController _dateComponentsForHour:minute:](v3, "_dateComponentsForHour:minute:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[NSMutableArray lastObject](self->_mutableDeliveryTimes, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hour");

  if (v8 > 0x16
    || (-[NCSchedulerViewController _dateComponentsForHour:minute:](self, "_dateComponentsForHour:minute:", v8 + 1, 0),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSMutableArray lastObject](self->_mutableDeliveryTimes, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "minute");

    if (v10 > 0x3A)
    {
      v3 = self;
      v4 = v8;
      v5 = 59;
    }
    else
    {
      v5 = v10 + 1;
      v3 = self;
      v4 = v8;
    }
    goto LABEL_6;
  }
LABEL_7:
  v11 = (id)v6;
  -[NSMutableArray addObject:](self->_mutableDeliveryTimes, "addObject:", v6);

}

- (void)_handleAddOrRemoveActionForIndexPath:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  if (-[NCSchedulerViewController _isAddIndexPath:](self, "_isAddIndexPath:"))
  {
    -[NCSchedulerViewController _addItemAtIndexPath:](self, "_addItemAtIndexPath:", v5);
  }
  else
  {
    v4 = objc_msgSend(v5, "item");
    if (v4 < -[NSMutableArray count](self->_mutableDeliveryTimes, "count"))
      -[NCSchedulerViewController _deleteItemAtIndexPath:](self, "_deleteItemAtIndexPath:", v5);
  }

}

- (unint64_t)_cellCount
{
  unint64_t v2;

  v2 = -[NCSchedulerViewController _currentDailyDigestCount](self, "_currentDailyDigestCount");
  if (v2 + 1 < 0xC)
    return v2 + 1;
  else
    return 12;
}

- (BOOL)_isFirstIndexPath:(id)a3
{
  return objc_msgSend(a3, "item") == 0;
}

- (BOOL)_isLastIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[NCSchedulerViewController _cellCount](self, "_cellCount") - 1;
  v6 = objc_msgSend(v4, "item");

  return v5 == v6;
}

- (BOOL)_isAddIndexPath:(id)a3
{
  _BOOL4 v4;

  v4 = -[NCSchedulerViewController _isLastIndexPath:](self, "_isLastIndexPath:", a3);
  if (v4)
    LOBYTE(v4) = -[NCSchedulerViewController _currentDailyDigestCount](self, "_currentDailyDigestCount") < 0xC;
  return v4;
}

- (double)_heightThatFitsCollectionView
{
  double dynamicCellHeight;

  dynamicCellHeight = self->_dynamicCellHeight;
  return self->_dynamicHeaderHeight
       + dynamicCellHeight * (double)-[NCSchedulerViewController _cellCount](self, "_cellCount");
}

- (void)_reloadCollectionViewHeight
{
  double v3;
  double v4;
  double v5;

  -[NCSchedulerViewController _heightThatFitsCollectionView](self, "_heightThatFitsCollectionView");
  v4 = v3;
  -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
  if (v4 != v5)
  {
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v4);
    -[UICollectionView setNeedsLayout](self->_collectionView, "setNeedsLayout");
    -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
  }
}

- (id)_indexPathForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  os_log_t *v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  v8 = (os_log_t *)MEMORY[0x1E0DC5FA0];
  if (v7)
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v6, "count");
      if (v10 == v4)
        break;
      if (++v9 >= objc_msgSend(v5, "count"))
        goto LABEL_11;
    }
    if (v9 >= v11)
    {
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        -[NCSchedulerViewController _indexPathForCell:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_14;
    }
  }
LABEL_11:
  v21 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    -[NCSchedulerViewController _indexPathForCell:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  v12 = 0;
LABEL_14:

  return v12;
}

- (void)_deleteItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  UICollectionView *collectionView;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  collectionView = self->_collectionView;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke;
  v12[3] = &unk_1E8D1D8C0;
  v12[4] = self;
  v13 = v4;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_2;
  v10[3] = &unk_1E8D1DD08;
  v10[4] = self;
  v11 = v14;
  v8 = v14;
  v9 = v4;
  -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v12, v10);

}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentDailyDigestCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  objc_msgSend(*(id *)(a1 + 32), "_reloadCollectionViewHeight");
  for (i = objc_msgSend(*(id *)(a1 + 40), "item"); i < objc_msgSend(*(id *)(a1 + 32), "_cellCount"); ++i)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (v2 != 12)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteItemsAtIndexPaths:", v7);

  }
}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E8D1DD08;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performBatchUpdates:completion:", &__block_literal_global_31, v4);

}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));

}

- (void)_addItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  UICollectionView *collectionView;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = -[NCSchedulerViewController _currentDailyDigestCount](self, "_currentDailyDigestCount");
  collectionView = self->_collectionView;
  if (v5 == 11)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke;
    v13[3] = &unk_1E8D1B3A0;
    v13[4] = self;
    v14 = v4;
    v7 = v4;
    -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v13, 0);
    v8 = v14;
  }
  else
  {
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_2;
    v11[3] = &unk_1E8D1B3A0;
    v11[4] = self;
    v12 = v4;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_3;
    v10[3] = &unk_1E8D1CDC0;
    v9 = v4;
    -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v11, v10);
    v8 = v12;
  }

}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_insertNextTime");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", v3);

}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_insertNextTime");
  objc_msgSend(*(id *)(a1 + 32), "_reloadCollectionViewHeight");
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = objc_msgSend(*(id *)(a1 + 40), "item"); i < objc_msgSend(*(id *)(a1 + 32), "_cellCount") - 1; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItemsAtIndexPaths:", v2);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertItemsAtIndexPaths:", v7);

}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v5 - v7;
    objc_msgSend(*(id *)(a1 + 32), "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v11 = v8 + v10;

    if (v11 > 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentOffset:animated:", 1, 0.0, v11);

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_summaryTextForCount:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_FIRST_SUMMARY");
      goto LABEL_14;
    case 2uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_SECOND_SUMMARY");
      goto LABEL_14;
    case 3uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_THIRD_SUMMARY");
      goto LABEL_14;
    case 4uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_FOURTH_SUMMARY");
      goto LABEL_14;
    case 5uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_FIFTH_SUMMARY");
      goto LABEL_14;
    case 6uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_SIXTH_SUMMARY");
      goto LABEL_14;
    case 7uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_SEVENTH_SUMMARY");
      goto LABEL_14;
    case 8uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_EIGHTH_SUMMARY");
      goto LABEL_14;
    case 9uLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_NINTH_SUMMARY");
      goto LABEL_14;
    case 0xAuLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_TENTH_SUMMARY");
      goto LABEL_14;
    case 0xBuLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_ELEVENTH_SUMMARY");
      goto LABEL_14;
    case 0xCuLL:
      NCUserNotificationsUIKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOTIFICATION_DIGEST_LABEL_TWELFTH_SUMMARY");
LABEL_14:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8D21F60, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)_addSummaryText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_SETTINGS_ADD_SUMMARY"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dateComponentsForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setHour:", a3);
  objc_msgSend(v6, "setMinute:", a4);
  return v6;
}

- (void)_cancelButtonPressed:(id)a3
{
  id v3;

  -[NCSchedulerViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mutableDeliveryTimes, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

- (void)_indexPathForCell:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFC3D000, a1, a3, "Cannot find cell in visibleCells", a5, a6, a7, a8, 0);
}

- (void)_indexPathForCell:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFC3D000, a1, a3, "Collection view's visibleCells count does not equal indexPathsForVisibleItems count, and thus can't get index for cell.", a5, a6, a7, a8, 0);
}

@end
