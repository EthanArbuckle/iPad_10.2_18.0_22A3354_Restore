@implementation SearchHomeRecentSearchesLayoutProvider

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(QuerySuggestionCollectionViewCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellReuseIdentifier
{
  return +[QuerySuggestionCollectionViewCell identifier](QuerySuggestionCollectionViewCell, "identifier");
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
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8));

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100C32C90;
  v28 = sub_100C32CA0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100C32C90;
  v22 = sub_100C32CA0;
  v23 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "historyEntry"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100C32CA8;
  v17[3] = &unk_1011E97A8;
  v17[4] = &v24;
  v17[5] = &v18;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100C32D14;
  v16[3] = &unk_1011E97D0;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v13, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v17, 0, v16, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v14);

  objc_msgSend(v12, "setTitle:highlightTitleRanges:detailText:style:", v25[5], 0, v19[5], 1);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
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
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  SearchHomeRecentSearchesLayoutProvider *v33;
  void *v34;

  v13 = a3;
  v14 = a6;
  v15 = a8;
  v16 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v13);
  objc_msgSend(v16, "setSeparatorStyle:", 1);
  +[QuerySuggestionCollectionViewCell estimatedCellHeight](QuerySuggestionCollectionViewCell, "estimatedCellHeight");
  objc_msgSend(v16, "setEstimatedRowHeight:");
  if (v14)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100C33130;
    v30[3] = &unk_1011E9820;
    v31 = v14;
    objc_msgSend(v16, "setTrailingSwipeActionsConfigurationProvider:", v30);

  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100C33294;
  v29[3] = &unk_1011ADD98;
  v29[4] = a7;
  objc_msgSend(v16, "setSeparatorInsetProvider:", v29);
  objc_msgSend(v16, "setHeaderTopPadding:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_separatorConfiguration"));
  v18 = objc_msgSend(v17, "copy");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicHairlineColor"));
  objc_msgSend(v18, "_setColor:", v19);

  objc_msgSend(v16, "_setSeparatorConfiguration:", v18);
  v20 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v16, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v21, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v23, UICollectionElementKindSectionHeader, 1));
  v34 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  objc_msgSend(v20, "setBoundarySupplementaryItems:", v25);

  if (!v20)
  {
    v26 = sub_10043230C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", buf, 0xCu);
    }

  }
  return v20;
}

@end
