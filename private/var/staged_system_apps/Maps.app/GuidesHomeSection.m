@implementation GuidesHomeSection

- (GuidesHomeSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5 count:(unint64_t)a6
{
  GuidesHomeSection *v9;
  GuidesHomeSection *v10;
  uint64_t v11;
  NSUUID *sectionIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GuidesHomeSection;
  v9 = -[GuidesHomeSection init](&v14, "init", a3, a5);
  v10 = v9;
  if (v9)
  {
    v9->_kind = a3;
    v9->_maxWidth = a4;
    v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSUUID *)v11;

    v10->_count = a6;
    v10->_contentType = 0;
    -[GuidesHomeSection setupConfiguration](v10, "setupConfiguration");
  }
  return v10;
}

- (id)layoutSectionForFeaturedGuideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 featuredGuideTitle:(id)a5
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  +[GuideHomeHeaderView maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:](GuideHomeHeaderView, "maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:", a5);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v13, v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitem:count:", v14, v11, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v15));
  objc_msgSend(v16, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);

  return v16;
}

- (id)layoutSectionForFiltersUsingFilters:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  CollectionsFilterSizeController *v11;
  CollectionsFilterSizeController *filtersSizeController;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  double v24;
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
  void *v35;
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void *v40;
  GuidesHomeSection *v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", 0, 2);
  filtersSizeController = self->_filtersSizeController;
  self->_filtersSizeController = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection filtersSizeController](self, "filtersSizeController"));
  objc_msgSend(v13, "insetForFilterAtIndex:", 0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  v37 = _NSConcreteStackBlock;
  v38 = 3221225472;
  v39 = sub_100ACE340;
  v40 = &unk_1011E1D28;
  v41 = self;
  v43 = &v44;
  v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  v42 = v22;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v37);
  v23 = objc_msgSend(v22, "count", v37, v38, v39, v40, v41);
  -[CollectionsFilterSizeController minimumLineSpacingForSectionAtIndex:](self->_filtersSizeController, "minimumLineSpacingForSectionAtIndex:", 0);
  v45[3] = v45[3] + (double)((unint64_t)v23 - 1) * v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
  -[CollectionsFilterSizeController defaultHeight](self->_filtersSizeController, "defaultHeight");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v25, v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v27, v22));
  -[CollectionsFilterSizeController minimumInterItemSpacingForSectionAtIndex:](self->_filtersSizeController, "minimumInterItemSpacingForSectionAtIndex:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v28, "setInterItemSpacing:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v28));
  objc_msgSend(v30, "setContentInsets:", v15, v17, v19, v21);
  objc_msgSend(v30, "setOrthogonalScrollingBehavior:", 1);
  if (v6)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection headerItem](self, "headerItem"));
    objc_msgSend(v31, "setContentInsets:", -8.0, 16.0, -8.0, 16.0);
    objc_msgSend(v30, "setSupplementariesFollowContentInsets:", 0);
    v49 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
    objc_msgSend(v30, "setBoundarySupplementaryItems:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesSectionBackground decorationViewKind](GuidesSectionBackground, "decorationViewKind"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", v33));

  v48 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
  objc_msgSend(v30, "setDecorationItems:", v35);

  _Block_object_dispose(&v44, 8);
  return v30;
}

- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  MKPlaceCompactCollectionSizeController *v9;
  MKPlaceCompactCollectionSizeController *compactCollectionsSizeController;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
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
  void *v47;
  void *v48;

  v5 = a5;
  v8 = a3;
  v9 = (MKPlaceCompactCollectionSizeController *)objc_msgSend(objc_alloc((Class)MKPlaceCompactCollectionSizeController), "initWithCollectionsConfiguration:usingTraitCollections:inContext:", 1, 1, v8, 2);

  compactCollectionsSizeController = self->_compactCollectionsSizeController;
  self->_compactCollectionsSizeController = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection compactCollectionsSizeController](self, "compactCollectionsSizeController"));
  objc_msgSend(v11, "sizeForCollectionWithMaxCollectionsWidth:", a4);
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection compactCollectionsSizeController](self, "compactCollectionsSizeController"));
  objc_msgSend(v16, "sectionInsets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (double)-[GuidesHomeSection count](self, "count");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection compactCollectionsSizeController](self, "compactCollectionsSizeController"));
  objc_msgSend(v26, "minimumInterItemSpacing");
  v28 = v27 * (double)(-[GuidesHomeSection count](self, "count") - 1) + v13 * v25;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v13));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v15));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v29, v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 200.0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v28));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v34, v33));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitem:count:", v35, v32, -[GuidesHomeSection count](self, "count")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection compactCollectionsSizeController](self, "compactCollectionsSizeController"));
  objc_msgSend(v37, "minimumInterItemSpacing");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v36, "setInterItemSpacing:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v36));
  objc_msgSend(v39, "setOrthogonalScrollingBehavior:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection compactCollectionsSizeController](self, "compactCollectionsSizeController"));
  objc_msgSend(v40, "minimumInterItemSpacing");
  objc_msgSend(v39, "setInterGroupSpacing:");

  objc_msgSend(v39, "setContentInsets:", v18, v20, v22, v24);
  if (v5)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection headerItem](self, "headerItem"));
    objc_msgSend(v41, "setContentInsets:", 0.0, 16.0, 0.0, 16.0);
    objc_msgSend(v39, "setSupplementariesFollowContentInsets:", 0);
    v48 = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
    objc_msgSend(v39, "setBoundarySupplementaryItems:", v42);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CompactGuidesSectionBackground decorationViewKind](CompactGuidesSectionBackground, "decorationViewKind"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", v43));

  v47 = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  objc_msgSend(v39, "setDecorationItems:", v45);

  return v39;
}

