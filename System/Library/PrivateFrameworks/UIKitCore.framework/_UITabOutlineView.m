@implementation _UITabOutlineView

- (id)initWithSidebar:(id *)a1
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_11;
  v17.receiver = a1;
  v17.super_class = (Class)_UITabOutlineView;
  a1 = (id *)objc_msgSendSuper2(&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (!a1)
    goto LABEL_11;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_13;
  }
  v4 = v3[5];
  v5 = v4;
  if (!v4)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = (void *)*((_QWORD *)v4 + 144);
LABEL_6:
  v7 = v6;

  objc_storeStrong(a1 + 55, v6);
  a1[57] = v3;
  *((_BYTE *)a1 + 424) = 1;
  *((_BYTE *)a1 + 426) = 1;
  -[UIView _internalTraitOverrides](a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setNSIntegerValue:forTraitToken:", 1, 0x1E1A99690);

  -[UIView _internalTraitOverrides](a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setNSIntegerValue:forTraitToken:", 2, 0x1E1A99660);

  objc_msgSend(a1, "_createViewHierarchy");
  v19[0] = 0x1E1A994E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(a1, "_registerForTraitTokenChanges:withTarget:action:", v10, a1, sel__displayScaleTraitChanged);

  v18 = 0x1E1A994B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(a1, "_registerForTraitTokenChanges:withTarget:action:", v12, a1, sel__userInterfaceStyleTraitChanged);

  objc_msgSend(v7, "addObserver:", a1);
  objc_msgSend(v7, "tabItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(a1, "_reloadDataSourceSnapshotAnimated:", 0);
    objc_msgSend(a1, "_updateSelectedItemAnimated:", 0);
  }
  if (objc_msgSend(v7, "isEditing"))
    -[_UITabOutlineView setEditing:animated:](a1, 1, 0);

LABEL_11:
  return a1;
}

- (_BYTE)setEditing:(uint64_t)a3 animated:
{
  void *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  char v9;
  _QWORD v10[5];
  char v11;

  if (result)
  {
    v4 = result;
    if (result[428] != (_DWORD)a2)
    {
      result[428] = a2;
      objc_msgSend(result, "_updateEditBarButtonItem");
      objc_msgSend(v4, "_reloadDataSourceSnapshotAnimated:", a3);
      objc_msgSend(v4, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectionFollowsFocus:", a2 ^ 1);

      if ((_DWORD)a3)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __41___UITabOutlineView_setEditing_animated___block_invoke;
        v10[3] = &unk_1E16B1B78;
        v10[4] = v4;
        v11 = a2;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.3);
      }
      else
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __41___UITabOutlineView_setEditing_animated___block_invoke_2;
        v8[3] = &unk_1E16B1B78;
        v8[4] = v4;
        v9 = a2;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
      }
      objc_msgSend(v4, "bottomBarView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", a2);

      objc_msgSend(v4, "_updateSelectedItemAnimated:", a3);
      return (_BYTE *)objc_msgSend(v4, "_updateEditingInsets");
    }
  }
  return result;
}

- (void)prepareForTransitionToVisibility:(_BYTE *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    a1[419] = 1;
    if (a2)
    {
      if (a1[421] && (objc_msgSend(a1, "isEditing") & 1) == 0)
      {
        objc_msgSend(a1, "collectionView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "indexPathsForSelectedItems");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          objc_msgSend(a1, "collectionView");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 0, 0);

        }
      }
      a1[421] = 0;
    }
  }
}

