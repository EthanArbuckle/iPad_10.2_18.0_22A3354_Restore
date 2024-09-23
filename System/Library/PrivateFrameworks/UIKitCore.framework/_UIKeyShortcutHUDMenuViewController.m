@implementation _UIKeyShortcutHUDMenuViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDMenuViewController;
  -[UIViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[_UIKeyShortcutHUDMenuViewController _setupSubviews](self, "_setupSubviews");
  -[_UIKeyShortcutHUDMenuViewController _configureCollectionView](self, "_configureCollectionView");
}

- (void)_setupSubviews
{
  UIKeyShortcutHUDMetrics **p_metrics;
  id WeakRetained;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  UIVisualEffectView *v35;
  id v36;
  void *v37;
  UIVisualEffectView *v38;
  UIVisualEffectView *visualEffectView;
  void *v40;
  UICollectionView *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  UICollectionView *v52;
  UICollectionView *collectionView;
  id v54;
  double v55;
  double v56;
  id v57;
  double v58;
  void *v59;
  id v60;

  p_metrics = &self->_metrics;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(WeakRetained, "menuPlatterCornerRadius");
  v6 = v5;
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v6);

  v9 = *MEMORY[0x1E0CD2A68];
  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v9);

  v12 = objc_loadWeakRetained((id *)p_metrics);
  v13 = objc_msgSend(v12, "menuPanelCornerMask");
  -[UIViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaskedCorners:", v13);

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMasksToBounds:", 1);

  v18 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v18, "menuPanelStrokeWidth");
  v20 = v19;
  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderWidth:", v20);

  v23 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v23, "platterStrokeColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resolvedColorWithTraitCollection:", v25);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");
  -[UIViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBorderColor:", v27);

  v30 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v30, "platterZPosition");
  v32 = v31;
  -[UIViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setZPosition:", v32);

  v35 = [UIVisualEffectView alloc];
  v36 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v36, "platterVisualEffect");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[UIVisualEffectView initWithEffect:](v35, "initWithEffect:", v37);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v38;

  -[UIViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");

  -[UIView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18);
  v41 = [UICollectionView alloc];
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[_UIKeyShortcutHUDMenuViewController _standardModeCollectionViewLayout](self, "_standardModeCollectionViewLayout");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[UICollectionView initWithFrame:collectionViewLayout:](v41, "initWithFrame:collectionViewLayout:", v51, v44, v46, v48, v50);
  collectionView = self->_collectionView;
  self->_collectionView = v52;

  v54 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v54, "menuHorizontalContentInset");
  v56 = v55;
  v57 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v57, "menuHorizontalContentInset");
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, v56, 0.0, v58);

  -[UIView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", self->_visualEffectView);

  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", self->_collectionView);

}

