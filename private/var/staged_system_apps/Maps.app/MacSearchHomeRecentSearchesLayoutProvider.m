@implementation MacSearchHomeRecentSearchesLayoutProvider

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(TwoLineCollectionViewListCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellReuseIdentifier
{
  return +[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier");
}

- (int64_t)type
{
  return 1;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacSearchHomeRecentSearchesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacSearchHomeRecentSearchesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

  objc_msgSend(v12, "setViewModel:", v8);
  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  MacSearchHomeRecentSearchesLayoutProvider *v29;
  _QWORD v30[2];

  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v11);
  objc_msgSend(v12, "setSeparatorStyle:", 0);
  +[TwoLineCollectionViewListCell estimatedCellHeight](TwoLineCollectionViewListCell, "estimatedCellHeight");
  objc_msgSend(v12, "setEstimatedRowHeight:");
  v13 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v12, v11);

  objc_msgSend(v13, "setInterGroupSpacing:", 3.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v14, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a5));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v17, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v16, UICollectionElementKindSectionHeader, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v19, UICollectionElementKindSectionFooter, 5));
  v30[0] = v20;
  v30[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  objc_msgSend(v13, "setBoundarySupplementaryItems:", v22);

  if (!v13)
  {
    v23 = sub_10043230C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = 0;
      v28 = 2112;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "The layoutSection - %@ is nil for some reason in class - %@", (uint8_t *)&v26, 0x16u);
    }

  }
  return v13;
}

@end