- (id)contentView
{
  if (a1)
  {
    objc_msgSend(a1[65], "contentView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (double)sidebarButtonOrigin
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameInView:", a1);
  v5 = v4;

  return v5;
}

- (id)currentBackgroundEffect
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "backgroundView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "effect");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setOverrideBackgroundEffect:(id *)a1
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a2;
  if (a1 && a1[60] != v4)
  {
    v9 = v4;
    objc_storeStrong(a1 + 60, a2);
    v5 = v9;
    if (!v5)
    {
      objc_msgSend(a1, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "sidebarBackgroundEffect");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEffect:", v5);

    v4 = v9;
  }

}

- (id)_tabBarController
{
  if (self)
    self = (_UITabOutlineView *)self->_tabModel;
  return (id)-[_UITabOutlineView tabBarController](self, "tabBarController");
}

- (id)primaryShadow
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "shadowView");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 424);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)secondaryShadow
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "shadowView");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 432);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_createViewHierarchy
{
  _UIVisualEffectBackdropView *v4;
  void *v5;
  UIVisualEffectView *v6;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  UINavigationItem *v10;
  UINavigationBar *v11;
  void *v12;
  void *v13;
  void *v14;
  UICollectionViewCompositionalLayout *v15;
  uint64_t v16;
  UICollectionView *v17;
  UICollectionView *v18;
  _UICollectionViewDragAndDropController *dragAndDropController;
  void *v20;
  uint64_t v21;
  void *v22;
  UICollectionViewDiffableDataSource *v23;
  UICollectionViewDiffableDataSource *v24;
  UICollectionViewDiffableDataSource *dataSource;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableSet *v33;
  NSMutableSet *collapsedSectionIdentifiers;
  void *v35;
  void *v36;
  void *v37;
  UIBarButtonItem *v38;
  void *v39;
  UIBarButtonItem *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  UICollectionViewCompositionalLayout *v46;
  UINavigationItem *v47;
  _UIVisualEffectBackdropView *v48;
  void *v49;
  _UIDuoShadowView *v50;
  UIVisualEffectView *v51;
  UINavigationBar *obj;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58[2];
  _QWORD v59[4];
  id v60[2];
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD aBlock[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id location;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  +[_UIFloatingTabBar registerPlatformMetrics](_UIFloatingTabBar, "registerPlatformMetrics");
  v50 = objc_alloc_init(_UIDuoShadowView);
  objc_storeStrong((id *)&self->_shadowView, v50);
  -[_UITabOutlineView _configureShadowView](self, "_configureShadowView");
  -[UIView addSubview:](self, "addSubview:", v50);
  v4 = objc_alloc_init(_UIVisualEffectBackdropView);
  -[_UIVisualEffectBackdropView setRenderMode:](v4, "setRenderMode:", 1);
  -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v50);
  v48 = v4;
  objc_storeStrong((id *)&self->_backgroundCaptureView, v4);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [UIVisualEffectView alloc];
  objc_msgSend(v49, "sidebarBackgroundEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIVisualEffectView initWithEffect:](v6, "initWithEffect:", v7);

  v51 = v8;
  -[UIVisualEffectView contentView](v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[UIVisualEffectView _setCaptureView:](v8, "_setCaptureView:", v48);
  -[UIView addSubview:](self, "addSubview:", v8);
  objc_storeStrong((id *)&self->_backgroundView, v8);
  v10 = -[UINavigationItem initWithTitle:]([UINavigationItem alloc], "initWithTitle:", &stru_1E16EDF20);
  -[UINavigationItem _setManualScrollEdgeAppearanceEnabled:](v10, "_setManualScrollEdgeAppearanceEnabled:", 1);
  v47 = v10;
  objc_storeStrong((id *)&self->_navigationItem, v10);
  v11 = [UINavigationBar alloc];
  obj = -[UINavigationBar initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UITabOutlineView _defaultBarBackdropGroupName](self, "_defaultBarBackdropGroupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _setBackdropViewLayerGroupName:](obj, "_setBackdropViewLayerGroupName:", v12);

  -[UINavigationBar _setBarPosition:](obj, "_setBarPosition:", 3);
  -[UINavigationBar _setWantsHostedTabBarMetrics:](obj, "_setWantsHostedTabBarMetrics:", self->_wantsHostedTabBarMetricsForNavigationBar);
  v77[0] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar setItems:](obj, "setItems:", v13);

  -[UIVisualEffectView contentView](v8, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", obj);

  objc_storeStrong((id *)&self->_navigationBar, obj);
  objc_initWeak(&location, self);
  v15 = [UICollectionViewCompositionalLayout alloc];
  v16 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke;
  v74[3] = &unk_1E16DB350;
  objc_copyWeak(&v75, &location);
  v46 = -[UICollectionViewCompositionalLayout initWithSectionProvider:](v15, "initWithSectionProvider:", v74);
  v17 = [UICollectionView alloc];
  -[UIView bounds](self, "bounds");
  v18 = -[UICollectionView initWithFrame:collectionViewLayout:](v17, "initWithFrame:collectionViewLayout:", v46);
  -[UICollectionView setAllowsFocus:](v18, "setAllowsFocus:", 1);
  -[UICollectionView setSelectionFollowsFocus:](v18, "setSelectionFollowsFocus:", 1);
  -[UICollectionView setSpringLoaded:](v18, "setSpringLoaded:", 1);
  -[UICollectionView setDragDelegate:](v18, "setDragDelegate:", self);
  -[UICollectionView setDropDelegate:](v18, "setDropDelegate:", self);
  if (v18)
  {
    dragAndDropController = v18->_dragAndDropController;
    if (dragAndDropController)
      dragAndDropController->_flockSelectedItemsOnDrag = 0;
  }
  -[UICollectionView _setPreferredDragDestinationVisualStyle:](v18, "_setPreferredDragDestinationVisualStyle:", 1);
  -[UICollectionView setContentInset:](v18, "setContentInset:", 9.0, 0.0, 9.0, 0.0);
  -[UICollectionView setDelegate:](v18, "setDelegate:", self);
  -[UICollectionView setAllowsMultipleSelectionDuringEditing:](v18, "setAllowsMultipleSelectionDuringEditing:", 1);
  -[UIScrollView _addScrollViewScrollObserver:](v18, "_addScrollViewScrollObserver:", self);
  -[UIVisualEffectView contentView](v51, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (obj)
    objc_msgSend(v20, "insertSubview:belowSubview:", v18, self->_navigationBar);
  else
    objc_msgSend(v20, "addSubview:", v18);

  objc_storeStrong((id *)&self->_collectionView, v18);
  v21 = objc_opt_class();
  v72[0] = v16;
  v72[1] = 3221225472;
  v72[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_4;
  v72[3] = &unk_1E16EC9D8;
  objc_copyWeak(&v73, &location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v21, v72);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [UICollectionViewDiffableDataSource alloc];
  v69[0] = v16;
  v69[1] = 3221225472;
  v69[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_6;
  v69[3] = &unk_1E16ECA00;
  objc_copyWeak(&v71, &location);
  v45 = v22;
  v70 = v45;
  v24 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v23, "initWithCollectionView:cellProvider:", v18, v69);
  dataSource = self->_dataSource;
  self->_dataSource = v24;

  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_7;
  aBlock[3] = &unk_1E16ECA28;
  objc_copyWeak(&v68, &location);
  v26 = _Block_copy(aBlock);
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), CFSTR("UICollectionElementKindSectionHeader"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), CFSTR("UICollectionElementKindSectionFooter"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), CFSTR("UITabOutlineView.EditHeader"), v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v16;
  v63[1] = 3221225472;
  v63[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_8;
  v63[3] = &unk_1E16ECA50;
  v42 = v27;
  v64 = v42;
  v43 = v28;
  v65 = v43;
  v44 = v29;
  v66 = v44;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", v63);
  v61[0] = v16;
  v61[1] = 3221225472;
  v61[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_9;
  v61[3] = &unk_1E16DB430;
  objc_copyWeak(&v62, &location);
  -[UICollectionViewDiffableDataSource reorderingHandlers](self->_dataSource, "reorderingHandlers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCanReorderItemHandler:", v61);

  v59[0] = v16;
  v59[1] = 3221225472;
  v59[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_10;
  v59[3] = &unk_1E16ECA78;
  objc_copyWeak(v60, &location);
  v60[1] = (id)a2;
  -[UICollectionViewDiffableDataSource reorderingHandlers](self->_dataSource, "reorderingHandlers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWillReorderHandler:", v59);

  v57[0] = v16;
  v57[1] = 3221225472;
  v57[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_11;
  v57[3] = &unk_1E16ECA78;
  objc_copyWeak(v58, &location);
  v58[1] = (id)a2;
  -[UICollectionViewDiffableDataSource reorderingHandlers](self->_dataSource, "reorderingHandlers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDidReorderHandler:", v57);

  v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
  self->_collapsedSectionIdentifiers = v33;

  v55[0] = v16;
  v55[1] = 3221225472;
  v55[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_12;
  v55[3] = &unk_1E16ECAA0;
  objc_copyWeak(&v56, &location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_dataSource, "sectionSnapshotHandlers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWillExpandItemHandler:", v55);

  v53[0] = v16;
  v53[1] = 3221225472;
  v53[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_14;
  v53[3] = &unk_1E16ECAA0;
  objc_copyWeak(&v54, &location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_dataSource, "sectionSnapshotHandlers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWillCollapseItemHandler:", v53);

  -[_UITabOutlineView _currentSidebarImage](self, "_currentSidebarImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[UIBarButtonItem initWithImage:style:target:action:]([UIBarButtonItem alloc], "initWithImage:style:target:action:", v37, 0, 0, 0);
  -[UIBarButtonItem setSpringLoaded:](v38, "setSpringLoaded:", 1);
  objc_storeStrong((id *)&self->_sidebarBarButtonItem, v38);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Reset"), CFSTR("Reset"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", v39, 0, self, sel__resetCustomization);
  objc_storeStrong((id *)&self->_resetBarButtonItem, v40);
  -[_UITabOutlineView navigationItem](self, "navigationItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLeftBarButtonItem:", v38);

  -[_UITabOutlineView _updateEditBarButtonItem](self, "_updateEditBarButtonItem");
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(v58);
  objc_destroyWeak(v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);

}

- (void)_configureShadowView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setRadius:", 0.0);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v4 = 1.0;
  objc_msgSend(v7, "setOffset:", 1.0 / v5, 0.0);
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
  {
    +[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColor:", v6);

  }
  else
  {
    v4 = 0.16;
  }
  objc_msgSend(v7, "setOpacity:", v4);
  -[_UIDuoShadowView setPrimaryShadow:]((uint64_t)self->_shadowView, v7);

}

- (void)_resetCustomization
{
  void *v3;
  void *v4;
  _UITabModel *tabModel;
  void *v6;
  void *v7;

  -[_UITabOutlineView activeTransaction](self, "activeTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[_UITabModel tabItems](self->_tabModel, "tabItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetCustomizationForTabs:", v4);

    tabModel = self->_tabModel;
  }
  else
  {
    objc_msgSend(0, "tabItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetCustomizationForTabs:", v7);

    tabModel = 0;
  }
  -[_UITabModel customizationStore](tabModel, "customizationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[_UITabOutlineView _reloadDataSourceSnapshotAnimated:](self, "_reloadDataSourceSnapshotAnimated:", 1);
  -[_UITabOutlineView _updateSelectedItemAnimated:](self, "_updateSelectedItemAnimated:", 1);
}

- (void)_updateConfigurationForCell:(id)a3 inState:(id)a4 content:(id)a5 indexPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  UITabSidebarItemRequest *v18;
  void *v19;
  uint64_t v20;
  UITabBarControllerSidebar *v21;
  id v22;
  void *v23;
  UITabSidebarItemRequest *v24;
  void *v25;
  UITabBarControllerSidebar *sidebar;
  void *v27;
  void *v28;
  void *v29;
  id *v30;

  v30 = (id *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v30;
  if (v30)
  {
    if (v11)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabOutlineView.m"), 602, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

    v14 = v30;
    if (v30)
      goto LABEL_4;
LABEL_23:
    v15 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabOutlineView.m"), 601, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell != nil"));

  v14 = 0;
  if (!v11)
    goto LABEL_22;
LABEL_3:
  if (!v14)
    goto LABEL_23;
LABEL_4:
  v15 = v14[110];
  if (!v15 || (*((_BYTE *)v30 + 876) & 1) == 0)
  {
LABEL_6:
    v16 = -[_UITabOutlineView _isHeaderIndexPath:](self, "_isHeaderIndexPath:", v13);
    objc_msgSend(v12, "tab");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [UITabSidebarItemRequest alloc];
      objc_msgSend(v12, "tab");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[UITabSidebarItemRequest _initWithTab:cell:isHeader:](v18, "_initWithTab:cell:isHeader:", v19, v30, v16);
    }
    else
    {
      objc_msgSend(v12, "action");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_19;
      v24 = [UITabSidebarItemRequest alloc];
      objc_msgSend(v12, "action");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[UITabSidebarItemRequest _initWithAction:cell:](v24, "_initWithAction:cell:", v19, v30);
    }
    v25 = (void *)v20;

    if (v25)
    {
      if (self)
        sidebar = self->_sidebar;
      else
        sidebar = 0;
      -[UITabBarControllerSidebar _sidebarItemForRequest:]((uint64_t)sidebar, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, v27);

      goto LABEL_20;
    }
LABEL_19:
    -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, 0);
    goto LABEL_20;
  }
  -[_UITabSidebarCell pushCurrentStateIntoSidebarItem](v30);
  if (self)
    v21 = self->_sidebar;
  else
    v21 = 0;
  -[UITabBarControllerSidebar _updatedSidebarItem:](v21, v15);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22 != v15)
    -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, v22);

LABEL_20:
}

- (id)_leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a3
{
  id v4;
  _UITabModel *tabModel;
  void *v6;
  void *v7;
  UITabBarControllerSidebar *sidebar;

  v4 = a3;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    v6 = 0;
  }
  else
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && !-[_UITabOutlineView _isHeaderIndexPath:](self, "_isHeaderIndexPath:", v4))
    {
      if (self)
        sidebar = self->_sidebar;
      else
        sidebar = 0;
      -[UITabBarControllerSidebar _leadingSwipeActionsConfigurationForTab:]((uint64_t)sidebar, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)_trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a3
{
  id v4;
  _UITabModel *tabModel;
  void *v6;
  void *v7;
  UITabBarControllerSidebar *sidebar;

  v4 = a3;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    v6 = 0;
  }
  else
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && !-[_UITabOutlineView _isHeaderIndexPath:](self, "_isHeaderIndexPath:", v4))
    {
      if (self)
        sidebar = self->_sidebar;
      else
        sidebar = 0;
      -[UITabBarControllerSidebar _trailingSwipeActionsConfigurationForTab:]((uint64_t)sidebar, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabOutlineView;
  -[UIView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  if (a3)
    -[_UITabOutlineView _updateSelectedItemAnimated:](self, "_updateSelectedItemAnimated:", 0);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabOutlineView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[_UITabOutlineView _updateEditingInsets](self, "_updateEditingInsets");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)_UITabOutlineView;
  -[UIView layoutSubviews](&v43, sel_layoutSubviews);
  -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UITabOutlineView shadowView](self, "shadowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[_UITabOutlineView backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[_UITabOutlineView backgroundCaptureView](self, "backgroundCaptureView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[_UITabOutlineView navigationBar](self, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v8, v10);
  v16 = v15;
  v18 = v17;

  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v20 = v19;
  -[_UITabOutlineView navigationBar](self, "navigationBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 0.0, v20, v16, v18);

  if (self->_isNavigationBarSafeAreaDirty)
  {
    -[_UITabOutlineView navigationBar](self, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaInsetsDidChange");

    self->_isNavigationBarSafeAreaDirty = 0;
  }
  -[_UITabOutlineView navigationBar](self, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    -[UIView safeAreaInsets](self, "safeAreaInsets");
    v18 = v24;
  }
  -[_UITabOutlineView bottomBarView](self, "bottomBarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v25;
  v29 = 0.0;
  if (v25)
  {
    LODWORD(v26) = 1148846080;
    LODWORD(v27) = 1112014848;
    objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 44.0, v26, v27);
    v31 = v30;
    v32 = v10 - v30;
    -[_UITabOutlineView _bottomToolbar](self, "_bottomToolbar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "items");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      objc_msgSend(v28, "setLayoutWithinSafeArea:", 1);
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v32 = v32 - v36;
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v38 = v31 + v37;
    }
    else
    {
      objc_msgSend(v28, "setLayoutWithinSafeArea:", 0);
      v38 = v31;
    }
    objc_msgSend(v28, "setFrame:", 0.0, v32, v8, v38);
    v29 = v31 + 0.0;
  }
  v39 = v18 + 0.0;
  -[_UITabOutlineView collectionView](self, "collectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setContentInset:", v39, 0.0, v29, 0.0);

  -[_UITabOutlineView collectionView](self, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setVerticalScrollIndicatorInsets:", v39, 0.0, v29, 0.0);

  -[_UITabOutlineView collectionView](self, "collectionView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v4, v6, v8, v10);

  -[_UITabOutlineView _updateScrollEdgeAppearance](self, "_updateScrollEdgeAppearance");
}

- (void)setDisplayedGroup:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2;
  if (a1 && *(id *)(a1 + 448) != v4)
  {
    v8 = v4;
    if (v4)
    {
      objc_msgSend(v4, "_tabModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 440);

      if (v5 != v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_setDisplayedGroup_, a1, CFSTR("_UITabOutlineView.m"), 743, CFSTR("Trying to display a group that is not part of the tab model."));

      }
    }
    objc_storeStrong((id *)(a1 + 448), a2);
    objc_msgSend((id)a1, "_reloadDataSourceSnapshotAnimated:", 0);
    objc_msgSend((id)a1, "_updateSelectedItemAnimated:", 0);
    v4 = v8;
  }

}

- (void)setSidebarButtonAction:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_storeStrong(a1 + 59, v4);
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("rectangle.line.horizontal.inset.top"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

    objc_msgSend(a1, "sidebarBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrimaryAction:", v4);
    objc_msgSend(v6, "setHidden:", objc_msgSend(a1, "_showSidebarBarButtonItem") ^ 1);
    objc_msgSend(a1, "setNeedsLayout");

    v3 = v4;
  }

}

- (void)setTitle:(id *)a1
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    v4 = a1[58];
    v5 = v9;
    v6 = v5;
    if (v4 == v5)
    {

    }
    else
    {
      if (v5 && v4)
      {
        v7 = objc_msgSend(v4, "isEqual:", v5);

        if ((v7 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      objc_storeStrong(a1 + 58, a2);
      objc_msgSend(a1, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v6);
      v6 = v8;
    }

  }
LABEL_11:

}

- (void)setTransitionsToTabBar:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 424) != a2)
    {
      *(_BYTE *)(a1 + 424) = a2;
      objc_msgSend((id)a1, "_currentSidebarImage");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 600), "setImage:", v3);

    }
  }
}

- (uint64_t)setSuppressesSidebarButton:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned __int8 *)(result + 425) != a2)
    {
      *(_BYTE *)(result + 425) = a2;
      return objc_msgSend(*(id *)(result + 600), "setHidden:", objc_msgSend((id)result, "_showSidebarBarButtonItem") ^ 1);
    }
  }
  return result;
}

