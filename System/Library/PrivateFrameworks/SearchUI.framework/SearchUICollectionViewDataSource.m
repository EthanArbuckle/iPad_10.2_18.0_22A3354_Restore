@implementation SearchUICollectionViewDataSource

- (id)layoutSectionForSectionModel:(id)a3 layoutEnvironment:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SearchUICollectionViewDataSource *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char isKindOfClass;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v86;
  int v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  SearchUICollectionViewDataSource *v92;
  void *v93;
  void *v94;
  _QWORD v95[2];

  v95[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v94 = (void *)objc_opt_new();
  v11 = -[SearchUICollectionViewDataSource indexForSectionIdentifier:](self, "indexForSectionIdentifier:", v8);
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSections");

  v91 = TLKSnippetModernizationEnabled();
  objc_msgSend(v8, "layoutSectionForEnvironment:attributes:dataSource:", v10, v9, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v11;
  -[SearchUICollectionViewDataSource sectionsInsetsForSection:sectionIndex:totalNumberOfSections:attributes:](self, "sectionsInsetsForSection:sectionIndex:totalNumberOfSections:attributes:", v8, v11, v13, v9);
  v93 = v14;
  objc_msgSend(v14, "setContentInsets:");
  v16 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC3340];
  v19 = (void *)MEMORY[0x1E0DBDA48];
  v92 = self;
  v20 = self;
  v21 = v8;
  -[SearchUICollectionViewDataSource controller](v20, "controller");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pixelWidthForView:", v23);
  objc_msgSend(v18, "absoluteDimension:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeWithWidthDimension:heightDimension:", v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "needsHeader"))
  {
    objc_msgSend(v8, "headerInsetsWithAttributes:sectionIndex:", v9, v15);
    v27 = v26;
    v29 = v28;
    v30 = 0.0;
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v31 = v29;
    else
      v31 = 0.0;
    v32 = v9;
    if (objc_msgSend(v8, "needsHeaderSeparator"))
      v33 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") | v91;
    else
      v33 = 0;
    objc_msgSend(v8, "headerTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByTrimmingCharactersInSet:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "sizeWithWidthDimension:heightDimension:", v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x1E0DC3330];
      +[SearchUISupplementaryIdentifiers sectionHeaderKind](SearchUISupplementaryIdentifiers, "sectionHeaderKind");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v42, v44, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "setContentInsets:", 0.0, v27, 0.0, v29);
      objc_msgSend(v94, "addObject:", v45);

      v34 = 0.0;
    }
    else
    {
      v34 = 1.0;
    }
  }
  else
  {
    v33 = 0;
    v34 = *MEMORY[0x1E0DC3298];
    v27 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v30 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v31 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    v32 = v9;
  }
  objc_msgSend(v21, "section");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    if (!v33)
      goto LABEL_36;
