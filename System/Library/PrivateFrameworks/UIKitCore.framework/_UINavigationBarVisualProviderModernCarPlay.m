@implementation _UINavigationBarVisualProviderModernCarPlay

- (void)prepare
{
  void *v3;
  UIVisualEffectView *v4;
  UIView *v5;
  void *v6;
  UINavigationBar *navigationBar;
  void *v8;
  _CarTitleView *v9;
  _CarTitleView *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  UINavigationBar *v19;
  void *v20;
  void *v21;
  void *v22;
  UINavigationBar *v23;
  void *v24;
  void *v25;
  _UINavigationBarVisualProviderModernCarPlay *v26;
  _UIButtonBarButton *v27;
  _UIButtonBarButtonVisualProviderCarPlay *v28;
  _UIButtonBarButton *v29;
  double v30;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
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
  UIFocusContainerGuide *v102;
  UIFocusContainerGuide *focusContainerGuide;
  UINavigationBar *v104;
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
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  UIVisualEffectView *v217;
  objc_super v218;
  _QWORD v219[25];
  _QWORD v220[4];

  v220[2] = *MEMORY[0x1E0C80C00];
  if (!-[_UINavigationBarVisualProviderModernCarPlay havePrepared](self, "havePrepared"))
  {
    -[_UINavigationBarVisualProviderModernCarPlay setHavePrepared:](self, "setHavePrepared:", 1);
    v218.receiver = self;
    v218.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
    -[_UINavigationBarVisualProvider prepare](&v218, sel_prepare);
    -[UIView setLayoutMargins:](self->super._navigationBar, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->super._navigationBar, "setBackgroundColor:", v3);

    v4 = objc_alloc_init(UIVisualEffectView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UINavigationBarVisualProviderModernCarPlay setBackgroundView:](self, "setBackgroundView:", v4);
    v217 = v4;
    -[UIView addSubview:](self->super._navigationBar, "addSubview:", v4);
    -[_UINavigationBarVisualProviderModernCarPlay _configureBackground](self, "_configureBackground");
    v5 = objc_alloc_init(UIView);
    -[_UINavigationBarVisualProviderModernCarPlay setContentView:](self, "setContentView:", v5);

    -[_UINavigationBarVisualProviderModernCarPlay contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    navigationBar = self->super._navigationBar;
    -[_UINavigationBarVisualProviderModernCarPlay contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](navigationBar, "addSubview:", v8);

    v9 = [_CarTitleView alloc];
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UINavigationBarVisualProviderModernCarPlay setTitleView:](self, "setTitleView:", v10);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1144750080;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1111752704;
    objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v15);

    -[_UINavigationBarVisualProviderModernCarPlay contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    _newButtonBar(self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLeadingBar:](self, "setLeadingBar:", v18);

    v19 = self->super._navigationBar;
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](self, "leadingBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v19, "addSubview:", v21);

    _newButtonBar(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setTrailingBar:](self, "setTrailingBar:", v22);

    v23 = self->super._navigationBar;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](self, "trailingBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v23, "addSubview:", v25);

    v26 = self;
    v27 = [_UIButtonBarButton alloc];
    v28 = objc_alloc_init(_UIButtonBarButtonVisualProviderCarPlay);
    v29 = -[_UIButtonBarButton initWithVisualProvider:](v27, "initWithVisualProvider:", v28);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v30) = 1144586240;
    -[UIView setContentCompressionResistancePriority:forAxis:](v29, "setContentCompressionResistancePriority:forAxis:", 0, v30);
    -[UIControl addTarget:action:forControlEvents:](v29, "addTarget:action:forControlEvents:", v26, sel___backButtonAction, 0x2000);

    -[_UINavigationBarVisualProviderModernCarPlay setBackBarButton:](v26, "setBackBarButton:", v29);
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](v26, "backBarButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    -[UIView _setWantsAutolayout](self->super._navigationBar, "_setWantsAutolayout");
    if (-[UIView translatesAutoresizingMaskIntoConstraints](self->super._navigationBar, "translatesAutoresizingMaskIntoConstraints"))
    {
      -[UIView _setHostsLayoutEngine:](self->super._navigationBar, "_setHostsLayoutEngine:", 1);
    }
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 12.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarConstraint:](v26, "setLeadingBarConstraint:", v38);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToConstant:", 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarNoItemsConstraint:](v26, "setLeadingBarNoItemsConstraint:", v42);

    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarNoItemsConstraint:](v26, "setTrailingBarNoItemsConstraint:", v46);

    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](v26, "backBarButton");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "leadingAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "leadingAnchor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "constraintEqualToAnchor:", v209);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v220[0] = v47;
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](v26, "backBarButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v220[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setBackButtonConstraints:](v26, "setBackButtonConstraints:", v54);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 12.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLargeTitleLeadingConstraint:](v26, "setLargeTitleLeadingConstraint:", v59);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, -12.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLargeTitleTrailingConstraint:](v26, "setLargeTitleTrailingConstraint:", v64);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "centerXAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "centerXAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setRegularTitleConstraint:](v26, "setRegularTitleConstraint:", v69);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", v74, -12.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarWithTitleTrailingConstraint:](v26, "setLeadingBarWithTitleTrailingConstraint:", v75);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "view");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "view");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", v81, -12.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarWithNoTitleTrailingConstraint:](v26, "setLeadingBarWithNoTitleTrailingConstraint:", v82);

    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintGreaterThanOrEqualToAnchor:constant:", v87, 12.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarWithTitleLeadingConstraint:](v26, "setTrailingBarWithTitleLeadingConstraint:", v88);

    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "view");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintGreaterThanOrEqualToAnchor:constant:", v94, 12.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarWithNoTitleLeadingConstraint:](v26, "setTrailingBarWithNoTitleLeadingConstraint:", v95);

    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "view");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v100, -12.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarConstraint:](v26, "setTrailingBarConstraint:", v101);

    v102 = objc_alloc_init(UIFocusContainerGuide);
    focusContainerGuide = v26->_focusContainerGuide;
    v26->_focusContainerGuide = v102;

    v104 = self->super._navigationBar;
    -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](v26, "focusContainerGuide");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addLayoutGuide:](v104, "addLayoutGuide:", v105);

    v168 = (void *)MEMORY[0x1E0D156E0];
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "topAnchor");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "topAnchor");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "constraintEqualToAnchor:", v210);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v219[0] = v208;
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "bottomAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "bottomAnchor");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "constraintEqualToAnchor:", v204);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v219[1] = v203;
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "leftAnchor");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "leftAnchor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "constraintEqualToAnchor:", v199);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v219[2] = v198;
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "rightAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "rightAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "constraintEqualToAnchor:", v194);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v219[3] = v193;
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](v26, "backBarButton");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "topAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "topAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "constraintEqualToAnchor:", v189);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v219[4] = v188;
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](v26, "backBarButton");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "bottomAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "bottomAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintEqualToAnchor:", v184);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v219[5] = v183;
    -[_UINavigationBarVisualProviderModernCarPlay leadingBarConstraint](v26, "leadingBarConstraint");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v219[6] = v182;
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "view");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "topAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "topAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "constraintEqualToAnchor:", v177);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v219[7] = v176;
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](v26, "leadingBar");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "view");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "bottomAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "bottomAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "constraintEqualToAnchor:", v171);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v219[8] = v170;
    -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithTitleTrailingConstraint](v26, "leadingBarWithTitleTrailingConstraint");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v219[9] = v169;
    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "centerYAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "centerYAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintEqualToAnchor:", v164);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v219[10] = v163;
    -[_UINavigationBarVisualProviderModernCarPlay titleView](v26, "titleView");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "heightAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay contentView](v26, "contentView");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "heightAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "constraintEqualToAnchor:", v159);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v219[11] = v158;
    -[_UINavigationBarVisualProviderModernCarPlay regularTitleConstraint](v26, "regularTitleConstraint");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v219[12] = v157;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithTitleLeadingConstraint](v26, "trailingBarWithTitleLeadingConstraint");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v219[13] = v156;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBarConstraint](v26, "trailingBarConstraint");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v219[14] = v155;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "view");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "topAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToAnchor:", v150);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v219[15] = v149;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](v26, "trailingBar");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "view");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "bottomAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "bottomAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v144);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v219[16] = v143;
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](v26, "backgroundView");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "topAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->super._navigationBar, "topAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToAnchor:", v140);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v219[17] = v139;
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](v26, "backgroundView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "bottomAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->super._navigationBar, "bottomAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v136);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v219[18] = v135;
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](v26, "backgroundView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "leftAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->super._navigationBar, "leftAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v132);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v219[19] = v131;
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](v26, "backgroundView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "rightAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->super._navigationBar, "rightAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v128);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v219[20] = v127;
    -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](v26, "focusContainerGuide");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "leadingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v123);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v219[21] = v122;
    -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](v26, "focusContainerGuide");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "trailingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintEqualToAnchor:", v118);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v219[22] = v117;
    -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](v26, "focusContainerGuide");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "topAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "topAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v219[23] = v109;
    -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](v26, "focusContainerGuide");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->super._navigationBar, "safeAreaLayoutGuide");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "bottomAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v219[24] = v114;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v219, 25);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "activateConstraints:", v115);

  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UINavigationBar *navigationBar;
  void *v13;
  objc_super v14;

  -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setTitleView:](self, "setTitleView:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay leadingBar](self, "leadingBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setLeadingBar:](self, "setLeadingBar:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay trailingBar](self, "trailingBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setTrailingBar:](self, "setTrailingBar:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setBackBarButton:](self, "setBackBarButton:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setBackgroundView:](self, "setBackgroundView:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[_UINavigationBarVisualProviderModernCarPlay setContentView:](self, "setContentView:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay debugViews](self, "debugViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_219);

  -[_UINavigationBarVisualProviderModernCarPlay setDebugViews:](self, "setDebugViews:", 0);
  navigationBar = self->super._navigationBar;
  -[_UINavigationBarVisualProviderModernCarPlay focusContainerGuide](self, "focusContainerGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView removeLayoutGuide:](navigationBar, "removeLayoutGuide:", v13);

  -[_UINavigationBarVisualProviderModernCarPlay setFocusContainerGuide:](self, "setFocusContainerGuide:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarConstraint:](self, "setLeadingBarConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setLeadingBarNoItemsConstraint:](self, "setLeadingBarNoItemsConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarConstraint:](self, "setTrailingBarConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setTrailingBarNoItemsConstraint:](self, "setTrailingBarNoItemsConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setBackButtonConstraints:](self, "setBackButtonConstraints:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setLargeTitleLeadingConstraint:](self, "setLargeTitleLeadingConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setLargeTitleTrailingConstraint:](self, "setLargeTitleTrailingConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setRegularTitleConstraint:](self, "setRegularTitleConstraint:", 0);
  -[_UINavigationBarVisualProviderModernCarPlay setHavePrepared:](self, "setHavePrepared:", 0);
  v14.receiver = self;
  v14.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
  -[_UINavigationBarVisualProvider teardown](&v14, sel_teardown);
}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", v7);

  -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) == 0)
  {
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewsRepresentingBackButton:", v11);

  }
}

