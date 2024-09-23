@implementation SearchHomeBrowseCategoriesLayoutProvider

- (SearchHomeBrowseCategoriesLayoutProvider)initWithSearchAlongRoute:(BOOL)a3 supportsFullTextSearch:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  SearchHomeBrowseCategoriesLayoutProvider *v6;
  SearchHomeBrowseCategoriesLayoutProvider *v7;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeBrowseCategoriesLayoutProvider;
  v6 = -[SearchHomeBrowseCategoriesLayoutProvider init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[SearchHomeBrowseCategoriesLayoutProvider setSearchAlongRoute:](v6, "setSearchAlongRoute:", v5);
    -[SearchHomeBrowseCategoriesLayoutProvider setSupportsFullTextSearch:](v7, "setSupportsFullTextSearch:", v4);
  }
  return v7;
}

- (id)cellClasses
{
  uint64_t v3;

  v3 = objc_opt_class(SearchHomeBrowseCategoryCollectionViewCell);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)cellReuseIdentifier
{
  return +[SearchHomeBrowseCategoryCollectionViewCell identifier](SearchHomeBrowseCategoryCollectionViewCell, "identifier");
}

- (int64_t)type
{
  return 2;
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
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider cellReuseIdentifier](self, "cellReuseIdentifier"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
  objc_msgSend(v12, "setSizeController:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v12, "setTitle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v12, "setUpdateIdentifier:", v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1006CB8F8;
  v25[3] = &unk_1011BB6C8;
  v26 = v16;
  v17 = v12;
  v27 = v17;
  v18 = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1006CB970;
  v23[3] = &unk_1011ACBF8;
  v24 = objc_retainBlock(v25);
  v19 = v24;
  objc_msgSend(v8, "imageWithResultHandler:", v23);

  v20 = v24;
  v21 = v17;

  return v21;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  return -[SearchHomeBrowseCategoriesLayoutProvider layoutSectionWithLayoutEnvironment:estimatedHeaderHeight:estimatedFooterHeight:deletionBlock:collectionViewWidth:wantsOneColumnLayout:browseCategoriesTitles:objectsCount:mapsTheme:](self, "layoutSectionWithLayoutEnvironment:estimatedHeaderHeight:estimatedFooterHeight:deletionBlock:collectionViewWidth:wantsOneColumnLayout:browseCategoriesTitles:objectsCount:mapsTheme:", a3, a6, 0, &__NSArray0__struct, 0, a8, a4, a5, 0.0);
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 collectionViewWidth:(double)a7 wantsOneColumnLayout:(BOOL)a8 browseCategoriesTitles:(id)a9 objectsCount:(unint64_t)a10 mapsTheme:(id)a11
{
  _BOOL8 v14;
  id v18;
  id v19;
  id v20;
  SearchHomeBrowseCategoryCellSizeController *v21;
  void *v22;
  SearchHomeBrowseCategoryCellSizeController *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  unsigned int v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  id v67;
  unint64_t v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  float v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  double v82;
  void *v83;
  id v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v116;
  id v117;
  id v118;
  unint64_t v119;
  id v120;
  id v121;
  _QWORD v122[5];
  void *v123;
  void *v124;
  uint8_t buf[4];
  SearchHomeBrowseCategoriesLayoutProvider *v126;
  void *v127;
  id v128;

  v14 = a8;
  v18 = a3;
  v19 = a9;
  v20 = a11;
  v21 = [SearchHomeBrowseCategoryCellSizeController alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
  v23 = -[SearchHomeBrowseCategoryCellSizeController initWithStrings:traitCollection:availableWidth:wantsOneColumnLayout:isSearchAlongRoute:supportsFullTextSearch:](v21, "initWithStrings:traitCollection:availableWidth:wantsOneColumnLayout:isSearchAlongRoute:supportsFullTextSearch:", v19, v22, v14, -[SearchHomeBrowseCategoriesLayoutProvider searchAlongRoute](self, "searchAlongRoute"), self->_supportsFullTextSearch, a7);
  -[SearchHomeBrowseCategoriesLayoutProvider setSizeController:](self, "setSizeController:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v25 = objc_msgSend(v24, "userInterfaceIdiom");

  if (v25 == (id)5)
  {
    v120 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalHeightDimension:](NSCollectionLayoutDimension, "fractionalHeightDimension:", 1.0));
    v28 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v26, v27));

    v121 = (id)v28;
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 36.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v30, v31));

    v128 = v29;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v128, 1));
    v34 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v32, v33));

    v116 = (void *)v34;
    v35 = (id)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v34));
    objc_msgSend(v35, "setInterGroupSpacing:", 3.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
    v38 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v36, v37));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v38, UICollectionElementKindSectionHeader, 1));
    v127 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v127, 1));
    objc_msgSend(v35, "setBoundarySupplementaryItems:", v40);

    objc_msgSend(v35, "setSupplementariesFollowContentInsets:", 0);
    if (!v35)
    {
      v41 = sub_10043230C();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v126 = self;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ in Catalyst App", buf, 0xCu);
      }

    }
LABEL_27:
    v94 = v116;
