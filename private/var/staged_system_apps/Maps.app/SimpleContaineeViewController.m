@implementation SimpleContaineeViewController

- (void)dealloc
{
  NSArray *viewsToObserveBoundsChanges;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  viewsToObserveBoundsChanges = self->_viewsToObserveBoundsChanges;
  if (viewsToObserveBoundsChanges)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = viewsToObserveBoundsChanges;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &unk_1014D3120);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[MapsThemeTableView removeObserver:forKeyPath:context:](self->_actionsTableView, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), &unk_1014D3128);
  }
  v9.receiver = self;
  v9.super_class = (Class)SimpleContaineeViewController;
  -[SimpleContaineeViewController dealloc](&v9, "dealloc");
}

- (void)viewDidLoad
{
  MapsThemeTableView *actionsTableView;
  NSArray *v4;
  NSArray *viewsToObserveBoundsChanges;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  _QWORD v17[2];

  v15.receiver = self;
  v15.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v15, "viewDidLoad");
  -[SimpleContaineeViewController setupSubviews](self, "setupSubviews");
  if (sub_1002A8AA0(self) == 5)
  {
    -[UIScrollView setScrollEnabled:](self->_contentScrollView, "setScrollEnabled:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](self->_contentScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](self->_contentScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setAlwaysBounceVertical:](self->_contentScrollView, "setAlwaysBounceVertical:", 0);
    actionsTableView = self->_actionsTableView;
    v17[0] = self->_contentScrollView;
    v17[1] = actionsTableView;
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    viewsToObserveBoundsChanges = self->_viewsToObserveBoundsChanges;
    self->_viewsToObserveBoundsChanges = v4;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_viewsToObserveBoundsChanges;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, &unk_1014D3120, (_QWORD)v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

    -[SimpleContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    -[MapsThemeTableView setClipsToBounds:](self->_actionsTableView, "setClipsToBounds:", 0);
  }
  else
  {
    -[MapsThemeTableView addObserver:forKeyPath:options:context:](self->_actionsTableView, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, &unk_1014D3128);
  }
}

- (void)setupSubviews
{
  ContainerHeaderView *v3;
  ContainerHeaderView *titleHeaderView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIScrollView *v15;
  UIScrollView *contentScrollView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIStackView *v35;
  UIStackView *topActionsContainerView;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  double y;
  double width;
  double height;
  UIView *v51;
  UIView *metadataContainerView;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  MapsThemeTableView *v63;
  MapsThemeTableView *actionsTableView;
  void *v65;
  double v66;
  double v67;
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
  NSLayoutConstraint *v79;
  NSLayoutConstraint *actionsTableHeightConstraint;
  void *v81;
  NSLayoutConstraint *v82;
  NSLayoutConstraint *actionsTableWidthConstraint;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
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
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[3];
  _QWORD v130[6];
  _QWORD v131[4];
  _QWORD v132[4];

  if (-[SimpleContaineeViewController headerNeeded](self, "headerNeeded"))
  {
    v3 = objc_alloc_init(ContainerHeaderView);
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v3;

    -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v5, "addSubview:", self->_titleHeaderView);

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v112));
    v132[0] = v107;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "trailingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v94));
    v132[1] = v90;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
    v132[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v132[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
  v15 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v15;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setDelegate:](self->_contentScrollView, "setDelegate:", self);
  -[UIScrollView setAlwaysBounceVertical:](self->_contentScrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_contentScrollView, "setPreservesSuperviewLayoutMargins:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v17, "addSubview:", self->_contentScrollView);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_contentScrollView, "topAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "topAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v113));
  v131[0] = v108;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_contentScrollView, "bottomAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v95));
  v131[1] = v91;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_contentScrollView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v19));
  v131[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_contentScrollView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v131[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  v26 = objc_alloc_init((Class)UIView);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v26, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIScrollView addSubview:](self->_contentScrollView, "addSubview:", v26);
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_contentScrollView, "topAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v114));
  v130[0] = v109;
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_contentScrollView, "bottomAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v99));
  v130[1] = v96;
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_contentScrollView, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v130[2] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_contentScrollView, "trailingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v130[3] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v28));
  v130[4] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  v130[5] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  v35 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  topActionsContainerView = self->_topActionsContainerView;
  self->_topActionsContainerView = v35;

  -[UIStackView setDistribution:](self->_topActionsContainerView, "setDistribution:", 1);
  -[UIStackView setAlignment:](self->_topActionsContainerView, "setAlignment:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_topActionsContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v26, "addSubview:", self->_topActionsContainerView);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v37, "userInterfaceIdiom") == (id)5)
    v38 = 0.0;
  else
    v38 = 10.0;

  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_topActionsContainerView, "leadingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v115, 16.0));
  v129[0] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_topActionsContainerView, "trailingAnchor"));
  v126 = v26;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -16.0));
  v129[1] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_topActionsContainerView, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v38));
  v129[2] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);

  v47 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v51 = (UIView *)objc_msgSend(v47, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  metadataContainerView = self->_metadataContainerView;
  self->_metadataContainerView = v51;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_metadataContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v53) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_metadataContainerView, "setContentHuggingPriority:forAxis:", 1, v53);
  LODWORD(v54) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_metadataContainerView, "setContentCompressionResistancePriority:forAxis:", 1, v54);
  objc_msgSend(v126, "addSubview:", self->_metadataContainerView);
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_metadataContainerView, "leadingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v116));
  v128[0] = v110;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_metadataContainerView, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v100));
  v128[1] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_metadataContainerView, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_topActionsContainerView, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v57));
  v128[2] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_metadataContainerView, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v60));
  v128[3] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v62);

  v63 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", -[SimpleContaineeViewController tableViewStyle](self, "tableViewStyle"), CGRectZero.origin.x, y, width, height);
  actionsTableView = self->_actionsTableView;
  self->_actionsTableView = v63;

  -[MapsThemeTableView setAccessibilityIdentifier:](self->_actionsTableView, "setAccessibilityIdentifier:", CFSTR("ActionsTableView"));
  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionsTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SimpleContaineeViewController registerActionsTableViewCellClasses](self, "registerActionsTableViewCellClasses");
  if (-[MapsThemeTableView style](self->_actionsTableView, "style"))
    -[MapsThemeTableView _setTopPadding:](self->_actionsTableView, "_setTopPadding:", 0.0);
  -[MapsThemeTableView setDelegate:](self->_actionsTableView, "setDelegate:", self);
  -[MapsThemeTableView setDataSource:](self->_actionsTableView, "setDataSource:", self);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeTableView setBackgroundColor:](self->_actionsTableView, "setBackgroundColor:", v65);

  -[MapsThemeTableView setScrollEnabled:](self->_actionsTableView, "setScrollEnabled:", 0);
  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](self->_actionsTableView, "setPreservesSuperviewLayoutMargins:", 1);
  if (sub_1002A8AA0(self) == 5)
  {
    -[MapsThemeTableView setSeparatorStyle:](self->_actionsTableView, "setSeparatorStyle:", 0);
    -[MapsThemeTableView setSeparatorInset:](self->_actionsTableView, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
  }
  v66 = 0.0;
  -[MapsThemeTableView setDirectionalLayoutMargins:](self->_actionsTableView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  -[MapsThemeTableView setCellLayoutMarginsFollowReadableWidth:](self->_actionsTableView, "setCellLayoutMarginsFollowReadableWidth:", 0);
  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](self->_actionsTableView, "setPreservesSuperviewLayoutMargins:", 0);
  objc_msgSend(v126, "addSubview:", self->_actionsTableView);
  v67 = 0.0;
  if (!-[SimpleContaineeViewController tableViewStyle](self, "tableViewStyle"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v68, "userInterfaceIdiom") == (id)5)
      v67 = 17.0;
    else
      v67 = 10.0;

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v69, "userInterfaceIdiom") == (id)5)
    v66 = 17.0;

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](self->_actionsTableView, "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_metadataContainerView, "bottomAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:constant:", v117, v67));
  v127[0] = v111;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](self->_actionsTableView, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v101));
  v127[1] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](self->_actionsTableView, "trailingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintLessThanOrEqualToAnchor:", v72));
  v127[2] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](self->_actionsTableView, "bottomAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", v75, -v66));
  v127[3] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v127, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView heightAnchor](self->_actionsTableView, "heightAnchor"));
  v79 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", 0.0));
  actionsTableHeightConstraint = self->_actionsTableHeightConstraint;
  self->_actionsTableHeightConstraint = v79;

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView widthAnchor](self->_actionsTableView, "widthAnchor"));
  -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
  v82 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToConstant:"));
  actionsTableWidthConstraint = self->_actionsTableWidthConstraint;
  self->_actionsTableWidthConstraint = v82;

  -[NSLayoutConstraint setActive:](self->_actionsTableHeightConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_actionsTableWidthConstraint, "setActive:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  v7.receiver = self;
  v7.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)registerActionsTableViewCellClasses
{
  -[MapsThemeTableView registerClass:forCellReuseIdentifier:](self->_actionsTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("ActionCell"));
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;

  if (-[SimpleContaineeViewController isViewLoaded](self, "isViewLoaded") && sub_1002A8AA0(self) == 5)
  {
    -[SimpleContaineeViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
    v4 = v3;
    v6 = v5;
    v7 = fabs(v5);
    if (fabs(v3) > 2.22044605e-16 && v7 > 2.22044605e-16)
    {
      -[SimpleContaineeViewController preferredContentSize](self, "preferredContentSize", 2.22044605e-16, v7);
      if (v4 != v10 || v6 != v9)
        -[SimpleContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    }
  }
}

- (CGSize)_calculatePreferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  if (-[SimpleContaineeViewController isViewLoaded](self, "isViewLoaded") && sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController view](self, "view"));
    objc_msgSend(v3, "layoutIfNeeded");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
    objc_msgSend(v4, "systemLayoutSizeFittingSize:");
    v6 = v5;

    -[UIScrollView contentSize](self->_contentScrollView, "contentSize");
    v8 = v6 + v7;
    -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
    v10 = v9;
  }
  else
  {
    -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
    v10 = v11;
    -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
    v8 = v12;
  }
  v13 = v10;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)preferredWidth
{
  double v3;
  void *v4;
  double v5;

  if (sub_1002A8AA0(self) == 5)
    return 282.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v4, "bounds");
  v3 = v5;

  return v3;
}