- (id)_defaultBarBackdropGroupName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<TabSidebar.NavigationBar %p>"), self);
}

- (id)_currentSidebarImage
{
  void *v2;

  if (self && self->_transitionsToTabBar)
  {
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("rectangle.line.horizontal.inset.top"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_updateSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!self->_ignoringSelectionUpdates)
  {
    v3 = a3;
    if (-[_UITabModel isEditing](self->_tabModel, "isEditing"))
    {
      v43 = v3;
      -[_UITabOutlineView dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "snapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v42 = v6;
      objc_msgSend(v6, "itemIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v45;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v45 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v11);
            -[_UITabOutlineView contentByIdentifier](self, "contentByIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "tab");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = -[_UITabModel isTabHidden:](self->_tabModel, "isTabHidden:", v15);
            if (v15 && !v16)
            {
              -[_UITabOutlineView dataSource](self, "dataSource");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "indexPathForItemIdentifier:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[_UITabOutlineView collectionView](self, "collectionView");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[_UITabOutlineView collectionView:shouldSelectItemAtIndexPath:](self, "collectionView:shouldSelectItemAtIndexPath:", v19, v18);

              v21 = objc_msgSend(v15, "_hasCustomizablePlacement");
              if (v20 || v21)
              {
                -[_UITabOutlineView collectionView](self, "collectionView");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "selectItemAtIndexPath:animated:scrollPosition:", v18, v43, 0);

              }
            }

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v9);
      }

      v23 = v41;
      v24 = v42;
    }
    else
    {
      -[_UITabModel selectedLeaf](self->_tabModel, "selectedLeaf");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabOutlineView dataSource](self, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "indexPathForItemIdentifier:", v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v23 == 0;
      if (v24)
        v28 = v23 == 0;
      else
        v28 = 0;
      if (v28)
      {
        do
        {
          v29 = v24;
          objc_msgSend(v24, "_parentGroup");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITabOutlineView dataSource](self, "dataSource");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "indexPathForItemIdentifier:", v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v23 == 0;
        }
        while (v24 && !v23);
      }
      -[_UITabOutlineView collectionView](self, "collectionView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v27)
      {
        objc_msgSend(v32, "indexPathsForSelectedItems");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v33 = v34;
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v49;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v49 != v37)
                objc_enumerationMutation(v33);
              v39 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v38);
              -[_UITabOutlineView collectionView](self, "collectionView");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "deselectItemAtIndexPath:animated:", v39, v3);

              ++v38;
            }
            while (v36 != v38);
            v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v36);
        }

      }
      else
      {
        objc_msgSend(v32, "selectItemAtIndexPath:animated:scrollPosition:", v23, v3, 0);
      }

    }
  }
}