- (void)stackDidChangeFrom:(id)a3
{
  -[_UINavigationBarItemStack setChangeObserver:](self->super._stack, "setChangeObserver:", self);
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentAnimated:completion:direction:](self, "_updateContentAnimated:completion:direction:", 0, 0, 0);
}

- (void)setupTopNavigationItem
{
  void *v3;
  id v4;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v4, v3, 0, 0);

}

- (void)updateTopNavigationItemAnimated:(BOOL)a3
{
  void *v4;
  id v5;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v5, v4, 0, 0);

}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentAnimated:completion:direction:](self, "_updateContentAnimated:completion:direction:", a3, a4, 1);
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentAnimated:completion:direction:](self, "_updateContentAnimated:completion:direction:", a3, a4, 2);
}

- (void)navigationBarInvalidatedResolvedLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[UINavigationBar _resolvedLayoutMargins](self->super._navigationBar, "_resolvedLayoutMargins");
  v5 = v4;
  if (v3 == 0.0)
    v6 = 12.0;
  else
    v6 = v3;
  -[_UINavigationBarVisualProviderModernCarPlay leadingBarConstraint](self, "leadingBarConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  if (v5 == 0.0)
    v8 = 12.0;
  else
    v8 = v5;
  v9 = -v8;
  -[_UINavigationBarVisualProviderModernCarPlay trailingBarConstraint](self, "trailingBarConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  if (a3.width == 0.0)
  {
    -[UIView superview](self->super._navigationBar, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "bounds");
      width = v6;
    }

  }
  v7 = 44.0;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
  -[_UINavigationBarVisualProvider traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UINavigationBarVisualProviderModernCarPlay _configureBackground](self, "_configureBackground");
}