- (id)layoutSectionForCuratedCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
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
  void *v44;
  void *v45;

  v5 = a5;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)MKPlaceCollectionsSizeController), "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, (id)-[GuidesHomeSection count](self, "count") == (id)1, v8, 8);

  -[GuidesHomeSection setCollectionsSizeController:](self, "setCollectionsSizeController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v10, "sizeForCollectionWithMaxCollectionsWidth:", a4);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v15, "sectionInsets");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (double)-[GuidesHomeSection count](self, "count");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v25, "minimumInterItemSpacing");
  v27 = v26 * (double)(-[GuidesHomeSection count](self, "count") - 1) + v12 * v24;

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v12));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v14));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v28, v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v14));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v27));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v33, v32));

  v45 = v31;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v34, v35));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v37, "minimumInterItemSpacing");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v36, "setInterItemSpacing:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v36));
  objc_msgSend(v39, "setOrthogonalScrollingBehavior:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v40, "minimumInterItemSpacing");
  objc_msgSend(v39, "setInterGroupSpacing:");

  objc_msgSend(v39, "setContentInsets:", v17, v19, v21, v23);
  if (v5)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection headerItem](self, "headerItem"));
    objc_msgSend(v41, "setContentInsets:", -8.0, 16.0, -8.0, 16.0);
    objc_msgSend(v39, "setSupplementariesFollowContentInsets:", 0);
    v44 = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v39, "setBoundarySupplementaryItems:", v42);

  }
  return v39;
}

- (id)layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  void *v19;

  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom") != (id)5;

  objc_msgSend(v9, "setSeparatorStyle:", v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100ACEDC0;
  v18[3] = &unk_1011ADD98;
  v18[4] = a5;
  objc_msgSend(v9, "setSeparatorInsetProvider:", v18);
  objc_msgSend(v9, "setHeaderTopPadding:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_separatorConfiguration"));
  v13 = objc_msgSend(v12, "copy");

  objc_msgSend(v9, "_setSeparatorConfiguration:", v13);
  v14 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v9, v8);
  objc_msgSend(v14, "setContentInsets:", 0.0, 16.0, 0.0, 0.0);
  if ((id)-[GuidesHomeSection kind](self, "kind") == (id)4 && v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection headerItem](self, "headerItem"));
    v19 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    objc_msgSend(v14, "setBoundarySupplementaryItems:", v16);

  }
  return v14;
}

+ (double)loadingSectionHeight
{
  return 100.0;
}

- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", a3, 1.0, 1.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v4));
  objc_msgSend(v5, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  objc_msgSend((id)objc_opt_class(self), "loadingSectionHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v7, v6));

  v13 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v10));
  return v11;
}

- (id)layoutForPublishersListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  void *v19;

  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom") != (id)5;

  objc_msgSend(v9, "setSeparatorStyle:", v11);
  +[TwoLineCollectionViewListCell estimatedCellHeight](TwoLineCollectionViewListCell, "estimatedCellHeight");
  objc_msgSend(v9, "setEstimatedRowHeight:");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100ACF18C;
  v18[3] = &unk_1011ADD98;
  v18[4] = a5;
  objc_msgSend(v9, "setSeparatorInsetProvider:", v18);
  objc_msgSend(v9, "setHeaderTopPadding:", 16.0);
  objc_msgSend(v9, "setSectionHeaderHeight:", _UICollectionViewListLayoutSectionAutomaticDimension);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_separatorConfiguration"));
  v13 = objc_msgSend(v12, "copy");

  objc_msgSend(v9, "_setSeparatorConfiguration:", v13);
  v14 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v9, v8);
  objc_msgSend(v14, "setContentInsets:", 0.0, 16.0, 0.0, 0.0);
  if (v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection headerItem](self, "headerItem"));
    v19 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    objc_msgSend(v14, "setBoundarySupplementaryItems:", v16);

  }
  return v14;
}