LABEL_31:
    LOBYTE(v66) = 0;
    goto LABEL_34;
  }
  v88 = v33;
  v89 = v25;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v90 = v32;
  v87 = objc_msgSend(v32, "shouldUseInsetRoundedSections");
  v48 = -[SearchUICollectionViewDataSource indexForSectionIdentifier:](v92, "indexForSectionIdentifier:", v21);
  -[SearchUICollectionViewDataSource sectionIdentifierForIndex:](v92, "sectionIdentifierForIndex:", v48 - 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    v50 = 1;
  else
    v50 = objc_msgSend(v21, "drawPlattersIfNecessary") ^ 1;
  objc_msgSend(v21, "rowModels");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "count") == 1)
  {
    objc_msgSend(v21, "rowModels");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "firstObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v53, "separatorStyle") != 1;

  }
  else
  {
    v86 = 1;
  }

  objc_msgSend(v21, "rowModels");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "cardSection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v57 = objc_opt_isKindOfClass();

  objc_msgSend(v21, "rowModels");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "cardSection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = objc_opt_isKindOfClass();

  v62 = v49;
  if ((v57 & 1) != 0 || (v61 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v63 = (objc_msgSend(v21, "drawPlattersIfNecessary") | v91) ^ 1;
  else
    v63 = 0;
  v64 = v63 | v88;
  if ((v87 ^ 1 | v50) != 1)
  {

    v25 = v89;
    v32 = v90;
    if (!v64)
      goto LABEL_36;
    goto LABEL_31;
  }
  -[SearchUICollectionViewDataSource snapshot](v92, "snapshot");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v89;
  if (v48 == objc_msgSend(v65, "numberOfSections") - 1 && !objc_msgSend(v21, "needsHeader"))
    v66 = 0;
  else
    v66 = v86 & (v91 ^ 1);

  v32 = v90;
  if (v64)
  {
LABEL_34:
    v67 = (void *)MEMORY[0x1E0DC3330];
    +[SearchUISupplementaryIdentifiers sectionTopSeparatorKind](SearchUISupplementaryIdentifiers, "sectionTopSeparatorKind");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v25, v68, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "setContentInsets:", v34, v27, v30, v31);
    objc_msgSend(v94, "addObject:", v69);

    if ((v66 & 1) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (v66)
  {
LABEL_35:
    v70 = (void *)MEMORY[0x1E0DC3330];
    +[SearchUISupplementaryIdentifiers sectionBottomSeparatorKind](SearchUISupplementaryIdentifiers, "sectionBottomSeparatorKind");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v25, v71, 5);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v94, "addObject:", v72);
  }
LABEL_36:
  if (objc_msgSend(v21, "sectionBackgroundStyleWithAttributes:", v32) == 4)
  {
    v73 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "sizeWithWidthDimension:heightDimension:", v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = (void *)MEMORY[0x1E0DC3330];
    objc_msgSend(MEMORY[0x1E0DC3328], "layoutAnchorWithEdges:", 15);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v76, CFSTR("SearchUIBackgroundReuseIdentifer"), v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v79, "setZIndex:", -10);
    v95[0] = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "boundarySupplementaryItems");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "arrayByAddingObjectsFromArray:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setBoundarySupplementaryItems:", v82);

  }
  objc_msgSend(v93, "boundarySupplementaryItems");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "arrayByAddingObjectsFromArray:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setBoundarySupplementaryItems:", v84);

  objc_msgSend(v93, "setSupplementaryContentInsetsReference:", 2);
  objc_msgSend(v93, "setContentInsetsReference:", 2);

  return v93;
}

- (void)registerSupplementaryViews
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchUICollectionViewDataSource controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  +[SearchUILayoutFooterView reuseIdentifier](SearchUILayoutFooterView, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUILayoutFooterView reuseIdentifier](SearchUILayoutFooterView, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v3, v4, v5);

  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("SearchUIBackgroundReuseIdentifer"), CFSTR("SearchUIBackgroundReuseIdentifer"));
  +[SearchUISupplementaryProvider registerSupplementariesForCollectionView:](SearchUISupplementaryProvider, "registerSupplementariesForCollectionView:", v6);

}

- (SearchUICollectionViewDataSource)initWithController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SearchUICollectionViewDataSource *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *applyQueue;
  uint64_t v11;
  NSMutableSet *registeredCellIdentifiers;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  id from;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__SearchUICollectionViewDataSource_initWithController___block_invoke;
  v21[3] = &unk_1EA1F7C98;
  objc_copyWeak(&v22, &location);
  v20.receiver = self;
  v20.super_class = (Class)SearchUICollectionViewDataSource;
  v7 = -[SearchUICollectionViewDataSource initWithCollectionView:cellProvider:](&v20, sel_initWithCollectionView_cellProvider_, v5, v21);

  if (v7)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.searchui.datasource", v8);
    applyQueue = v7->_applyQueue;
    v7->_applyQueue = (OS_dispatch_queue *)v9;

    atomic_store(0, (unsigned int *)&v7->_numberOfUpdatesInProgress);
    objc_storeWeak((id *)&v7->_controller, v4);
    v11 = objc_opt_new();
    registeredCellIdentifiers = v7->_registeredCellIdentifiers;
    v7->_registeredCellIdentifiers = (NSMutableSet *)v11;

    objc_initWeak(&from, v7);
    v14 = v6;
    v15 = 3221225472;
    v16 = __55__SearchUICollectionViewDataSource_initWithController___block_invoke_2;
    v17 = &unk_1EA1F7CC0;
    objc_copyWeak(&v18, &from);
    -[SearchUICollectionViewDataSource setSupplementaryViewProvider:](v7, "setSupplementaryViewProvider:", &v14);
    -[SearchUICollectionViewDataSource registerSupplementaryViews](v7, "registerSupplementaryViews", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v7;
}