- (void)__backButtonAction
{
  UINavigationBar *navigationBar;
  void *v3;
  id v4;

  navigationBar = self->super._navigationBar;
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveBackBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _sendNavigationPopForBackBarButtonItem:](navigationBar, "_sendNavigationPopForBackBarButtonItem:", v3);

}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5 direction:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
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
  void *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  UIBarButtonItemGroup *v76;
  UIBarButtonItemGroup *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  UIView *v86;
  UIView *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  UILayoutGuide *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  UIView *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
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
  UIView *v135;
  UIView *v136;
  void *v137;
  unint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  double v143;
  void *v144;
  void *v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  id v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  char v180;
  unint64_t v181;
  void *v182;
  void *v183;
  UIView *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  UIView *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  double v208;
  void *v209;
  void *v210;
  double v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  id v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  id v241;
  UIView *v242;
  UIView *v243;
  id v244;
  id v245;
  UIView *v246;
  id v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  id v257;
  UIView *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  UIView *v265;
  void *v266;
  void *v267;
  void *v268;
  UILayoutGuide *v269;
  void *v270;
  UIBarButtonItemGroup *v271;
  void *v272;
  id v273;
  UIView *v274;
  int v275;
  BOOL v276;
  void *v277;
  UIBarButtonItemGroup *v278;
  id v280;
  uint64_t v281;
  void *v282;
  void *v283;
  void *v284;
  _QWORD v285[5];
  UIView *v286;
  id v287;
  _QWORD v288[5];
  id v289;
  UIView *v290;
  id v291;
  id v292;
  id v293;
  _QWORD v294[5];
  UIBarButtonItemGroup *v295;
  _QWORD v296[5];
  UIBarButtonItemGroup *v297;
  _QWORD v298[3];
  _QWORD v299[4];
  _QWORD v300[4];
  _QWORD v301[4];
  _QWORD v302[4];
  UIBarButtonItemGroup *v303;
  UIBarButtonItemGroup *v304;
  _QWORD v305[2];
  _QWORD v306[2];
  _QWORD v307[2];
  _QWORD v308[2];
  _QWORD v309[2];
  _QWORD v310[4];

  v310[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v280 = a4;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v9, "titleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v276 = a5;
  if (v12)
  {
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    objc_msgSend(v9, "titleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setView:", v14);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithNoTitleTrailingConstraint](self, "leadingBarWithNoTitleTrailingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v310[0] = v16;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithNoTitleLeadingConstraint](self, "trailingBarWithNoTitleLeadingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v310[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v310, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v18);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithTitleTrailingConstraint](self, "leadingBarWithTitleTrailingConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v309[0] = v19;
    -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithTitleLeadingConstraint](self, "trailingBarWithTitleLeadingConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v309[1] = v20;
    v21 = v309;
  }
  else
  {
    objc_msgSend(v9, "title");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22
      && (v23 = (void *)v22,
          objc_msgSend(v9, "title"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "isEqualToString:", &stru_1E16EDF20),
          v24,
          v23,
          (v25 & 1) == 0))
    {
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 0);

      objc_msgSend(v9, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v31);

      -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithNoTitleTrailingConstraint](self, "leadingBarWithNoTitleTrailingConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v308[0] = v33;
      -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithNoTitleLeadingConstraint](self, "trailingBarWithNoTitleLeadingConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v308[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v308, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v35);

      -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithTitleTrailingConstraint](self, "leadingBarWithTitleTrailingConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v307[0] = v19;
      -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithTitleLeadingConstraint](self, "trailingBarWithTitleLeadingConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v307[1] = v20;
      v21 = v307;
    }
    else
    {
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidden:", 1);

      -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithTitleTrailingConstraint](self, "leadingBarWithTitleTrailingConstraint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v306[0] = v27;
      -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithTitleLeadingConstraint](self, "trailingBarWithTitleLeadingConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v306[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v306, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v29);

      -[_UINavigationBarVisualProviderModernCarPlay leadingBarWithNoTitleTrailingConstraint](self, "leadingBarWithNoTitleTrailingConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v305[0] = v19;
      -[_UINavigationBarVisualProviderModernCarPlay trailingBarWithNoTitleLeadingConstraint](self, "trailingBarWithNoTitleLeadingConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v305[1] = v20;
      v21 = v305;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v36);

  objc_msgSend(v280, "_effectiveBackBarButtonItem");
  v37 = objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v9, "hidesBackButton");
  objc_msgSend(v9, "leftItemsSupplementBackButton");
  objc_msgSend(v9, "leftBarButtonItems");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  v41 = (void *)MEMORY[0x1E0C9AA60];
  if (v39)
    v42 = (void *)v39;
  else
    v42 = (void *)MEMORY[0x1E0C9AA60];
  v43 = v42;

  objc_msgSend(v9, "rightBarButtonItems");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44)
    v44 = v41;
  objc_msgSend(v44, "reverseObjectEnumerator");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "allObjects");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = objc_msgSend(v48, "isHidden");

  v284 = v43;
  v49 = objc_msgSend(v43, "count");
  -[_UINavigationBarVisualProviderModernCarPlay leadingBarNoItemsConstraint](self, "leadingBarNoItemsConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    v51 = v10;
  else
    v51 = v11;
  objc_msgSend(v51, "addObject:", v50);

  v52 = objc_msgSend(v47, "count");
  -[_UINavigationBarVisualProviderModernCarPlay trailingBarNoItemsConstraint](self, "trailingBarNoItemsConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    v54 = v10;
  else
    v54 = v11;
  objc_msgSend(v54, "addObject:", v53);

  -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  v283 = (void *)v37;
  if (!v37 || (v38 & 1) != 0)
  {
    objc_msgSend(v55, "setHidden:", 1);

    -[_UINavigationBarVisualProviderModernCarPlay backButtonConstraints](self, "backButtonConstraints");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v66);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBarConstraint](self, "leadingBarConstraint");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v67);

    v64 = v43;
    v65 = v276;
    if (objc_msgSend(v284, "count"))
    {
      -[_UINavigationBarVisualProviderModernCarPlay regularTitleConstraint](self, "regularTitleConstraint");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v68);

      -[_UINavigationBarVisualProviderModernCarPlay largeTitleLeadingConstraint](self, "largeTitleLeadingConstraint");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v69);

      -[_UINavigationBarVisualProviderModernCarPlay largeTitleTrailingConstraint](self, "largeTitleTrailingConstraint");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v70);

      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setLargeText:", 0);
    }
    else
    {
      -[_UINavigationBarVisualProviderModernCarPlay largeTitleLeadingConstraint](self, "largeTitleLeadingConstraint");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v71);

      -[_UINavigationBarVisualProviderModernCarPlay regularTitleConstraint](self, "regularTitleConstraint");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v72);

      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setLargeText:", 1);

      v74 = objc_msgSend(v47, "count");
      -[_UINavigationBarVisualProviderModernCarPlay largeTitleTrailingConstraint](self, "largeTitleTrailingConstraint");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v74)
        v75 = v10;
      else
        v75 = v11;
      objc_msgSend(v75, "addObject:", v63);
    }
  }
  else
  {
    objc_msgSend(v55, "setHidden:", 0);

    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "configureBackButtonFromBarItem:withAppearanceDelegate:", v37, self);

    -[_UINavigationBarVisualProviderModernCarPlay backButtonConstraints](self, "backButtonConstraints");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v58);

    -[_UINavigationBarVisualProviderModernCarPlay regularTitleConstraint](self, "regularTitleConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v59);

    -[_UINavigationBarVisualProviderModernCarPlay largeTitleLeadingConstraint](self, "largeTitleLeadingConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v60);

    -[_UINavigationBarVisualProviderModernCarPlay largeTitleTrailingConstraint](self, "largeTitleTrailingConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v61);

    -[_UINavigationBarVisualProviderModernCarPlay leadingBarConstraint](self, "leadingBarConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v62);

    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setLargeText:", 0);
    v64 = v43;
    v65 = v276;
  }

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v10);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v11);
  v76 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", v64, 0);
  v77 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", v47, 0);
  v278 = v76;
  if (!v65)
  {
    v304 = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v304, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay leadingBar](self, "leadingBar");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setBarButtonGroups:", v93);

    v303 = v77;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v303, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](self, "trailingBar");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setBarButtonGroups:", v95);
