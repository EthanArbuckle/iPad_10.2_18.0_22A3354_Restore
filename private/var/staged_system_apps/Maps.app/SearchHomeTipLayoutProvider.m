@implementation SearchHomeTipLayoutProvider

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(SearchHomeTipCollectionViewCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v8));

  return v10;
}

- (id)cellReuseIdentifier
{
  return +[SearchHomeTipCollectionViewCell identifier](SearchHomeTipCollectionViewCell, "identifier");
}

- (int64_t)type
{
  return 6;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v22;
  SearchHomeTipLayoutProvider *v23;
  void *v24;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", a3, a6, a7, a8, 1.0, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 100.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 100.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v13, v14));

  v24 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v15, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v17));
  if (!v18)
  {
    v19 = sub_10043230C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", (uint8_t *)&v22, 0xCu);
    }

  }
  return v18;
}

@end
