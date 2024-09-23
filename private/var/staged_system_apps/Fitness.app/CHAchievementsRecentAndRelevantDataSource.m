@implementation CHAchievementsRecentAndRelevantDataSource

- (double)collectionView:layout:minimumInteritemSpacingForSectionAtIndex:
{
  if (qword_10083DF08 != -1)
    dispatch_once(&qword_10083DF08, &stru_100777F40);
  return *(double *)&qword_10083DF00;
}

- (CHAchievementsRecentAndRelevantDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 localizationProvider:(id)a5 badgeImageFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CHAchievementsRecentAndRelevantDataSource *v15;
  CHAchievementsRecentAndRelevantDataSource *v16;
  void *v17;
  UICollectionView *collectionView;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  UICollectionView *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  UICollectionView *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v43;
  objc_super v44;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v44.receiver = self;
  v44.super_class = (Class)CHAchievementsRecentAndRelevantDataSource;
  v15 = -[CHAchievementsRecentAndRelevantDataSource init](&v44, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataProvider, a3);
    -[AAUIAchievementsDataProvider addRecentAndRelevantSectionObserver:](v16->_dataProvider, "addRecentAndRelevantSectionObserver:", v16);
    objc_storeStrong((id *)&v16->_localizationProvider, a5);
    objc_storeStrong((id *)&v16->_badgeImageFactory, a6);
    objc_storeStrong((id *)&v16->_collectionView, a4);
    -[UICollectionView setDataSource:](v16->_collectionView, "setDataSource:", v16);
    -[UICollectionView setDelegate:](v16->_collectionView, "setDelegate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](v16->_collectionView, "collectionViewLayout"));
    objc_msgSend(v17, "setScrollDirection:", 1);
    collectionView = v16->_collectionView;
    v43 = v11;
    v20 = objc_opt_class(CHAchievementsCollectionViewCell, v19);
    v22 = (objc_class *)objc_opt_class(CHAchievementsCollectionViewCell, v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](collectionView, "registerClass:forCellWithReuseIdentifier:", v20, v24);

    v25 = v16->_collectionView;
    v27 = objc_opt_class(CHAchievementsSectionHeaderView, v26);
    v29 = (objc_class *)objc_opt_class(CHAchievementsSectionHeaderView, v28);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v25, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v27, UICollectionElementKindSectionHeader, v31);

    v32 = v16->_collectionView;
    v34 = objc_opt_class(UICollectionReusableView, v33);
    v36 = (objc_class *)objc_opt_class(UICollectionReusableView, v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v32, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v34, UICollectionElementKindSectionFooter, v38);

    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(UICollectionReusableView, v39), UICollectionElementKindSectionHeader, CFSTR("EMPTY"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(UICollectionReusableView, v40), UICollectionElementKindSectionFooter, CFSTR("EMPTY"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v41, "addObserver:selector:name:object:", v16, "fontChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    v11 = v43;
    -[CHAchievementsRecentAndRelevantDataSource invalidateMaxCellHeight](v16, "invalidateMaxCellHeight");

  }
  return v16;
}

- (void)fontChanged:(id)a3
{
  void *v4;
  id v5;

  -[CHAchievementsRecentAndRelevantDataSource invalidateMaxCellHeight](self, "invalidateMaxCellHeight", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

}

- (double)preferredCollectionViewHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  +[CHAchievementsSectionHeaderView preferredSizeForSectionName:](CHAchievementsSectionHeaderView, "preferredSizeForSectionName:", CFSTR(" "));
  v4 = v3;
  -[CHAchievementsRecentAndRelevantDataSource maxCellHeight](self, "maxCellHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CHAchievementsSectionHeaderView headerFont](CHAchievementsSectionHeaderView, "headerFont"));
  objc_msgSend(v7, "_scaledValueForValue:", 17.0);
  v9 = v8;

  return v4 + v6 + v9;
}

- (void)invalidateMaxCellHeight
{
  self->_maxCellHeight = -1.0;
}

- (double)cellWidth
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000601A4;
  block[3] = &unk_100777E20;
  block[4] = self;
  if (qword_10083DF58 != -1)
    dispatch_once(&qword_10083DF58, block);
  return *(double *)&qword_10083DF50;
}

- (double)maxCellHeight
{
  double maxCellHeight;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int64_t v19;
  void *v20;
  int64_t v21;

  maxCellHeight = self->_maxCellHeight;
  if (maxCellHeight < 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
    v5 = -[CHAchievementsRecentAndRelevantDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v4);

    if (v5 < 1)
    {
      maxCellHeight = 0.0;
    }
    else
    {
      v6 = 0;
      maxCellHeight = 0.0;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
        v8 = -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v7, v6);

        if (v8 >= 1)
        {
          v9 = 0;
          do
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v9, v6));
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recentAndRelevantAchievementAtIndexPath:", v10));

            -[CHAchievementsRecentAndRelevantDataSource cellWidth](self, "cellWidth");
            v14 = v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource localizationProvider](self, "localizationProvider"));
            +[CHAchievementsCellContentView cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:](CHAchievementsCellContentView, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:", v12, 1, v15, v14);
            v17 = v16;

            if (maxCellHeight < v17)
              maxCellHeight = v17;

            ++v9;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
            v19 = -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v18, v6);

          }
          while (v9 < v19);
        }
        ++v6;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
        v21 = -[CHAchievementsRecentAndRelevantDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v20);

      }
      while (v6 < v21);
    }
    self->_maxCellHeight = maxCellHeight;
  }
  return maxCellHeight;
}