LABEL_87:

    goto LABEL_88;
  }
  -[_UINavigationBarVisualProviderModernCarPlay leadingBar](self, "leadingBar");
  v271 = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v11;
  v80 = MEMORY[0x1E0C809B0];
  v296[0] = MEMORY[0x1E0C809B0];
  v296[1] = 3221225472;
  v277 = v47;
  v296[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke;
  v296[3] = &unk_1E16B1B50;
  v296[4] = self;
  v297 = v76;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v79, 5242880, v296, &__block_literal_global_53_0, 0.35);

  v77 = v271;
  v64 = v284;
  -[_UINavigationBarVisualProviderModernCarPlay trailingBar](self, "trailingBar");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v294[0] = v80;
  v11 = v272;
  v294[1] = 3221225472;
  v294[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_3;
  v294[3] = &unk_1E16B1B50;
  v294[4] = self;
  v295 = v271;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v82, 5242880, v294, &__block_literal_global_54_1, 0.35);

  if (a6)
  {
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "visualProvider");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "contentView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = [UIView alloc];
    v87 = -[UIView initWithFrame:](v86, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setClipsToBounds:](v87, "setClipsToBounds:", 1);
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = v87;
    objc_msgSend(v88, "addSubview:", v87);

    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v87) = objc_msgSend(v89, "isHidden");

    v270 = v85;
    if ((_DWORD)v87)
    {
      -[_UINavigationBarVisualProviderModernCarPlay leadingBar](self, "leadingBar");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "view");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "trailingAnchor");
      v92 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v85, "leadingAnchor");
      v92 = objc_claimAutoreleasedReturnValue();
    }
    v97 = objc_alloc_init(UILayoutGuide);
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addLayoutGuide:", v97);

    -[UILayoutGuide trailingAnchor](v97, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay trailingBar](self, "trailingBar");
    v100 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v100, "view");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    v262 = v103;
    LODWORD(v104) = 1148846080;
    objc_msgSend(v103, "setPriority:", v104);
    v269 = v97;
    -[UILayoutGuide leadingAnchor](v97, "leadingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v92);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v107) = 1148846080;
    objc_msgSend(v106, "setPriority:", v107);
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v100) = objc_msgSend(v108, "isHidden");

    if ((v100 & 1) == 0)
      objc_msgSend(v106, "setConstant:", -4.0);
    v255 = (void *)v92;
    v256 = v10;
    v257 = v9;
    v273 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "snapshotViewAfterScreenUpdates:", 0);
    v110 = (UIView *)objc_claimAutoreleasedReturnValue();

    v260 = v106;
    v258 = v110;
    if (v110)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v110, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](v274, "addSubview:", v110);
      -[UIView centerXAnchor](v110, "centerXAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "centerXAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:", v113);
      v114 = objc_claimAutoreleasedReturnValue();

      v264 = (void *)v114;
      v302[0] = v114;
      -[UIView heightAnchor](v110, "heightAnchor");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "frame");
      objc_msgSend(v266, "constraintEqualToConstant:", v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v302[1] = v117;
      -[UIView widthAnchor](v110, "widthAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "frame");
      objc_msgSend(v118, "constraintEqualToConstant:", v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v302[2] = v121;
      -[UIView centerYAnchor](v110, "centerYAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](v274, "centerYAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "constraintEqualToAnchor:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v302[3] = v124;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v302, 4);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "addObjectsFromArray:", v125);

      v106 = v260;
    }
    else
    {
      v264 = 0;
    }
    v301[0] = v106;
    v301[1] = v262;
    -[UILayoutGuide topAnchor](v269, "topAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "topAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToAnchor:", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v301[2] = v129;
    -[UILayoutGuide bottomAnchor](v269, "bottomAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "bottomAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v301[3] = v133;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v301, 4);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "addObjectsFromArray:", v134);

    v135 = objc_alloc_init(UIView);
    v136 = v274;
    -[UIView addSubview:](v274, "addSubview:", v135);
    v265 = v135;
    if ((v275 & 1) != 0)
    {
      v263 = 0;
      v259 = 0;
      v137 = v270;
      v138 = 0x1E0D15000;
    }
    else
    {
      v137 = v270;
      objc_msgSend(v270, "snapshotViewAfterScreenUpdates:", 0);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](v274, "addSubview:", v139);
      objc_msgSend(v139, "leadingAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v135, "leadingAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:", v141);
      v142 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v139, "heightAnchor");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "frame");
      objc_msgSend(v267, "constraintEqualToConstant:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v300[0] = v144;
      objc_msgSend(v139, "widthAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "frame");
      objc_msgSend(v145, "constraintEqualToConstant:", v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v300[1] = v147;
      v263 = (void *)v142;
      v300[2] = v142;
      v259 = v139;
      objc_msgSend(v139, "topAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v135, "topAnchor");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "constraintEqualToAnchor:", v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v300[3] = v150;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v300, 4);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "addObjectsFromArray:", v151);

      v135 = v265;
      v136 = v274;

      v138 = 0x1E0D15000uLL;
    }
    objc_msgSend(*(id *)(v138 + 1760), "activateConstraints:", v273);
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "layoutIfNeeded");

    -[UILayoutGuide layoutFrame](v269, "layoutFrame");
    -[UIView setFrame:](v136, "setFrame:");
    objc_msgSend(v137, "frame");
    v154 = v153;
    v156 = v155;
    v158 = v157;
    v160 = v159;
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](v136, "convertRect:fromView:", v161, v154, v156, v158, v160);
    -[UIView setFrame:](v135, "setFrame:");

    -[_UINavigationBarVisualProviderModernCarPlay _installGradientLayerMaskForClippingView:](self, "_installGradientLayerMaskForClippingView:", v136);
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "snapshotViewAfterScreenUpdates:", 1);
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v163, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v136, "addSubview:", v163);
    if (a6 == 1)
    {
      objc_msgSend(v163, "leadingAnchor");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v163, "leadingAnchor");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      if (v135)
      {
        -[UIView leadingAnchor](v135, "leadingAnchor");
        v165 = objc_claimAutoreleasedReturnValue();
        goto LABEL_46;
      }
    }
    -[UIView trailingAnchor](v136, "trailingAnchor");
    v165 = objc_claimAutoreleasedReturnValue();
