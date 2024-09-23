@implementation CHAchievementsDataSource

- (CHAchievementsDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 recentAndRelevantCollectionView:(id)a5 recentAndRelevantDataSource:(id)a6 localizationProvider:(id)a7 badgeImageFactory:(id)a8
{
  id v15;
  id v16;
  id v17;
  CHAchievementsDataSource *v18;
  CHAchievementsDataSource *v19;
  UICollectionView *collectionView;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  UICollectionView *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  UICollectionView *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableDictionary *v43;
  NSMutableDictionary *cellSizeForIndexPath;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v46 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v49.receiver = self;
  v49.super_class = (Class)CHAchievementsDataSource;
  v18 = -[CHAchievementsDataSource init](&v49, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_locProvider, a7);
    objc_storeStrong((id *)&v19->_dataProvider, a3);
    -[AAUIAchievementsDataProvider addMainSectionObserver:](v19->_dataProvider, "addMainSectionObserver:", v19);
    objc_storeStrong((id *)&v19->_badgeImageFactory, a8);
    objc_storeStrong((id *)&v19->_recentAndRelevantDataSource, a6);
    objc_storeStrong((id *)&v19->_collectionView, a4);
    -[UICollectionView setDelegate:](v19->_collectionView, "setDelegate:", v19);
    -[UICollectionView setDataSource:](v19->_collectionView, "setDataSource:", v19);
    collectionView = v19->_collectionView;
    v22 = objc_opt_class(CHRecentAndRelevantCollectionViewCell, v21);
    v24 = (objc_class *)objc_opt_class(CHRecentAndRelevantCollectionViewCell, v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](collectionView, "registerClass:forCellWithReuseIdentifier:", v22, v26);

    v27 = v19->_collectionView;
    v29 = objc_opt_class(CHAchievementsCollectionViewCell, v28);
    v31 = (objc_class *)objc_opt_class(CHAchievementsCollectionViewCell, v30);
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v27, "registerClass:forCellWithReuseIdentifier:", v29, v33);

    v34 = v19->_collectionView;
    v36 = objc_opt_class(CHAchievementsSectionHeaderView, v35);
    v38 = (objc_class *)objc_opt_class(CHAchievementsSectionHeaderView, v37);
    v39 = NSStringFromClass(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v34, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v36, UICollectionElementKindSectionHeader, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](v19->_collectionView, "collectionViewLayout"));
    objc_msgSend(v41, "setMinimumLineSpacing:", 13.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v42, "addObserver:selector:name:object:", v19, "textSizeDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    objc_storeStrong((id *)&v19->_recentAndRelevantCollectionView, a5);
    v43 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellSizeForIndexPath = v19->_cellSizeForIndexPath;
    v19->_cellSizeForIndexPath = v43;

    -[CHAchievementsDataSource textSizeDidChange:](v19, "textSizeDidChange:", 0);
  }

  return v19;
}

- (double)mainSectionHorizontalInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = (double)-[CHAchievementsDataSource nCellsPerRow](self, "nCellsPerRow");
  -[CHAchievementsDataSource mainSectionCellWidth](self, "mainSectionCellWidth");
  v5 = v4 * v3;
  -[CHAchievementsDataSource mainSectionCellPadding](self, "mainSectionCellPadding");
  v7 = v5 + (v3 + -1.0) * v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v10 = (v9 - v7) * 0.5;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource collectionView](self, "collectionView"));
  v12 = UICeilToViewScale(v10);

  return v12;
}

- (void)textSizeDidChange:(id)a3
{
  void *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
    v6 = 2;
  else
    v6 = 3;
  -[CHAchievementsDataSource setNCellsPerRow:](self, "setNCellsPerRow:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v10 = (id)-[CHAchievementsDataSource nCellsPerRow](self, "nCellsPerRow") == (id)2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource collectionView](self, "collectionView"));
  v12 = UIRoundToViewScale(v11, v9 * dbl_100620870[v10]);

  -[CHAchievementsDataSource setMainSectionCellWidth:](self, "setMainSectionCellWidth:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource cellSizeForIndexPath](self, "cellSizeForIndexPath"));
  objc_msgSend(v13, "removeAllObjects");

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource collectionView](self, "collectionView"));
  objc_msgSend(v14, "reloadData");

}

