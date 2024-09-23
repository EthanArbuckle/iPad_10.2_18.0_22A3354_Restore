@implementation MailActionsViewController

- (MailActionsViewController)initWithDelegate:(id)a3 messageHeaderView:(id)a4 didDismissHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MailActionsViewController *v11;
  MailActionsViewController *v12;
  id v13;
  id didDismissHandler;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MailActionsViewController;
  v11 = -[MailActionsViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_messageHeaderView, a4);
    v13 = objc_retainBlock(v10);
    didDismissHandler = v12->_didDismissHandler;
    v12->_didDismissHandler = v13;

  }
  return v12;
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = objc_claimAutoreleasedReturnValue(-[MailActionsViewController didDismissHandler](self, "didDismissHandler"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  -[MailActionsViewController setDidDismissHandler:](self, "setDidDismissHandler:", 0);

}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v3);

  -[MailActionsViewController setView:](self, "setView:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9));
  v5 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v4);
  objc_storeStrong((id *)&self->_backgroundView, v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", v5);
  objc_msgSend(v5, "mf_pinToView:usingLayoutMargins:", v6, 0);
  -[MailActionsViewController _configureNavigationTitleViewIfNeeded](self, "_configureNavigationTitleViewIfNeeded");
  -[MailActionsViewController _configureCollectionViewIfNeeded](self, "_configureCollectionViewIfNeeded");
  -[MailActionsViewController _loadData](self, "_loadData");

}

- (void)reloadFlagItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewController flagCardAction](self, "flagCardAction"));
  objc_msgSend(v15, "setAccessibilityIdentifer:", MSAccessibilityIdentifierActionsViewControllerFlag);
  if (v15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController flagColorCardAction](self, "flagColorCardAction"));
    if (objc_msgSend(v3, "count"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemIdentifier:", v5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

      v9 = -[MailActionsViewController _cardActionIsUnflag:](self, "_cardActionIsUnflag:", v15);
      if (v9)
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MFFlagTriageInteraction defaultColor](MFFlagTriageInteraction, "defaultColor")));
      else
        v10 = 0;
      objc_msgSend(v8, "selectColor:", v10);
      if (v9)

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItemIdentifier:", v15));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v13));

    objc_msgSend(v14, "setCardAction:", v15);
  }

}

- (BOOL)_cardActionIsUnflag:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "imageName"));
  v4 = objc_msgSend(v3, "isEqualToString:", MFImageGlyphUnflag);

  return v4;
}

- (double)_topInsetForCollectionView
{
  return 16.0;
}

- (double)_bottomInsetForCollectionView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController view](self, "view"));
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController view](self, "view"));
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 + v7;

  return v8;
}

- (BOOL)useActionSheetStyleCard
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController sectionData](self, "sectionData"));
  v3 = objc_msgSend(v2, "count") == (id)1;

  return v3;
}

- (double)approximateHeightForActionSheetStyleCard
{
  unsigned int v3;
  double result;
  void *v5;
  double Height;
  double v7;
  double v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  double v12;
  double v13;
  MFMessageDisplayMetrics *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGRect v22;

  v3 = -[MailActionsViewController useActionSheetStyleCard](self, "useActionSheetStyleCard");
  result = 0.0;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController messageHeaderView](self, "messageHeaderView", 0.0));
    objc_msgSend(v5, "frame");
    Height = CGRectGetHeight(v22);

    -[MailActionsViewController _topInsetForCollectionView](self, "_topInsetForCollectionView");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController traitCollection](self, "traitCollection"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
    {
      +[MailActionCell approximateHeightForAccessibilityContentSizeCategory](MailActionCell, "approximateHeightForAccessibilityContentSizeCategory");
      v13 = v12;
    }
    else
    {
      v14 = objc_opt_new(MFMessageDisplayMetrics);
      -[MFMessageDisplayMetrics topToFirstBaselineSpacingInMailActionCardVerticalGroup](v14, "topToFirstBaselineSpacingInMailActionCardVerticalGroup");
      v16 = v15;
      -[MFMessageDisplayMetrics bottomToLastBaselineInMailActionCardVerticalGroup](v14, "bottomToLastBaselineInMailActionCardVerticalGroup");
      v13 = v16 + v17;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController sectionData](self, "sectionData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actions"));
    v21 = Height + 0.0 + v8 + (double)(unint64_t)objc_msgSend(v20, "count") * v13;

    return v21 + 8.0;
  }
  return result;
}

