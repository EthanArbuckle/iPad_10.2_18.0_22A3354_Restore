@implementation _UIKeyShortcutHUDToolbarViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarViewController;
  -[UIViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[_UIKeyShortcutHUDToolbarViewController _setupSubviews](self, "_setupSubviews");
  -[_UIKeyShortcutHUDToolbarViewController _configureCollectionView](self, "_configureCollectionView");
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
  id *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  UIVisualEffectView *v36;
  id v37;
  void *v38;
  UIVisualEffectView *v39;
  UIVisualEffectView *visualEffectView;
  void *v41;
  void *v42;
  UIView *v43;
  UIView *toolbarContentView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _UIKeyShortcutHUDSearchButton *v54;
  _UIKeyShortcutHUDSearchButton *searchButton;
  _UIKeyShortcutHUDSearchBar *v56;
  _UIKeyShortcutHUDSearchBar *v57;
  _UIKeyShortcutHUDSearchBar *searchBar;
  UIView *v59;
  UIView *categoriesContentView;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  UICollectionView *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  UICollectionView *v79;
  UICollectionView *collectionView;
  id v81;
  UIPageControl *v82;
  UIPageControl *categoriesPageControl;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _UIKeyShortcutHUDSeparatorView *v89;
  _UIKeyShortcutHUDSeparatorView *scrollingSeparatorView;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  double v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id *location;
  id *locationa;
  _QWORD v161[4];
  _UIKeyShortcutHUDSearchButton *v162;
  _QWORD v163[6];
  _QWORD v164[8];
  _QWORD v165[6];

  v165[4] = *MEMORY[0x1E0C80C00];
  p_metrics = &self->_metrics;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  objc_msgSend(WeakRetained, "toolbarPlatterCornerRadius");
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
  v13 = objc_msgSend(v12, "toolbarPanelCornerMask");
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
  objc_msgSend(v18, "toolbarPanelStrokeWidth");
  v20 = v19;
  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderWidth:", v20);

  v23 = (id *)p_metrics;
  v24 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v24, "platterStrokeColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resolvedColorWithTraitCollection:", v26);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "CGColor");
  -[UIViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBorderColor:", v28);

  location = v23;
  v31 = objc_loadWeakRetained(v23);
  objc_msgSend(v31, "platterZPosition");
  v33 = v32;
  -[UIViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setZPosition:", v33);

  v36 = [UIVisualEffectView alloc];
  v37 = objc_loadWeakRetained(v23);
  objc_msgSend(v37, "platterVisualEffect");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[UIVisualEffectView initWithEffect:](v36, "initWithEffect:", v38);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v39;

  -[UIViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");

  -[UIView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", self->_visualEffectView);

  v43 = (UIView *)objc_opt_new();
  toolbarContentView = self->_toolbarContentView;
  self->_toolbarContentView = v43;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_toolbarContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", self->_toolbarContentView);

  v130 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_toolbarContentView, "topAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "topAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v145);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = v142;
  -[UIView leadingAnchor](self->_toolbarContentView, "leadingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "leadingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v133);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v165[1] = v127;
  -[UIView trailingAnchor](self->_toolbarContentView, "trailingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v165[2] = v47;
  -[UIView bottomAnchor](self->_toolbarContentView, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "safeAreaLayoutGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v165[3] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "activateConstraints:", v53);

  v54 = (_UIKeyShortcutHUDSearchButton *)objc_opt_new();
  searchButton = self->_searchButton;
  self->_searchButton = v54;

  -[_UIKeyShortcutHUDSearchButton setDelegate:](self->_searchButton, "setDelegate:", self);
  -[_UIKeyShortcutHUDSearchButton setToolbarVC:](self->_searchButton, "setToolbarVC:", self);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_toolbarContentView, "addSubview:", self->_searchButton);
  v56 = [_UIKeyShortcutHUDSearchBar alloc];
  -[UIView bounds](self->_toolbarContentView, "bounds");
  v57 = -[_UIKeyShortcutHUDSearchBar initWithFrame:](v56, "initWithFrame:");
  searchBar = self->_searchBar;
  self->_searchBar = v57;

  -[UIView setUserInteractionEnabled:](self->_searchBar, "setUserInteractionEnabled:", 0);
  -[_UIKeyShortcutHUDSearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  -[_UIKeyShortcutHUDSearchBar setSearchButton:](self->_searchBar, "setSearchButton:", self->_searchButton);
  -[UIView setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_toolbarContentView, "addSubview:", self->_searchBar);
  v59 = (UIView *)objc_opt_new();
  categoriesContentView = self->_categoriesContentView;
  self->_categoriesContentView = v59;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_categoriesContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_toolbarContentView, "addSubview:", self->_categoriesContentView);
  v125 = (void *)MEMORY[0x1E0D156E0];
  -[UIView leadingAnchor](self->_searchButton, "leadingAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_toolbarContentView, "leadingAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:", v150);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = v146;
  -[UIView topAnchor](self->_searchButton, "topAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_toolbarContentView, "topAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:", v140);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v164[1] = v137;
  -[UIView bottomAnchor](self->_searchButton, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_toolbarContentView, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:", v131);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v164[2] = v128;
  -[UIView widthAnchor](self->_searchButton, "widthAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_loadWeakRetained(location);
  objc_msgSend(v122, "searchButtonWidth");
  objc_msgSend(v119, "constraintEqualToConstant:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v164[3] = v118;
  -[UIView leadingAnchor](self->_categoriesContentView, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_searchButton, "trailingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v164[4] = v115;
  -[UIView topAnchor](self->_categoriesContentView, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_toolbarContentView, "topAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v113);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v164[5] = v61;
  -[UIView bottomAnchor](self->_categoriesContentView, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_toolbarContentView, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v164[6] = v64;
  -[UIView trailingAnchor](self->_categoriesContentView, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_toolbarContentView, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v164[7] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 8);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "activateConstraints:", v68);

  v69 = [UICollectionView alloc];
  -[UIView bounds](self->_categoriesContentView, "bounds");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  -[_UIKeyShortcutHUDToolbarViewController _collectionViewLayout](self, "_collectionViewLayout");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[UICollectionView initWithFrame:collectionViewLayout:](v69, "initWithFrame:collectionViewLayout:", v78, v71, v73, v75, v77);
  collectionView = self->_collectionView;
  self->_collectionView = v79;

  v81 = objc_loadWeakRetained(location);
  -[UIView setHidden:](self->_collectionView, "setHidden:", objc_msgSend(v81, "toolbarStylesCategoriesAsPageControl"));

  -[UIView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_categoriesContentView, "addSubview:", self->_collectionView);
  v82 = (UIPageControl *)objc_opt_new();
  categoriesPageControl = self->_categoriesPageControl;
  self->_categoriesPageControl = v82;

  -[UIControl addTarget:action:forControlEvents:](self->_categoriesPageControl, "addTarget:action:forControlEvents:", self, sel_categoriesPageControlCurrentPageChanged_, 4096);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "standardHUDTextColor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setCurrentPageIndicatorTintColor:](self->_categoriesPageControl, "setCurrentPageIndicatorTintColor:", v85);

  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setPageIndicatorTintColor:](self->_categoriesPageControl, "setPageIndicatorTintColor:", v86);

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl _setPlatterEffect:](self->_categoriesPageControl, "_setPlatterEffect:", v87);

  -[UIPageControl setHidesForSinglePage:](self->_categoriesPageControl, "setHidesForSinglePage:", 1);
  v88 = objc_loadWeakRetained(location);
  -[UIView setHidden:](self->_categoriesPageControl, "setHidden:", objc_msgSend(v88, "toolbarStylesCategoriesAsPageControl") ^ 1);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_categoriesPageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_categoriesContentView, "addSubview:", self->_categoriesPageControl);
  v89 = (_UIKeyShortcutHUDSeparatorView *)objc_opt_new();
  scrollingSeparatorView = self->_scrollingSeparatorView;
  self->_scrollingSeparatorView = v89;

  -[_UIKeyShortcutHUDToolbarViewController _configureSeparatorViewAppearance:](self, "_configureSeparatorViewAppearance:", self->_scrollingSeparatorView);
  -[_UIKeyShortcutHUDSeparatorView setSeparatorHidden:](self->_scrollingSeparatorView, "setSeparatorHidden:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollingSeparatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_categoriesContentView, "addSubview:", self->_scrollingSeparatorView);
  v132 = (void *)MEMORY[0x1E0D156E0];
  -[UIView centerXAnchor](self->_categoriesPageControl, "centerXAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_toolbarContentView, "centerXAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v151);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v147;
  -[UIView centerYAnchor](self->_categoriesPageControl, "centerYAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_toolbarContentView, "centerYAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:", v157);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v141;
  -[UIView leadingAnchor](self->_scrollingSeparatorView, "leadingAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_categoriesContentView, "leadingAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "constraintEqualToAnchor:", v135);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v163[2] = v129;
  -[UIView topAnchor](self->_scrollingSeparatorView, "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_categoriesContentView, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_loadWeakRetained(location);
  objc_msgSend(v123, "toolbarContentInset");
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v120);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v163[3] = v91;
  -[UIView bottomAnchor](self->_scrollingSeparatorView, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_categoriesContentView, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_loadWeakRetained(location);
  objc_msgSend(v94, "toolbarContentInset");
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, -v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v163[4] = v96;
  -[UIView widthAnchor](self->_scrollingSeparatorView, "widthAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_loadWeakRetained(location);
  objc_msgSend(v98, "separatorWidth");
  objc_msgSend(v97, "constraintEqualToConstant:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v163[5] = v99;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 6);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "activateConstraints:", v100);

  v101 = objc_loadWeakRetained(location);
  LODWORD(v98) = objc_msgSend(v101, "toolbarStylesCategoriesAsPageControl");

  if ((_DWORD)v98)
  {
    v102 = (void *)objc_opt_new();
    v162 = self->_searchButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v162, 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setPreferredFocusEnvironments:", v103);

    -[UIView addLayoutGuide:](self->_categoriesContentView, "addLayoutGuide:", v102);
    v148 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v102, "leadingAnchor");
    locationa = (id *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_categoriesContentView, "leadingAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(locationa, "constraintEqualToAnchor:", v158);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v161[0] = v156;
    objc_msgSend(v102, "topAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_categoriesContentView, "topAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v161[1] = v105;
    objc_msgSend(v102, "trailingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_categoriesContentView, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v161[2] = v108;
    objc_msgSend(v102, "bottomAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_categoriesContentView, "bottomAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v161[3] = v111;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 4);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "activateConstraints:", v112);

  }
}

- (void)_configureCollectionView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UICollectionViewDiffableDataSource *v9;
  UICollectionView *collectionView;
  id v11;
  UICollectionViewDiffableDataSource *v12;
  UICollectionViewDiffableDataSource *dataSource;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  objc_initWeak(location, self);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke;
  v29[3] = &unk_1E16ED8A0;
  objc_copyWeak(&v30, location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_3;
  v27[3] = &unk_1E16C7470;
  objc_copyWeak(&v28, location);
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v6, v7, v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_4;
  v25[3] = &unk_1E16C74C0;
  v11 = v5;
  v26 = v11;
  v12 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v9, "initWithCollectionView:cellProvider:", collectionView, v25);
  dataSource = self->_dataSource;
  self->_dataSource = v12;

  v20 = v4;
  v21 = 3221225472;
  v22 = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_5;
  v23 = &unk_1E16ED8C8;
  v14 = v8;
  v24 = v14;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", &v20);
  objc_storeStrong((id *)&self->_categoryCellRegistration, v5);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  LODWORD(v8) = objc_msgSend(WeakRetained, "toolbarStylesCategoriesAsPageControl", v20, v21, v22, v23);

  if ((_DWORD)v8)
  {
    v16 = objc_loadWeakRetained((id *)&self->_menu);
    objc_msgSend(v16, "children");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setNumberOfPages:](self->_categoriesPageControl, "setNumberOfPages:", objc_msgSend(v17, "count"));

  }
  else
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendSectionsWithIdentifiers:", &unk_1E1A95498);
    v18 = objc_loadWeakRetained((id *)&self->_menu);
    objc_msgSend(v18, "children");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendItemsWithIdentifiers:", v19);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v16, 0);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (id)_collectionViewLayout
{
  void *v3;
  UICollectionViewCompositionalLayout *v4;
  UICollectionViewCompositionalLayout *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setScrollDirection:", 1);
  objc_initWeak(&location, self);
  v4 = [UICollectionViewCompositionalLayout alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___UIKeyShortcutHUDToolbarViewController__collectionViewLayout__block_invoke;
  v7[3] = &unk_1E16DB350;
  objc_copyWeak(&v8, &location);
  v5 = -[UICollectionViewCompositionalLayout initWithSectionProvider:configuration:](v4, "initWithSectionProvider:configuration:", v7, v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[_UIKeyShortcutHUDToolbarViewController isSearching](self, "isSearching")
    && !-[_UIKeyShortcutHUDToolbarViewController isPreparingSearchTransition](self, "isPreparingSearchTransition"))
  {
    -[_UIKeyShortcutHUDToolbarViewController collectionViewManager](self, "collectionViewManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client:setCategoryVisibleForCellAtIndexPath:", self, v9);

    -[_UIKeyShortcutHUDToolbarViewController menu](self, "menu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIKeyShortcutHUDToolbarViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolbarViewController:didSelectCategory:categoryIndex:animated:", self, v7, objc_msgSend(v9, "item"), 1);

  }
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  return 1;
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _UIKeyShortcutHUDToolbarViewController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "client");
    v6 = (_UIKeyShortcutHUDToolbarViewController *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      objc_msgSend(v4, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "item");

      if (v8 >= 1)
      {
        objc_msgSend(v5, "addObject:", v4);
        v9 = (void *)MEMORY[0x1E0CB36B0];
        objc_msgSend(v4, "indexPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "item") - 1;
        objc_msgSend(v4, "indexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "indexPathForItem:inSection:", v11, objc_msgSend(v12, "section"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v14);
      }
    }
  }

  return v5;
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _UIKeyShortcutHUDToolbarViewController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id WeakRetained;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "client");
    v6 = (_UIKeyShortcutHUDToolbarViewController *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      objc_msgSend(v4, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "item");

      if (v8 >= 1)
        objc_msgSend(v5, "addObject:", v4);
      objc_msgSend(v4, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "item");
      WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
      objc_msgSend(WeakRetained, "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") - 1;

      if (v10 < v13)
      {
        v14 = (void *)MEMORY[0x1E0CB36B0];
        objc_msgSend(v4, "indexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "item") + 1;
        objc_msgSend(v4, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "indexPathForItem:inSection:", v16, objc_msgSend(v17, "section"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v19);
      }
    }
  }

  return v5;
}

- (_UIKeyShortcutHUDIndexPath)firstCategoryIndexPath
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDIndexPath *)v4;
}

- (void)_configureSeparatorViewAppearance:(id)a3
{
  UIKeyShortcutHUDMetrics **p_metrics;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  p_metrics = &self->_metrics;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(WeakRetained, "toolbarSeparatorVerticalMargin");
  v7 = v6;

  objc_msgSend(v4, "setDirectionalLayoutMargins:", v7, 0.0, v7, 0.0);
  v8 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v8, "toolbarSeparatorColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorColor:", v9);

  v11 = objc_loadWeakRetained((id *)p_metrics);
  objc_msgSend(v11, "toolbarSeparatorVisualEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualEffect:", v10);

}

- (void)updateScrollingSeparatorViewVisibility
{
  -[_UIKeyShortcutHUDSeparatorView setSeparatorHidden:](self->_scrollingSeparatorView, "setSeparatorHidden:", -[_UIKeyShortcutHUDToolbarViewController _shouldHideScrollingSeparatorView](self, "_shouldHideScrollingSeparatorView"));
}

- (BOOL)_shouldHideScrollingSeparatorView
{
  id WeakRetained;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  v4 = objc_msgSend(WeakRetained, "toolbarStylesCategoriesAsPageControl");

  if ((v4 & 1) != 0)
    return 1;
  -[_UIKeyShortcutHUDSearchButton collectionView](self->_searchButton, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDSearchButton searchButtonIndexPath](self->_searchButton, "searchButtonIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isBackgroundVisible") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    collectionView = self->_collectionView;
    -[_UIKeyShortcutHUDToolbarViewController firstCategoryIndexPath](self, "firstCategoryIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isBackgroundVisible")
      && (-[UIScrollView contentOffset](self->_collectionView, "contentOffset"), v14 < 0.0))
    {
      v5 = 1;
      v9 = v13;
    }
    else
    {
      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      v16 = v15;
      -[UIView bounds](self->_collectionView, "bounds");
      -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", v16, CGRectGetMidY(v19));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v9, "isBackgroundVisible");
    }
  }

  return v5;
}

- (void)prepareForSearchTransition:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  UIUserInterfaceLayoutDirection v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _UIKeyShortcutHUDSearchBar *searchBar;
  id v25;

  v3 = a3;
  -[_UIKeyShortcutHUDToolbarViewController setPreparingSearchTransition:](self, "setPreparingSearchTransition:", 1);
  -[_UIKeyShortcutHUDSearchButton prepareForSearchTransition:](self->_searchButton, "prepareForSearchTransition:", v3);
  if (!v3)
  {
    -[UIView setUserInteractionEnabled:](self->_categoriesContentView, "setUserInteractionEnabled:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewManager);
    objc_msgSend(WeakRetained, "deselectCurrentlySelectedCell");

    -[_UIKeyShortcutHUDToolbarViewController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

    -[_UIKeyShortcutHUDSearchBar setText:](self->_searchBar, "setText:", 0);
    -[UIView setUserInteractionEnabled:](self->_searchBar, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](self->_searchButton, "setUserInteractionEnabled:", 1);
    -[UIViewController updateFocusIfNeeded](self, "updateFocusIfNeeded");
    -[_UIKeyShortcutHUDSearchBar searchTextField](self->_searchBar, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (__UIAccessibilityBroadcastCallback)
      __UIAccessibilityBroadcastCallback(1001, v7);

  }
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = -[UIView effectiveUserInterfaceLayoutDirection](self->_collectionView, "effectiveUserInterfaceLayoutDirection");

    if (v9 == UIUserInterfaceLayoutDirectionLeftToRight)
    {
      collectionView = self->_collectionView;
      -[UICollectionView indexPathsForSelectedItems](collectionView, "indexPathsForSelectedItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_cellForSearchTransition, v13);

      goto LABEL_11;
    }
  }
  else
  {

  }
  -[_UIKeyShortcutHUDSearchButton collectionView](self->_searchButton, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathsForSelectedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[_UIKeyShortcutHUDSearchButton collectionView](self->_searchButton, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDSearchButton collectionView](self->_searchButton, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexPathsForSelectedItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForItemAtIndexPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_cellForSearchTransition, v21);

  }
LABEL_11:
  v22 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  objc_msgSend(v22, "setDrawsBackground:", 1);

  v23 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  objc_msgSend(v23, "layoutIfNeeded");

  searchBar = self->_searchBar;
  v25 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  -[_UIKeyShortcutHUDSearchBar prepareForSearchTransition:usingCell:](searchBar, "prepareForSearchTransition:usingCell:", v3, v25);

  if (v3)
  {
    -[UIView setUserInteractionEnabled:](self->_searchBar, "setUserInteractionEnabled:", 1);
    -[_UIKeyShortcutHUDSearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
    -[UIView setUserInteractionEnabled:](self->_categoriesContentView, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](self->_searchButton, "setUserInteractionEnabled:", 0);
    if (self->_searching)
      -[_UIKeyShortcutHUDSearchBar selectAll:](self->_searchBar, "selectAll:", 0);
    if (__UIAccessibilityBroadcastCallback)
      __UIAccessibilityBroadcastCallback(1001, self->_searchButton);
  }
  -[_UIKeyShortcutHUDToolbarViewController setPreparingSearchTransition:](self, "setPreparingSearchTransition:", 0);
}

- (void)setSearching:(BOOL)a3
{
  _BOOL8 v3;
  UIView *categoriesContentView;
  id WeakRetained;
  UICollectionView *v7;
  UICollectionView *collectionView;
  UICollectionView *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[_UIKeyShortcutHUDSearchButton setSearching:](self->_searchButton, "setSearching:");
  -[_UIKeyShortcutHUDSearchBar setSearching:](self->_searchBar, "setSearching:", v3);
  if (self->_searching != v3)
  {
    self->_searching = v3;
    categoriesContentView = self->_categoriesContentView;
    if (v3)
    {
      -[UIView setAlpha:](categoriesContentView, "setAlpha:", 0.0);
    }
    else
    {
      -[UIView setAlpha:](categoriesContentView, "setAlpha:", 1.0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
      objc_msgSend(WeakRetained, "superview");
      v7 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
      collectionView = self->_collectionView;

      if (v7 == collectionView)
      {
        v9 = self->_collectionView;
        v10 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
        -[UICollectionView indexPathForCell:](v9, "indexPathForCell:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIKeyShortcutHUDToolbarViewController performActionForSelectingCellAtIndexPath:](self, "performActionForSelectingCellAtIndexPath:", v11);
      }
      -[_UIKeyShortcutHUDToolbarViewController collectionView](self, "collectionView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionViewLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidateLayout");

    }
  }
}

- (void)didCompleteSearchTransition
{
  id WeakRetained;
  _QWORD block[5];

  -[_UIKeyShortcutHUDSearchButton didCompleteSearchTransition](self->_searchButton, "didCompleteSearchTransition");
  -[_UIKeyShortcutHUDSearchBar didCompleteSearchTransition](self->_searchBar, "didCompleteSearchTransition");
  WeakRetained = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  objc_msgSend(WeakRetained, "setDrawsBackground:", 0);

  objc_storeWeak((id *)&self->_cellForSearchTransition, 0);
  if (-[_UIKeyShortcutHUDToolbarViewController isSearching](self, "isSearching"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___UIKeyShortcutHUDToolbarViewController_didCompleteSearchTransition__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)searchBarDidPressCancelButton:(id)a3
{
  id v4;

  -[_UIKeyShortcutHUDToolbarViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbarViewControllerDidPressCancelSearchButton:", self);

}

- (void)searchBar:(id)a3 didUpdateSearchText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_UIKeyShortcutHUDToolbarViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbarViewController:didUpdateSearchText:", self, v5);

}

- (void)searchButtonDidPress:(id)a3
{
  id v4;

  -[_UIKeyShortcutHUDToolbarViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbarViewControllerDidPressSearchButton:", self);

}

- (void)hudWillBecomeHidden:(BOOL)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[_UIKeyShortcutHUDToolbarViewController visualEffectView](self, "visualEffectView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setSafeAreaInsetsFrozen:", 1);

  }
}

- (void)selectCategory:(id)a3 withCategoryIndex:(int64_t)a4
{
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  v7 = objc_msgSend(WeakRetained, "toolbarStylesCategoriesAsPageControl");

  if (v7)
  {
    if (-[UIPageControl interactionState](self->_categoriesPageControl, "interactionState") == UIPageControlInteractionStateNone)
      -[UIPageControl setCurrentPage:](self->_categoriesPageControl, "setCurrentPage:", a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDToolbarViewController collectionViewManager](self, "collectionViewManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client:setCategoryVisibleForCellAtIndexPath:", self, v22);

    -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_collectionView, "layoutAttributesForItemAtIndexPath:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v23.origin.x = v11;
    v23.origin.y = v13;
    v23.size.width = v15;
    v23.size.height = v17;
    v18 = CGRectGetWidth(v23) * -0.5;
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    v25 = CGRectInset(v24, v18, 0.0);
    -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 1, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      -[_UIKeyShortcutHUDToolbarViewController collectionViewManager](self, "collectionViewManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "client:selectCellAtIndexPath:", self, v22);

    }
  }
}

- (void)categoriesPageControlCurrentPageChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[_UIKeyShortcutHUDToolbarViewController menu](self, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "currentPage"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "interactionState") == 1;
  -[_UIKeyShortcutHUDToolbarViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "currentPage");

  objc_msgSend(v8, "toolbarViewController:didSelectCategory:categoryIndex:animated:", self, v10, v9, v7);
}

- (void)flashCategoryAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDToolbarViewController collectionViewManager](self, "collectionViewManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___UIKeyShortcutHUDToolbarViewController_flashCategoryAtIndex_completionHandler___block_invoke;
  v10[3] = &unk_1E16B1BA0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "client:flashCellIfPossibleAtIndexPath:completionHandler:", self, v7, v10);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDToolbarViewControllerDelegate)delegate
{
  return (_UIKeyShortcutHUDToolbarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void)setMenu:(id)a3
{
  objc_storeWeak((id *)&self->_menu, a3);
}

- (UIKeyShortcutHUDMetrics)metrics
{
  return (UIKeyShortcutHUDMetrics *)objc_loadWeakRetained((id *)&self->_metrics);
}

- (void)setMetrics:(id)a3
{
  objc_storeWeak((id *)&self->_metrics, a3);
}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchButton, a3);
}

- (_UIKeyShortcutHUDSearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
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

- (UIView)toolbarContentView
{
  return self->_toolbarContentView;
}

- (void)setToolbarContentView:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarContentView, a3);
}

- (UIView)categoriesContentView
{
  return self->_categoriesContentView;
}

- (void)setCategoriesContentView:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesContentView, a3);
}

- (_UIKeyShortcutHUDSeparatorView)scrollingSeparatorView
{
  return self->_scrollingSeparatorView;
}

- (void)setScrollingSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingSeparatorView, a3);
}

- (UIPageControl)categoriesPageControl
{
  return self->_categoriesPageControl;
}

- (void)setCategoriesPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesPageControl, a3);
}

- (UICollectionViewCellRegistration)categoryCellRegistration
{
  return self->_categoryCellRegistration;
}

- (void)setCategoryCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_categoryCellRegistration, a3);
}

- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration
{
  return self->_cellSeparatorRegistration;
}

- (void)setCellSeparatorRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)isPreparingSearchTransition
{
  return self->_preparingSearchTransition;
}

- (void)setPreparingSearchTransition:(BOOL)a3
{
  self->_preparingSearchTransition = a3;
}

- (_UIKeyShortcutHUDCell)cellForSearchTransition
{
  return (_UIKeyShortcutHUDCell *)objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
}

- (void)setCellForSearchTransition:(id)a3
{
  objc_storeWeak((id *)&self->_cellForSearchTransition, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cellForSearchTransition);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, 0);
  objc_storeStrong((id *)&self->_categoryCellRegistration, 0);
  objc_storeStrong((id *)&self->_categoriesPageControl, 0);
  objc_storeStrong((id *)&self->_scrollingSeparatorView, 0);
  objc_storeStrong((id *)&self->_categoriesContentView, 0);
  objc_storeStrong((id *)&self->_toolbarContentView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_destroyWeak((id *)&self->_metrics);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