- (id)headerItem
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSAttributedStringKey v21;
  void *v22;

  v3 = objc_claimAutoreleasedReturnValue(-[GuidesHomeSection sectionTitle](self, "sectionTitle"));
  if (v3 && (v4 = (void *)v3, -[GuidesHomeSection maxWidth](self, "maxWidth"), v6 = v5, v4, v6 > 0.0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapkit_fontWithWeight:", UIFontWeightSemibold));

    v21 = NSFontAttributeName;
    v22 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = objc_alloc((Class)NSAttributedString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection sectionTitle](self, "sectionTitle"));
    v12 = objc_msgSend(v10, "initWithString:attributes:", v11, v9);

    -[GuidesHomeSection maxWidth](self, "maxWidth");
    objc_msgSend(v12, "boundingRectWithSize:options:context:", 1, 0);
    if (v13 >= 40.0)
      v14 = v13;
    else
      v14 = 40.0;

  }
  else
  {
    v14 = 40.0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v15, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v17, v18, 1));

  return v19;
}

- (void)setupConfiguration
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];

  v3 = -[GuidesHomeSection kind](self, "kind");
  if (v3 > 7)
  {
    v6 = 0;
  }
  else
  {
    v6 = (uint64_t)*(&off_1011E1D48 + v3);
    v4 = qword_100E3EB10[v3];
    v5 = qword_100E3EB50[v3];
  }
  v7[0] = 1;
  v7[1] = v6;
  v7[2] = v4;
  v7[3] = v5;
  if (self)
    -[GuidesHomeSection setConfiguration:](self, "setConfiguration:", v7);
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = -[GuidesHomeSection kind](self, "kind");
  switch(v9)
  {
    case 7:
      v10 = objc_claimAutoreleasedReturnValue(-[GuidesHomeSection layoutSectionForLoadingUsingTraitEnvironment:](self, "layoutSectionForLoadingUsingTraitEnvironment:", v8));
      break;
    case 3:
      v10 = objc_claimAutoreleasedReturnValue(-[GuidesHomeSection layoutSectionForCuratedCollectionsUsingTraitsEnvironment:usingWidth:shouldAddSupplementaryHeaderView:](self, "layoutSectionForCuratedCollectionsUsingTraitsEnvironment:usingWidth:shouldAddSupplementaryHeaderView:", v8, v5, a4));
      break;
    case 2:
      v10 = objc_claimAutoreleasedReturnValue(-[GuidesHomeSection layoutSectionForCompactCollectionsUsingTraitsEnvironment:usingWidth:shouldAddSupplementaryHeaderView:](self, "layoutSectionForCompactCollectionsUsingTraitsEnvironment:usingWidth:shouldAddSupplementaryHeaderView:", v8, v5, a4));
      break;
    default:
      v11 = 0;
      goto LABEL_9;
  }
  v11 = (void *)v10;
LABEL_9:

  return v11;
}

- (id)layoutForFilterSectionUsingViewModels:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6
{
  return -[GuidesHomeSection layoutSectionForFiltersUsingFilters:traitsEnvironment:width:shouldAddSupplementaryHeaderView:](self, "layoutSectionForFiltersUsingFilters:traitsEnvironment:width:shouldAddSupplementaryHeaderView:", a3, a4, a6, a5);
}

- (id)layoutForCollectionsListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  return -[GuidesHomeSection layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:shouldAddSupplementaryHeaderView:objectsCount:](self, "layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:shouldAddSupplementaryHeaderView:objectsCount:", a3, a4, a5);
}

- (id)description
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v8;

  -[GuidesHomeSection configuration](self, "configuration");
  v3 = v8;
  v4 = -[GuidesHomeSection count](self, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeSection sectionTitle](self, "sectionTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Section: (%@). Items: (%lu). Title: (%@)"), v3, v4, v5));

  return v6;
}

- (int64_t)kind
{
  return self->_kind;
}

- ($F604286BD1E4CBBF10F21E9B2637A591)configuration
{
  NSString *sectionIdentifier;
  $F604286BD1E4CBBF10F21E9B2637A591 *result;

  sectionIdentifier = self->_configuration.sectionIdentifier;
  retstr->var0 = self->_configuration.rowCount;
  result = sectionIdentifier;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_configuration.cellKind;
  return result;
}

- (void)setConfiguration:(id *)a3
{
  NSString *var1;
  NSString *sectionIdentifier;

  self->_configuration.rowCount = a3->var0;
  var1 = (NSString *)a3->var1;
  a3->var1 = 0;
  sectionIdentifier = self->_configuration.sectionIdentifier;
  self->_configuration.sectionIdentifier = var1;

  *(_OWORD *)&self->_configuration.cellKind = *(_OWORD *)&a3->var2;
}

- (NSUUID)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonTitle, a3);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (MKPlaceCollectionsSizeController)collectionsSizeController
{
  return self->_collectionsSizeController;
}

- (void)setCollectionsSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsSizeController, a3);
}

- (MKPlaceCompactCollectionSizeController)compactCollectionsSizeController
{
  return self->_compactCollectionsSizeController;
}

- (void)setCompactCollectionsSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_compactCollectionsSizeController, a3);
}

- (CollectionsFilterSizeController)filtersSizeController
{
  return self->_filtersSizeController;
}

- (void)setFiltersSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_filtersSizeController, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_filtersSizeController, 0);
  objc_storeStrong((id *)&self->_compactCollectionsSizeController, 0);
  objc_storeStrong((id *)&self->_collectionsSizeController, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
