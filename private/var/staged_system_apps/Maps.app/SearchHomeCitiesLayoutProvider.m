@implementation SearchHomeCitiesLayoutProvider

- (SearchHomeCitiesLayoutProvider)initWithTraitEnvironment:(id)a3
{
  id v4;
  SearchHomeCitiesLayoutProvider *v5;
  MKPlaceCompactCollectionSizeController *v6;
  MKPlaceCompactCollectionSizeController *sizeController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeCitiesLayoutProvider;
  v5 = -[SearchHomeCitiesLayoutProvider init](&v9, "init");
  if (v5)
  {
    v6 = (MKPlaceCompactCollectionSizeController *)objc_msgSend(objc_alloc((Class)MKPlaceCompactCollectionSizeController), "initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:", v4, 1);
    sizeController = v5->_sizeController;
    v5->_sizeController = v6;

  }
  return v5;
}

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(MKPlaceCompactCollectionCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellReuseIdentifier
{
  return +[MKPlaceCompactCollectionCell reuseIdentifier](MKPlaceCompactCollectionCell, "reuseIdentifier");
}

- (int64_t)type
{
  return 5;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCitiesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10));

  objc_msgSend(v12, "configureWithModel:", v8);
  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  int v49;
  SearchHomeCitiesLayoutProvider *v50;
  void *v51;

  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCitiesLayoutProvider sizeController](self, "sizeController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "container"));

  objc_msgSend(v13, "contentSize");
  objc_msgSend(v12, "sizeForCollectionWithMaxCollectionsWidth:");
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCitiesLayoutProvider sizeController](self, "sizeController"));
  objc_msgSend(v18, "sectionInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCitiesLayoutProvider sizeController](self, "sizeController"));
  objc_msgSend(v27, "minimumInterItemSpacing");
  v29 = v28 * (double)(a7 - 1) + v15 * (double)a7;

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v15));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v17));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v30, v31));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v17));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v29));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v35, v34));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitem:count:", v36, v33, a7));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCitiesLayoutProvider sizeController](self, "sizeController"));
  objc_msgSend(v38, "minimumInterItemSpacing");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v37, "setInterItemSpacing:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v37));
  objc_msgSend(v40, "setOrthogonalScrollingBehavior:", 1);
  objc_msgSend(v40, "setContentInsets:", v20, v22, v24, v26);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v41, v42));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v43, UICollectionElementKindSectionHeader, 1));
  v51 = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  objc_msgSend(v40, "setBoundarySupplementaryItems:", v45);

  objc_msgSend(v40, "setSupplementariesFollowContentInsets:", 0);
  if (!v40)
  {
    v46 = sub_10043230C();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v49 = 138412290;
      v50 = self;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", (uint8_t *)&v49, 0xCu);
    }

  }
  return v40;
}

- (MKPlaceCompactCollectionSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeController, 0);
}

@end
