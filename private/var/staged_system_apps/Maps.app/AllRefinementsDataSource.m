@implementation AllRefinementsDataSource

- (AllRefinementsDataSource)initWithCollectionView:(id)a3 viewModel:(id)a4 scrollViewDelegate:(id)a5 selectionSequenceNumber:(id)a6 analyticsDelegate:(id)a7 viewModelDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  AllRefinementsDataSource *v19;
  AllRefinementsDataSource *v20;
  AllRefinementsSizeController *v21;
  AllRefinementsSizeController *sizeController;
  AllRefinementsTogglesCellLogicController *v23;
  AllRefinementsTogglesCellLogicController *togglesLogicController;
  AllRefinementsMultiSelectCellLogicController *v25;
  AllRefinementsMultiSelectCellLogicController *multiSelectLogicController;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AllRefinementsDataSource;
  v19 = -[AllRefinementsDataSource init](&v30, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_collectionView, a3);
    -[UICollectionView setDelegate:](v20->_collectionView, "setDelegate:", v20, v28, v29);
    objc_storeStrong((id *)&v20->_viewModel, a4);
    v21 = objc_alloc_init(AllRefinementsSizeController);
    sizeController = v20->_sizeController;
    v20->_sizeController = v21;

    objc_storeStrong((id *)&v20->_scrollViewDelegate, a5);
    objc_storeStrong((id *)&v20->_selectionSequenceNumber, a6);
    v23 = objc_alloc_init(AllRefinementsTogglesCellLogicController);
    togglesLogicController = v20->_togglesLogicController;
    v20->_togglesLogicController = v23;

    v25 = objc_alloc_init(AllRefinementsMultiSelectCellLogicController);
    multiSelectLogicController = v20->_multiSelectLogicController;
    v20->_multiSelectLogicController = v25;

    objc_storeWeak((id *)&v20->_analyticsDelegate, v17);
    objc_storeWeak((id *)&v20->_viewModelDelegate, v18);
    -[AllRefinementsDataSource setupDataSource](v20, "setupDataSource");
  }

  return v20;
}

- (void)setupDataSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  UICollectionViewDiffableDataSource *v18;
  UICollectionViewDiffableDataSource *collectionViewDiffableDataSource;
  _QWORD v20[4];
  id v21;
  _QWORD v22[7];
  id v23;
  id location;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
  v4 = objc_opt_class(NonSelectableCollectionViewListCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NonSelectableCollectionViewListCell reuseIdentifier](NonSelectableCollectionViewListCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
  v7 = objc_opt_class(_TtC4Maps36AllRefinementsMultiSelectElementCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsMultiSelectElementCell reuseIdentifier](_TtC4Maps36AllRefinementsMultiSelectElementCell, "reuseIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  if (MapsFeature_IsEnabled_SearchAndDiscovery(v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
    v11 = objc_opt_class(_TtC4Maps24AllRefinementsOpenAtCell);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsOpenAtCell reuseIdentifier](_TtC4Maps24AllRefinementsOpenAtCell, "reuseIdentifier"));
    objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
  v14 = objc_opt_class(AllRefinementsHeaderView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsHeaderView reuseIdentifier](AllRefinementsHeaderView, "reuseIdentifier"));
  objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v14, UICollectionElementKindSectionHeader, v15);

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100B9C1CC;
  v27[4] = sub_100B9C1DC;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100B9C1CC;
  v25[4] = sub_100B9C1DC;
  v26 = 0;
  objc_initWeak(&location, self);
  v16 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100B9C1E4;
  v22[3] = &unk_1011E7888;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v22[5] = v25;
  v22[6] = v27;
  v18 = (UICollectionViewDiffableDataSource *)objc_msgSend(v16, "initWithCollectionView:cellProvider:", v17, v22);
  collectionViewDiffableDataSource = self->_collectionViewDiffableDataSource;
  self->_collectionViewDiffableDataSource = v18;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100B9CEE4;
  v20[3] = &unk_1011B78E8;
  objc_copyWeak(&v21, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_collectionViewDiffableDataSource, "setSupplementaryViewProvider:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

- (void)reloadCollectionView:(id)a3
{
  -[AllRefinementsDataSource setViewModel:](self, "setViewModel:", a3);
  -[AllRefinementsDataSource displayRefinements](self, "displayRefinements");
}

- (void)displayRefinements
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  AllRefinementsDataSource *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v30 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
        objc_msgSend(v3, "appendSectionsWithIdentifiers:", v12);

        v13 = objc_msgSend(v10, "type");
        if (v13 == (id)2)
        {
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "openNow"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "openNow"));
            objc_msgSend(v17, "addObject:", v19);

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "openAt"));

          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "openAt"));
            objc_msgSend(v17, "addObject:", v21);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, v22);

        }
        else
        {
          if (v13 == (id)1)
          {
            v14 = v10;
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "elements"));
          }
          else
          {
            if (v13)
              continue;
            v14 = v10;
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toggles"));
          }
          v16 = (id)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

          objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, v17);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionViewDiffableDataSource](v25, "collectionViewDiffableDataSource"));
  objc_msgSend(v23, "applySnapshot:animatingDifferences:", v3, 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](v25, "collectionView"));
  objc_msgSend(v24, "layoutIfNeeded");

}