LABEL_28:

    v19 = v120;
    goto LABEL_29;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
  v44 = objc_msgSend(v43, "numberOfColumns");

  if (v44 != (id)1)
  {
    v117 = v20;
    v118 = v18;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 0.5));
    v56 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v54, v55));

    v121 = (id)v56;
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v56));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "titleLabelFont"));
    objc_msgSend(v58, "lineHeight");
    v60 = v59;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    objc_msgSend(v61, "labelTopAndBottomPadding");
    v63 = v60 + v62 * 2.0;

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    v65 = v63 * (double)(unint64_t)objc_msgSend(v64, "numberOfRows") + 4.0;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    v67 = objc_msgSend(v66, "numberOfColumns");

    v120 = v19;
    if (v67)
    {
      v68 = 0;
      v69 = 0.0;
      do
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "columnWidths"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v68));
        objc_msgSend(v72, "floatValue");
        v74 = v73;

        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v74));
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v65));
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v75, v76));

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitem:count:", v77, v29, objc_msgSend(v78, "numberOfRows")));

        objc_msgSend(v32, "addObject:", v79);
        v69 = v69 + v74;

        ++v68;
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
        v81 = objc_msgSend(v80, "numberOfColumns");

      }
      while (v68 < (unint64_t)v81);
    }
    else
    {
      v69 = 0.0;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    objc_msgSend(v97, "paddingBetweenCells");
    v99 = v98;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    v101 = v69 + v99 * (double)((unint64_t)objc_msgSend(v100, "numberOfColumns") - 1);

    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v101));
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v65));
    v104 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v102, v103));

    v105 = objc_msgSend(v32, "copy");
    v116 = (void *)v104;
    v38 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v104, v105));

    v106 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    objc_msgSend(v106, "paddingBetweenCells");
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
    -[NSObject setInterItemSpacing:](v38, "setInterItemSpacing:", v107);

    v35 = (id)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v38));
    objc_msgSend(v35, "setContentInsets:", 4.0, 16.0, 0.0, 16.0);
    objc_msgSend(v35, "setOrthogonalScrollingBehavior:", 1);
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v108, v109));

    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v110, UICollectionElementKindSectionHeader, 1));
    v123 = v111;
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v123, 1));
    objc_msgSend(v35, "setBoundarySupplementaryItems:", v112);

    objc_msgSend(v35, "setSupplementariesFollowContentInsets:", 0);
    v20 = v117;
    v18 = v118;
    if (!v35)
    {
      v113 = sub_10043230C();
      v114 = objc_claimAutoreleasedReturnValue(v113);
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v126 = self;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ for multiple columns", buf, 0xCu);
      }

    }
    goto LABEL_27;
  }
  v121 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v18);
  objc_msgSend(v121, "setSeparatorStyle:", 1);
  v45 = -[SearchHomeBrowseCategoriesLayoutProvider searchAlongRoute](self, "searchAlongRoute");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "titleLabelFont"));
  objc_msgSend(v47, "lineHeight");
  v49 = v48;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
  objc_msgSend(v50, "labelTopAndBottomPadding");
  v52 = v49 + v51 * 2.0;
  if (v45)
    v53 = 68.0;
  else
    v53 = 58.0;
  v82 = v53;
  if (v52 >= v53)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    v119 = a10;
    v84 = v20;
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "titleLabelFont"));
    objc_msgSend(v85, "lineHeight");
    v87 = v86;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesLayoutProvider sizeController](self, "sizeController"));
    objc_msgSend(v88, "labelTopAndBottomPadding");
    v82 = v87 + v89 * 2.0;

    v20 = v84;
    a10 = v119;

  }
  objc_msgSend(v121, "setRowHeight:", v82);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_1006CC554;
  v122[3] = &unk_1011ADD98;
  v122[4] = a10;
  objc_msgSend(v121, "setSeparatorInsetProvider:", v122);
  objc_msgSend(v121, "setHeaderTopPadding:", 0.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "_separatorConfiguration"));
  v29 = objc_msgSend(v90, "copy");

  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dynamicHairlineColor"));
  objc_msgSend(v29, "_setColor:", v91);

  objc_msgSend(v121, "_setSeparatorConfiguration:", v29);
  v35 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v121, v18);
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a4));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v92, v93));

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v32, UICollectionElementKindSectionHeader, 1));
  v124 = v94;
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v124, 1));
  objc_msgSend(v35, "setBoundarySupplementaryItems:", v95);

  if (!v35)
  {
    v120 = v19;
    v96 = sub_10043230C();
    v38 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v126 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ single column.", buf, 0xCu);
    }
    v35 = 0;
    goto LABEL_28;
  }
LABEL_29:

  return v35;
}

- (id)cellForRowAtIndexPath:(id)a3 tableview:(id)a4 item:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  void *v21;

  v6 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseCategoryTableViewCell identifier](_TtC4Maps27BrowseCategoryTableViewCell, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8));

  v10 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  objc_msgSend(v9, "updateContents:uniqueID:", v13, v12);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1006CC700;
  v19[3] = &unk_1011BB6C8;
  v14 = v9;
  v20 = v14;
  v21 = v12;
  v15 = v12;
  objc_msgSend(v10, "imageWithResultHandler:", v19);

  v16 = v21;
  v17 = v14;

  return v17;
}

- (SearchHomeBrowseCategoryCellSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_supportsFullTextSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeController, 0);
}

@end