- (void)_updateSnapshot:(id)a3 usingNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v7;
  objc_msgSend(v7, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItems:intoParentItem:", v16, v8);

        -[_UITabOutlineView _updateSnapshot:usingNode:](self, "_updateSnapshot:usingNode:", v6, v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v11);
  }

  objc_msgSend(v23, "actions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v23, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:intoParentItem:", v18, v8);

  }
  -[_UITabOutlineView _existingSectionSnapshotForTabIdentifier:](self, "_existingSectionSnapshotForTabIdentifier:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_15;
  if (-[_UITabOutlineView isEditing](self, "isEditing"))
    -[_UITabOutlineView editingCollapsedSectionIdentifiers](self, "editingCollapsedSectionIdentifiers");
  else
    -[_UITabOutlineView collapsedSectionIdentifiers](self, "collapsedSectionIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v8);

  if ((v21 & 1) == 0)
  {
LABEL_15:
    v28 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expandItems:", v22);

  }
}

- (void)_reloadDataSourceSnapshotAnimated:(BOOL)a3
{
  uint64_t v4;
  id v5;
  NSDiffableDataSourceSectionSnapshot *v6;
  _BOOL8 v7;
  void *v8;
  _UITabGroup *v9;
  _UITabModel *v10;
  _UITabModel *tabModel;
  uint64_t v12;
  _UITabOutlineParser *v13;
  void *v14;
  _UITabOutlineParser *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSDiffableDataSourceSectionSnapshot *v30;
  void *v31;
  void *v32;
  _UITabOutlineView *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSMutableDictionary *contentByIdentifier;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t ii;
  _QWORD *v73;
  _QWORD *v74;
  void *v75;
  NSMutableDictionary *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _UITabOutlineView *v83;
  NSDiffableDataSourceSectionSnapshot *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  NSDiffableDataSourceSectionSnapshot *v94;
  void *v95;
  void *v96;
  _UITabOutlineParser *v97;
  void *v98;
  _BOOL4 v99;
  id obj;
  id obja;
  void *v102;
  _UITabOutlineView *v103;
  _QWORD v104[4];
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  void *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  void *v139;
  _BYTE v140[128];
  void *v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  if (self->_ignoringContentUpdates)
    return;
  v99 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Root-%p"), self);
  v4 = objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  v95 = (void *)v4;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v4);
  v7 = -[_UITabModel isEditing](self->_tabModel, "isEditing");
  -[_UITabModel tabItems](self->_tabModel, "tabItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_displayedGroup;
  -[_UITabGroup _tabModel](v9, "_tabModel");
  v10 = (_UITabModel *)objc_claimAutoreleasedReturnValue();
  tabModel = self->_tabModel;

  if (v10 == tabModel)
  {
    -[_UITabGroup children](self->_displayedGroup, "children");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v13 = [_UITabOutlineParser alloc];
  -[_UITabOutlineView activeTransaction](self, "activeTransaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v8;
  v15 = -[_UITabOutlineParser initWithTabs:includeAllowsHidingItems:transaction:](v13, "initWithTabs:includeAllowsHidingItems:transaction:", v8, v7, v14);

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v97 = v15;
  -[_UITabOutlineParser rootItems](v15, "rootItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v130, v142, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v131 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * i), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDiffableDataSourceSectionSnapshot appendItems:](v6, "appendItems:", v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v130, v142, 16);
    }
    while (v18);
  }
  v94 = v6;
  v103 = self;

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[_UITabOutlineParser groupItems](v15, "groupItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        v28 = v5;
        if (*(_QWORD *)v127 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
        v30 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
        objc_msgSend(v29, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDiffableDataSourceSectionSnapshot appendItems:](v30, "appendItems:", v32);

        -[_UITabOutlineView _updateSnapshot:usingNode:](v103, "_updateSnapshot:usingNode:", v30, v29);
        objc_msgSend(obj, "addObject:", v31);
        v5 = v28;
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v31);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
    }
    while (v25);
  }

  v33 = v103;
  -[_UITabOutlineView _dataSourceUpdateGroupCompletionCreateIfNeeded:](v103, "_dataSourceUpdateGroupCompletionCreateIfNeeded:", 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "increment");
  -[_UITabOutlineView dataSource](v103, "dataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "snapshot");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "sectionIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "differenceFromArray:withOptions:", v36, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v36;
  v96 = v37;
  v98 = v35;
  v91 = v5;
  if (objc_msgSend(v36, "count"))
  {
    v38 = obj;
    if (objc_msgSend(v37, "hasChanges"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      objc_msgSend(v37, "removals");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v123;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v123 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * k);
            if (objc_msgSend(v45, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v45, "object");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v46);

            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
        }
        while (v42);
      }

      v90 = v39;
      objc_msgSend(v98, "deleteSectionsWithIdentifiers:", v39);
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      objc_msgSend(v96, "insertions");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v119;
        do
        {
          for (m = 0; m != v49; ++m)
          {
            if (*(_QWORD *)v119 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * m);
            objc_msgSend(v52, "object");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectAtIndex:", objc_msgSend(v52, "index") - 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v52, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
            {
              v136 = v53;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", v55, v54);

            }
            else
            {
              objc_msgSend(v98, "moveSectionWithIdentifier:afterSectionWithIdentifier:", v53, v54);
            }

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
        }
        while (v49);
      }

      v5 = v91;
      v33 = v103;
      v37 = v96;
      v35 = v98;
    }
  }
  else
  {
    objc_msgSend(v35, "appendSectionsWithIdentifiers:", obj);
    v38 = obj;
  }
  if (objc_msgSend(v37, "hasChanges"))
  {
    objc_msgSend(v102, "increment");
    -[_UITabOutlineView dataSource](v33, "dataSource");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke;
    v116[3] = &unk_1E16B1B28;
    v38 = obj;
    v117 = v102;
    objc_msgSend(v56, "applySnapshot:animatingDifferences:completion:", v35, v99, v116);

  }
  -[_UITabOutlineParser contentByIdentifier](v15, "contentByIdentifier");
  v57 = objc_claimAutoreleasedReturnValue();
  contentByIdentifier = v33->_contentByIdentifier;
  v33->_contentByIdentifier = (NSMutableDictionary *)v57;

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obja = v38;
  v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v113;
    do
    {
      for (n = 0; n != v60; ++n)
      {
        if (*(_QWORD *)v113 != v61)
          objc_enumerationMutation(obja);
        v63 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * n);
        objc_msgSend(v102, "increment");
        objc_msgSend(v5, "objectForKeyedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabOutlineView dataSource](v33, "dataSource");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke_2;
        v110[3] = &unk_1E16B1B28;
        v111 = v102;
        objc_msgSend(v65, "applySnapshot:toSection:animatingDifferences:completion:", v64, v63, v99, v110);

      }
      v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
    }
    while (v60);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[_UITabOutlineView collectionView](v33, "collectionView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "preparedCells");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
  if (!v68)
  {
    v70 = 0;
    v83 = v103;
    v84 = v94;
    v82 = v98;
    goto LABEL_70;
  }
  v69 = v68;
  v70 = 0;
  v71 = *(_QWORD *)v107;
  do
  {
    for (ii = 0; ii != v69; ++ii)
    {
      if (*(_QWORD *)v107 != v71)
        objc_enumerationMutation(v67);
      v73 = *(_QWORD **)(*((_QWORD *)&v106 + 1) + 8 * ii);
      if (v73)
        v73 = (_QWORD *)v73[110];
      v74 = v73;
      objc_msgSend(v74, "tab");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = v103->_contentByIdentifier;
      objc_msgSend(v75, "identifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v76, "objectForKeyedSubscript:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "tab");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75 && v79 && v75 != v79)
      {
        if (v70)
        {
          objc_msgSend(v79, "identifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addObject:", v80);
        }
        else
        {
          v81 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v79, "identifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "arrayWithObject:", v80);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
  }
  while (v69);

  v5 = v91;
  v82 = v98;
  if (!v70)
  {
    v83 = v103;
    v84 = v94;
    goto LABEL_72;
  }
  v83 = v103;
  v84 = v94;
  if (objc_msgSend(v70, "count"))
  {
    -[_UITabOutlineView dataSource](v103, "dataSource");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "snapshot");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v102, "increment");
    objc_msgSend(v86, "reconfigureItemsWithIdentifiers:", v70);
    -[_UITabOutlineView dataSource](v103, "dataSource");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke_3;
    v104[3] = &unk_1E16B1B28;
    v105 = v102;
    objc_msgSend(v87, "applySnapshot:animatingDifferences:completion:", v86, v99, v104);

    v67 = v105;
    v82 = v86;
LABEL_70:

  }
LABEL_72:
  objc_msgSend(v102, "complete");
  -[_UITabOutlineView activeTransaction](v83, "activeTransaction");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    -[_UITabOutlineView _tabsByIdentifier](v83, "_tabsByIdentifier");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "updateTabs:", v89);

  }
}

- (id)_existingSectionSnapshotForTabIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[_UITabOutlineView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  -[_UITabOutlineView dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshotForSection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {

LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (void)_reconfigureItemsInDataSourceForTabs:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
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
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v24 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabOutlineView dataSource](self, "dataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "indexPathForItemIdentifier:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[_UITabOutlineView willDisplayTab](self, "willDisplayTab");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v16)
          {
            self->_didUpdateWillDisplayTab = 1;
          }
          else
          {
            objc_msgSend(v6, "addObject:", v13);
            +[_UITabSidebarContent contentForTab:](_UITabSidebarContent, "contentForTab:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](self->_contentByIdentifier, "setObject:forKey:", v17, v13);
            -[_UITabOutlineView activeTransaction](self, "activeTransaction");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "replaceTab:forIdentifier:", v12, v13);

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    -[_UITabOutlineView dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "snapshot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "reconfigureItemsWithIdentifiers:", v6);
    -[_UITabOutlineView _dataSourceUpdateGroupCompletionCreateIfNeeded:](self, "_dataSourceUpdateGroupCompletionCreateIfNeeded:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "increment");
    -[_UITabOutlineView dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __67___UITabOutlineView__reconfigureItemsInDataSourceForTabs_animated___block_invoke;
    v25[3] = &unk_1E16B1B28;
    v26 = v21;
    v23 = v21;
    objc_msgSend(v22, "applySnapshot:animatingDifferences:completion:", v20, v24, v25);

  }
}

- (id)_dataSourceUpdateGroupCompletionCreateIfNeeded:(BOOL)a3
{
  _UIGroupCompletion *dataSourceUpdateGroupCompletion;
  BOOL v5;
  _UIGroupCompletion *v6;
  _UIGroupCompletion *v7;
  _UIGroupCompletion *v8;
  _QWORD v10[4];
  id v11;
  id location;

  dataSourceUpdateGroupCompletion = self->_dataSourceUpdateGroupCompletion;
  if (dataSourceUpdateGroupCompletion)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = objc_alloc_init(_UIGroupCompletion);
    v7 = self->_dataSourceUpdateGroupCompletion;
    self->_dataSourceUpdateGroupCompletion = v6;

    objc_initWeak(&location, self);
    v8 = self->_dataSourceUpdateGroupCompletion;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68___UITabOutlineView__dataSourceUpdateGroupCompletionCreateIfNeeded___block_invoke;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    -[_UIGroupCompletion addNonIncrementingCompletion:](v8, "addNonIncrementingCompletion:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    dataSourceUpdateGroupCompletion = self->_dataSourceUpdateGroupCompletion;
  }
  return dataSourceUpdateGroupCompletion;
}

- (id)_tabForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UITabOutlineView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_contentByIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tab");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_actionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UITabOutlineView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_contentByIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isHeaderIndexPath:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "section") >= 1 && objc_msgSend(v3, "item") == 0;

  return v4;
}

- (BOOL)_canDragTab:(id)a3
{
  id v4;
  _BOOL4 v5;
  _UITabModel *tabModel;
  _UITabModel *v7;
  _UITabModel *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "_isAction") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else if ((objc_msgSend(v4, "_canBeReordered") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (self)
      tabModel = self->_tabModel;
    else
      tabModel = 0;
    v7 = tabModel;
    if (-[_UITabModel isEditing](v7, "isEditing") && objc_msgSend(v4, "_hasCustomizablePlacement"))
    {
      if (self)
        v8 = self->_tabModel;
      else
        v8 = 0;
      v5 = !-[_UITabModel isTabHidden:](v8, "isTabHidden:", v4);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (void)headerContentConfigurationDidChange:(id *)a1
{
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "_headerContentConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((a2 == 0) != (v6 != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[67], "supplementaryViewForElementKind:atIndexPath:", CFSTR("UICollectionElementKindSectionHeader"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContentConfiguration:", v6);

    }
    else
    {
      objc_msgSend(a1[68], "snapshot");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[68], "applySnapshot:animatingDifferences:", v4, 1);
    }

  }
}

- (void)footerContentConfigurationDidChange:(id *)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "_footerContentConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((a2 == 0) != (v7 != 0))
    {
      v4 = objc_msgSend(a1[67], "numberOfSections");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v4 - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[67], "supplementaryViewForElementKind:atIndexPath:", CFSTR("UICollectionElementKindSectionFooter"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentConfiguration:", v7);

    }
    else
    {
      objc_msgSend(a1[68], "snapshot");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[68], "applySnapshot:animatingDifferences:", v5, 1);
    }

  }
}

- (void)updateBottomBarView
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _UITabSidebarBottomBarWrapperView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "_bottomToolbar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setItemsDidChangeBlock:", 0);

    v3 = *(void **)(a1 + 616);
    if (v3)
    {
      objc_msgSend(v3, "removeFromSuperview");
      v4 = *(void **)(a1 + 616);
      *(_QWORD *)(a1 + 616) = 0;

      objc_msgSend((id)a1, "setNeedsLayout");
    }
    v5 = (id *)*(id *)(a1 + 456);
    -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak(&location, (id)a1);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __40___UITabOutlineView_updateBottomBarView__block_invoke;
      v18 = &unk_1E16B3F40;
      objc_copyWeak(&v19, &location);
      v7 = _Block_copy(&v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
        objc_msgSend(*(id *)(a1 + 520), "_groupName", v15, v16, v17, v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
        {
          objc_msgSend((id)a1, "_defaultBarBackdropGroupName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "_setBackdropViewLayerGroupName:", v10);
        if (!v9)

        objc_msgSend(v8, "_setItemsDidChangeBlock:", v7);
        *(_BYTE *)(a1 + 420) = 1;

      }
      else
      {
        *(_BYTE *)(a1 + 420) = 0;
      }
      v11 = -[_UITabSidebarBottomBarWrapperView initWithView:intrinsicContentSizeInvalidationHandler:]([_UITabSidebarBottomBarWrapperView alloc], "initWithView:intrinsicContentSizeInvalidationHandler:", v6, v7);
      v12 = *(void **)(a1 + 616);
      *(_QWORD *)(a1 + 616) = v11;

      objc_msgSend((id)a1, "backgroundView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", *(_QWORD *)(a1 + 616));

      objc_msgSend((id)a1, "setNeedsLayout");
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }

  }
}

- (id)_headerContentConfiguration
{
  if (self)
    self = (_UITabOutlineView *)self->_sidebar;
  return -[UITabBarControllerSidebar _actualHeaderContentConfiguration]((id *)&self->super.super.super.isa);
}

- (id)_footerContentConfiguration
{
  if (self)
    self = (_UITabOutlineView *)self->_sidebar;
  return -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)&self->super.super.super.isa);
}

