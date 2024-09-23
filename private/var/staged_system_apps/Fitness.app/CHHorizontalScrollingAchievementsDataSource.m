@implementation CHHorizontalScrollingAchievementsDataSource

- (CHHorizontalScrollingAchievementsDataSource)initWithCollectionView:(id)a3 achievements:(id)a4 imageFactory:(id)a5 locProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CHHorizontalScrollingAchievementsDataSource *v15;
  CHHorizontalScrollingAchievementsDataSource *v16;
  __int128 v17;
  uint64_t v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CHHorizontalScrollingAchievementsDataSource;
  v15 = -[CHHorizontalScrollingAchievementsDataSource init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_achievements, a4);
    objc_storeStrong((id *)&v16->_locProvider, a6);
    objc_storeStrong((id *)&v16->_imageFactory, a5);
    v17 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v16->_edgeInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v16->_edgeInsets.bottom = v17;
    objc_storeStrong((id *)&v16->_collectionView, a3);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(CHAchievementCollectionViewCell, v18), CFSTR("CHAchievementCollectionViewCellReuseIdentifier"));
    -[UICollectionView setDataSource:](v16->_collectionView, "setDataSource:", v16);
    -[UICollectionView setDelegate:](v16->_collectionView, "setDelegate:", v16);
  }

  return v16;
}

- (CHHorizontalScrollingAchievementsDataSource)init
{

  return 0;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  void *v3;
  id v4;

  self->_edgeInsets = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewLayout"));
  objc_msgSend(v3, "invalidateLayout");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource achievements](self, "achievements", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CHAchievementCollectionViewCellReuseIdentifier"), v6));
  objc_msgSend(v7, "frame");
  v10 = v9;

  objc_msgSend(v8, "setImageDimension:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource imageFactory](self, "imageFactory"));
  objc_msgSend(v8, "setImageFactory:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource achievements](self, "achievements"));
  v13 = objc_msgSend(v6, "item");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
  objc_msgSend(v8, "setAchievement:", v14);

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "frame");
  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[CHHorizontalScrollingAchievementsDataSource edgeInsets](self, "edgeInsets", a3, a4, a5);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource achievementSelectedBlock](self, "achievementSelectedBlock"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v6));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsDataSource achievementSelectedBlock](self, "achievementSelectedBlock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_achievements, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v8);

  }
  objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (id)achievementSelectedBlock
{
  return self->_achievementSelectedBlock;
}

- (void)setAchievementSelectedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_achievements, a3);
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locProvider, a3);
}

- (AAUIBadgeImageFactory)imageFactory
{
  return self->_imageFactory;
}

- (void)setImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_imageFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_achievements, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong(&self->_achievementSelectedBlock, 0);
}

@end