LABEL_46:
    v166 = (void *)v165;
    objc_msgSend(v164, "constraintEqualToAnchor:", v165);
    v167 = objc_claimAutoreleasedReturnValue();

    v168 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v261 = (void *)v167;
    v299[0] = v167;
    objc_msgSend(v163, "heightAnchor");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "frame");
    objc_msgSend(v248, "constraintEqualToConstant:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v299[1] = v170;
    objc_msgSend(v163, "widthAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "frame");
    objc_msgSend(v171, "constraintEqualToConstant:", v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v299[2] = v174;
    v254 = v163;
    objc_msgSend(v163, "centerYAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v136, "centerYAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "constraintEqualToAnchor:", v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v299[3] = v177;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v299, 4);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = v168;
    objc_msgSend(v168, "addObjectsFromArray:", v178);

    if (!v280)
    {
      v185 = 0;
      v186 = 0;
      v253 = 0;
      v181 = 0x1E0D15000;
      v183 = v263;
      v182 = v264;
      v184 = v258;
      goto LABEL_50;
    }
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend(v179, "isHidden");

    v181 = 0x1E0D15000;
    v183 = v263;
    v182 = v264;
    v184 = v258;
    if ((v180 & 1) != 0)
    {
      v185 = 0;
      v186 = 0;
      v253 = 0;
LABEL_50:
      v187 = v261;
      goto LABEL_59;
    }
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "visualProvider");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "backIndicatorView");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v190, "snapshotViewAfterScreenUpdates:", 1);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "addSubview:", v191);

    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = v190;
    objc_msgSend(v190, "frame");
    v195 = v194;
    v197 = v196;
    v199 = v198;
    v201 = v200;
    -[_UINavigationBarVisualProviderModernCarPlay backBarButton](self, "backBarButton");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "convertRect:fromView:", v202, v195, v197, v199, v201);
    objc_msgSend(v191, "setFrame:");

    objc_msgSend(v270, "snapshotViewAfterScreenUpdates:", 1);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v274, "addSubview:", v186);
    v253 = v191;
    if (a6 == 1)
    {
      if (!v258)
        goto LABEL_57;
      objc_msgSend(v186, "leadingAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v258;
    }
    else
    {
      objc_msgSend(v186, "trailingAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v265;
    }
    -[UIView leadingAnchor](v204, "leadingAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "constraintEqualToAnchor:", v205);
    v206 = objc_claimAutoreleasedReturnValue();

    if (v206)
    {
      v281 = v206;
      objc_msgSend(v268, "addObject:", v206);
LABEL_58:
      objc_msgSend(v186, "heightAnchor");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "frame");
      objc_msgSend(v207, "constraintEqualToConstant:", v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v298[0] = v209;
      objc_msgSend(v186, "widthAnchor");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "frame");
      objc_msgSend(v210, "constraintEqualToConstant:", v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v298[1] = v212;
      objc_msgSend(v186, "topAnchor");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v265, "topAnchor");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "constraintEqualToAnchor:", v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v298[2] = v215;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v298, 3);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "addObjectsFromArray:", v216);

      v181 = 0x1E0D15000uLL;
      v183 = v263;
      v182 = v264;
      v184 = v258;
      v187 = v261;
      v185 = (void *)v281;
LABEL_59:
      objc_msgSend(*(id *)(v181 + 1760), "activateConstraints:", v268);
      -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "layoutIfNeeded");

      v218 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v219 = v218;
      v47 = v277;
      if (v187)
        objc_msgSend(v218, "addObject:", v187);
      if (v182)
        objc_msgSend(v219, "addObject:", v182);
      if (v183)
        objc_msgSend(v219, "addObject:", v183);
      if (v185)
        objc_msgSend(v219, "addObject:", v185);
      v282 = v185;
      objc_msgSend(*(id *)(v181 + 1760), "deactivateConstraints:", v219);
      v220 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v250 = v219;
      if (v254)
      {
        objc_msgSend(v254, "centerXAnchor", v219);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v222, "centerXAnchor");
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v221, "constraintEqualToAnchor:", v223);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v220, "addObject:", v224);

        v47 = v277;
      }
      if (a6 == 2)
      {
        v225 = v259;
        if (v259)
        {
          objc_msgSend(v259, "leadingAnchor");
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "leadingAnchor");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "constraintEqualToAnchor:", v227);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "addObject:", v228);

          v47 = v277;
        }
        if (v184)
        {
          -[UIView leadingAnchor](v184, "leadingAnchor");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView trailingAnchor](v274, "trailingAnchor");
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "constraintEqualToAnchor:", v230);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "addObject:", v231);

          v47 = v277;
        }
        if (!v186)
          goto LABEL_84;
        objc_msgSend(v186, "leadingAnchor");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v265, "leadingAnchor");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "constraintEqualToAnchor:constant:", v233, 0.0);
        v234 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v225 = v259;
        if (v282)
          objc_msgSend(v220, "addObject:");
        if (v184 && v270)
        {
          -[UIView leadingAnchor](v184, "leadingAnchor");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView leadingAnchor](v265, "leadingAnchor");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "constraintEqualToAnchor:", v236);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "addObject:", v237);

          v47 = v277;
        }
        if (!v259)
          goto LABEL_84;
        objc_msgSend(v259, "trailingAnchor");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v274, "leadingAnchor");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "constraintEqualToAnchor:", v233);
        v234 = objc_claimAutoreleasedReturnValue();
      }
      v238 = (void *)v234;
      objc_msgSend(v220, "addObject:", v234, v250);

      v225 = v259;