- (double)approximateHeightNeededForAccessibilityContentSizeCategory
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  double result;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double Height;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  result = 0.0;
  if (IsAccessibilityCategory)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController sectionData](self, "sectionData", 0.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actions"));
    v10 = objc_msgSend(v9, "count");

    +[MailActionCell approximateHeightForAccessibilityContentSizeCategory](MailActionCell, "approximateHeightForAccessibilityContentSizeCategory");
    v12 = v11;
    -[MailActionsViewController _topInsetForCollectionView](self, "_topInsetForCollectionView");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController messageHeaderView](self, "messageHeaderView"));
    objc_msgSend(v15, "frame");
    Height = CGRectGetHeight(v17);

    return (double)((unint64_t)v10 - 1) * 8.0 + (double)(unint64_t)v10 * v12 + v14 + Height;
  }
  return result;
}

- (void)_loadData
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewController dataSource](self, "dataSource"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController sectionData](self, "sectionData"));
    -[MailActionsViewController _performDataSourceUpdate:](self, "_performDataSourceUpdate:", v3);

  }
}

- (NSArray)sectionData
{
  void *v3;
  NSArray *sectionData;
  BOOL v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController dataSource](self, "dataSource"));
  sectionData = self->_sectionData;
  if (sectionData)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionDataForMailActionsViewController:", self));
    v7 = self->_sectionData;
    self->_sectionData = v6;

    sectionData = self->_sectionData;
  }
  v8 = sectionData;

  return v8;
}

- (void)_configureCollectionViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void ***v29;
  id v30;
  id v31;
  void **v32;
  uint64_t v33;
  id (*v34)(uint64_t, void *, void *, void *);
  void *v35;
  id v36;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController view](self, "view"));
    v5 = objc_alloc((Class)UICollectionView);
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController compositionalLayout](self, "compositionalLayout"));
    v15 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v14, v7, v9, v11, v13);

    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v15, "setDelaysContentTouches:", 0);
    -[MailActionsViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v15, 15);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setBackgroundColor:", 0);
    objc_msgSend(v15, "setAlwaysBounceVertical:", 1);
    -[MailActionsViewController _topInsetForCollectionView](self, "_topInsetForCollectionView");
    v17 = v16;
    -[MailActionsViewController _bottomInsetForCollectionView](self, "_bottomInsetForCollectionView");
    objc_msgSend(v15, "setContentInset:", v17, 0.0, v18, 0.0);
    objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v15, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -400.0, 0.0);
    v19 = objc_opt_class(MailActionCell);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionCell reusableIdentifier](MailActionCell, "reusableIdentifier"));
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v19, v20);

    v21 = objc_opt_class(MailActionHorizontalGroupedCell);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionHorizontalGroupedCell reusableIdentifier](MailActionHorizontalGroupedCell, "reusableIdentifier"));
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v21, v22);

    v23 = objc_opt_class(MailActionVerticalGroupedCell);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionVerticalGroupedCell reusableIdentifier](MailActionVerticalGroupedCell, "reusableIdentifier"));
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v23, v24);

    v25 = objc_opt_class(MailActionFlagColorCell);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionFlagColorCell reusableIdentifier](MailActionFlagColorCell, "reusableIdentifier"));
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v25, v26);

    v27 = objc_opt_class(_TtC10MobileMail29MailActionCatchUpFeedbackCell);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionCatchUpFeedbackCell reusableIdentifier](_TtC10MobileMail29MailActionCatchUpFeedbackCell, "reusableIdentifier"));
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v27, v28);

    objc_msgSend(v15, "setAccessibilityIdentifier:", MSAccessibilityIdentifierActionsViewController);
    -[MailActionsViewController setCollectionView:](self, "setCollectionView:", v15);
    objc_msgSend(v4, "addSubview:", v15);
    objc_msgSend(v15, "mf_pinToView:usingLayoutMargins:", v4, 0);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = sub_1000AB3A4;
    v35 = &unk_10051D240;
    objc_copyWeak(&v36, &location);
    v29 = objc_retainBlock(&v32);
    v30 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v31 = objc_msgSend(v30, "initWithCollectionView:cellProvider:", v15, v29, v32, v33, v34, v35);
    -[MailActionsViewController setCollectionViewDataSource:](self, "setCollectionViewDataSource:", v31);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
}