- (id)currentSnapshotLayoutConfiguration
{
  SearchUICollectionViewLayoutConfiguration *v3;
  void *v4;
  SearchUICollectionViewLayoutConfiguration *v5;

  v3 = [SearchUICollectionViewLayoutConfiguration alloc];
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchUICollectionViewLayoutConfiguration initWithSnapshot:](v3, "initWithSnapshot:", v4);

  return v5;
}

uint64_t __75__SearchUICollectionViewDataSource_updateWithSnapshot_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "asyncLoader");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "start");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[SearchUICollectionViewDataSource rebuildSnapshotForAsyncLoaders:](self, "rebuildSnapshotForAsyncLoaders:", v8);
  SearchUIDataSourceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "Updating with snapshot.", buf, 2u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__SearchUICollectionViewDataSource_updateWithSnapshot_animated_completion___block_invoke;
  v13[3] = &unk_1EA1F6908;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[SearchUICollectionViewDataSource applySnapshot:animated:skipsDiffing:completion:](self, "applySnapshot:animated:skipsDiffing:completion:", v12, v6, v6 ^ 1, v13);

}

- (void)rebuildSnapshotForAsyncLoaders:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  SearchUIDataSourceSnapshotBuilder *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  SearchUICollectionViewDataSource *v36;
  uint64_t v37;
  id obj;
  SearchUIDataSourceSnapshotBuilder *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SearchUIDataSourceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Reloading snapshot for SectionAsyncLoaders", buf, 2u);
  }

  objc_msgSend(v4, "sectionIdentifiers");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v41;
    *(_QWORD *)&v7 = 138412546;
    v34 = v7;
    v35 = *(_QWORD *)v41;
    v36 = self;
    do
    {
      v10 = 0;
      v37 = v8;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        objc_msgSend(v11, "asyncLoader", v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "asyncLoader");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setDelegate:", self);
          objc_msgSend(v11, "asyncLoader");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cardSections");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            SearchUIDataSourceLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v34;
              v46 = v11;
              v47 = 2112;
              v48 = v18;
              _os_log_impl(&dword_1DAD39000, v16, OS_LOG_TYPE_DEFAULT, "Rebuilding section %@ because of asyncLoader (%@).", buf, 0x16u);

            }
            objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "deleteItemsWithIdentifiers:", v19);

            v20 = -[SearchUIDataSourceSnapshotBuilder initWithSnapshot:]([SearchUIDataSourceSnapshotBuilder alloc], "initWithSnapshot:", v4);
            objc_msgSend(v13, "searchResult");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUICollectionViewDataSource rebuildAsyncLoaderResult:forCardSections:](self, "rebuildAsyncLoaderResult:forCardSections:", v21, v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v20;
            -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](v20, "buildRowModelsFromCardSections:result:isInline:queryId:", v15, v22, 0, objc_msgSend(v13, "queryId"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = (void *)objc_msgSend(v11, "copyWithRowModels:", v23);
            objc_msgSend(v24, "rowModels");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v26)
            {
              -[SearchUICollectionViewDataSource rebuildSnapshot:replacingSectionModel:newSectionModel:](self, "rebuildSnapshot:replacingSectionModel:newSectionModel:", v4, v11, v24);
              v27 = objc_claimAutoreleasedReturnValue();

              SearchUIDataSourceLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = (objc_class *)objc_opt_class();
                NSStringFromClass(v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v34;
                v46 = v11;
                v47 = 2112;
                v48 = v30;
                _os_log_impl(&dword_1DAD39000, v28, OS_LOG_TYPE_DEFAULT, "Reloading section %@ because of asyncLoader (%@).", buf, 0x16u);

              }
              v4 = (id)v27;
            }
            else
            {
              v44 = v11;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "deleteSectionsWithIdentifiers:", v31);

              SearchUIDataSourceLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v32 = (objc_class *)objc_opt_class();
                NSStringFromClass(v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v34;
                v46 = v11;
                v47 = 2112;
                v48 = v33;
                _os_log_impl(&dword_1DAD39000, v28, OS_LOG_TYPE_DEFAULT, "Removing section %@ because of asyncLoader (%@).", buf, 0x16u);

              }
            }
            v9 = v35;

            self = v36;
            v8 = v37;
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v8);
  }

}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_2(uint64_t a1)
{
  unsigned int *WeakRetained;
  unsigned int *v3;
  signed int v4;
  unsigned int v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  NSObject *v12;
  id *v13;
  id *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  char v21;
  char v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained + 6;
  v4 = atomic_load(WeakRetained + 6);
  do
    v5 = __ldxr(v3);
  while (__stxr(v5 + 1, v3));
  v6 = *(unsigned __int8 *)(a1 + 56);
  SearchUIDataSourceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
    v9 = v4 < 1;
  else
    v9 = 0;
  if (v9)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAD39000, v7, OS_LOG_TYPE_DEFAULT, "Applying snapshot synchronously", buf, 2u);
    }

    objc_msgSend(WeakRetained, "applyQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_25;
    v15[3] = &unk_1EA1F7BC0;
    v15[4] = WeakRetained;
    v13 = &v16;
    v16 = *(id *)(a1 + 32);
    v14 = &v17;
    v17 = *(id *)(a1 + 40);
    dispatch_sync(v12, v15);
  }
  else
  {
    if (v8)
    {
      v10 = *(unsigned __int8 *)(a1 + 56);
      v11 = atomic_load(v3);
      *(_DWORD *)buf = 67109376;
      v24 = v10;
      v25 = 1024;
      v26 = v11;
      _os_log_impl(&dword_1DAD39000, v7, OS_LOG_TYPE_DEFAULT, "Applying snapshot asynchronously, skipsDiffing:%d, updatesInProgress:%d", buf, 0xEu);
    }

    objc_msgSend(WeakRetained, "applyQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_24;
    block[3] = &unk_1EA1F7D38;
    v21 = *(_BYTE *)(a1 + 56);
    block[4] = WeakRetained;
    v13 = &v19;
    v19 = *(id *)(a1 + 32);
    v14 = &v20;
    v20 = *(id *)(a1 + 40);
    v22 = *(_BYTE *)(a1 + 57);
    dispatch_async(v12, block);
  }

}