- (id)_bottomToolbar
{
  void *v2;

  if (self->_bottomBarIsToolbar)
  {
    -[_UITabSidebarBottomBarWrapperView view](self->_bottomBarView, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)scrollToTarget:(uint64_t)a3 animated:
{
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_10;
  v18 = v5;
  if (v5)
    v6 = (void *)v5[2];
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(a1, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v9 = (void *)v18[2];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_8;
  }
  if (!v18 || !*((_BYTE *)v18 + 8))
  {
LABEL_16:
    objc_msgSend(a1, "_footerContentConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v18;
    if (!v15)
      goto LABEL_10;
    objc_msgSend(a1, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "numberOfSections") - 1;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 4;
    goto LABEL_8;
  }
  objc_msgSend(a1, "_headerContentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v5 = v18;
    if (*((_BYTE *)v18 + 8))
      goto LABEL_10;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
LABEL_8:
  v5 = v18;
  if (v12)
  {
    objc_msgSend(a1[67], "scrollToItemAtIndexPath:atScrollPosition:animated:", v12, v13, a3);

    v5 = v18;
  }
LABEL_10:

}

- (void)reconfigureItemForTab:(void *)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_reconfigureItemsInDataSourceForTabs:animated:", v3, 1);

  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[_UITabOutlineView contentByIdentifier](self, "contentByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tab");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v4;
    if (v9)
    {
      do
      {
        v10 = v9;
        -[_UITabOutlineView dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "indexPathForItemIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UITabOutlineView collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellForItemAtIndexPath:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "_parentGroup");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v9 && !v15);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_tabModelDidReload:(id)a3
{
  -[_UITabOutlineView _reloadDataSourceSnapshotAnimated:](self, "_reloadDataSourceSnapshotAnimated:", 1);
  -[_UITabOutlineView _updateSelectedItemAnimated:](self, "_updateSelectedItemAnimated:", 1);
}

- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableSet *updatedTabsDuringApplySnapshot;
  NSMutableSet *v10;
  NSMutableSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[_UITabOutlineView _dataSourceUpdateGroupCompletionCreateIfNeeded:](self, "_dataSourceUpdateGroupCompletionCreateIfNeeded:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    updatedTabsDuringApplySnapshot = self->_updatedTabsDuringApplySnapshot;
    if (!updatedTabsDuringApplySnapshot)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_updatedTabsDuringApplySnapshot;
      self->_updatedTabsDuringApplySnapshot = v10;

      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __51___UITabOutlineView__tabModel_tabContentDidChange___block_invoke;
      v16 = &unk_1E16B3F40;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v8, "addNonIncrementingCompletion:", &v13);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      updatedTabsDuringApplySnapshot = self->_updatedTabsDuringApplySnapshot;
    }
    -[NSMutableSet addObject:](updatedTabsDuringApplySnapshot, "addObject:", v7, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView _reconfigureItemsInDataSourceForTabs:animated:](self, "_reconfigureItemsInDataSourceForTabs:animated:", v12, 1);

  }
}

- (void)_tabModel:(id)a3 didReplaceOldItem:(id)a4 newItem:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *contentByIdentifier;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "_isGroup") & 1) == 0 && !objc_msgSend(v8, "_isGroup"))
  {
    contentByIdentifier = self->_contentByIdentifier;
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](contentByIdentifier, "removeObjectForKey:", v10);

    v11 = self->_contentByIdentifier;
    +[_UITabSidebarContent contentForTab:](_UITabSidebarContent, "contentForTab:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v13);

    -[_UITabOutlineView activeTransaction](self, "activeTransaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replaceTab:forIdentifier:", v8, v15);

    -[_UITabOutlineView dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITabOutlineView _dataSourceUpdateGroupCompletionCreateIfNeeded:](self, "_dataSourceUpdateGroupCompletionCreateIfNeeded:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "increment");
    objc_msgSend(v7, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v20;
    if (v21 == v22)
    {

    }
    else
    {
      v23 = v22;
      if (!v21 || !v22)
      {

LABEL_12:
        objc_msgSend(v7, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v17, "indexOfItemIdentifier:", v29);

        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((objc_msgSend(v8, "isHidden") & 1) == 0)
          {
            objc_msgSend(v18, "complete");
            -[_UITabOutlineView _reloadDataSourceSnapshotAnimated:](self, "_reloadDataSourceSnapshotAnimated:", 1);
          }
          goto LABEL_17;
        }
        objc_msgSend(v8, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v32, v33);

        objc_msgSend(v7, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deleteItemsWithIdentifiers:", v35);

        -[_UITabOutlineView dataSource](self, "dataSource");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __57___UITabOutlineView__tabModel_didReplaceOldItem_newItem___block_invoke_2;
        v37[3] = &unk_1E16B1B28;
        v38 = v18;
        objc_msgSend(v36, "applySnapshot:animatingDifferences:completion:", v17, 1, v37);

        v28 = v38;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      v24 = objc_msgSend(v21, "isEqual:", v22);

      if ((v24 & 1) == 0)
        goto LABEL_12;
    }
    objc_msgSend(v8, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reconfigureItemsWithIdentifiers:", v26);

    -[_UITabOutlineView dataSource](self, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __57___UITabOutlineView__tabModel_didReplaceOldItem_newItem___block_invoke;
    v39[3] = &unk_1E16B1B28;
    v40 = v18;
    objc_msgSend(v27, "applySnapshot:animatingDifferences:completion:", v17, 1, v39);

    v28 = v40;
    goto LABEL_16;
  }
  -[_UITabOutlineView _reloadDataSourceSnapshotAnimated:](self, "_reloadDataSourceSnapshotAnimated:", 1);
LABEL_18:

}

- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4
{
  _UITabModel *tabModel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    if (!self->_ignoringSelectionUpdates)
    {
      -[_UITabOutlineView dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForItemIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITabOutlineView collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_UITabOutlineView collectionView:shouldSelectItemAtIndexPath:](self, "collectionView:shouldSelectItemAtIndexPath:", v9, v8);

      v11 = -[_UITabModel isTabHidden:](self->_tabModel, "isTabHidden:", v15);
      -[_UITabOutlineView collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11 || !v10)
        objc_msgSend(v12, "deselectItemAtIndexPath:animated:", v8, 1);
      else
        objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v8, 1, 0);

      -[_UITabOutlineView activeTransaction](self, "activeTransaction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateTab:toHidden:", v15, v11);

    }
  }
  else
  {
    -[_UITabOutlineView _reloadDataSourceSnapshotAnimated:](self, "_reloadDataSourceSnapshotAnimated:", 1);
    -[_UITabOutlineView _updateSelectedItemAnimated:](self, "_updateSelectedItemAnimated:", 1);
  }

}

- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5
{
  void *v6;
  _BOOL8 v7;
  void *v8;

  -[UIView superview](self, "superview", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  else
    v7 = 0;

  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    self->_needsScrollToSelectedItemWhenBecomingVisible = 1;
  -[_UITabOutlineView _updateSelectedItemAnimated:](self, "_updateSelectedItemAnimated:", v7);
}

- (BOOL)_showSidebarBarButtonItem
{
  if (self->_sidebarButtonAction && !self->_suppressesSidebarButton)
    return !-[_UITabModel isEditing](self->_tabModel, "isEditing");
  else
    return 0;
}

- (void)_updateEditBarButtonItem
{
  _UITabOutlineView *v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _UITabModel *tabModel;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  UIBarButtonItem *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  BOOL v19;
  id location;

  v2 = self;
  if (self)
    self = (_UITabOutlineView *)self->_tabModel;
  v3 = -[_UITabOutlineView isEditing](self, "isEditing");
  v4 = -[_UITabOutlineView _showSidebarBarButtonItem](v2, "_showSidebarBarButtonItem") ^ 1;
  -[_UITabOutlineView sidebarBarButtonItem](v2, "sidebarBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  v6 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    objc_initWeak(&location, v2);
    -[_UITabOutlineView resetBarButtonItem](v2, "resetBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    if (v2)
      tabModel = v2->_tabModel;
    else
      tabModel = 0;
    if (!-[_UITabModel isEditable](tabModel, "isEditable"))
    {
      -[_UITabOutlineView navigationItem](v2, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRightBarButtonItem:", 0);

      goto LABEL_11;
    }
    objc_initWeak(&location, v2);
    -[_UITabOutlineView sidebarBarButtonItem](v2, "sidebarBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 2;
  }
  -[_UITabOutlineView navigationItem](v2, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v7);

  v11 = [UIBarButtonItem alloc];
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __45___UITabOutlineView__updateEditBarButtonItem__block_invoke;
  v17[3] = &unk_1E16C91F8;
  objc_copyWeak(&v18, &location);
  v19 = v3;
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:](v11, "initWithBarButtonSystemItem:primaryAction:", v8, v12);
  -[_UITabOutlineView navigationItem](v2, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_11:
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __45___UITabOutlineView__updateEditBarButtonItem__block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v16[4] = v2;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
}

- (void)_performWithoutAffectingSelection:(id)a3
{
  self->_ignoringSelectionUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringSelectionUpdates = 0;
}

- (void)_performWithoutAffectingContent:(id)a3
{
  self->_ignoringContentUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringContentUpdates = 0;
}

- (void)_performWithWillDisplayTab:(id)a3 block:(id)a4
{
  UITab **p_willDisplayTab;
  void (**v7)(id, id);
  UITab *v8;
  id v9;

  p_willDisplayTab = &self->_willDisplayTab;
  objc_storeStrong((id *)&self->_willDisplayTab, a3);
  v9 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v9);

  v8 = *p_willDisplayTab;
  *p_willDisplayTab = 0;

}

- (id)activeTransaction
{
  uint64_t v2;

  if (self)
  {
    v2 = *((_QWORD *)self + 57);
    if (v2)
      return *(id *)(v2 + 96);
    else
      return 0;
  }
  return self;
}

- (void)tabModelEditingStateDidChange
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 440), "isEditing") & 1) != 0)
    {
      objc_msgSend((id)a1, "_activateNewSidebarTransaction");
      v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v3 = *(void **)(a1 + 568);
      *(_QWORD *)(a1 + 568) = v2;

    }
    else
    {
      objc_msgSend((id)a1, "activeTransaction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_tabModelEditingStateDidChange, a1, CFSTR("_UITabOutlineView.m"), 1471, CFSTR("UIKit internal error: Tab outline view should not be exiting edit mode without an active transaction. Model: %@; Outline view: %@"),
          *(_QWORD *)(a1 + 440),
          a1);

      }
      objc_msgSend((id)a1, "_commitCurrentSidebarTransaction");
      v5 = *(void **)(a1 + 568);
      *(_QWORD *)(a1 + 568) = 0;

    }
  }
}