- (id)layoutSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v122;
  void *v123;
  void *v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id location;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource viewModel](self, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));

  v10 = objc_msgSend(v9, "type");
  if (v10 == (id)2)
  {
    v45 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v6);
    objc_msgSend(v45, "setSeparatorStyle:", 1);
    objc_msgSend(v45, "setEstimatedRowHeight:", 44.0);
    objc_initWeak(&location, v9);
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_100B9DE6C;
    v125[3] = &unk_1011BF008;
    objc_copyWeak(&v126, &location);
    objc_msgSend(v45, "setSeparatorInsetProvider:", v125);
    v7 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v45, v6);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v46, "togglesSectionContentInsets");
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;

    objc_msgSend(v7, "setContentInsets:", v48, v50, v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsSectionBackground decorationViewKind](AllRefinementsSectionBackground, "decorationViewKind"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", v55));

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
    objc_msgSend(v57, "headerHeightWithTitle:collectionView:", v58, v59);
    v61 = v60;

    if (v61 > 0.0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v61));
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v62, v63));

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v64, UICollectionElementKindSectionHeader, 2));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
      objc_msgSend(v66, "togglesHeaderLeadingAdjustment");
      objc_msgSend(v65, "setContentInsets:", 0.0, v67, 0.0, 0.0);

      v131 = v65;
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
      objc_msgSend(v7, "setBoundarySupplementaryItems:", v68);

    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v69, "togglesBackgroundContentInsets");
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;

    objc_msgSend(v56, "setContentInsets:", v61 + v71, v73, v75, v77);
    v130 = v56;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
    objc_msgSend(v7, "setDecorationItems:", v78);

    objc_destroyWeak(&v126);
    objc_destroyWeak(&location);

  }
  else if (v10 == (id)1)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 100.0));
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 32.0));
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v79, v80));

    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v124));
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 32.0));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v81, v82));

    v134 = v123;
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v134, 1));
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v122, v83));

    v85 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v85, "multiSelectPaddingBetweenCells");
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
    objc_msgSend(v84, "setInterItemSpacing:", v86);

    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v84));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v87, "multiSelectPaddingBetweenCells");
    objc_msgSend(v7, "setInterGroupSpacing:");

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v88, "multiSelectSectionContentInsets");
    v90 = v89;
    v92 = v91;
    v94 = v93;
    v96 = v95;

    objc_msgSend(v7, "setContentInsets:", v90, v92, v94, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsSectionBackground decorationViewKind](AllRefinementsSectionBackground, "decorationViewKind"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", v97));

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
    objc_msgSend(v99, "headerHeightWithTitle:collectionView:", v100, v101);
    v103 = v102;

    if (v103 > 0.0)
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v103));
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v104, v105));

      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v106, UICollectionElementKindSectionHeader, 2));
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
      objc_msgSend(v108, "multiSelectHeaderLeadingAdjustment");
      objc_msgSend(v107, "setContentInsets:", 0.0, v109, 0.0, 0.0);

      v133 = v107;
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v133, 1));
      objc_msgSend(v7, "setBoundarySupplementaryItems:", v110);

    }
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v111, "multiSelectBackgroundContentInsets");
    v113 = v112;
    v115 = v114;
    v117 = v116;
    v119 = v118;

    objc_msgSend(v98, "setContentInsets:", v103 + v113, v115, v117, v119);
    v132 = v98;
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1));
    objc_msgSend(v7, "setDecorationItems:", v120);

  }
  else if (!v10)
  {
    objc_initWeak(&location, v9);
    v11 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v6);
    objc_msgSend(v11, "setSeparatorStyle:", 1);
    objc_msgSend(v11, "setEstimatedRowHeight:", 44.0);
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_100B9DDD4;
    v127[3] = &unk_1011BF008;
    objc_copyWeak(&v128, &location);
    objc_msgSend(v11, "setSeparatorInsetProvider:", v127);
    v7 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v12, "togglesSectionContentInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(v7, "setContentInsets:", v14, v16, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsSectionBackground decorationViewKind](AllRefinementsSectionBackground, "decorationViewKind"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", v21));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
    objc_msgSend(v23, "headerHeightWithTitle:collectionView:", v24, v25);
    v27 = v26;

    if (v27 > 0.0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v27));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v28, v29));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v30, UICollectionElementKindSectionHeader, 2));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
      objc_msgSend(v32, "togglesHeaderLeadingAdjustment");
      objc_msgSend(v31, "setContentInsets:", 0.0, v33, 0.0, 0.0);

      v136 = v31;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1));
      objc_msgSend(v7, "setBoundarySupplementaryItems:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
    objc_msgSend(v35, "togglesBackgroundContentInsets");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    objc_msgSend(v22, "setContentInsets:", v27 + v37, v39, v41, v43);
    v135 = v22;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v135, 1));
    objc_msgSend(v7, "setDecorationItems:", v44);

    objc_destroyWeak(&v128);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (double)getMaxWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGRect v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
  objc_msgSend(v3, "multiSelectSectionContentInsets");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
  objc_msgSend(v6, "multiSelectSectionContentInsets");
  v8 = v5 + v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
  objc_msgSend(v9, "multiSelectBackgroundContentInsets");
  v11 = v8 + v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource sizeController](self, "sizeController"));
  objc_msgSend(v12, "multiSelectBackgroundContentInsets");
  v14 = v11 + v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource collectionView](self, "collectionView"));
  objc_msgSend(v15, "frame");
  v16 = CGRectGetWidth(v18) - v14;

  return v16;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v5, "scrollViewDidScroll:", v4);

}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (AllRefinementsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (void)setCollectionViewDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, a3);
}

- (AllRefinementsSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return self->_scrollViewDelegate;
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewDelegate, a3);
}

- (AllRefinementsTogglesCellLogicController)togglesLogicController
{
  return self->_togglesLogicController;
}

- (void)setTogglesLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_togglesLogicController, a3);
}

- (AllRefinementsMultiSelectCellLogicController)multiSelectLogicController
{
  return self->_multiSelectLogicController;
}

- (void)setMultiSelectLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelectLogicController, a3);
}

- (ResultRefinementsAnalytics)analyticsDelegate
{
  return (ResultRefinementsAnalytics *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (AllRefinementsViewModelDelegate)viewModelDelegate
{
  return (AllRefinementsViewModelDelegate *)objc_loadWeakRetained((id *)&self->_viewModelDelegate);
}

- (void)setViewModelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewModelDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModelDelegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_multiSelectLogicController, 0);
  objc_storeStrong((id *)&self->_togglesLogicController, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegate, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
}

@end