- (BOOL)headerNeeded
{
  return 1;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &unk_1014D3120)
  {
    -[SimpleContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
  else if (a6 == &unk_1014D3128)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController view](self, "view"));
    objc_msgSend(v13, "setNeedsLayout");

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SimpleContaineeViewController;
    -[SimpleContaineeViewController observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v26, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  -[MapsThemeTableView setSeparatorColor:](self->_actionsTableView, "setSeparatorColor:", v4);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView indexPathsForVisibleRows](self->_actionsTableView, "indexPathsForVisibleRows"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend(v9, "section");
        if (v10 == (id)-[SimpleContaineeViewController _actionsSectionIndex](self, "_actionsSectionIndex"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionForIndexPath:](self, "actionForIndexPath:", v9));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView cellForRowAtIndexPath:](self->_actionsTableView, "cellForRowAtIndexPath:", v9));
          v13 = v7;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentConfiguration"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageProperties"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredSymbolConfiguration"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController _colorConfigurationForAction:](self, "_colorConfigurationForAction:", v11));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configurationByApplyingConfiguration:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageProperties"));
          objc_msgSend(v19, "setPreferredSymbolConfiguration:", v18);

          objc_msgSend(v12, "setContentConfiguration:", v14);
          v7 = v13;
          v6 = v20;

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  -[MapsThemeTableView contentSize](self->_actionsTableView, "contentSize");
  -[NSLayoutConstraint setConstant:](self->_actionsTableHeightConstraint, "setConstant:", v3);
  -[SimpleContaineeViewController preferredWidth](self, "preferredWidth");
  -[NSLayoutConstraint setConstant:](self->_actionsTableWidthConstraint, "setConstant:");
  -[MapsThemeTableView layoutIfNeeded](self->_actionsTableView, "layoutIfNeeded");
  -[MapsThemeTableView contentSize](self->_actionsTableView, "contentSize");
  -[NSLayoutConstraint setConstant:](self->_actionsTableHeightConstraint, "setConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6 <= 320.0;

  -[UIStackView setAxis:](self->_topActionsContainerView, "setAxis:", v7);
  -[UIStackView setSpacing:](self->_topActionsContainerView, "setSpacing:", 10.0);
}