- (uint64_t)setAdditionalEditingInsets:(double)a3
{
  void *v5;

  if (result)
  {
    v5 = (void *)result;
    if (*(double *)(result + 632) != a3
      || *(double *)(result + 624) != a2
      || *(double *)(result + 648) != a5
      || *(double *)(result + 640) != a4)
    {
      *(double *)(result + 624) = a2;
      *(double *)(result + 632) = a3;
      *(double *)(result + 640) = a4;
      *(double *)(result + 648) = a5;
      objc_msgSend((id)result, "_updateEditingInsets");
      result = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
      if ((_DWORD)result)
        return objc_msgSend(v5, "layoutIfNeeded");
    }
  }
  return result;
}

- (void)_updateEditingInsets
{
  double left;
  double top;
  double bottom;
  double right;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[UIView _setSafeAreaInsetsFrozen:](self, "_setSafeAreaInsetsFrozen:", 0);
  if (self)
  {
    top = self->_additionalEditingInsets.top;
    left = self->_additionalEditingInsets.left;
    bottom = self->_additionalEditingInsets.bottom;
    right = self->_additionalEditingInsets.right;
  }
  else
  {
    left = 0.0;
    bottom = 0.0;
    right = 0.0;
    top = 0.0;
  }
  -[UIView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (left != 0.0 || top != 0.0 || right != 0.0)
    {

LABEL_10:
      -[UIView superview](self, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeAreaInsets");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[UIView _setSafeAreaInsetsFrozen:](self, "_setSafeAreaInsetsFrozen:", 1);
      -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)self, 1, top + v10, left + v12, bottom + v14, right + v16);
      goto LABEL_11;
    }

    if (bottom != 0.0)
      goto LABEL_10;
  }
LABEL_11:
  self->_isNavigationBarSafeAreaDirty = 1;
}

- (void)_activateNewSidebarTransaction
{
  void *v4;
  _UITabSidebarTransaction *v5;
  _UITabSidebarTransaction *v6;
  UITabBarControllerSidebar *sidebar;
  void *v8;
  void *v9;
  _UITabModel *tabModel;
  id v11;

  -[_UITabOutlineView activeTransaction](self, "activeTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self)
      tabModel = self->_tabModel;
    else
      tabModel = 0;
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabOutlineView.m"), 1548, CFSTR("UIKit internal error: Attempting to create a new transaction without while there is already an active transaction. Model: %@; Outline view: %@"),
      tabModel,
      self);

  }
  -[_UITabOutlineView _tabsByIdentifier](self, "_tabsByIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [_UITabSidebarTransaction alloc];
  if (self)
  {
    v6 = -[_UITabSidebarTransaction initWithTabs:sidebar:](v5, "initWithTabs:sidebar:", v11, self->_sidebar);
    sidebar = self->_sidebar;
  }
  else
  {
    v6 = -[_UITabSidebarTransaction initWithTabs:sidebar:](v5, "initWithTabs:sidebar:", v11, 0);
    sidebar = 0;
  }
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)sidebar, v6);

}

- (void)_commitCurrentSidebarTransaction
{
  void *v3;
  UITabBarControllerSidebar *sidebar;
  _QWORD v5[5];

  -[_UITabOutlineView activeTransaction](self, "activeTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53___UITabOutlineView__commitCurrentSidebarTransaction__block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    -[_UITabOutlineView _performWithoutAffectingContent:](self, "_performWithoutAffectingContent:", v5);
    if (self)
      sidebar = self->_sidebar;
    else
      sidebar = 0;
    -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)sidebar, 0);
  }
}

