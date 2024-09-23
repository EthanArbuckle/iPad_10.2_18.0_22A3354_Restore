@implementation SearchHomeCuratedCollectionsLayoutProvider

- (SearchHomeCuratedCollectionsLayoutProvider)initWithTraitEnvironment:(id)a3
{
  id v4;
  SearchHomeCuratedCollectionsLayoutProvider *v5;
  SearchHomeCuratedCollectionsLayoutProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchHomeCuratedCollectionsLayoutProvider;
  v5 = -[SearchHomeCuratedCollectionsLayoutProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SearchHomeCuratedCollectionsLayoutProvider setTraitEnvironment:](v5, "setTraitEnvironment:", v4);

  return v6;
}

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(MKPlaceCollectionCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellReuseIdentifier
{
  return +[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier");
}

- (int64_t)type
{
  return 3;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCuratedCollectionsLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

  objc_msgSend(v12, "configureWithModel:", v8);
  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _UNKNOWN **v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  double v74;
  SearchHomeCuratedCollectionsLayoutProvider *v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  SearchHomeCuratedCollectionsLayoutProvider *v79;
  _QWORD v80[2];
  void *v81;

  v12 = a3;
  v77 = v12;
  v75 = self;
  if (MapsFeature_IsEnabled_Maps269(v12, v13)
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCuratedCollectionsLayoutProvider traitEnvironment](self, "traitEnvironment")),
        v15 = sub_1002A8AA0(v14),
        v14,
        v15 != 5))
  {
    v36 = objc_alloc((Class)MKPlaceCollectionsSizeController);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCuratedCollectionsLayoutProvider traitEnvironment](self, "traitEnvironment"));
    v38 = objc_msgSend(v36, "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, a7 == 1, v37, 3);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "container"));
    objc_msgSend(v39, "contentSize");
    objc_msgSend(v38, "sizeForCollectionWithMaxCollectionsWidth:");
    v41 = v40;
    v43 = v42;

    objc_msgSend(v38, "sectionInsets");
    v74 = v44;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    objc_msgSend(v38, "minimumInterItemSpacing");
    v52 = v51 * (double)(a7 - 1) + v41 * (double)a7;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v41));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v43));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v53, v54));

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v55));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v43));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v52));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v58, v57));

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitem:count:", v59, v56, a7));
    v76 = v38;
    objc_msgSend(v38, "minimumInterItemSpacing");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
    objc_msgSend(v60, "setInterItemSpacing:", v61);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v60));
    objc_msgSend(v33, "setOrthogonalScrollingBehavior:", 1);
    objc_msgSend(v33, "setContentInsets:", v74, v46, v48, v50);

    v35 = MKPlaceCollectionsLogicController_ptr;
  }
  else
  {
    v16 = objc_alloc((Class)MKPlaceCollectionsSizeController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCuratedCollectionsLayoutProvider traitEnvironment](self, "traitEnvironment"));
    v18 = objc_msgSend(v16, "initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:", v17, 3);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "container"));
    objc_msgSend(v19, "contentSize");
    objc_msgSend(v18, "sizeForCollectionWithMaxCollectionsWidth:");
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v21));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v23));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v24, v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 260.0));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v29, v28));

    v81 = v27;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v30, v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v32));
    objc_msgSend(v33, "setContentInsets:", 0.0, 16.0, 0.0, 16.0);
    v76 = v18;
    v34 = v18;
    v35 = MKPlaceCollectionsLogicController_ptr;
    objc_msgSend(v34, "minimumInterItemSpacing");
    objc_msgSend(v33, "setInterGroupSpacing:");

  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v62, v63));

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v64, UICollectionElementKindSectionHeader, 1));
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a5));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v66, v67));

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v68, UICollectionElementKindSectionFooter, 5));
  v80[0] = v65;
  v80[1] = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[304], "arrayWithObjects:count:", v80, 2));
  objc_msgSend(v33, "setBoundarySupplementaryItems:", v70);

  objc_msgSend(v33, "setSupplementariesFollowContentInsets:", 0);
  if (!v33)
  {
    v71 = sub_10043230C();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v75;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@.", buf, 0xCu);
    }

  }
  return v33;
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_traitEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitEnvironment, 0);
}

@end