LABEL_84:
      objc_msgSend(*(id *)(v181 + 1760), "activateConstraints:", v220, v250);
      objc_msgSend(v254, "setAlpha:", 0.0);
      objc_msgSend(v186, "setAlpha:", 0.0);
      if (v275)
        objc_msgSend(v253, "setAlpha:", 0.0);
      -[_UINavigationBarVisualProviderModernCarPlay contentView](self, "contentView");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "setHidden:", 1);

      v240 = MEMORY[0x1E0C809B0];
      v288[0] = MEMORY[0x1E0C809B0];
      v288[1] = 3221225472;
      v288[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_5;
      v288[3] = &unk_1E16C7000;
      v288[4] = self;
      v289 = v225;
      v290 = v184;
      v291 = v186;
      v292 = v254;
      v293 = v253;
      v285[0] = v240;
      v285[1] = 3221225472;
      v285[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_6;
      v285[3] = &unk_1E16B2B40;
      v285[4] = self;
      v286 = v274;
      v287 = v293;
      v241 = v293;
      v242 = v184;
      v243 = v274;
      v244 = v254;
      v245 = v186;
      v246 = v242;
      v247 = v225;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v288, v285, 0.35, 0.0);

      v10 = v256;
      v9 = v257;
      v77 = v271;
      v11 = v272;
      v64 = v284;
      v95 = v270;
      v96 = v255;
      goto LABEL_87;
    }