- (OS_dispatch_queue)applyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SearchUIDataSourceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_1DAD39000, v2, OS_LOG_TYPE_DEFAULT, "Applied snapshot, skisDiffing %d", buf, 8u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_23;
  v4[3] = &unk_1EA1F7CE8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v4);

  objc_destroyWeak(&v7);
}

- (void)applySnapshot:(id)a3 animated:(BOOL)a4 skipsDiffing:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  BOOL v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id location[2];

  v10 = a3;
  v11 = a6;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0DC37E0];
  -[SearchUICollectionViewDataSource controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "focusSystemForEnvironment:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SearchUICollectionViewDataSource controller](self, "controller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "focusableIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICollectionViewDataSource controller](self, "controller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFocusableIndexPath:", 0);

  }
  objc_initWeak(location, self);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke;
  aBlock[3] = &unk_1EA1F7D10;
  v35 = a5;
  objc_copyWeak(&v34, location);
  v20 = v11;
  v33 = v20;
  v21 = v16;
  v32 = v21;
  v22 = _Block_copy(aBlock);
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_2;
  v25[3] = &unk_1EA1F7D60;
  objc_copyWeak(&v28, location);
  v29 = a5;
  v23 = v13;
  v26 = v23;
  v24 = v22;
  v27 = v24;
  v30 = a4;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

}