- (void)setActions:(id)a3
{
  NSArray *v5;
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *footerText;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = (NSArray *)a3;
  if (self->_actions != v5)
  {
    objc_storeStrong((id *)&self->_actions, a3);
    if (-[NSArray count](v5, "count"))
    {
      v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v5, "count"));
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v5;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "footer", (_QWORD)v20));
            v14 = objc_msgSend(v13, "length");

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "footer"));
              objc_msgSend(v6, "addObject:", v15);

            }
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      v16 = objc_msgSend(v6, "count");
      if (v16)
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\n")));
      else
        v17 = 0;
      objc_storeStrong((id *)&self->_footerText, v17);
      if (v16)

    }
    else
    {
      footerText = self->_footerText;
      self->_footerText = 0;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionsTableView](self, "actionsTableView", (_QWORD)v20));
    objc_msgSend(v19, "reloadData");

  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIScrollView *contentScrollView;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  contentScrollView = self->_contentScrollView;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  -[UIScrollView convertRect:fromCoordinateSpace:](contentScrollView, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[SimpleContaineeViewController adjustScrollForKeyboardWithRect:](self, "adjustScrollForKeyboardWithRect:", v18, v20, v22, v24);
}

- (void)keyboardWillHide:(id)a3
{
  -[UIScrollView setContentInset:](self->_contentScrollView, "setContentInset:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
}

- (void)adjustScrollForKeyboardWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIScrollView bounds](self->_contentScrollView, "bounds");
  MaxY = CGRectGetMaxY(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIScrollView setContentInset:](self->_contentScrollView, "setContentInset:", 0.0, 0.0, MaxY - CGRectGetMinY(v10) + 15.0, 0.0);
}