- (id)_tabsByIdentifier
{
  void *v3;
  NSMutableDictionary *contentByIdentifier;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_contentByIdentifier, "count"));
  contentByIdentifier = self->_contentByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___UITabOutlineView__tabsByIdentifier__block_invoke;
  v7[3] = &unk_1E16ECAC8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contentByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)_updateScrollEdgeAppearance
{
  void *v3;
  double MaxY;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double MinY;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[_UITabOutlineView collectionView](self, "collectionView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v14);

  objc_msgSend(v13, "contentOffset");
  v6 = fmax(fmin((-v5 - MaxY) / (MaxY + -4.0 - MaxY), 1.0), 0.0);
  -[_UITabOutlineView navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setManualScrollEdgeAppearanceProgress:", v6);

  -[_UITabOutlineView _bottomToolbar](self, "_bottomToolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView frame](self->_bottomBarView, "frame");
    MinY = CGRectGetMinY(v15);
    objc_msgSend(v13, "contentSize");
    v11 = v10;
    objc_msgSend(v13, "contentOffset");
    objc_msgSend(v8, "_setBackgroundTransitionProgress:", fmax(fmin((v11 - v12 - (MinY + 4.0)) / (MinY - (MinY + 4.0)), 1.0), 0.0));
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  _UITabModel *tabModel;
  int v10;
  char v11;

  v5 = a4;
  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UITabOutlineView _isHeaderIndexPath:](self, "_isHeaderIndexPath:", v5);

  if (v7)
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "_isElement");
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    if (objc_msgSend(v6, "allowsHiding"))
      v10 = objc_msgSend(v6, "_isGroup") ^ 1;
    else
      LOBYTE(v10) = 0;
    v11 = v8 & v10;
  }
  else if (v8)
  {
    v11 = -[_UITabModel shouldSelectTab:](self->_tabModel, "shouldSelectTab:", v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_isElement") && !self->_ignoresSelectionChangeFromFocusUpdate)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61___UITabOutlineView_collectionView_didSelectItemAtIndexPath___block_invoke;
    v7[3] = &unk_1E16B1C28;
    v7[4] = self;
    v8 = v6;
    v9 = a2;
    -[_UITabOutlineView _performWithoutAffectingSelection:](self, "_performWithoutAffectingSelection:", v7);

  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  _UITabModel *tabModel;
  char v7;

  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing") && objc_msgSend(v5, "_isElement"))
    v7 = objc_msgSend(v5, "allowsHiding");
  else
    v7 = 0;

  return v7;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  _UITabModel *tabModel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v11 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    -[_UITabOutlineView activeTransaction](self, "activeTransaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabOutlineView.m"), 1663, CFSTR("Cannot edit an item without an active transaction"));

    }
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63___UITabOutlineView_collectionView_didDeselectItemAtIndexPath___block_invoke;
      v12[3] = &unk_1E16B1B50;
      v12[4] = self;
      v13 = v8;
      -[_UITabOutlineView _performWithoutAffectingSelection:](self, "_performWithoutAffectingSelection:", v12);

    }
  }

}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  _UITabModel *tabModel;
  BOOL v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    v7 = 0;
  }
  else
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_isAction") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[_UITabOutlineView _actionForIndexPath:](self, "_actionForIndexPath:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9 != 0;

    }
  }

  return v7;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[_UITabOutlineView _actionForIndexPath:](self, "_actionForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "performWithSender:target:", 0, 0);
  }
  else
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isAction"))
      objc_msgSend(v7, "_performAction");

  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  if (-[_UITabOutlineView isEditing](self, "isEditing"))
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "allowsHiding") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "_isGroup");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;

  v11 = a3;
  objc_msgSend(a4, "nextFocusedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_prefersCollectionViewFocused = v7 != 0;
  v10 = 0;
  if (!-[_UITabOutlineView isEditing](self, "isEditing"))
  {
    if (v7)
    {
      objc_msgSend(v11, "indexPathsForSelectedItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if ((v9 & 1) != 0)
        v10 = 1;
    }
  }
  self->_ignoresSelectionChangeFromFocusUpdate = v10;

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabOutlineView;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  self->_ignoresSelectionChangeFromFocusUpdate = 0;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_prefersCollectionViewFocused)
  {
    -[_UITabOutlineView collectionView](self, "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITabOutlineView;
    -[UIView preferredFocusEnvironments](&v5, sel_preferredFocusEnvironments);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v6;
  _UITabModel *tabModel;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    v8 = 0;
  }
  else
  {
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isSpringLoaded"))
    {
      if (objc_msgSend(v9, "_isGroup"))
      {
        objc_msgSend(v9, "identifier");
        v10 = objc_claimAutoreleasedReturnValue();
        -[_UITabOutlineView _existingSectionSnapshotForTabIdentifier:](self, "_existingSectionSnapshotForTabIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v11, "isExpanded:", v12);

        v8 = v10 ^ 1;
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)hasActiveDrag
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(result, "collectionView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "hasActiveDrag");

    return (void *)v2;
  }
  return result;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  UIDragItem *v11;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a5;
  v8 = objc_alloc_init(v6);
  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UITabOutlineView _canDragTab:](self, "_canDragTab:", v9))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v11 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v10);
    -[UIDragItem setLocalObject:](v11, "setLocalObject:", v9);
    objc_msgSend(v8, "addObject:", v11);

  }
  return v8;
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_storeStrong((id *)&self->_activeDragSession, a4);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  UIDragSession *activeDragSession;

  activeDragSession = self->_activeDragSession;
  self->_activeDragSession = 0;

}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  _UITabModel *tabModel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    objc_msgSend(v12, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v7, "localObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v7, "localObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "previewProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v7, "setPreviewProvider:", 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_UITabOutlineView _tabBarController](self, "_tabBarController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _tabDropSessionDidUpdate:withDestinationTab:](v6, v5, 0);

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a6;
  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UITabOutlineView _canMoveTab:toDestinationIndexPath:](self, "_canMoveTab:toDestinationIndexPath:", v10, v9))
    v11 = v9;
  else
    v11 = v8;
  v12 = v11;

  return v12;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  _UITabModel *tabModel;
  _BOOL4 v10;
  int v11;
  UIDragSession *v12;
  UIDragSession *v13;
  UIDragSession *activeDragSession;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  UICollectionViewDropProposal *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;

  v7 = a4;
  v8 = a5;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  v10 = -[_UITabModel isEditing](tabModel, "isEditing");
  v11 = v10;
  if (!v8)
  {
    if (!v10)
    {
      v16 = 0;
      goto LABEL_20;
    }
LABEL_13:
    objc_msgSend(v7, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count") == 1)
    {
      objc_msgSend(v16, "localObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_18:

LABEL_23:
        v19 = -[UICollectionViewDropProposal initWithDropOperation:]([UICollectionViewDropProposal alloc], "initWithDropOperation:", 0);
        goto LABEL_24;
      }
      objc_msgSend(v16, "localObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_UITabOutlineView _canMoveTab:toDestinationIndexPath:](self, "_canMoveTab:toDestinationIndexPath:", v21, v8))
      {
        v19 = -[UICollectionViewDropProposal initWithDropOperation:dropLocation:]([UICollectionViewDropProposal alloc], "initWithDropOperation:dropLocation:", 3, 0);
        goto LABEL_22;
      }
    }

    goto LABEL_18;
  }
  objc_msgSend(v7, "localDragSession");
  v12 = (UIDragSession *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self)
    activeDragSession = self->_activeDragSession;
  else
    activeDragSession = 0;

  if (v13 == activeDragSession)
    v15 = 1;
  else
    v15 = v11;
  if (v15 == 1)
    goto LABEL_13;
  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  -[_UITabOutlineView _tabBarController](self, "_tabBarController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UITabBarController _tab:operationForAcceptingItemsFromDropSession:](v17, v16, v7);

  v19 = -[UICollectionViewDropProposal initWithDropOperation:dropLocation:]([UICollectionViewDropProposal alloc], "initWithDropOperation:dropLocation:", v18, 1);
LABEL_21:
  -[_UITabOutlineView _tabBarController](self, "_tabBarController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _tabDropSessionDidUpdate:withDestinationTab:](v21, v7, v16);
LABEL_22:

  if (!v19)
    goto LABEL_23;
LABEL_24:

  return v19;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  _UITabModel *tabModel;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (!-[_UITabModel isEditing](tabModel, "isEditing"))
  {
    objc_msgSend(v5, "proposal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dropLocation");

    if (v8)
    {
      objc_msgSend(v5, "destinationIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabOutlineView collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "locationInView:", v12);
        v15 = v14;
        v17 = v16;

        -[_UITabOutlineView _tabBarController](self, "_tabBarController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "session");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarController _tab:acceptItemsFromDropSession:](v18, v10, v19);

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v5, "session", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "items");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v28 != v24)
                objc_enumerationMutation(v21);
              v26 = (id)objc_msgSend(v5, "dropItem:intoItemAtIndexPath:rect:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v9, v15, v17, 0.0, 0.0);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v23);
        }

      }
    }
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  _UITabModel *tabModel;
  void *v8;
  void *v9;
  UITabBarControllerSidebar *sidebar;
  void *v11;

  v6 = a4;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  if (-[_UITabModel isEditing](tabModel, "isEditing") || objc_msgSend(v6, "count") != 1)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (self)
        sidebar = self->_sidebar;
      else
        sidebar = 0;
      -[UITabBarControllerSidebar _contextMenuConfigurationForTab:]((uint64_t)sidebar, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setTab:", v9);
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "_tab");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UITabOutlineView dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_tab");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItemIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __94___UITabOutlineView_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v17[3] = &unk_1E16B47A8;
      v17[4] = self;
      v18 = v15;
      v19 = v8;
      v16 = v15;
      objc_msgSend(v10, "addAnimations:", v17);

    }
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id *v15;
  id *v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = (id *)v7;
  v10 = v9;
  if (v9)
  {
    v11 = v9[110];
    v12 = v11;
    if (v11)
    {
      self->_didUpdateWillDisplayTab = 0;
      objc_msgSend(v11, "_tab");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __71___UITabOutlineView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
      v14[3] = &unk_1E16ECAF0;
      v14[4] = self;
      v15 = v10;
      v16 = v15;
      v17 = v8;
      -[_UITabOutlineView _performWithWillDisplayTab:block:](self, "_performWithWillDisplayTab:block:", v13, v14);

    }
  }
  else
  {
    v12 = 0;
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  UITabBarControllerSidebar *sidebar;
  UITabBarControllerSidebar *v8;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = *((id *)a4 + 110);
    if (v6)
    {
      v10 = v6;
      if (self)
        sidebar = self->_sidebar;
      else
        sidebar = 0;
      v8 = sidebar;
      objc_msgSend(v10, "_tab");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarControllerSidebar _didEndDisplayingTab:]((uint64_t)v8, v9);

      v6 = v10;
    }
  }
  else
  {
    v6 = 0;
  }

}

- (BOOL)_canMoveTab:(id)a3 toDestinationIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  if (!a4)
    return 0;
  v6 = a4;
  v7 = a3;
  -[_UITabOutlineView _tabForIndexPath:](self, "_tabForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UITabOutlineView _isHeaderIndexPath:](self, "_isHeaderIndexPath:", v6);

  v10 = !v9;
  v11 = objc_msgSend(v8, "_canBeReordered");
  objc_msgSend(v8, "_parentGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_parentGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "_isAction");
  -[_UITabOutlineView dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForItemIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (objc_msgSend(v16, "section") != 0) & ~(_BYTE)v7;
  if (v12 != v13)
    v17 = 0;
  v18 = v17 & v11 & v10;

  return v18;
}

- (_UIDuoShadowView)shadowView
{
  return self->_shadowView;
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (_UIVisualEffectBackdropView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableDictionary)contentByIdentifier
{
  return self->_contentByIdentifier;
}

- (NSMutableSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (NSMutableSet)editingCollapsedSectionIdentifiers
{
  return self->_editingCollapsedSectionIdentifiers;
}

- (_UIGroupCompletion)dataSourceUpdateGroupCompletion
{
  return self->_dataSourceUpdateGroupCompletion;
}

- (NSMutableSet)updatedTabsDuringApplySnapshot
{
  return self->_updatedTabsDuringApplySnapshot;
}

- (UITab)willDisplayTab
{
  return self->_willDisplayTab;
}

- (BOOL)didUpdateWillDisplayTab
{
  return self->_didUpdateWillDisplayTab;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UIBarButtonItem)sidebarBarButtonItem
{
  return self->_sidebarBarButtonItem;
}

- (UIBarButtonItem)resetBarButtonItem
{
  return self->_resetBarButtonItem;
}

- (_UITabSidebarBottomBarWrapperView)bottomBarView
{
  return self->_bottomBarView;
}

- (void)setBottomBarView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_resetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarBarButtonItem, 0);
  objc_storeStrong((id *)&self->_willDisplayTab, 0);
  objc_storeStrong((id *)&self->_updatedTabsDuringApplySnapshot, 0);
  objc_storeStrong((id *)&self->_dataSourceUpdateGroupCompletion, 0);
  objc_storeStrong((id *)&self->_editingCollapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_activeDragSession, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_sidebarButtonAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_displayedGroup, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