id __55__SearchUICollectionViewDataSource_initWithController___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "cellForRowModel:atIndexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__SearchUICollectionViewDataSource_initWithController___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  unsigned int v37;

  v6 = a3;
  v7 = a4;
  -[SearchUICollectionViewDataSource sectionIdentifierForIndex:](self, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource registerCellForRowModel:](self, "registerCellForRowModel:", v6);
  -[SearchUICollectionViewDataSource reuseIdentifierForRowModel:](self, "reuseIdentifierForRowModel:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overriddenAccessibilityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v6, "accessibilityIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = objc_msgSend(v8, "shouldDisplayChevronForIndex:nextCardsEnabled:", objc_msgSend(v7, "item"), 1);
  v37 = objc_msgSend(v8, "shouldLeaveSpaceForChevronForIndex:", objc_msgSend(v7, "item"));
  -[SearchUICollectionViewDataSource controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewDataSource controller](self, "controller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", v18);

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier:%@,Section:%ld,Row:%ld"), v13, objc_msgSend(v7, "section"), objc_msgSend(v7, "row"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", v19);

  }
  objc_msgSend(v6, "setSectionType:", objc_msgSend((id)objc_opt_class(), "sectionType"));
  objc_msgSend(v17, "updateWithRowModel:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v13;
    v20 = v9;
    v21 = v14;
    v22 = v8;
    -[SearchUICollectionViewDataSource controller](self, "controller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchUIAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "sectionBackgroundStyleWithAttributes:forRowModel:", v24, v6);

    v14 = v21;
    v9 = v20;
    v13 = v36;
  }
  else
  {
    -[SearchUICollectionViewDataSource controller](self, "controller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchUIAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v8, "sectionBackgroundStyleWithAttributes:", v24);
  }
  objc_msgSend(v17, "setSectionBackgroundStyle:", v25);

  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class())
    && objc_msgSend(v17, "sectionBackgroundStyle") == 4)
  {
    objc_msgSend(v8, "rowModels");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    v28 = v13;
    v29 = v9;
    v30 = v14;
    v31 = objc_msgSend(v26, "count");

    v32 = v31 >= 2;
    v14 = v30;
    v9 = v29;
    v13 = v28;
    v6 = v27;
    v33 = v37;
    if (v32)
    {
      if (objc_msgSend(v7, "row"))
        v35 = 1;
      else
        v35 = 5;
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
    v33 = v37;
  }
  objc_msgSend(v17, "setSearchui_focusStyle:", v35);
  objc_msgSend(v17, "updateChevronVisible:leaveSpaceForChevron:", v14, v33);
  objc_msgSend(v17, "setSfSeparatorStyle:", objc_msgSend(v8, "separatorStyleForIndex:", objc_msgSend(v7, "item")));

  return v17;
}

- (SearchUICollectionViewController)controller
{
  return (SearchUICollectionViewController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)registerCellForRowModel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SearchUICollectionViewDataSource reuseIdentifierForRowModel:](self, "reuseIdentifierForRowModel:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SearchUICollectionViewDataSource registeredCellIdentifiers](self, "registeredCellIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) == 0)
    {
      -[SearchUICollectionViewDataSource registeredCellIdentifiers](self, "registeredCellIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v4);

      -[SearchUICollectionViewDataSource controller](self, "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v10, "collectionViewCellClass"), v4);

    }
  }

}

- (NSMutableSet)registeredCellIdentifiers
{
  return self->_registeredCellIdentifiers;
}