- (void)dealloc
{
  objc_super v3;

  -[AAUIAchievementsDataProvider removeMainSectionObserver:](self->_dataProvider, "removeMainSectionObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsDataSource;
  -[CHAchievementsDataSource dealloc](&v3, "dealloc");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "achievementAtIndexPath:", v6));

    v12 = (objc_class *)objc_opt_class(CHAchievementsCollectionViewCell, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v6));

    -[CHAchievementsDataSource mainSectionCellWidth](self, "mainSectionCellWidth");
    objc_msgSend(v15, "setPreferredWidth:");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource badgeImageFactory](self, "badgeImageFactory"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource locProvider](self, "locProvider"));
    objc_msgSend(v15, "configureWithAchievement:badgeImageFactory:locProvider:", v10, v16, v17);

  }
  else
  {
    v18 = (objc_class *)objc_opt_class(CHRecentAndRelevantCollectionViewCell, v8);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v6));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
    objc_msgSend(v15, "setCollectionView:", v10);
  }

  return v15;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider", a3));
  v4 = objc_msgSend(v3, "numberOfSections");

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider", a3));
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return (int64_t)v6;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat left;
  CGFloat bottom;
  CGFloat top;
  CGFloat right;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  if (a5
    && -[CHAchievementsDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, a5))
  {
    -[CHAchievementsDataSource mainSectionHorizontalInset](self, "mainSectionHorizontalInset");
    left = v10;
    bottom = 12.0;
    top = 0.0;
    right = v10;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)siblingIndexPathsForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char *v10;
  id v11;
  void **v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v4 = a3;
  v5 = -[CHAchievementsDataSource nCellsPerRow](self, "nCellsPerRow");
  v6 = (uint64_t)objc_msgSend(v4, "item") % v5;
  if (v5 == 3)
  {
    if (v6 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") - 1, objc_msgSend(v4, "section")));
      v18[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") + 1, objc_msgSend(v4, "section")));
      v18[1] = v8;
      v9 = v18;
    }
    else if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") - 2, objc_msgSend(v4, "section")));
      v17[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") - 1, objc_msgSend(v4, "section")));
      v17[1] = v8;
      v9 = v17;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") + 1, objc_msgSend(v4, "section")));
      v19[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") + 2, objc_msgSend(v4, "section")));
      v19[1] = v8;
      v9 = v19;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

  }
  else
  {
    v10 = (char *)objc_msgSend(v4, "item");
    v11 = objc_msgSend(v4, "section");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v10 - 1, v11));
      v15 = v7;
      v12 = &v15;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v10 + 1, v11));
      v16 = v7;
      v12 = &v16;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1));
  }

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat Width;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  CGSize result;
  CGRect v53;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "section"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource cellSizeForIndexPath](self, "cellSizeForIndexPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

    if (v10)
    {
      objc_msgSend(v10, "CGSizeValue");
      Width = v11;
      v14 = v13;
    }
    else
    {
      v46 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource siblingIndexPathsForIndexPath:](self, "siblingIndexPathsForIndexPath:", v8));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "achievementAtIndexPath:", v8));

      -[CHAchievementsDataSource mainSectionCellWidth](self, "mainSectionCellWidth");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource locProvider](self, "locProvider"));
      v45 = (void *)v19;
      +[CHAchievementsCellContentView cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:](CHAchievementsCellContentView, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:", v19, 0, v22, v21);
      v14 = v23;

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v24 = v17;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
            v30 = objc_msgSend(v29, "item");
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
            v32 = objc_msgSend(v31, "numberOfItemsInSection:", objc_msgSend(v8, "section"));

            if ((uint64_t)v30 < (uint64_t)v32)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "achievementAtIndexPath:", v29));

              -[CHAchievementsDataSource mainSectionCellWidth](self, "mainSectionCellWidth");
              v36 = v35;
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource locProvider](self, "locProvider"));
              +[CHAchievementsCellContentView cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:](CHAchievementsCellContentView, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:", v34, 0, v37, v36);
              v39 = v38;

              if (v14 < v39)
                v14 = v39;

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v26);
      }

      -[CHAchievementsDataSource mainSectionCellWidth](self, "mainSectionCellWidth");
      Width = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource cellSizeForIndexPath](self, "cellSizeForIndexPath"));
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v8);

      v10 = 0;
      v7 = v46;
    }

  }
  else
  {
    objc_msgSend(v7, "frame");
    Width = CGRectGetWidth(v53);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource recentAndRelevantDataSource](self, "recentAndRelevantDataSource"));
    objc_msgSend(v15, "preferredCollectionViewHeight");
    v14 = v16;

  }
  v43 = Width;
  v44 = v14;
  result.height = v44;
  result.width = v43;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  double v16;
  double v17;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (a5
    && -[CHAchievementsDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, a5) >= 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headerStringForSection:isRecentAndRelevant:", a5, 0));

    +[CHAchievementsSectionHeaderView preferredSizeForSectionName:](CHAchievementsSectionHeaderView, "preferredSizeForSectionName:", v11);
    width = v12;
    height = v14;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  NSString *v9;
  uint64_t v10;
  id v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = (NSString *)a4;
  v11 = a5;
  if (UICollectionElementKindSectionHeader == v9)
  {
    v13 = (objc_class *)objc_opt_class(CHAchievementsSectionHeaderView, v10);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v15, v11));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "headerStringForSection:isRecentAndRelevant:", objc_msgSend(v11, "section"), 0));
    objc_msgSend(v12, "configureWithSectionName:", v17);

  }
  else
  {
    v12 = objc_alloc_init((Class)UICollectionReusableView);
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) != 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v21 = a4;
  v6 = a3;
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v21));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource achievementTappedHandler](self, "achievementTappedHandler"));
  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource achievementTappedHandler](self, "achievementTappedHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource dataProvider](self, "dataProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "achievementAtIndexPath:", v21));
    objc_msgSend(v7, "badgeRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    ((void (**)(_QWORD, void *, void *, void *, double, double, double, double))v9)[2](v9, v11, v20, v7, v13, v15, v17, v19);

  }
}