- (void)_configureCollectionView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UICollectionViewDiffableDataSource *v11;
  UICollectionView *collectionView;
  id v13;
  UICollectionViewDiffableDataSource *v14;
  UICollectionViewDiffableDataSource *dataSource;
  id v16;
  id v17;
  id WeakRetained;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location[2];

  objc_initWeak(location, self);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke;
  v28[3] = &unk_1E16C7448;
  objc_copyWeak(&v29, location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_2;
  v26[3] = &unk_1E16C7470;
  objc_copyWeak(&v27, location);
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v6, v7, v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_3;
  v24[3] = &unk_1E16C7498;
  objc_copyWeak(&v25, location);
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v9, CFSTR("UICollectionElementKindSectionHeader"), v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_4;
  v22[3] = &unk_1E16C74C0;
  v13 = v5;
  v23 = v13;
  v14 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v11, "initWithCollectionView:cellProvider:", collectionView, v22);
  dataSource = self->_dataSource;
  self->_dataSource = v14;

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_5;
  v19[3] = &unk_1E16C74E8;
  v16 = v10;
  v20 = v16;
  v17 = v8;
  v21 = v17;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", v19);
  objc_storeStrong((id *)&self->_cellRegistration, v5);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, v8);
  objc_storeStrong((id *)&self->_sectionHeaderRegistration, v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  -[_UIKeyShortcutHUDMenuViewController _displayMenu:animatingDifferences:](self, "_displayMenu:animatingDifferences:", WeakRetained, 0);

  self->_currentScrolledToCategoryIndex = 0;
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

- (id)_standardModeCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIKeyShortcutHUDMetrics **p_metrics;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  UICollectionViewCompositionalLayout *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "absoluteDimension:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v3, v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799B8, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v52, v5, v6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  p_metrics = &self->_metrics;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(WeakRetained, "minShortcutCellWidth");
  objc_msgSend(off_1E1679980, "estimatedDimension:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0 / (double)(unint64_t)objc_msgSend(v10, "numCellsPerColumn"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v9, v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679998, "itemWithLayoutSize:supplementaryItems:", v50, v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v13, "minShortcutCellWidth");
  objc_msgSend(off_1E1679980, "estimatedDimension:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v15, "menuCellHeight");
  v17 = v16;
  v18 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(off_1E1679980, "absoluteDimension:", v17 * (double)(unint64_t)objc_msgSend(v18, "numCellsPerColumn"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v14, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v20, v49, objc_msgSend(v21, "numCellsPerColumn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v23, "menuCellHeight");
  objc_msgSend(off_1E16799B0, "fixedSpacing:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679988, "spacingForLeading:top:trailing:bottom:", 0, v24, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEdgeSpacing:", v25);

  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v27, "menuColumnSpacing");
  objc_msgSend(v26, "setInterGroupSpacing:");

  v28 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v28, "minShortcutCellWidth");
  objc_msgSend(off_1E1679980, "estimatedDimension:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v30, "menuCellHeight");
  objc_msgSend(off_1E1679980, "absoluteDimension:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v32, CFSTR("UICollectionElementKindSectionHeader"), 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setExtendsBoundary:", 0);
  objc_msgSend(v33, "setPinToVisibleBounds:", 1);
  v53 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBoundarySupplementaryItems:", v34);

  objc_msgSend(v26, "contentInsets");
  v36 = v35;
  v38 = v37;
  v39 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v39, "menuTopContentInset");
  v41 = v40;

  v42 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v42, "menuBottomContentInset");
  v44 = v43;

  objc_msgSend(v26, "setContentInsets:", v41, v36, v44, v38);
  v45 = (void *)objc_opt_new();
  objc_msgSend(v45, "setScrollDirection:", 1);
  v46 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v46, "menuColumnSpacing");
  objc_msgSend(v45, "setInterSectionSpacing:");

  v47 = -[UICollectionViewCompositionalLayout initWithSection:configuration:]([UICollectionViewCompositionalLayout alloc], "initWithSection:configuration:", v26, v45);
  return v47;
}

- (id)_searchModeCollectionViewLayout
{
  void *v3;
  UIKeyShortcutHUDMetrics **p_metrics;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  UICollectionViewCompositionalLayout *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_metrics = &self->_metrics;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(WeakRetained, "separatorWidth");
  objc_msgSend(off_1E1679980, "absoluteDimension:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v3, v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799B8, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v40, v7, v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v9, v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679998, "itemWithLayoutSize:supplementaryItems:", v38, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v14, "menuCellHeight");
  objc_msgSend(off_1E1679980, "absoluteDimension:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v21, "menuCellHeight");
  objc_msgSend(off_1E1679980, "absoluteDimension:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v23, CFSTR("UICollectionElementKindSectionHeader"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPinToVisibleBounds:", 1);
  v41 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBoundarySupplementaryItems:", v25);

  objc_msgSend(v19, "contentInsets");
  v27 = v26;
  v29 = v28;
  v30 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v30, "menuHorizontalContentInset");
  v32 = v31;

  v33 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v33, "menuHorizontalContentInset");
  v35 = v34;

  objc_msgSend(v19, "setContentInsets:", v27, v32, v29, v35);
  v36 = -[UICollectionViewCompositionalLayout initWithSection:]([UICollectionViewCompositionalLayout alloc], "initWithSection:", v19);

  return v36;
}

- (void)setMenu:(id)a3
{
  -[_UIKeyShortcutHUDMenuViewController setMenu:animated:](self, "setMenu:animated:", a3, 0);
}

- (void)setMenu:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  _BOOL4 v8;
  id v9;
  id v10;
  id obj;

  v4 = a4;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menu, obj);
    v8 = -[UIViewController isViewLoaded](self, "isViewLoaded");
    v7 = obj;
    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_menu);
      -[_UIKeyShortcutHUDMenuViewController _displayMenu:animatingDifferences:](self, "_displayMenu:animatingDifferences:", v9, v4);

      v10 = objc_loadWeakRetained((id *)&self->_collectionViewManager);
      objc_msgSend(v10, "reloadAllVisibleSeparatorsForClient:", self);

      v7 = obj;
    }
  }

}