LABEL_57:
    v281 = 0;
    goto LABEL_58;
  }
LABEL_88:

}

- (void)_updateContentAnimated:(BOOL)a3 completion:(id)a4 direction:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _BOOL8, void *);

  v6 = a3;
  v11 = (void (**)(id, _BOOL8, void *))a4;
  if (!-[_UINavigationBarVisualProviderModernCarPlay havePrepared](self, "havePrepared"))
    -[_UINavigationBarVisualProviderModernCarPlay prepare](self, "prepare");
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v8, v9, v6, a5);
  if (v11)
  {
    -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v6, v10);

  }
}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v4;
  id v5;

  stack = self->super._stack;
  v4 = a3;
  -[_UINavigationBarItemStack topItem](stack, "topItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v4;
  id v5;

  stack = self->super._stack;
  v4 = a3;
  -[_UINavigationBarItemStack backItem](stack, "backItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
    v8 = 0;
  else
    v8 = v6 == v9;
  if (v8)
    -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v9, v7, v4, 0);

}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
    v8 = 0;
  else
    v8 = v6 == v9;
  if (v8)
    -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v9, v7, v4, 0);

}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
    v8 = 0;
  else
    v8 = v7 == v9;
  if (v8)
    -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v6, v9, v4, 0);

}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
    v8 = 0;
  else
    v8 = v6 == v9;
  if (v8)
    -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v9, v7, v4, 0);

}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
    v8 = 0;
  else
    v8 = v6 == v9;
  if (v8)
    -[_UINavigationBarVisualProviderModernCarPlay _updateContentForTopItem:backItem:animated:direction:](self, "_updateContentForTopItem:backItem:animated:direction:", v9, v7, v4, 0);

}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  return 0;
}

- (BOOL)isRTL
{
  return -[UIView effectiveUserInterfaceLayoutDirection](self->super._navigationBar, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft;
}

- (_UIBarButtonItemAppearanceStorage)appearanceStorage
{
  _UIBarButtonItemAppearanceStorage *appearanceStorage;
  _UIBarButtonItemAppearanceStorage *v4;
  _UIBarButtonItemAppearanceStorage *v5;

  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v4 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    v5 = self->_appearanceStorage;
    self->_appearanceStorage = v4;

    appearanceStorage = self->_appearanceStorage;
  }
  return appearanceStorage;
}

- (int64_t)barType
{
  return 1;
}

- (int64_t)barMetrics
{
  return 0;
}

- (UIColor)tintColor
{
  return (UIColor *)+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
}

- (BOOL)centerTextButtons
{
  return 0;
}

- (double)defaultEdgeSpacing
{
  return 0.0;
}

- (double)defaultTextPadding
{
  return 0.0;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  return 15;
}