- (void)achievementsDataProviderDidUpdate:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource cellSizeForIndexPath](self, "cellSizeForIndexPath", a3));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsDataSource collectionView](self, "collectionView"));
  objc_msgSend(v5, "reloadData");

}

- (id)achievementTappedHandler
{
  return self->_achievementTappedHandler;
}

- (void)setAchievementTappedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageFactory, a3);
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locProvider, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionView)recentAndRelevantCollectionView
{
  return self->_recentAndRelevantCollectionView;
}

- (void)setRecentAndRelevantCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, a3);
}

- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource
{
  return self->_recentAndRelevantDataSource;
}

- (void)setRecentAndRelevantDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, a3);
}

- (int64_t)nCellsPerRow
{
  return self->_nCellsPerRow;
}

- (void)setNCellsPerRow:(int64_t)a3
{
  self->_nCellsPerRow = a3;
}

- (double)mainSectionCellWidth
{
  return self->_mainSectionCellWidth;
}

- (void)setMainSectionCellWidth:(double)a3
{
  self->_mainSectionCellWidth = a3;
}

- (NSMutableDictionary)cellSizeForIndexPath
{
  return self->_cellSizeForIndexPath;
}

- (void)setCellSizeForIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_cellSizeForIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellSizeForIndexPath, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong(&self->_achievementTappedHandler, 0);
}

@end