- (id)compositionalLayout
{
  void ***v2;
  id v3;
  id v4;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1000AB810;
  v9 = &unk_10051D300;
  objc_copyWeak(&v10, &location);
  v2 = objc_retainBlock(&v6);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", v2, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

- (double)_maxLabelWidthInSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  NSAttributedStringKey v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailActionCell preferredFontForHorizontalTitle](MailActionCell, "preferredFontForHorizontalTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifiersInSectionWithIdentifier:", v4));

  v24 = NSFontAttributeName;
  v25 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "shortTitle", (_QWORD)v19));
        objc_msgSend(v15, "sizeWithAttributes:", v9);
        v17 = v16;

        v13 = fmax(v17, v13);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  return ceil(v13);
}

- (void)_performDataSourceUpdate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  MailActionsViewController *v6;
  id v7;

  v6 = self;
  v3 = a3;
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000AC52C, &unk_10051A910, v6));
  objc_msgSend(v4, "performBlock:", &v5);

}

- (BOOL)_insertActions:(id)a3 after:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  id v13;
  id v14;
  MailActionsViewController *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = self;
  v16 = &v17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000ACD28, &unk_10051D3B0));
  objc_msgSend(v10, "performBlock:", &v12);

  LOBYTE(v10) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v10;
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController viewLayoutMarginsDidChange](&v5, "viewLayoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  -[MailActionsViewController _loadData](self, "_loadData");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionViewLayout"));
  objc_msgSend(v6, "invalidateLayout");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController messageHeaderView](self, "messageHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayMetrics"));
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:](MailActionViewHeader, "defaultHeightWithDisplayMetrics:", v8);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController titleView](self, "titleView"));
  objc_msgSend(v11, "setHeight:", v10);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController viewSafeAreaInsetsDidChange](&v9, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v3, "layoutMargins");
    v7 = v6;
    objc_msgSend(v3, "safeAreaInsets");
    objc_msgSend(v5, "setContentInset:", 16.0, 0.0, v7 + v8, 0.0);

  }
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD2D0;
  v8[3] = &unk_10051C0B8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AD534;
  v13[3] = &unk_10051A910;
  v13[4] = self;
  v8 = v7;
  v14 = v8;
  v9 = objc_retainBlock(v13);
  if (objc_msgSend(v8, "shouldDeferDismissHandler"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController didDismissHandler](self, "didDismissHandler"));
    objc_msgSend(v8, "setDismissHandler:", v10);

    -[MailActionsViewController setDidDismissHandler:](self, "setDidDismissHandler:", 0);
  }
  if (objc_msgSend(v8, "shouldDismissCardBeforeExecuteHandler"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AD718;
    v11[3] = &unk_10051A870;
    v12 = v9;
    -[MailActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

- (void)_updateFlagCardActionCell:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController flagCardAction](self, "flagCardAction"));
  v6 = &MFImageGlyphFlag;
  if (!v3)
    v6 = &MFImageGlyphUnflag;
  v12 = v5;
  objc_msgSend(v5, "setImageName:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController dataSource](self, "dataSource"));
  v8 = objc_opt_respondsToSelector(v7, "messageCountForMailActionsViewController:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController dataSource](self, "dataSource"));
    v10 = (uint64_t)objc_msgSend(v9, "messageCountForMailActionsViewController:", self);

  }
  else
  {
    v10 = 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagTriageInteraction titleForFlagAction:messageCount:](MFFlagTriageInteraction, "titleForFlagAction:messageCount:", v3, v10));
  objc_msgSend(v12, "setTitle:", v11);

  -[MailActionsViewController reloadFlagItem](self, "reloadFlagItem");
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "itemIdentifierForIndexPath:", v5));

  v8 = objc_opt_class(MFFlagColorCardAction);
  LOBYTE(v6) = objc_opt_isKindOfClass(v7, v8);
  v9 = objc_opt_class(MFCatchUpFeedbackCardAction);
  LOBYTE(v6) = v6 | objc_opt_isKindOfClass(v7, v9);

  return (v6 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = objc_opt_class(MFFlagColorCardAction);
  LODWORD(v6) = objc_opt_isKindOfClass(v7, v8);
  v9 = objc_opt_class(MFCatchUpFeedbackCardAction);
  v10 = ((v6 | objc_opt_isKindOfClass(v7, v9)) & 1) == 0
     && (objc_msgSend(v7, "handlerEnabled") & 1) != 0;

  return v10;
}

