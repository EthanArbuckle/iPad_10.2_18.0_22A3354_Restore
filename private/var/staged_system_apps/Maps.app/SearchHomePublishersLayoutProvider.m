@implementation SearchHomePublishersLayoutProvider

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(TwoLineCollectionViewListCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (int64_t)type
{
  return 4;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomePublishersLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomePublishersLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

  objc_msgSend(v12, "setViewModel:", v8);
  return v12;
}

- (id)cellReuseIdentifier
{
  return +[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier");
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v29[5];
  uint8_t buf[4];
  SearchHomePublishersLayoutProvider *v31;
  void *v32;

  v12 = a3;
  v13 = a8;
  v14 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitCollection"));
  v16 = objc_msgSend(v15, "userInterfaceIdiom") != (id)5;

  objc_msgSend(v14, "setSeparatorStyle:", v16);
  +[TwoLineCollectionViewListCell estimatedCellHeight](TwoLineCollectionViewListCell, "estimatedCellHeight");
  objc_msgSend(v14, "setEstimatedRowHeight:");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100259280;
  v29[3] = &unk_1011ADD98;
  v29[4] = a7;
  objc_msgSend(v14, "setSeparatorInsetProvider:", v29);
  objc_msgSend(v14, "setHeaderTopPadding:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_separatorConfiguration"));
  v18 = objc_msgSend(v17, "copy");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dynamicHairlineColor"));
  objc_msgSend(v18, "_setColor:", v19);

  objc_msgSend(v14, "_setSeparatorConfiguration:", v18);
  v20 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v14, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v21, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v23, UICollectionElementKindSectionHeader, 1));
  v32 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  objc_msgSend(v20, "setBoundarySupplementaryItems:", v25);

  if (!v20)
  {
    v26 = sub_10043230C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", buf, 0xCu);
    }

  }
  return v20;
}

@end