- (void)dealloc
{
  objc_super v3;

  -[AAUIAchievementsDataProvider removeRecentAndRelevantSectionObserver:](self->_dataProvider, "removeRecentAndRelevantSectionObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsRecentAndRelevantDataSource;
  -[CHAchievementsRecentAndRelevantDataSource dealloc](&v3, "dealloc");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recentAndRelevantAchievementAtIndexPath:", v6));

  v11 = (objc_class *)objc_opt_class(CHAchievementsCollectionViewCell, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v6));

  -[CHAchievementsRecentAndRelevantDataSource cellWidth](self, "cellWidth");
  objc_msgSend(v14, "setPreferredWidth:");
  objc_msgSend(v14, "setAppliesLargeCellInset:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource badgeImageFactory](self, "badgeImageFactory"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource localizationProvider](self, "localizationProvider"));
  objc_msgSend(v14, "configureWithAchievement:badgeImageFactory:locProvider:", v9, v15, v16);

  return v14;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider", a3));
  v4 = objc_msgSend(v3, "numberOfRecentAndRelevantSections");

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider", a3));
  v6 = objc_msgSend(v5, "numberOfItemsInRecentAndRelevantSection:", a4);

  return (int64_t)v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CHAchievementsRecentAndRelevantDataSource cellWidth](self, "cellWidth", a3, a4, a5);
  v7 = v6;
  -[CHAchievementsRecentAndRelevantDataSource maxCellHeight](self, "maxCellHeight");
  v9 = v8;
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  CGFloat left;
  CGFloat top;
  double bottom;
  double right;
  uint64_t v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  left = 10.0;
  top = 0.0;
  if (a5)
  {
    bottom = 0.0;
    right = 10.0;
  }
  else
  {
    v9 = -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", a3, 0);
    right = 29.0;
    bottom = 0.0;
    if (v9 <= 0)
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
  }
  v10 = top;
  v11 = left;
  result.right = right;
  result.bottom = bottom;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  double v9;
  CGFloat height;
  double width;
  double v12;
  CGSize result;

  if (-[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", a3, a5) < 1)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerStringForSection:isRecentAndRelevant:", a5, 1));

    +[CHAchievementsSectionHeaderView preferredSizeForSectionName:](CHAchievementsSectionHeaderView, "preferredSizeForSectionName:", v8);
    height = v9;

    width = 1.0;
  }
  v12 = height;
  result.height = v12;
  result.width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionHeader)
    && -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, objc_msgSend(v10, "section")) >= 1)
  {
    v12 = (objc_class *)objc_opt_class(CHAchievementsSectionHeaderView, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v14, v10));

    objc_msgSend(v15, "setHidesKeyLine:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "headerStringForSection:isRecentAndRelevant:", objc_msgSend(v10, "section"), 1));
    objc_msgSend(v15, "configureWithSectionName:", v17);

LABEL_13:
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter)
    && !objc_msgSend(v10, "section")
    && -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, objc_msgSend(v10, "section")) >= 1)
  {
    v20 = (objc_class *)objc_opt_class(UICollectionReusableView, v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v22, v10));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    objc_msgSend(v15, "setBackgroundColor:", v16);
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionHeader)
    || objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter))
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("EMPTY"), v10));
  }
  else
  {
    v18 = objc_alloc_init((Class)UICollectionReusableView);
  }
  v15 = v18;
LABEL_14:

  return v15;
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

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource achievementTappedHandler](self, "achievementTappedHandler"));
  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource achievementTappedHandler](self, "achievementTappedHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource dataProvider](self, "dataProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recentAndRelevantAchievementAtIndexPath:", v21));
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
  id v4;

  -[CHAchievementsRecentAndRelevantDataSource invalidateMaxCellHeight](self, "invalidateMaxCellHeight", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsRecentAndRelevantDataSource collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

}

- (id)achievementTappedHandler
{
  return self->_achievementTappedHandler;
}

- (void)setAchievementTappedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPreferredCollectionViewHeight:(double)a3
{
  self->_preferredCollectionViewHeight = a3;
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (ACHAchievementLocalizationProvider)localizationProvider
{
  return self->_localizationProvider;
}

- (void)setLocalizationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_localizationProvider, a3);
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageFactory, a3);
}

- (void)setMaxCellHeight:(double)a3
{
  self->_maxCellHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_localizationProvider, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong(&self->_achievementTappedHandler, 0);
}

@end