- (void)_configureNavigationTitleViewIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController titleView](self, "titleView"));

  if (!v3)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewController messageHeaderView](self, "messageHeaderView"));
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_msgSend(objc_alloc((Class)_UINavigationBarTitleView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v4, "setHideStandardTitle:", 1);
    objc_msgSend(v29, "frame");
    objc_msgSend(v4, "setHeight:", CGRectGetHeight(v30));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "addSubview:", v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setTitleView:", v4);

    -[MailActionsViewController setTitleView:](self, "setTitleView:", v4);
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "dismissSelf");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    v9 = objc_opt_new(NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    -[NSMutableArray addObject:](v9, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -24.0));
    -[NSMutableArray addObject:](v9, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    -[NSMutableArray addObject:](v9, "addObject:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    -[NSMutableArray addObject:](v9, "addObject:", v23);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v24, "_setManualScrollEdgeAppearanceEnabled:", 1);

    v25 = objc_alloc_init((Class)UINavigationBarAppearance);
    objc_msgSend(v25, "configureWithDefaultBackground");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    objc_msgSend(v25, "setShadowColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v27, "setStandardAppearance:", v25);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v28, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double Height;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));

  v5 = v12;
  if (v4 == v12)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController messageHeaderView](self, "messageHeaderView"));
    objc_msgSend(v6, "frame");
    Height = CGRectGetHeight(v13);

    objc_msgSend(v12, "contentOffset");
    if (v8 <= -Height)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", 0.0);
    }
    else
    {
      objc_msgSend(v12, "contentOffset");
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", fmin((Height + v10) * 10.0, 100.0) / 100.0);
    }

    v5 = v12;
  }

}

- (void)dismissSelf
{
  -[MailActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mailActionFlagColorCell:(id)a3 didTapOnFlagColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "selectColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v12));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIdentifierForIndexPath:", v8));

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flagColor"));
  if (v11 != v6)
  {
    objc_msgSend(v10, "setFlagColor:", v6);
    objc_msgSend(v10, "executeHandler");
  }
  -[MailActionsViewController _updateFlagCardActionCell:](self, "_updateFlagCardActionCell:", 0);

}

- (void)mailActionCatchUpFeedbackCell:(id)a3 didTapOnFeedbackType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v10));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v7));

  objc_msgSend(v9, "setSelectedFeedbackType:", a4);
  objc_msgSend(v9, "executeHandler");

}

- (MailActionsViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MailActionsViewDelegate)delegate
{
  return (MailActionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (MailActionViewHeader)messageHeaderView
{
  return self->_messageHeaderView;
}

- (void)setMessageHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_messageHeaderView, a3);
}

- (_UINavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDataSource, a3);
}

- (NSMutableDictionary)cardSectionViewLayout
{
  return self->_cardSectionViewLayout;
}

- (void)setCardSectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionViewLayout, a3);
}

- (NSArray)flagColorCardAction
{
  return self->_flagColorCardAction;
}

- (void)setFlagColorCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_flagColorCardAction, a3);
}

- (MFCardAction)flagCardAction
{
  return self->_flagCardAction;
}

- (void)setFlagCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_flagCardAction, a3);
}

- (MFCatchUpFeedbackCardHeaderAction)catchUpFeedbackHeaderCardAction
{
  return self->_catchUpFeedbackHeaderCardAction;
}

- (void)setCatchUpFeedbackHeaderCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_catchUpFeedbackHeaderCardAction, a3);
}

- (MFCatchUpFeedbackCardAction)catchUpFeedbackCardAction
{
  return self->_catchUpFeedbackCardAction;
}

- (void)setCatchUpFeedbackCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_catchUpFeedbackCardAction, a3);
}

- (BOOL)useVerticalSingleInsteadOfHorizontal
{
  return self->_useVerticalSingleInsteadOfHorizontal;
}

- (void)setUseVerticalSingleInsteadOfHorizontal:(BOOL)a3
{
  self->_useVerticalSingleInsteadOfHorizontal = a3;
}

- (void)setSectionData:(id)a3
{
  objc_storeStrong((id *)&self->_sectionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionData, 0);
  objc_storeStrong((id *)&self->_catchUpFeedbackCardAction, 0);
  objc_storeStrong((id *)&self->_catchUpFeedbackHeaderCardAction, 0);
  objc_storeStrong((id *)&self->_flagCardAction, 0);
  objc_storeStrong((id *)&self->_flagColorCardAction, 0);
  objc_storeStrong((id *)&self->_cardSectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_messageHeaderView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