- (id)actionForIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == (id)-[SimpleContaineeViewController _actionsSectionIndex](self, "_actionsSectionIndex")
    && (v6 = objc_msgSend(v4, "row"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actions](self, "actions")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        (uint64_t)v6 < (uint64_t)v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actions](self, "actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actions](self, "actions", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionForIndexPath:](self, "actionForIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ActionCell"), v6));

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController configurationForAction:](self, "configurationForAction:", v8));
    objc_msgSend(v9, "setContentConfiguration:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityIdentifier"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "labelAccessibilityIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
    objc_msgSend(v13, "setAccessibilityIdentifier:", v12);

  }
  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  if (!objc_msgSend(a3, "style"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
}

- (id)_primaryColorForAction:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(a3, "glyphStyle") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));

  }
  return v5;
}

- (id)_colorConfigurationForAction:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController _primaryColorForAction:](self, "_primaryColorForAction:", v4));
  v6 = objc_msgSend(v4, "glyphStyle");

  if ((v6 & 2) != 0)
  {
    v11[0] = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v9));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationPreferringMonochrome](UIImageSymbolConfiguration, "configurationPreferringMonochrome"));
  }

  return v7;
}

- (id)configurationForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController _primaryColorForAction:](self, "_primaryColorForAction:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  objc_msgSend(v6, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  objc_msgSend(v8, "setColor:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "glyph"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9));
  objc_msgSend(v6, "setImage:", v10);

  v11 = sub_1002A8AA0(self);
  v12 = 21.0;
  if (v11 == 5)
    v12 = 17.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController _colorConfigurationForAction:](self, "_colorConfigurationForAction:", v4));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configurationByApplyingConfiguration:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProperties"));
  objc_msgSend(v16, "setTintColor:", v5);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProperties"));
  objc_msgSend(v17, "setPreferredSymbolConfiguration:", v15);

  return v6;
}

- (int64_t)_actionsSectionIndex
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actions](self, "actions"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return (int64_t)-[MapsThemeTableView numberOfSections](self->_actionsTableView, "numberOfSections") - 1;
  else
    return -1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeViewController actionForIndexPath:](self, "actionForIndexPath:", v6));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "action"));
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SimpleContaineeViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v10, "scrollViewDidScroll:", v4);
  objc_msgSend(v4, "contentOffset");
  v5 = 0.0;
  if (v6 > 0.0)
  {
    objc_msgSend(v4, "contentOffset", 0.0);
    v8 = v7 < 10.0;
    v9 = 10.0;
    if (v8)
      objc_msgSend(v4, "contentOffset");
    v5 = v9 / 10.0;
  }
  -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", v5);

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "viewControllerClosed:animated:", self, 1);

}

- (NSArray)actions
{
  return self->_actions;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (UIView)metadataContainerView
{
  return self->_metadataContainerView;
}

- (UIStackView)topActionsContainerView
{
  return self->_topActionsContainerView;
}

- (MapsThemeTableView)actionsTableView
{
  return self->_actionsTableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsTableView, 0);
  objc_storeStrong((id *)&self->_topActionsContainerView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_largeWidthConstraints, 0);
  objc_storeStrong((id *)&self->_smallWidthConstraints, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_actionsTableWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionsTableHeightConstraint, 0);
  objc_storeStrong((id *)&self->_metadataContainerView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_viewsToObserveBoundsChanges, 0);
}

@end