- (id)reuseIdentifierForRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SearchUICollectionViewDataSource pointerStringFrom:](self, "pointerStringFrom:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)reloadModel
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SearchUIDataSourceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DAD39000, v3, OS_LOG_TYPE_DEFAULT, "Reloading with current snapshot.", v5, 2u);
  }

  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource applySnapshot:animated:skipsDiffing:completion:](self, "applySnapshot:animated:skipsDiffing:completion:", v4, 0, 1, 0);

}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
  -[SearchUICollectionViewDataSource reloadSection:animated:reconfigureExisting:](self, "reloadSection:animated:reconfigureExisting:", a3, a4, 0);
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  SearchUIDataSourceSnapshotBuilder *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  unsigned int v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v5 = a5;
  v6 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "indexOfSectionIdentifier:", v8) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "asyncLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "asyncLoader");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asyncLoader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cardSections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v46 = v6;
        SearchUIDataSourceLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v8;
          v50 = 2112;
          v51 = v24;
          _os_log_impl(&dword_1DAD39000, v22, OS_LOG_TYPE_DEFAULT, "Rebuilding section %@ because of asyncLoader (%@).", buf, 0x16u);

        }
        objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteItemsWithIdentifiers:", v25);

        v26 = -[SearchUIDataSourceSnapshotBuilder initWithSnapshot:]([SearchUIDataSourceSnapshotBuilder alloc], "initWithSnapshot:", v10);
        objc_msgSend(v19, "searchResult");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewDataSource rebuildAsyncLoaderResult:forCardSections:](self, "rebuildAsyncLoaderResult:forCardSections:", v27, v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](v26, "buildRowModelsFromCardSections:result:isInline:queryId:", v21, v28, 0, objc_msgSend(v19, "queryId"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v8, "copyWithRowModels:", v29);
        -[SearchUICollectionViewDataSource rebuildSnapshot:replacingSectionModel:newSectionModel:](self, "rebuildSnapshot:replacingSectionModel:newSectionModel:", v10, v8, v30);
        v31 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v31;
        v8 = (id)v30;
        v6 = v46;
      }

    }
    objc_msgSend(v8, "rowModels");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v10, "indexOfSectionIdentifier:", v8));
      v34 = objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewDataSource controller](self, "controller");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "collectionView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "supplementaryViewForElementKind:atIndexPath:", CFSTR("SearchUIBackgroundReuseIdentifer"), v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = v37;
          objc_msgSend(v8, "backgroundColor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "colorView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "setColor:", v39);
        }
      }
      objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteItemsWithIdentifiers:", v41);

      objc_msgSend(v8, "rowModels");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v42, v8);

      if (v5)
      {
        objc_msgSend(v8, "rowModels");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reconfigureItemsWithIdentifiers:", v43);

      }
      SearchUIDataSourceLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v8;
        _os_log_impl(&dword_1DAD39000, v44, OS_LOG_TYPE_DEFAULT, "Reloading section %@.", buf, 0xCu);
      }

    }
    else
    {
      v47 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteSectionsWithIdentifiers:", v45);

      SearchUIDataSourceLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v8;
        _os_log_impl(&dword_1DAD39000, v34, OS_LOG_TYPE_DEFAULT, "Reloading section %@. Removing because section is empty!", buf, 0xCu);
      }
    }

    -[SearchUICollectionViewDataSource applySnapshot:animated:skipsDiffing:completion:](self, "applySnapshot:animated:skipsDiffing:completion:", v10, v6, 0, 0);
  }
  else
  {
    SearchUIDataSourceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SearchUICollectionViewDataSource reloadSection:animated:reconfigureExisting:].cold.1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)reloadSectionWithIdentifier:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SearchUICollectionViewDataSource *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a5;
  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v27 = v6;
    v28 = v5;
    v26 = self;
    -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
    v9 = objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NSObject sectionIdentifiers](v9, "sectionIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        objc_msgSend(v15, "section");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sectionIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v8);

        if ((v18 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v15;

      if (!v19)
        goto LABEL_13;
      -[SearchUICollectionViewDataSource reloadSection:animated:reconfigureExisting:](v26, "reloadSection:animated:reconfigureExisting:", v19, v27, v28);
    }
    else
    {
LABEL_10:

LABEL_13:
      SearchUIDataSourceLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SearchUICollectionViewDataSource reloadSectionWithIdentifier:animated:reconfigureExisting:].cold.2((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);
    }

  }
  else
  {
    SearchUIDataSourceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SearchUICollectionViewDataSource reloadSectionWithIdentifier:animated:reconfigureExisting:].cold.1(v9);
  }

}

- (BOOL)deviceIsAuthenticated
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SearchUICollectionViewDataSource controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v3);

  return v4;
}

- (void)updateWithSnapshot:(id)a3
{
  -[SearchUICollectionViewDataSource updateWithSnapshot:animated:completion:](self, "updateWithSnapshot:animated:completion:", a3, 0, 0);
}

- (id)rebuildSnapshot:(id)a3 replacingSectionModel:(id)a4 newSectionModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "indexOfSectionIdentifier:", v8);
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteSectionsWithIdentifiers:", v11);

  if (v10 == objc_msgSend(v7, "numberOfSections"))
  {
    v18 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", v12);
  }
  else
  {
    objc_msgSend(v7, "sectionIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v14, v12);

  }
  objc_msgSend(v9, "rowModels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v9);

  return v7;
}

- (id)rebuildAsyncLoaderResult:(id)a3 forCardSections:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSearchResult:", v6);
  +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v7, "card");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "cardSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v10, "cardSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "cardSections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      objc_msgSend(v17, "setCardSections:", v5);
      v20[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCardSections:", v18);

    }
  }
  else
  {

  }
  return v7;
}

