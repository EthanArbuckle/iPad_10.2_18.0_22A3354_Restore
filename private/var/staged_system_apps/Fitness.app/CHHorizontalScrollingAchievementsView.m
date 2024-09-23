@implementation CHHorizontalScrollingAchievementsView

- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (CHHorizontalScrollingAchievementsView)initWithCoder:(id)a3
{

  return 0;
}

- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  CHHorizontalScrollingAchievementsView *v14;
  id v15;
  void *v16;
  UICollectionView *v17;
  UICollectionView *collectionView;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHHorizontalScrollingAchievementsView;
  v14 = -[CHHorizontalScrollingAchievementsView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  if (v14)
  {
    v15 = objc_alloc((Class)UICollectionView);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView _createLayout](v14, "_createLayout"));
    v17 = (UICollectionView *)objc_msgSend(v15, "initWithFrame:collectionViewLayout:", v16, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    collectionView = v14->_collectionView;
    v14->_collectionView = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v14->_collectionView, "setBackgroundColor:", v19);

    -[UICollectionView setShowsHorizontalScrollIndicator:](v14->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](v14->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[CHHorizontalScrollingAchievementsView addSubview:](v14, "addSubview:", v14->_collectionView);
    objc_storeStrong((id *)&v14->_locProvider, a5);
    objc_storeStrong((id *)&v14->_imageFactory, a4);
  }

  return v14;
}

- (id)_createLayout
{
  id v2;

  v2 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v2, "setMinimumInteritemSpacing:", 9.0);
  objc_msgSend(v2, "setMinimumLineSpacing:", 9.0);
  objc_msgSend(v2, "setScrollDirection:", 1);
  return v2;
}

- (void)setAchievements:(id)a3
{
  NSArray *v5;
  CHHorizontalScrollingAchievementsDataSource *v6;
  void *v7;
  NSArray *achievements;
  void *v9;
  void *v10;
  CHHorizontalScrollingAchievementsDataSource *v11;
  CHHorizontalScrollingAchievementsDataSource *dataSource;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = (NSArray *)a3;
  if (self->_achievements != v5)
  {
    objc_storeStrong((id *)&self->_achievements, a3);
    v6 = [CHHorizontalScrollingAchievementsDataSource alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView collectionView](self, "collectionView"));
    achievements = self->_achievements;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView imageFactory](self, "imageFactory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView locProvider](self, "locProvider"));
    v11 = -[CHHorizontalScrollingAchievementsDataSource initWithCollectionView:achievements:imageFactory:locProvider:](v6, "initWithCollectionView:achievements:imageFactory:locProvider:", v7, achievements, v9, v10);
    dataSource = self->_dataSource;
    self->_dataSource = v11;

    -[CHHorizontalScrollingAchievementsView scrollViewContentInset](self, "scrollViewContentInset");
    -[CHHorizontalScrollingAchievementsDataSource setEdgeInsets:](self->_dataSource, "setEdgeInsets:");
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008CA38;
    v13[3] = &unk_100779250;
    objc_copyWeak(&v14, &location);
    -[CHHorizontalScrollingAchievementsDataSource setAchievementSelectedBlock:](self->_dataSource, "setAchievementSelectedBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)setScrollViewContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_scrollViewContentInset.left
    || a3.top != self->_scrollViewContentInset.top
    || a3.right != self->_scrollViewContentInset.right
    || a3.bottom != self->_scrollViewContentInset.bottom)
  {
    self->_scrollViewContentInset = a3;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView dataSource](self, "dataSource"));
    objc_msgSend(v10, "setEdgeInsets:", top, left, bottom, right);

  }
}

- (BOOL)hasVisibleAchievements
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView dataSource](self, "dataSource"));
  if ((uint64_t)objc_msgSend(v3, "numberOfSectionsInCollectionView:", self->_collectionView) < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView dataSource](self, "dataSource"));
    v5 = (uint64_t)objc_msgSend(v4, "collectionView:numberOfItemsInSection:", self->_collectionView, 0) > 0;

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHHorizontalScrollingAchievementsView;
  -[CHHorizontalScrollingAchievementsView layoutSubviews](&v14, "layoutSubviews");
  -[CHHorizontalScrollingAchievementsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView collectionView](self, "collectionView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsView collectionView](self, "collectionView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionViewLayout"));
  objc_msgSend(v13, "invalidateLayout");

}

- (NSArray)achievements
{
  return self->_achievements;
}

- (UIEdgeInsets)scrollViewContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollViewContentInset.top;
  left = self->_scrollViewContentInset.left;
  bottom = self->_scrollViewContentInset.bottom;
  right = self->_scrollViewContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CHHorizontalScrollingAchievementsViewDelegate)delegate
{
  return (CHHorizontalScrollingAchievementsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CHHorizontalScrollingAchievementsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
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
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_achievements, 0);
}

@end
