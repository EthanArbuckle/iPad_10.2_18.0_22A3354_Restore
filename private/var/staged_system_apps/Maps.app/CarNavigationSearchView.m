@implementation CarNavigationSearchView

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CarNavigationSearchView;
  -[CarNavigationSearchView dealloc](&v3, "dealloc");
}

- (CarNavigationSearchView)initWithFrame:(CGRect)a3
{
  CarNavigationSearchView *v3;
  CarNavigationSearchViewLayout *v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *collectionView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchView;
  v3 = -[CarNavigationSearchView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CarNavigationSearchViewLayout);
    v5 = objc_alloc((Class)UICollectionView);
    -[CarNavigationSearchView bounds](v3, "bounds");
    v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4);
    collectionView = v3->_collectionView;
    v3->_collectionView = v6;

    -[UICollectionView setScrollEnabled:](v3->_collectionView, "setScrollEnabled:", 0);
    -[UICollectionView setAutoresizingMask:](v3->_collectionView, "setAutoresizingMask:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v3->_collectionView, "setBackgroundColor:", v8);

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v3->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(CarNavigationSearchCategoryViewCell), CFSTR("Cell"));
    -[UICollectionView setDelegate:](v3->_collectionView, "setDelegate:", v3);
    -[UICollectionView setDataSource:](v3->_collectionView, "setDataSource:", v3);
    -[CarNavigationSearchView addSubview:](v3, "addSubview:", v3->_collectionView);

  }
  return v3;
}

- (double)preferredHeightForAvailableSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout"));
  objc_msgSend(v6, "preferredHeightForItemCount:availableSize:", -[CarNavigationSearchView _numberOfItems](self, "_numberOfItems"), width, height);
  v8 = v7;

  return v8;
}

- (void)setCategories:(id)a3
{
  uint64_t v4;
  NSArray *v5;
  NSArray *categories;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_categories, "isEqualToArray:"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") <= 3)
      v4 = (uint64_t)objc_msgSend(v7, "count");
    else
      v4 = 3;
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subarrayWithRange:", 0, v4));
    categories = self->_categories;
    self->_categories = v5;

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }

}

- (unint64_t)_numberOfItems
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categories](self, "categories"));
  v3 = (char *)objc_msgSend(v2, "count") + 1;

  return (unint64_t)v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v8 = objc_msgSend(v6, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categories](self, "categories"));
  v10 = objc_msgSend(v9, "count");

  if (v8 == v10)
  {
    if (qword_1014D4378 != -1)
      dispatch_once(&qword_1014D4378, &stru_1011E83D0);
    objc_msgSend(v7, "setImage:", qword_1014D4370);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    objc_msgSend(v7, "setUpdateIdentifier:", v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100BD4628;
    v20[3] = &unk_1011BB6C8;
    v21 = v11;
    v22 = v7;
    v12 = v11;
    v13 = objc_retainBlock(v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categories](self, "categories"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100BD46A0;
    v18[3] = &unk_1011ACBF8;
    v19 = v13;
    v16 = v13;
    objc_msgSend(v15, "imageWithScale:isCarplay:resultHandler:", 1, v18, 0.0);

  }
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categories](self, "categories"));
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView siriSearchHandler](self, "siriSearchHandler"));

    if (v10)
    {
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView siriSearchHandler](self, "siriSearchHandler"));
      v11[2]();
LABEL_6:

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categorySearchHandler](self, "categorySearchHandler"));

    if (v12)
    {
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categorySearchHandler](self, "categorySearchHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchView categories](self, "categories"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      ((void (*)(void (**)(void), void *))v11[2])(v11, v14);

      goto LABEL_6;
    }
  }
  objc_msgSend(v15, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (NSArray)categories
{
  return self->_categories;
}

- (id)siriSearchHandler
{
  return self->_siriSearchHandler;
}

- (void)setSiriSearchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)categorySearchHandler
{
  return self->_categorySearchHandler;
}

- (void)setCategorySearchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_categorySearchHandler, 0);
  objc_storeStrong(&self->_siriSearchHandler, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