- (id)registerFooterView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SearchUICollectionViewDataSource reuseIdentifierForFooterView:](self, "reuseIdentifierForFooterView:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v4, v4);

  return v4;
}

- (void)removeRowModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifierForSectionContainingItemIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteItemsWithIdentifiers:", v10);

    if (!objc_msgSend(v8, "numberOfItemsInSection:", v9))
    {
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteSectionsWithIdentifiers:", v11);

    }
    SearchUIDataSourceLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      objc_msgSend(v6, "itemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1DAD39000, v12, OS_LOG_TYPE_DEFAULT, "Removing rowModel %@ (%@).", buf, 0x16u);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SearchUICollectionViewDataSource_removeRowModel_completion___block_invoke;
    v16[3] = &unk_1EA1F6DA8;
    v17 = v7;
    -[SearchUICollectionViewDataSource applySnapshot:animated:skipsDiffing:completion:](self, "applySnapshot:animated:skipsDiffing:completion:", v8, 1, 0, v16);

  }
  else
  {
    SearchUIDataSourceLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SearchUICollectionViewDataSource removeRowModel:completion:].cold.1(v6, v15);

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __62__SearchUICollectionViewDataSource_removeRowModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)removeSectionContaining:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifierForSectionContainingItemIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SearchUIDataSourceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    objc_msgSend(v6, "itemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "Trying to remove section %@ containing rowModel %@ (%@).", (uint8_t *)&v13, 0x20u);

  }
  -[SearchUICollectionViewDataSource removeSectionModel:completion:](self, "removeSectionModel:completion:", v9, v7);

}

- (void)removeSectionModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSectionsWithIdentifiers:", v9);

    SearchUIDataSourceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "Removing section %@", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__SearchUICollectionViewDataSource_removeSectionModel_completion___block_invoke;
    v19[3] = &unk_1EA1F6DA8;
    v20 = v7;
    -[SearchUICollectionViewDataSource applySnapshot:animated:skipsDiffing:completion:](self, "applySnapshot:animated:skipsDiffing:completion:", v8, 1, 0, v19);

  }
  else
  {
    SearchUIDataSourceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SearchUICollectionViewDataSource removeSectionModel:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __66__SearchUICollectionViewDataSource_removeSectionModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_23(uint64_t a1)
{
  unsigned int *WeakRetained;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  unsigned int *v11;

  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 6;
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 - 1, v4));
  }
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    v3 = v11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v3, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFocusableIndexPath:", v7);

    v3 = v11;
  }
  objc_msgSend(v3, "updateCompletionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "updateCompletionBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, unsigned int *))v10)[2](v10, v11);

  }
}