- (void)_displayMenu:(id)a3 animatingDifferences:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  UICollectionViewDiffableDataSource *dataSource;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v21 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendSectionsWithIdentifiers:", v13);

        objc_msgSend(v12, "children");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  dataSource = self->_dataSource;
  if (v16)
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v6, 1);
  else
    -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](dataSource, "applySnapshotUsingReloadData:", v6);

}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIKeyShortcutHUDMenuViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuViewController:didSelectShortcut:", self, v5);

  }
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  _UIKeyShortcutHUDMenuViewController *v3;
  void *v4;
  void *v5;

  v3 = self;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDMenuViewController delegate](v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "menuViewController:shouldPersistSelectionForShortcut:", v3, v4);

  return (char)v3;
}

- (void)didScrollCollectionView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  int v13;
  id v14;
  char v15;
  double v16;
  double v17;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  if (!-[UIScrollView isScrollAnimating](self->_collectionView, "isScrollAnimating")
    && !-[_UIKeyShortcutHUDMenuViewController isSearching](self, "isSearching")
    && !-[_UIKeyShortcutHUDMenuViewController isTransitioningSearch](self, "isTransitioningSearch"))
  {
    -[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex");
    -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
    v4 = v3;
    -[UIScrollView contentSize](self->_collectionView, "contentSize");
    v6 = v5;
    -[UIView bounds](self->_collectionView, "bounds");
    v8 = v7;
    -[UIScrollView contentInset](self->_collectionView, "contentInset");
    v10 = v9;
    -[UIScrollView contentInset](self->_collectionView, "contentInset");
    if (v4 + v11 > 0.0
      || (v12 = objc_loadWeakRetained((id *)&self->_menu), v13 = objc_msgSend(v12, "isEmpty"), v12, v13))
    {
      if (v4 < v6 - v8 + v10
        || (v14 = objc_loadWeakRetained((id *)&self->_menu),
            v15 = objc_msgSend(v14, "isEmpty"),
            v14,
            (v15 & 1) != 0))
      {
        -[UIScrollView contentInset](self->_collectionView, "contentInset");
        v17 = v4 + v16 + v16;
        WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
        v19 = objc_msgSend(WeakRetained, "categoryIndexAtHorizontalOffset:", v17);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
        objc_msgSend(WeakRetained, "children");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v20, "count") - 1;

      }
    }
    else
    {
      v19 = 0;
    }
    if (-[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex") != v19)
    {
      -[_UIKeyShortcutHUDMenuViewController setCurrentScrolledToCategoryIndex:](self, "setCurrentScrolledToCategoryIndex:", v19);
      v21 = objc_loadWeakRetained((id *)&self->_menu);
      objc_msgSend(v21, "children");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", -[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex"));
      v24 = (id)objc_claimAutoreleasedReturnValue();

      -[_UIKeyShortcutHUDMenuViewController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "menuViewController:didScrollToCategory:withCategoryIndex:", self, v24, -[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex"));

    }
  }
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _UIKeyShortcutHUDMenuViewController *v8;
  void *v9;
  unint64_t v10;
  id WeakRetained;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UICollectionView *collectionView;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "client");
    v8 = (_UIKeyShortcutHUDMenuViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
    {
      if (-[_UIKeyShortcutHUDMenuViewController isSearching](self, "isSearching")
        || (objc_msgSend(v4, "indexPath"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "item") + 1,
            WeakRetained = objc_loadWeakRetained((id *)&self->_metrics),
            v12 = v10 % objc_msgSend(WeakRetained, "numCellsPerColumn"),
            WeakRetained,
            v9,
            v12))
      {
        objc_msgSend(v5, "addObject:", v4);
        objc_msgSend(v4, "indexPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "section");
        if (v14 >= -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"))
        {
LABEL_8:

          goto LABEL_9;
        }
        objc_msgSend(v4, "indexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "item");
        collectionView = self->_collectionView;
        objc_msgSend(v4, "indexPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[UICollectionView numberOfItemsInSection:](collectionView, "numberOfItemsInSection:", objc_msgSend(v18, "section"))- 1;

        if (v16 < v19)
        {
          v20 = (void *)MEMORY[0x1E0CB36B0];
          objc_msgSend(v4, "indexPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "item") + 1;
          objc_msgSend(v4, "indexPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "indexPathForItem:inSection:", v22, objc_msgSend(v23, "section"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v13);
          goto LABEL_8;
        }
      }
    }
  }
LABEL_9:

  return v5;
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _UIKeyShortcutHUDMenuViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  id WeakRetained;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "client");
    v8 = (_UIKeyShortcutHUDMenuViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
    {
      if (-[_UIKeyShortcutHUDMenuViewController isSearching](self, "isSearching"))
      {
        objc_msgSend(v5, "addObject:", v4);
        objc_msgSend(v4, "indexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "item");

        if (v10 < 1)
          goto LABEL_10;
        goto LABEL_9;
      }
      objc_msgSend(v4, "indexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "item") + 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      v14 = v12 % objc_msgSend(WeakRetained, "numCellsPerColumn");

      if (v14)
        objc_msgSend(v5, "addObject:", v4);
      objc_msgSend(v4, "indexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "item");
      v17 = objc_loadWeakRetained((id *)&self->_metrics);
      v18 = v16 % objc_msgSend(v17, "numCellsPerColumn");

      if (v18)
      {
LABEL_9:
        v19 = (void *)MEMORY[0x1E0CB36B0];
        objc_msgSend(v4, "indexPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "item") - 1;
        objc_msgSend(v4, "indexPath");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "indexPathForItem:inSection:", v21, objc_msgSend(v22, "section"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v24);
      }
    }
  }
LABEL_10:

  return v5;
}

- (void)prepareForSearchTransition:(BOOL)a3
{
  -[_UIKeyShortcutHUDMenuViewController setTransitioningSearch:](self, "setTransitioningSearch:", 1);
}

- (void)setSearching:(BOOL)a3
{
  UICollectionView *collectionView;
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  UICollectionView *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;

  if (self->_searching != a3)
  {
    self->_searching = a3;
    collectionView = self->_collectionView;
    if (a3)
    {
      -[_UIKeyShortcutHUDMenuViewController _searchModeCollectionViewLayout](self, "_searchModeCollectionViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView setCollectionViewLayout:](collectionView, "setCollectionViewLayout:", v5);

      WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      objc_msgSend(WeakRetained, "searchModeMenuTopContentInset");
      v8 = v7;
      v9 = objc_loadWeakRetained((id *)&self->_metrics);
      objc_msgSend(v9, "searchModeMenuBottomContentInset");
      v11 = v10;
      v12 = self->_collectionView;
      v13 = 0.0;
      v14 = 0.0;
      v15 = v8;
    }
    else
    {
      -[_UIKeyShortcutHUDMenuViewController _standardModeCollectionViewLayout](self, "_standardModeCollectionViewLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView setCollectionViewLayout:](collectionView, "setCollectionViewLayout:", v16);

      WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      objc_msgSend(WeakRetained, "menuHorizontalContentInset");
      v18 = v17;
      v9 = objc_loadWeakRetained((id *)&self->_metrics);
      objc_msgSend(v9, "menuHorizontalContentInset");
      v14 = v19;
      v12 = self->_collectionView;
      v15 = 0.0;
      v11 = 0.0;
      v13 = v18;
    }
    -[UICollectionView setContentInset:](v12, "setContentInset:", v15, v13, v11, v14);

    v20 = objc_loadWeakRetained((id *)&self->_collectionViewManager);
    objc_msgSend(v20, "reloadAllVisibleSeparatorsForClient:", self);

  }
}

- (void)didCompleteSearchTransition
{
  -[_UIKeyShortcutHUDMenuViewController setTransitioningSearch:](self, "setTransitioningSearch:", 0);
}

- (void)scrollToCategory:(id)a3 withCategoryIndex:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UICollectionView *collectionView;

  v5 = a5;
  -[UIScrollView contentInset](self->_collectionView, "contentInset", a3);
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(WeakRetained, "horizontalOffsetForCategoryAtIndex:", a4);
  v12 = v11;

  v13 = v12 - (v9 + v9);
  v14 = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(v14, "displayedMenuContentWidth");
  v16 = v15;
  -[UIView bounds](self->_collectionView, "bounds");
  v18 = v16 - v17 - v9;

  if (v13 < v18)
    v18 = v13;
  collectionView = self->_collectionView;
  -[UIScrollView contentOffset](collectionView, "contentOffset");
  -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", v5, v18);
  -[_UIKeyShortcutHUDMenuViewController setCurrentScrolledToCategoryIndex:](self, "setCurrentScrolledToCategoryIndex:", a4);
}

- (void)flashShortcutIfVisible:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDMenuViewController collectionViewManager](self, "collectionViewManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80___UIKeyShortcutHUDMenuViewController_flashShortcutIfVisible_completionHandler___block_invoke;
  v11[3] = &unk_1E16C5E00;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "client:flashCellIfPossibleAtIndexPath:completionHandler:", self, v9, v11);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDMenuViewControllerDelegate)delegate
{
  return (_UIKeyShortcutHUDMenuViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  return (_UIKeyShortcutHUDCollectionViewManager *)objc_loadWeakRetained((id *)&self->_collectionViewManager);
}

- (void)setCollectionViewManager:(id)a3
{
  objc_storeWeak((id *)&self->_collectionViewManager, a3);
}

- (_UIKeyShortcutHUDMenu)menu
{
  return (_UIKeyShortcutHUDMenu *)objc_loadWeakRetained((id *)&self->_menu);
}

- (UIKeyShortcutHUDMetrics)metrics
{
  return (UIKeyShortcutHUDMetrics *)objc_loadWeakRetained((id *)&self->_metrics);
}

- (void)setMetrics:(id)a3
{
  objc_storeWeak((id *)&self->_metrics, a3);
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration
{
  return self->_cellSeparatorRegistration;
}

- (void)setCellSeparatorRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, a3);
}

- (UICollectionViewSupplementaryRegistration)sectionHeaderRegistration
{
  return self->_sectionHeaderRegistration;
}

- (void)setSectionHeaderRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderRegistration, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)isTransitioningSearch
{
  return self->_transitioningSearch;
}

- (void)setTransitioningSearch:(BOOL)a3
{
  self->_transitioningSearch = a3;
}

- (unint64_t)currentScrolledToCategoryIndex
{
  return self->_currentScrolledToCategoryIndex;
}

- (void)setCurrentScrolledToCategoryIndex:(unint64_t)a3
{
  self->_currentScrolledToCategoryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sectionHeaderRegistration, 0);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_metrics);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