- (id)defaultFontDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  -[_UINavigationBarVisualProviderModernCarPlay titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleCallout"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backIndicatorImage
{
  return 0;
}

- (id)backIndicatorMaskImage
{
  return 0;
}

- (double)backButtonMargin
{
  return 0.0;
}

- (double)backButtonMaximumWidth
{
  return 110.0;
}

- (double)absorptionForItem:(id)a3
{
  return 0.0;
}

- (void)_configureBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "barStyle");

  if (v4 == 4)
  {
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](self, "backgroundView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

  }
  else
  {
    -[_UINavigationBarVisualProvider navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dbl_18667CA40[objc_msgSend(v8, "accessibilityContrast") == 1];

    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](self, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderModernCarPlay backgroundView](self, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundEffects:", v16);

  }
}

- (void)_installGradientLayerMaskForClippingView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2790];
  v4 = a3;
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  +[UIColor clearColor](UIColor, "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor blackColor](UIColor, "blackColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v8;
  v20[1] = v10;
  v20[2] = v10;
  v20[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColors:", v11);

  objc_msgSend(v4, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", v5);

  objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v5, "frame");
  v19[0] = &unk_1E1A957A0;
  v14 = 6.0 / v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 6.0 / v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  v19[3] = &unk_1E1A957B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocations:", v17);

  objc_msgSend(v4, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setMask:", v5);
}

- (BOOL)compactMetrics
{
  return self->_compactMetrics;
}

- (BOOL)havePrepared
{
  return self->_havePrepared;
}

- (void)setHavePrepared:(BOOL)a3
{
  self->_havePrepared = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (_CarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (_UIButtonBar)leadingBar
{
  return self->_leadingBar;
}

- (void)setLeadingBar:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBar, a3);
}

- (_UIButtonBar)trailingBar
{
  return self->_trailingBar;
}

- (void)setTrailingBar:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBar, a3);
}

- (_UIButtonBarButton)backBarButton
{
  return self->_backBarButton;
}

- (void)setBackBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButton, a3);
}

- (NSLayoutConstraint)leadingBarConstraint
{
  return self->_leadingBarConstraint;
}

- (void)setLeadingBarConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarConstraint, a3);
}

- (NSLayoutConstraint)leadingBarNoItemsConstraint
{
  return self->_leadingBarNoItemsConstraint;
}

- (void)setLeadingBarNoItemsConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarNoItemsConstraint, a3);
}

- (NSLayoutConstraint)trailingBarConstraint
{
  return self->_trailingBarConstraint;
}

- (void)setTrailingBarConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarConstraint, a3);
}

- (NSLayoutConstraint)trailingBarNoItemsConstraint
{
  return self->_trailingBarNoItemsConstraint;
}

- (void)setTrailingBarNoItemsConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarNoItemsConstraint, a3);
}

- (NSArray)backButtonConstraints
{
  return self->_backButtonConstraints;
}

- (void)setBackButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonConstraints, a3);
}

- (NSLayoutConstraint)largeTitleLeadingConstraint
{
  return self->_largeTitleLeadingConstraint;
}

- (void)setLargeTitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleLeadingConstraint, a3);
}

- (NSLayoutConstraint)largeTitleTrailingConstraint
{
  return self->_largeTitleTrailingConstraint;
}

- (void)setLargeTitleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleTrailingConstraint, a3);
}

- (NSLayoutConstraint)regularTitleConstraint
{
  return self->_regularTitleConstraint;
}

- (void)setRegularTitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_regularTitleConstraint, a3);
}

- (NSLayoutConstraint)leadingBarWithTitleTrailingConstraint
{
  return self->_leadingBarWithTitleTrailingConstraint;
}

- (void)setLeadingBarWithTitleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarWithTitleTrailingConstraint, a3);
}

- (NSLayoutConstraint)leadingBarWithNoTitleTrailingConstraint
{
  return self->_leadingBarWithNoTitleTrailingConstraint;
}

- (void)setLeadingBarWithNoTitleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarWithNoTitleTrailingConstraint, a3);
}

- (NSLayoutConstraint)trailingBarWithTitleLeadingConstraint
{
  return self->_trailingBarWithTitleLeadingConstraint;
}

- (void)setTrailingBarWithTitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarWithTitleLeadingConstraint, a3);
}

- (NSLayoutConstraint)trailingBarWithNoTitleLeadingConstraint
{
  return self->_trailingBarWithNoTitleLeadingConstraint;
}

- (void)setTrailingBarWithNoTitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarWithNoTitleLeadingConstraint, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIFocusContainerGuide)focusContainerGuide
{
  return self->_focusContainerGuide;
}

- (void)setFocusContainerGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusContainerGuide, a3);
}

- (NSArray)debugViews
{
  return self->_debugViews;
}

- (void)setDebugViews:(id)a3
{
  objc_storeStrong((id *)&self->_debugViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViews, 0);
  objc_storeStrong((id *)&self->_focusContainerGuide, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_trailingBarWithNoTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingBarWithTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarWithNoTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarWithTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_regularTitleConstraint, 0);
  objc_storeStrong((id *)&self->_largeTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_largeTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backButtonConstraints, 0);
  objc_storeStrong((id *)&self->_trailingBarNoItemsConstraint, 0);
  objc_storeStrong((id *)&self->_trailingBarConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarNoItemsConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarConstraint, 0);
  objc_storeStrong((id *)&self->_backBarButton, 0);
  objc_storeStrong((id *)&self->_trailingBar, 0);
  objc_storeStrong((id *)&self->_leadingBar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end