uint64_t __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_24(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "applySnapshotUsingReloadData:completion:", v4, *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(v3, "applySnapshot:animatingDifferences:completion:", v4, *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

uint64_t __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySnapshotUsingReloadData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)reuseIdentifierForFooterView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  +[SearchUILayoutFooterView reuseIdentifier](SearchUILayoutFooterView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource pointerStringFrom:](self, "pointerStringFrom:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pointerStringFrom:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
}

- (void)setUpdateCompletionBlock:(id)a3
{
  void *v4;
  id updateCompletionBlock;

  v4 = _Block_copy(a3);
  updateCompletionBlock = self->_updateCompletionBlock;
  self->_updateCompletionBlock = v4;

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
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
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SearchUICollectionViewDataSource sectionIdentifierForIndex:](self, "sectionIdentifierForIndex:", objc_msgSend(v10, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "footerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewDataSource reuseIdentifierForFooterView:](self, "reuseIdentifierForFooterView:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", v14))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewDataSource controller](self, "controller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "footerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFooterView:", v17);

    -[SearchUICollectionViewDataSource controller](self, "controller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "footerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v19 == 0);
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("SearchUIBackgroundReuseIdentifer")))
    {
      -[SearchUICollectionViewDataSource controller](self, "controller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUISupplementaryProvider viewForSupplementaryOfKind:atIndexPath:forSectionModel:controller:](SearchUISupplementaryProvider, "viewForSupplementaryOfKind:atIndexPath:forSectionModel:controller:", v9, v10, v11, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("SearchUIBackgroundReuseIdentifer"), CFSTR("SearchUIBackgroundReuseIdentifer"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout sectionCornerRadius](SearchUIAutoLayout, "sectionCornerRadius");
    objc_msgSend(v15, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v15, "setHighlighted:", 0);
    objc_msgSend(v11, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColor:", v18);
  }

LABEL_7:
  return v15;
}

- (NSDirectionalEdgeInsets)sectionsInsetsForSection:(id)a3 sectionIndex:(unint64_t)a4 totalNumberOfSections:(int64_t)a5 attributes:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  _BOOL4 v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSDirectionalEdgeInsets result;

  v10 = a3;
  v11 = a6;
  -[SearchUICollectionViewDataSource snapshot](self, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSections");

  v14 = objc_msgSend(v10, "shouldInsetGroupedCollectionStyle");
  if (objc_msgSend((id)objc_opt_class(), "sectionType"))
    v15 = 1;
  else
    v15 = v14;
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri"))
    v16 = objc_msgSend((id)objc_opt_class(), "sectionType") == 1;
  else
    v16 = 0;
  if ((objc_msgSend(v11, "inPreviewPlatter") & 1) != 0)
    LOBYTE(v17) = 0;
  else
    v17 = objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri") ^ 1;
  objc_msgSend(v10, "sectionInsetsWithAttributes:sectionIndex:", v11, a4);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  if ((v14 | v16) == 1)
    +[SearchUIUtilities disambiguationTableCellContentInset](SearchUIUtilities, "disambiguationTableCellContentInset");
  else
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v27 = v26;
  v28 = v13 - 1;
  if (a4)
    v29 = 1;
  else
    v29 = v17;
  if ((v29 & 1) != 0)
    goto LABEL_29;
  objc_msgSend(v10, "rowModels");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "cardSection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v31, "fillsBackgroundWithContent"))
  {
    if (objc_msgSend(v31, "fillsBackgroundWithContent"))
      v19 = 12.0;
    else
      v19 = 0.0;
    goto LABEL_28;
  }
  if (a5 == 1)
  {
    v19 = v27;
    if ((v15 & 1) != 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  v19 = v27;
  if (((objc_msgSend(v31, "fillsBackgroundWithContent") | v15) & 1) == 0)
LABEL_27:
    v19 = 0.0;
LABEL_28:

LABEL_29:
  if (v28 == a4)
    v33 = v17;
  else
    v33 = 1;
  if ((v33 & 1) == 0)
  {
    objc_msgSend(v10, "rowModels");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 == 1)
    {
      if ((v15 & 1) != 0)
        goto LABEL_38;
    }
    else if (((objc_msgSend(v35, "fillsBackgroundWithContent") | v15) & 1) != 0)
    {
LABEL_38:

      v23 = v27;
      goto LABEL_39;
    }
    v27 = 0.0;
    goto LABEL_38;
  }
LABEL_39:

  v36 = v19;
  v37 = v21;
  v38 = v23;
  v39 = v25;
  result.trailing = v39;
  result.bottom = v38;
  result.leading = v37;
  result.top = v36;
  return result;
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void)setRegisteredCellIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredCellIdentifiers, a3);
}

- (void)setApplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)numberOfUpdatesInProgress
{
  return self->_numberOfUpdatesInProgress;
}

- (void)setNumberOfUpdatesInProgress:(int)a3
{
  self->_numberOfUpdatesInProgress = a3;
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_applyQueue, 0);
  objc_storeStrong((id *)&self->_registeredCellIdentifiers, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)reloadSection:(uint64_t)a3 animated:(uint64_t)a4 reconfigureExisting:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Attempted to reload section %@ which is not part of current snapshot!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reloadSectionWithIdentifier:(os_log_t)log animated:reconfigureExisting:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Attempted to reload section with invalid identifier!", v1, 2u);
}

- (void)reloadSectionWithIdentifier:(uint64_t)a3 animated:(uint64_t)a4 reconfigureExisting:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Attempted to reload section (identifier: %@) that is not part of current snapshot!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeRowModel:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  objc_msgSend(a1, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Attempted to remove rowModel %@ (%@) which is not part of current snapshot!", (uint8_t *)&v6, 0x16u);

}

- (void)removeSectionModel:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a1, a3, "Attempted to remove section %@, however section is not part of current snapshot!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
