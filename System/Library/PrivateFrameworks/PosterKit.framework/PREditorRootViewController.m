@implementation PREditorRootViewController

- (void)invalidate
{
  -[PRComplicationSceneHostViewController invalidate](self->_complicationHostViewController, "invalidate");
  -[PRQuickActionsSceneHostViewController invalidate](self->_quickActionsHostViewController, "invalidate");
}

- (void)loadView
{
  id v3;
  void *v4;
  PREditingBottomLegibilityView *v5;
  _BOOL4 v6;
  double v7;
  id v8;
  double v9;
  uint64_t v10;
  PREditingCancelButton *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  int v27;
  char v28;
  int v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PREditingStandaloneLabelView *v38;
  PREditingStandaloneLabelView *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  PREditingReticleView *v46;
  void *v47;
  PREditingReticleView *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  PREditingReticleView *v54;
  void *v55;
  PRComplicationEmptyStateView *v56;
  void *v57;
  uint64_t v58;
  PREditingReticleView *v59;
  void *v60;
  PRComplicationEmptyStateView *v61;
  PRComplicationSceneHostViewController *v62;
  void *v63;
  PRComplicationSceneHostViewController *v64;
  void *v65;
  PRQuickActionsSceneHostViewController *v66;
  void *v67;
  id v68;
  id v69;
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
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
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
  id v178;
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
  PRQuickActionsSceneHostViewController *v190;
  void *v191;
  void *v192;
  id v193;
  PREditingStandaloneLabelView *v194;
  PREditingBottomLegibilityView *v195;
  PREditingStandaloneLabelView *v196;
  void *v197;
  void *v198;
  PREditingCancelButton *v199;
  void *v200;
  id v201;
  PREditorRootViewController *val;
  _QWORD v203[4];
  id v204;
  _QWORD v205[4];
  id v206;
  id location;
  _QWORD v208[23];
  _QWORD v209[9];

  v209[7] = *MEMORY[0x1E0C80C00];
  v201 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  val = self;
  -[PREditorRootViewController editor](self, "editor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0D01950]);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setPagingEnabled:", 1);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setScrollsToTop:", 0);
  objc_msgSend(v3, "setBounces:", 0);
  objc_msgSend(v3, "_setAutoScrollEnabled:", 0);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);
  v200 = v3;

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v201, "addSubview:", v3);
  -[PREditorRootViewController setScrollView:](val, "setScrollView:", v3);
  v5 = objc_alloc_init(PREditingBottomLegibilityView);
  -[PREditingBottomLegibilityView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  -[PREditingBottomLegibilityView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = -[PREditorRootViewController _shouldShowQuickActionEditing](val, "_shouldShowQuickActionEditing");
  v7 = 0.35;
  if (!v6)
    v7 = 0.25;
  -[PREditingBottomLegibilityView setHeightFactor:](v5, "setHeightFactor:", v7);
  objc_msgSend(v201, "addSubview:", v5);
  -[PREditorRootViewController setBottomLegibilityView:](val, "setBottomLegibilityView:", v5);
  v195 = v5;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3A88]);
  objc_msgSend(v8, "setHidesForSinglePage:", 1);
  objc_msgSend(v8, "setBackgroundStyle:", 1);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", val, sel_pageControlCurrentPageDidChange_, 4096);
  LODWORD(v9) = 1132068864;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("editing-page-control"));
  objc_msgSend(v8, "_setPreferredNumberOfVisibleIndicators:", 6);
  objc_msgSend(v201, "addSubview:", v8);
  -[PREditorRootViewController setPageControl:](val, "setPageControl:", v8);
  v197 = v8;
  objc_msgSend(v192, "delegate");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PREditingSupportsLiveBlurs() ^ 1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v179, "prefersSimpleButtonAppearanceForEditor:", v192))
  {
    v10 = 1;
  }
  v11 = [PREditingCancelButton alloc];
  v12 = (void *)MEMORY[0x1E0DC3428];
  v13 = MEMORY[0x1E0C809B0];
  v205[0] = MEMORY[0x1E0C809B0];
  v205[1] = 3221225472;
  v205[2] = __38__PREditorRootViewController_loadView__block_invoke;
  v205[3] = &unk_1E2183D00;
  objc_copyWeak(&v206, &location);
  objc_msgSend(v12, "actionWithHandler:", v205);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v199 = -[PREditingButton initWithStyle:frame:primaryAction:](v11, "initWithStyle:frame:primaryAction:", v10, v14, *MEMORY[0x1E0C9D648], v16, v18, v17);

  -[PREditingCancelButton setTranslatesAutoresizingMaskIntoConstraints:](v199, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditingCancelButton setAccessibilityIdentifier:](v199, "setAccessibilityIdentifier:", CFSTR("editing-cancel"));
  objc_msgSend(v201, "addSubview:", v199);
  -[PREditorRootViewController setCancelButton:](val, "setCancelButton:", v199);
  v19 = (objc_class *)objc_opt_class();
  -[PREditorRootViewController editor](val, "editor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "acceptButtonType");

  if (v21 == 1 || v21 == 2)
    v19 = (objc_class *)objc_opt_class();
  v22 = [v19 alloc];
  v23 = (void *)MEMORY[0x1E0DC3428];
  v203[0] = v13;
  v203[1] = 3221225472;
  v203[2] = __38__PREditorRootViewController_loadView__block_invoke_2;
  v203[3] = &unk_1E2183D00;
  objc_copyWeak(&v204, &location);
  objc_msgSend(v23, "actionWithHandler:", v203);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (void *)objc_msgSend(v22, "initWithStyle:frame:primaryAction:", 2, v24, v15, v16, v18, v17);

  objc_msgSend(v198, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v198, "setAccessibilityIdentifier:", CFSTR("editing-done"));
  objc_msgSend(v201, "addSubview:", v198);
  -[PREditorRootViewController setAcceptButton:](val, "setAcceptButton:", v198);
  -[PREditorRootViewController updateTopButtonAlpha](val, "updateTopButtonAlpha");
  v25 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PREditorRootViewController setTimeContainerView:](val, "setTimeContainerView:", v25);
  v176 = v25;
  v26 = objc_msgSend(v192, "displaysHeaderElements");
  LODWORD(v25) = objc_msgSend(v192, "displaysSubtitleElement");
  v27 = objc_msgSend(v192, "areComplicationsAllowed");
  v28 = v27;
  v29 = v26 & v27;
  if ((v26 & v27 & v25) == 1)
  {
    v30 = -[PREditorRootViewController isSubtitleHidden](val, "isSubtitleHidden");
    v31 = objc_alloc_init(MEMORY[0x1E0D1BCA8]);
    v32 = v31;
    if (v30)
      v33 = 0;
    else
      v33 = 2;
    objc_msgSend(v31, "setElements:", v33);
    -[PREditorRootViewController dateProvider](val, "dateProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDisplayDate:", v35);

    objc_msgSend(v32, "setUsesEditingLayout:", -[PREditorRootViewController usesEditingLayout](val, "usesEditingLayout"));
    objc_msgSend(v32, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setUserInteractionEnabled:", 0);
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAllowsHitTesting:", 0);

    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditorRootViewController addChildViewController:](val, "addChildViewController:", v32);
    objc_msgSend(v176, "addSubview:", v36);
    objc_msgSend(v32, "didMoveToParentViewController:", val);
    -[PREditorRootViewController setSubtitleViewController:](val, "setSubtitleViewController:", v32);

  }
  v38 = objc_alloc_init(PREditingStandaloneLabelView);
  -[PREditingStandaloneLabelView setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditingStandaloneLabelView setUserInteractionEnabled:](v38, "setUserInteractionEnabled:", 0);
  -[PREditingStandaloneLabelView setAlpha:](v38, "setAlpha:", 0.0);
  objc_msgSend(v201, "addSubview:", v38);
  -[PREditorRootViewController setLookNameLabel:](val, "setLookNameLabel:", v38);
  v196 = v38;
  v39 = objc_alloc_init(PREditingStandaloneLabelView);
  -[PREditingStandaloneLabelView setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditingStandaloneLabelView setUserInteractionEnabled:](v39, "setUserInteractionEnabled:", 0);
  objc_msgSend(v201, "addSubview:", v39);
  -[PREditorRootViewController setLookInteractionHintLabel:](val, "setLookInteractionHintLabel:", v39);
  v194 = v39;
  v40 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PREditorRootViewController setComplicationsContainerView:](val, "setComplicationsContainerView:", v40);
  v177 = v40;
  if (v26)
  {
    v193 = objc_alloc_init(MEMORY[0x1E0D01960]);
    objc_msgSend(v193, "setUserInteractionEnabled:", 0);
    objc_msgSend(v193, "setBlurEnabled:", PREditingSupportsLiveBlurs());
    -[PREditorRootViewController setReticleVibrancyView:](val, "setReticleVibrancyView:", v193);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "userInterfaceIdiom");

    if ((v42 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    {
      v178 = objc_alloc_init(MEMORY[0x1E0D01960]);
      objc_msgSend(v178, "setUserInteractionEnabled:", 0);
      objc_msgSend(v178, "setBlurEnabled:", PREditingSupportsLiveBlurs());
      -[PREditorRootViewController setSidebarReticleVibrancyView:](val, "setSidebarReticleVibrancyView:", v178);
    }
    else
    {
      v178 = 0;
    }
  }
  else
  {
    v178 = 0;
    v193 = 0;
  }
  if (objc_msgSend(v192, "areViewsSharedBetweenLooks"))
  {
    v43 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v200, "addSubview:", v43);
    -[PREditorRootViewController setBackgroundContainerView:](val, "setBackgroundContainerView:", v43);
    v44 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v200, "addSubview:", v44);
    -[PREditorRootViewController setForegroundContainerView:](val, "setForegroundContainerView:", v44);
    v45 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[PREditorRootViewController setFloatingContainerView:](val, "setFloatingContainerView:", v45);
    if (v193)
      objc_msgSend(v200, "addSubview:", v193);
    objc_msgSend(v200, "insertSubview:aboveSubview:", v45, v44);
    objc_msgSend(v200, "addSubview:", v176);
    if (v178)
      objc_msgSend(v200, "addSubview:", v178);

  }
  objc_msgSend(v200, "addSubview:", v177);
  if (v29)
  {
    v46 = objc_alloc_init(PREditingReticleView);
    -[PREditingReticleView setTranslatesAutoresizingMaskIntoConstraints:](v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v193, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v46);

    -[PREditorRootViewController setInlineComplicationReticleView:](val, "setInlineComplicationReticleView:", v46);
  }
  if (v26)
  {
    v48 = objc_alloc_init(PREditingReticleView);
    objc_msgSend(v193, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v48);

    -[PREditorRootViewController setTitleReticleView:](val, "setTitleReticleView:", v48);
    v50 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v50, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setHitTestsAsOpaque:", 1);

    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", val, sel_titleViewTapped_);
    objc_msgSend(v50, "addGestureRecognizer:", v52);
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v201, "addSubview:", v50);
    -[PREditorRootViewController setTitleGestureView:](val, "setTitleGestureView:", v50);
    v53 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    -[PREditingReticleView addLayoutGuide:](v48, "addLayoutGuide:", v53);
    -[PREditorRootViewController setTitlePopoverLayoutGuide:](val, "setTitlePopoverLayoutGuide:", v53);

    if ((v28 & 1) != 0)
    {
      v54 = objc_alloc_init(PREditingReticleView);
      objc_msgSend(v193, "contentView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addSubview:", v54);

      -[PREditorRootViewController setComplicationRowReticleView:](val, "setComplicationRowReticleView:", v54);
      v56 = objc_alloc_init(PRComplicationEmptyStateView);
      -[PREditingReticleView addSubview:](v54, "addSubview:", v56);
      -[PREditorRootViewController setComplicationRowEmptyStateView:](val, "setComplicationRowEmptyStateView:", v56);
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "userInterfaceIdiom");

      if ((v58 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
      {
        v59 = objc_alloc_init(PREditingReticleView);
        objc_msgSend(v178, "contentView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addSubview:", v59);

        -[PREditorRootViewController setComplicationSidebarReticleView:](val, "setComplicationSidebarReticleView:", v59);
        v61 = objc_alloc_init(PRComplicationEmptyStateView);
        -[PREditingReticleView addSubview:](v59, "addSubview:", v61);
        -[PREditorRootViewController setComplicationSidebarEmptyStateView:](val, "setComplicationSidebarEmptyStateView:", v61);

      }
      v62 = [PRComplicationSceneHostViewController alloc];
      -[PREditorRootViewController makeComplicationsHostingScene](val, "makeComplicationsHostingScene");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[PRComplicationSceneHostViewController initWithScene:](v62, "initWithScene:", v63);

      -[PRComplicationSceneHostViewController view](v64, "view");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PREditorRootViewController addChildViewController:](val, "addChildViewController:", v64);
      objc_msgSend(v177, "addSubview:", v65);
      -[PRComplicationSceneHostViewController didMoveToParentViewController:](v64, "didMoveToParentViewController:", val);
      -[PREditorRootViewController setComplicationHostViewController:](val, "setComplicationHostViewController:", v64);
      -[PREditorRootViewController _updateComplicationsVibrancyFromCurrentLook](val, "_updateComplicationsVibrancyFromCurrentLook");

    }
  }
  if (-[PREditorRootViewController _shouldShowQuickActionEditing](val, "_shouldShowQuickActionEditing"))
  {
    v66 = [PRQuickActionsSceneHostViewController alloc];
    -[PREditorRootViewController makeQuickActionsHostingScene](val, "makeQuickActionsHostingScene");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = -[PRQuickActionsSceneHostViewController initWithScene:](v66, "initWithScene:", v67);

    -[PRQuickActionsSceneHostViewController view](v190, "view");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController addChildViewController:](val, "addChildViewController:", v190);
    objc_msgSend(v201, "addSubview:", v188);
    objc_msgSend(v188, "setAutoresizingMask:", 18);
    -[PRQuickActionsSceneHostViewController didMoveToParentViewController:](v190, "didMoveToParentViewController:", val);
    -[PREditorRootViewController setQuickActionsHostViewController:](val, "setQuickActionsHostViewController:", v190);
    v68 = objc_alloc_init(MEMORY[0x1E0D01960]);
    objc_msgSend(v68, "setUserInteractionEnabled:", 0);
    objc_msgSend(v68, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v68, "setBlurEnabled:", PREditingSupportsLiveBlurs());
    -[PREditorRootViewController setControlsDividerVibrancyView:](val, "setControlsDividerVibrancyView:", v68);
    objc_msgSend(v201, "addSubview:", v68);
    v69 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setBackgroundColor:", v70);

    objc_msgSend(v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v69, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setCornerRadius:", 0.5);

    objc_msgSend(v68, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addSubview:", v69);

    -[PREditorRootViewController setControlsDividerView:](val, "setControlsDividerView:", v69);
    v156 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v68, "leadingAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "leadingAnchor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintEqualToAnchor:constant:", v186, 40.0);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v209[0] = v182;
    objc_msgSend(v68, "trailingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "trailingAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:constant:", v180, -40.0);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v209[1] = v172;
    objc_msgSend(v68, "heightAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintEqualToConstant:", 1.0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v209[2] = v168;
    objc_msgSend(v69, "leadingAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "constraintEqualToAnchor:", v164);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v209[3] = v162;
    objc_msgSend(v69, "trailingAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "constraintEqualToAnchor:", v158);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v209[4] = v73;
    objc_msgSend(v69, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v209[5] = v76;
    objc_msgSend(v69, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v209[6] = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 7);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "activateConstraints:", v80);

  }
  -[PREditorRootViewController contentOverlayView](val, "contentOverlayView");
  v81 = (id)objc_claimAutoreleasedReturnValue();
  if (!v81)
  {
    v81 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[PREditorRootViewController setContentOverlayView:](val, "setContentOverlayView:", v81);
  }
  v191 = v81;
  objc_msgSend(v81, "bounds");
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v82, v84, v86, v88);
  objc_msgSend(v191, "setFrame:", v83, v85, v87, v89);
  objc_msgSend(v90, "addSubview:", v191);
  objc_msgSend(v200, "addSubview:", v90);
  -[PREditorRootViewController setContentOverlayContainerView:](val, "setContentOverlayContainerView:", v90);
  v118 = v90;
  if (-[PREditorRootViewController _shouldShowQuickActionEditing](val, "_shouldShowQuickActionEditing"))
  {
    -[BSUIVibrancyEffectView bottomAnchor](val->_controlsDividerVibrancyView, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "bottomAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v92);
    v189 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v197, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView topAnchor](val->_controlsDividerVibrancyView, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, -23.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v197, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "safeAreaLayoutGuide");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v95);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PREditorRootViewController setBottomControlsYConstraint:](val, "setBottomControlsYConstraint:", v189);
  -[PREditorRootViewController topButtonsEdgeInsets](val, "topButtonsEdgeInsets");
  v97 = v96;
  v99 = v98;
  -[PREditingCancelButton leadingAnchor](v199, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, v99);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController setLeadingTopButtonXConstraint:](val, "setLeadingTopButtonXConstraint:", v187);
  -[PREditingCancelButton topAnchor](v199, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "topAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, v97);
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController setLeadingTopButtonYConstraint:](val, "setLeadingTopButtonYConstraint:", v185);
  objc_msgSend(v198, "trailingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:constant:", v105, -v99);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController setTrailingTopButtonXConstraint:](val, "setTrailingTopButtonXConstraint:", v183);
  objc_msgSend(v198, "topAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "topAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, v97);
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController setTrailingTopButtonYConstraint:](val, "setTrailingTopButtonYConstraint:", v181);
  v119 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v197, "centerXAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "safeAreaLayoutGuide");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "centerXAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "constraintEqualToAnchor:", v171);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v208[0] = v169;
  v208[1] = v189;
  v208[2] = v187;
  v208[3] = v185;
  v208[4] = v183;
  v208[5] = v181;
  objc_msgSend(v198, "widthAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingCancelButton widthAnchor](v199, "widthAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "constraintEqualToAnchor:", v165);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v208[6] = v163;
  objc_msgSend(v200, "topAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToAnchor:", v159);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v208[7] = v157;
  objc_msgSend(v200, "bottomAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "bottomAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v154);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v208[8] = v153;
  objc_msgSend(v200, "leadingAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "leadingAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToAnchor:", v151);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v208[9] = v150;
  objc_msgSend(v200, "trailingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v148);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v208[10] = v147;
  -[PREditingStandaloneLabelView centerXAnchor](v196, "centerXAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "centerXAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:", v145);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v208[11] = v144;
  -[PREditingStandaloneLabelView bottomAnchor](v196, "bottomAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:constant:", v142, -10.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v208[12] = v141;
  -[PREditingStandaloneLabelView leadingAnchor](v196, "leadingAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "leadingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintGreaterThanOrEqualToAnchor:constant:", v139, 20.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v208[13] = v138;
  -[PREditingStandaloneLabelView trailingAnchor](v196, "trailingAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintLessThanOrEqualToAnchor:constant:", v136, -20.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v208[14] = v135;
  -[PREditingStandaloneLabelView centerXAnchor](v194, "centerXAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "centerXAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:", v133);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v208[15] = v132;
  -[PREditingStandaloneLabelView bottomAnchor](v194, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "topAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v130, -10.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v208[16] = v129;
  -[PREditingStandaloneLabelView leadingAnchor](v194, "leadingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "leadingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintGreaterThanOrEqualToAnchor:constant:", v127, 20.0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v208[17] = v126;
  -[PREditingStandaloneLabelView trailingAnchor](v194, "trailingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintLessThanOrEqualToAnchor:constant:", v124, -20.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v208[18] = v123;
  -[PREditingBottomLegibilityView heightAnchor](v195, "heightAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "heightAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:", v121);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v208[19] = v120;
  -[PREditingBottomLegibilityView bottomAnchor](v195, "bottomAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v208[20] = v110;
  -[PREditingBottomLegibilityView leadingAnchor](v195, "leadingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "leadingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v208[21] = v113;
  -[PREditingBottomLegibilityView trailingAnchor](v195, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "trailingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v208[22] = v116;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 23);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "activateConstraints:", v117);

  -[PREditorRootViewController setView:](val, "setView:", v201);
  objc_destroyWeak(&v204);

  objc_destroyWeak(&v206);
  objc_destroyWeak(&location);

}

void __38__PREditorRootViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editor");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "requestDismissalWithAction:", 0);
}

void __38__PREditorRootViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editor");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "requestDismissalWithAction:", 1);
}

- (void)viewDidLoad
{
  PREditorElementLayoutController *v3;
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  PREditorElementLayoutController *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[10];

  v76[8] = *MEMORY[0x1E0C80C00];
  v73.receiver = self;
  v73.super_class = (Class)PREditorRootViewController;
  -[PREditorRootViewController viewDidLoad](&v73, sel_viewDidLoad);
  v3 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", self);
  -[PREditorRootViewController setEditorElementLayoutController:](self, "setEditorElementLayoutController:", v3);
  -[PREditorRootViewController depthEffectEnablementDidChange](self, "depthEffectEnablementDidChange");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController editor](self, "editor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displaysHeaderElements"))
  {
    v71 = v5;
    v69 = v3;
    -[PREditorRootViewController titleGestureView](self, "titleGestureView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController titleReticleView](self, "titleReticleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController titlePopoverLayoutGuide](self, "titlePopoverLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerXAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v62);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v59;
    objc_msgSend(v7, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v53);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v50;
    objc_msgSend(v7, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v45;
    v68 = v7;
    objc_msgSend(v7, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v42;
    objc_msgSend(v9, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v39;
    objc_msgSend(v9, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v10;
    objc_msgSend(v9, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v13;
    v66 = v9;
    objc_msgSend(v9, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v8;
    objc_msgSend(v8, "heightAnchor");
    v70 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 10.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v4;
    objc_msgSend(v4, "addObjectsFromArray:", v17);

    v6 = v70;
    if (objc_msgSend(v70, "areComplicationsAllowed"))
    {
      -[PREditorRootViewController complicationHostViewController](self, "complicationHostViewController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v57);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v54;
      objc_msgSend(v18, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v19;
      v63 = v18;
      objc_msgSend(v18, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v22;
      objc_msgSend(v18, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "addObjectsFromArray:", v26);

      -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v55);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v52;
      objc_msgSend(v27, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v29;
      objc_msgSend(v27, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v32;
      objc_msgSend(v27, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "addObjectsFromArray:", v36);

      v6 = v70;
    }

    v3 = v69;
    v5 = v71;
    v4 = v72;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PREditorElementLayoutController *editorElementLayoutController;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PREditorRootViewController;
  -[PREditorRootViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[PREditorRootViewController currentLook](self, "currentLook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  editorElementLayoutController = self->_editorElementLayoutController;
  objc_msgSend(v5, "timeNumberingSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorElementLayoutController setNumberingSystem:](editorElementLayoutController, "setNumberingSystem:", v7);

  -[PREditorRootViewController currentLook](self, "currentLook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "isFourDigitTime");
    -[PREditorRootViewController setFourDigitTime:](self, "setFourDigitTime:", v10);
    -[PREditorElementLayoutController setFourDigitTime:](self->_editorElementLayoutController, "setFourDigitTime:", v10);
  }
  -[PREditorRootViewController _updateMenuElements](self, "_updateMenuElements");
  if (!-[PREditorRootViewController initialLayoutFinished](self, "initialLayoutFinished"))
  {
    -[PREditorRootViewController setInitialLayoutFinished:](self, "setInitialLayoutFinished:", 1);
    -[PREditorRootViewController editor](self, "editor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateSafeForCallbackType:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "editorDidFinishInitialLayout:", v11);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __51__PREditorRootViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "frameForPageAtLookIndex:", a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "timeViewControllerForLook:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(v16, "pr_updateStyleBoundingRects");

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PREditorRootViewController;
  -[PREditorRootViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v13, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PREditorRootViewController bottomControlsYConstraint](self, "bottomControlsYConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PREditorRootViewController _shouldShowQuickActionEditing](self, "_shouldShowQuickActionEditing"))
    v8 = -138.0;
  else
    v8 = 0.0;
  objc_msgSend(v7, "safeAreaInsets");
  v9 = -20.0;
  if (v10 > 0.0)
    v9 = -10.0;
  objc_msgSend(v6, "setConstant:", v8 + v9);
  -[PREditorRootViewController _updateButtonLayout](self, "_updateButtonLayout");
  -[PREditorRootViewController dateProvider](self, "dateProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3)
    objc_msgSend(v11, "addMinuteUpdateObserver:", self);
  else
    objc_msgSend(v11, "removeMinuteUpdateObserver:", self);
  -[PREditorRootViewController _updateComplicationsRowEmptyViewVisibilityAnimated:](self, "_updateComplicationsRowEmptyViewVisibilityAnimated:", 0);
  -[PREditorRootViewController _updateComplicationSidebarEmptyViewVisibilityAnimated:](self, "_updateComplicationSidebarEmptyViewVisibilityAnimated:", 0);
  -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorRootViewController;
  -[PREditorRootViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  PREditingBottomLegibilityView *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PREditingBottomLegibilityView *v23;
  id v24;
  _QWORD v25[4];
  PREditingBottomLegibilityView *v26;
  _QWORD v27[5];
  id v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;

  height = a3.height;
  width = a3.width;
  v32.receiver = self;
  v32.super_class = (Class)PREditorRootViewController;
  v7 = a4;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v32, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PREditorRootViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController lookTransition](self, "lookTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "destinationLook");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController looks](self, "looks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v11);

    v14 = -[PREditorRootViewController viewIndexForLookIndex:](self, "viewIndexForLookIndex:", v13);
  }
  else
  {
    objc_msgSend(v8, "contentOffset");
    v14 = -[PREditorRootViewController lookIndexForContentOffset:](self, "lookIndexForContentOffset:");
  }
  v15 = width * (double)v14;
  v16 = objc_alloc_init(PREditingBottomLegibilityView);
  -[PREditingBottomLegibilityView setShouldOverscan:](v16, "setShouldOverscan:", 1);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v17 = 8;
  else
    v17 = 4;
  -[PREditorRootViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "interfaceOrientation");

  v27[0] = MEMORY[0x1E0C809B0];
  if ((unint64_t)(v21 - 1) < 2)
    v22 = 1;
  else
    v22 = v17;
  v27[1] = 3221225472;
  v27[2] = __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v27[3] = &unk_1E2184770;
  v27[4] = self;
  v28 = v8;
  v29 = v15;
  v30 = 0;
  v31 = v22;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v25[3] = &unk_1E2184798;
  v26 = v16;
  v23 = v16;
  v24 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v27, v25);

}

void __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsReticleVisibilityUpdate");
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:animated:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentSize");
  objc_msgSend(*(id *)(a1 + 32), "editor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "permittedArrowDirections");
  v5 = *(_QWORD *)(a1 + 64);

  if (v4 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "editor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPermittedArrowDirections:", *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "editor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontAndColorPickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatePopoverContentSize");

  }
}

uint64_t __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldOverscan:", 0);
}

- (void)_updateScrollViewContentSize
{
  unint64_t v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  -[PREditorRootViewController looks](self, "looks");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v12, "count");
  -[PREditorRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v9 = CGRectGetWidth(v13) * (double)v3;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = CGRectGetHeight(v14);
  -[PREditorRootViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentSize:", v9, v10);

}

- (void)looksWillChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PREditorRootViewController looks](self, "looks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromParentViewController");
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        objc_msgSend(v8, "didMoveToParentViewController:", 0);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[PREditorTitleViewControllerCoordinator reloadData](self->_titleViewControllerCoordinator, "reloadData");
}

- (void)looksDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PREditorTitleViewControllerCoordinator *titleViewControllerCoordinator;
  void *v10;
  char v11;
  PREditorTitleViewControllerCoordinator *v12;
  PREditorTitleViewControllerCoordinator *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  -[PREditorRootViewController editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController looks](self, "looks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "count");
  -[PREditorRootViewController currentLook](self, "currentLook");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v5;
  v34 = v6;
  if (objc_msgSend(v3, "displaysHeaderElements"))
  {
    -[PREditorRootViewController dateProvider](self, "dateProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v3;
    v8 = objc_msgSend(v3, "timeViewControllerDisplayedElements");
    titleViewControllerCoordinator = self->_titleViewControllerCoordinator;
    if (!titleViewControllerCoordinator
      || (-[PREditorTitleViewControllerCoordinator role](titleViewControllerCoordinator, "role"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqual:", v5),
          v10,
          (v11 & 1) == 0))
    {
      v12 = -[PREditorTitleViewControllerCoordinator initWithRole:]([PREditorTitleViewControllerCoordinator alloc], "initWithRole:", v5);
      v13 = self->_titleViewControllerCoordinator;
      self->_titleViewControllerCoordinator = v12;

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v34;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "pr_setElements:", v8);
          objc_msgSend(v20, "pr_setDisplayDate:", v37);
          objc_msgSend(v20, "pr_setUsesEditingLayout:", -[PREditorRootViewController usesEditingLayout](self, "usesEditingLayout"));
          -[PREditorRootViewController editor](self, "editor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "posterRole");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v19, v36, v22);
          objc_msgSend(v38, "titleString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "pr_setDisplayString:", v23);

          -[PREditorRootViewController addChildViewController:](self, "addChildViewController:", v20);
          objc_msgSend(v20, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setHidden:", objc_msgSend(v18, "isEqual:", v39) ^ 1);
          -[UIView addSubview:](self->_timeContainerView, "addSubview:", v24);
          -[UIView sendSubviewToBack:](self->_timeContainerView, "sendSubviewToBack:", v24);
          objc_msgSend(v20, "didMoveToParentViewController:", self);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v15);
    }

    v3 = v38;
  }
  -[PREditorRootViewController _updateComplicationsVibrancyFromCurrentLook](self, "_updateComplicationsVibrancyFromCurrentLook");
  -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterRole");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v25, v27, v28);
  -[PREditorRootViewController pageControl](self, "pageControl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setNumberOfPages:", v32);
  -[PREditorRootViewController updatePageControlCurrentPage](self, "updatePageControlCurrentPage");
  -[PREditorRootViewController lookNameLabel](self, "lookNameLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "displayName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v31);
  objc_msgSend(v30, "setHidden:", v32 < 2);

}

- (void)updateForChangedTitleString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController looks](self, "looks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pr_setDisplayString:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)updateForChangedOverrideDate
{
  void *v3;
  id v4;

  -[PREditorRootViewController dateProvider](self, "dateProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController dateProvider:didUpdateDate:](self, "dateProvider:didUpdateDate:", v4, v3);

}

- (void)updateTimeControllersForLookMap
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  PREditorTitleViewControllerCoordinator *titleViewControllerCoordinator;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displaysHeaderElements");

  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PREditorRootViewController looks](self, "looks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          titleViewControllerCoordinator = self->_titleViewControllerCoordinator;
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditorTitleViewControllerCoordinator updateLookWithIdentifier:withLook:](titleViewControllerCoordinator, "updateLookWithIdentifier:withLook:", v12, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)lookPropertiesDidChange
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PREditorElementLayoutController *editorElementLayoutController;
  void *v26;
  void *v27;
  void *v28;
  const char *aSelector;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  PREditorRootViewController *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displaysHeaderElements");

  if (v5)
  {
    aSelector = a2;
    -[PREditorRootViewController updateTimeControllersForLookMap](self, "updateTimeControllersForLookMap");
    -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController editor](self, "editor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterRole");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[PREditorRootViewController looks](self, "looks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
          -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find titleViewController for look: %@"), v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              NSStringFromSelector(aSelector);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v35 = v28;
              v36 = 2114;
              v37 = v27;
              v38 = 2048;
              v39 = self;
              v40 = 2114;
              v41 = CFSTR("PREditor.m");
              v42 = 1024;
              v43 = 3539;
              v44 = 2114;
              v45 = v17;
              _os_log_fault_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
          }
          objc_msgSend(v16, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v15, v6, v8);

          ++v13;
        }
        while (v11 != v13);
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        v11 = v19;
      }
      while (v19);
    }

    -[PREditorRootViewController editor](self, "editor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configuredProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "titleStyleConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v22, v6, v8);

    if (objc_msgSend(v8, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
    {
      -[PREditorRootViewController editor](self, "editor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDepthEffectDisallowed:", objc_msgSend(v22, "prefersVerticalTitleLayout"));

    }
    editorElementLayoutController = self->_editorElementLayoutController;
    objc_msgSend(v22, "timeNumberingSystem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorElementLayoutController setNumberingSystem:](editorElementLayoutController, "setNumberingSystem:", v26);

    -[PREditorRootViewController _updateComplicationsVibrancyFromCurrentLook](self, "_updateComplicationsVibrancyFromCurrentLook");
    -[PREditorRootViewController updateReticleViewFrames](self, "updateReticleViewFrames");

  }
}

- (void)lookBackgroundTypesDidChange
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *aSelector;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  PREditorRootViewController *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displaysHeaderElements");

  if (v5)
  {
    aSelector = a2;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PREditorRootViewController looks](self, "looks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
          -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "vibrancyConfigurationWithExtensionBundleURL:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "backgroundType");

          -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find titleViewController for look: %@"), v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              NSStringFromSelector(aSelector);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v29 = v22;
              v30 = 2114;
              v31 = v19;
              v20 = (void *)v19;
              v32 = 2048;
              v33 = self;
              v34 = 2114;
              v35 = CFSTR("PREditor.m");
              v36 = 1024;
              v37 = 3567;
              v38 = 2114;
              v39 = v17;
              _os_log_fault_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
          }
          objc_msgSend(v16, "pr_setBackgroundType:", v15);

          ++v10;
        }
        while (v8 != v10);
        v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
        v8 = v21;
      }
      while (v21);
    }

    -[PREditorRootViewController _updateComplicationsVibrancyFromCurrentLook](self, "_updateComplicationsVibrancyFromCurrentLook");
  }
}

- (void)updateReticleViewFrames
{
  double v3;
  void *v4;
  double v5;
  id v6;

  -[PREditorRootViewController editor](self, "editor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (objc_msgSend(v6, "areViewsSharedBetweenLooks"))
  {
    -[PREditorRootViewController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v3 = v5;

  }
  -[PREditorRootViewController _updateReticleViewFramesWithOffset:](self, "_updateReticleViewFramesWithOffset:", v3);

}

- (void)_updateReticleViewFramesWithOffset:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
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
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
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
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  id v112;

  -[PREditorRootViewController editor](self, "editor");
  v112 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PREditorRootViewController editorElementLayoutController](self, "editorElementLayoutController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController configuredProperties](self, "configuredProperties");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "titleStyleConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "titleString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "effectiveTitleLayoutForText:", v16);

  -[PREditorRootViewController reticleVibrancyView](self, "reticleVibrancyView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v112, "displaysHeaderElements");
  if (v18 && v19)
  {
    v20 = objc_msgSend(v112, "displaysSubtitleElement");
    v21 = objc_msgSend(v112, "areComplicationsAllowed");
    v22 = 3;
    if (!v20)
      v22 = 1;
    if (v21)
      v23 = v22 | 0xC;
    else
      v23 = v22;
    objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", v23, 3, v17, v7, v9, v11, v13);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "rect");
    objc_msgSend(v18, "setFrame:", v24 + a3);
    -[PREditorRootViewController inlineComplicationReticleView](self, "inlineComplicationReticleView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 2, 3, v7, v9, v11, v13);
    v27 = v26;
    v109 = v13;
    v110 = v11;
    v29 = v28;
    v30 = v9;
    v31 = v7;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v25, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "convertRect:fromView:", v5, v27, v29, v33, v35);
    v38 = v37;
    v40 = v39;
    v108 = a3;
    v42 = v41;
    v44 = v43;

    objc_msgSend(v25, "setFrame:", v38, v40, v42, v44);
    -[PREditorRootViewController titleReticleView](self, "titleReticleView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 3, v17, v31, v30, v110, v109);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rect");
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;
    if (BSFloatLessThanFloat())
    {
      v48 = v27;
      v52 = v33;
    }
    v7 = v31;
    v9 = v30;
    v11 = v110;
    objc_msgSend(v45, "superview");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v54;
    v13 = v109;
    objc_msgSend(v55, "convertRect:fromView:", v5, v48, v50, v52, v56);
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;

    objc_msgSend(v45, "setFrame:", v58, v60, v62, v64);
    -[PREditorRootViewController complicationRowReticleView](self, "complicationRowReticleView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 8, 3, v7, v9, v110, v109);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    objc_msgSend(v65, "superview");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "convertRect:fromView:", v5, v67, v69, v71, v73);
    v76 = v75;
    v78 = v77;
    v80 = v79;
    v82 = v81;

    v83 = v76;
    a3 = v108;
    objc_msgSend(v65, "setFrame:", v83, v78, v80, v82);
    -[PREditorRootViewController complicationRowEmptyStateView](self, "complicationRowEmptyStateView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bounds");
    objc_msgSend(v84, "setFrame:");

  }
  -[PREditorRootViewController sidebarReticleVibrancyView](self, "sidebarReticleVibrancyView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 16, 3, 0, v7, v9, v11, v13);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "rect");
    objc_msgSend(v85, "setFrame:", v87 + a3);
    -[PREditorRootViewController complicationSidebarReticleView](self, "complicationSidebarReticleView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 16, 3, v7, v9, v11, v13);
    v90 = v89;
    v92 = v91;
    v94 = v93;
    v96 = v95;
    objc_msgSend(v88, "superview");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "convertRect:fromView:", v5, v90, v92, v94, v96);
    v99 = v98;
    v101 = v100;
    v103 = v102;
    v105 = v104;

    objc_msgSend(v88, "setFrame:", v99, v101, v103, v105);
    -[PREditorRootViewController complicationSidebarEmptyStateView](self, "complicationSidebarEmptyStateView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "bounds");
    objc_msgSend(v106, "setFrame:");

  }
}

- (void)_updateComplicationsRowEmptyViewVisibility
{
  -[PREditorRootViewController _updateComplicationsRowEmptyViewVisibilityAnimated:](self, "_updateComplicationsRowEmptyViewVisibilityAnimated:", 1);
}

- (void)_updateComplicationsRowEmptyViewVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _QWORD v12[6];

  v3 = a3;
  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
  {

    v10 = 0.0;
    if ((unint64_t)(v8 - 3) < 2)
      goto LABEL_11;
  }
  else
  {

  }
  v10 = 0.0;
  if (-[PREditorRootViewController isTitleReticleActive](self, "isTitleReticleActive"))
    goto LABEL_11;
  if (-[PREditorRootViewController focusedComplicationElement](self, "focusedComplicationElement"))
  {
    if (-[PREditorRootViewController focusedComplicationElement](self, "focusedComplicationElement") != 2)
      goto LABEL_11;
LABEL_8:
    if (self->_complicationsRowConfigured)
      v10 = 0.0;
    else
      v10 = 1.0;
    goto LABEL_11;
  }
  if (!-[PREditorRootViewController areControlsHidden](self, "areControlsHidden"))
    goto LABEL_8;
LABEL_11:
  if (self->_complicationsRowConfigured || !v3)
  {
    -[PRComplicationEmptyStateView setAlpha:](self->_complicationRowEmptyStateView, "setAlpha:", v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__PREditorRootViewController__updateComplicationsRowEmptyViewVisibilityAnimated___block_invoke;
    v12[3] = &unk_1E21847C0;
    v12[4] = self;
    *(double *)&v12[5] = v10;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.3);
  }
}

uint64_t __81__PREditorRootViewController__updateComplicationsRowEmptyViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_updateComplicationSidebarEmptyViewVisibility
{
  -[PREditorRootViewController _updateComplicationSidebarEmptyViewVisibilityAnimated:](self, "_updateComplicationSidebarEmptyViewVisibilityAnimated:", 1);
}

- (void)_updateComplicationSidebarEmptyViewVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _QWORD v12[6];

  v3 = a3;
  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
  {

    v10 = 0.0;
    if ((unint64_t)(v8 - 1) < 2)
      goto LABEL_11;
  }
  else
  {

  }
  v10 = 0.0;
  if (-[PREditorRootViewController isTitleReticleActive](self, "isTitleReticleActive"))
    goto LABEL_11;
  if (-[PREditorRootViewController focusedComplicationElement](self, "focusedComplicationElement"))
  {
    if (-[PREditorRootViewController focusedComplicationElement](self, "focusedComplicationElement") != 3)
      goto LABEL_11;
LABEL_8:
    if (self->_complicationSidebarConfigured)
      v10 = 0.0;
    else
      v10 = 1.0;
    goto LABEL_11;
  }
  if (!-[PREditorRootViewController areControlsHidden](self, "areControlsHidden"))
    goto LABEL_8;
LABEL_11:
  if (self->_complicationSidebarConfigured || !v3)
  {
    -[PRComplicationEmptyStateView setAlpha:](self->_complicationSidebarEmptyStateView, "setAlpha:", v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__PREditorRootViewController__updateComplicationSidebarEmptyViewVisibilityAnimated___block_invoke;
    v12[3] = &unk_1E21847C0;
    v12[4] = self;
    *(double *)&v12[5] = v10;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.3);
  }
}

uint64_t __84__PREditorRootViewController__updateComplicationSidebarEmptyViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_updateComplicationsVibrancyFromCurrentLook
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[PREditorRootViewController currentLook](self, "currentLook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleContentStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    if (v6 == 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01958]), "initWithEffectType:backgroundType:color:", 2, 0, 0);
    }
    else
    {
      -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vibrancyConfigurationWithExtensionBundleURL:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PREditorRootViewController _setVibrancyConfiguration:](self, "_setVibrancyConfiguration:", v7);
    -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    objc_msgSend(v9, "setEffectType:", objc_msgSend(v7, "effectType"));
    objc_msgSend(v9, "setBackgroundType:", objc_msgSend(v7, "backgroundType"));
    objc_msgSend(v7, "alternativeVibrancyEffectLUT");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();
    objc_msgSend(v11, "lutIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 1) != 0)
      objc_msgSend(v9, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:", v13, v14, 0);
    else
      objc_msgSend(v9, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:", v13, v14);

    objc_msgSend(v7, "groupName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroupName:", v15);

    v3 = v16;
  }

}

- (void)_setVibrancyConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setComplicationsVibrancyConfiguration:", v4);

  +[PREditingReticleView reticleVibrancyForVibrancyConfiguration:](PREditingReticleView, "reticleVibrancyForVibrancyConfiguration:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController reticleVibrancyView](self, "reticleVibrancyView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfiguration:", v9);

  -[PREditorRootViewController sidebarReticleVibrancyView](self, "sidebarReticleVibrancyView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v9);

  -[PREditorRootViewController controlsDividerVibrancyView](self, "controlsDividerVibrancyView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v9);

}

- (unint64_t)backgroundTypeForLook:(id)a3
{
  void *v3;
  double v4;
  unint64_t v5;

  -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsLuminance");
  v5 = PRPosterContentsBackgroundTypeForLuminance(v4);

  return v5;
}

- (void)setLooks:(id)a3
{
  -[PREditorRootViewController setLooks:forUpdatingProperties:](self, "setLooks:forUpdatingProperties:", a3, 0);
}

- (void)setLooks:(id)a3 forUpdatingProperties:(BOOL)a4
{
  NSArray *v6;
  NSArray *looks;
  NSArray *v8;
  NSArray *v9;
  id v10;

  v10 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    if (a4)
    {
      v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
      looks = self->_looks;
      self->_looks = v6;

      -[PREditorRootViewController lookPropertiesDidChange](self, "lookPropertiesDidChange");
    }
    else
    {
      -[PREditorRootViewController looksWillChange](self, "looksWillChange");
      v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
      v9 = self->_looks;
      self->_looks = v8;

      -[PREditorRootViewController looksDidChange](self, "looksDidChange");
    }
  }

}

- (id)viewForMenuElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditorRootViewController leadingMenuElements](self, "leadingMenuElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController trailingMenuElements](self, "trailingMenuElements");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)v6;
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorRootViewController leadingMenuElementViews](self, "leadingMenuElementViews");
  v10 = objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController trailingMenuElementViews](self, "trailingMenuElementViews");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v36 = (void *)v10;
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)v11;
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v41;
    v34 = v5;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v39, "objectAtIndex:", v16 + i, v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_class();
        v22 = v19;
        if (v21)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
        }
        else
        {
          v23 = 0;
        }
        v24 = v23;

        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v4);

        if ((v26 & 1) != 0)
          goto LABEL_23;
        v27 = objc_opt_class();
        v28 = v22;
        if (v27)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
        }
        else
        {
          v29 = 0;
        }
        v30 = v29;

        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v4);

        if ((v32 & 1) != 0)
        {

LABEL_23:
          v5 = v34;
          goto LABEL_24;
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v20 = 0;
      v16 += i;
      v5 = v34;
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_24:

  return v20;
}

- (void)_updateMenuElements
{
  OUTLINED_FUNCTION_9_0(&dword_18B634000, a1, a3, "Poster editor supports a maximum of 2 trailing menu elements", a5, a6, a7, a8, 0);
}

- (id)_viewsForMenuElements:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id from;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v4)
    goto LABEL_31;
  v36 = *(_QWORD *)v44;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v44 != v36)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      v11 = objc_opt_class();
      v12 = v10;
      if (v11)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v14 = v13;

      v15 = objc_opt_class();
      v16 = v12;
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v18 = v17;

      objc_msgSend(v14, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", PREditorPlaceholderActionIdentifier);

      if (v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithFrame:", v5, v6, v7, v8);
        objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setColor:", v22);

        objc_msgSend(v21, "startAnimating");
        objc_msgSend(v37, "addObject:", v21);
        goto LABEL_29;
      }
      +[PREditorMenuButton buttonWithType:](PREditorMenuButton, "buttonWithType:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 26.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPreferredSymbolConfiguration:forImageInState:", v23, 0);
      objc_msgSend(v16, "accessibilityLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAccessibilityLabel:", v24);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTintColor:", v25);

      objc_msgSend(v21, "setPointerInteractionEnabled:", 1);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v21);
      v26 = (void *)MEMORY[0x1E0DC3428];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __52__PREditorRootViewController__viewsForMenuElements___block_invoke;
      v38[3] = &unk_1E21847E8;
      objc_copyWeak(&v39, &location);
      objc_copyWeak(&v40, &from);
      objc_msgSend(v26, "actionWithHandler:", v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:forControlEvents:", v27, 0x4000);

      objc_msgSend(v14, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqualToString:", PREditorDepthEffectActionIdentifier))
      {

LABEL_21:
        -[PREditorRootViewController imageForDepthEffectActionTopLevelAction:](self, "imageForDepthEffectActionTopLevelAction:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setImage:forState:", v31, 0);
        goto LABEL_23;
      }
      objc_msgSend(v18, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", PREditorDepthEffectActionIdentifier);

      if (v30)
        goto LABEL_21;
      objc_msgSend(v16, "image");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImage:forState:", v31, 0);
LABEL_23:

      if (v14)
      {
        objc_msgSend(v21, "addAction:forControlEvents:", v14, 0x2000);
LABEL_27:
        objc_msgSend(v21, "setShowsMenuAsPrimaryAction:", v14 == 0);
        goto LABEL_28;
      }
      if (v18)
      {
        objc_msgSend(v21, "setMenu:", v18);
        goto LABEL_27;
      }
LABEL_28:
      objc_msgSend(v37, "addObject:", v21);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

LABEL_29:
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v4);
LABEL_31:

  if (objc_msgSend(v37, "count"))
    v32 = (void *)objc_msgSend(v37, "copy");
  else
    v32 = 0;

  return v32;
}

void __52__PREditorRootViewController__viewsForMenuElements___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_acquireModalPresentationAssertionForReason:", CFSTR("MenuPresentation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "setMenuPresentationAssertion:", v5);

}

- (void)_updateButtonLayout
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double Width;
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
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
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
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[8];
  _QWORD v109[4];
  _QWORD v110[8];
  _QWORD v111[4];
  _QWORD v112[4];
  _BYTE v113[128];
  uint64_t v114;
  CGRect v115;

  v114 = *MEMORY[0x1E0C80C00];
  if (-[PREditorRootViewController _appearState](self, "_appearState") == 2)
  {
    -[PREditorRootViewController leadingMenuElementViews](self, "leadingMenuElementViews");
    v3 = objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController trailingMenuElementViews](self, "trailingMenuElementViews");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!(v3 | v4))
    {
LABEL_36:

      return;
    }
    -[PREditorRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController pageControl](self, "pageControl");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaLayoutGuide");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    objc_msgSend((id)v4, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v3, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();

    v79 = (void *)v8;
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = (void *)v10;
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      obj = v12;
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (v86)
      {
        v74 = v12;
        v75 = v5;
        v76 = v4;
        v77 = v3;
        v15 = 0;
        v82 = *(_QWORD *)v105;
        do
        {
          v16 = 0;
          v17 = v15;
          do
          {
            if (*(_QWORD *)v105 != v82)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v16);
            if (v17)
              objc_msgSend(v17, "leadingAnchor");
            else
              objc_msgSend(v80, "trailingAnchor");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = (void *)MEMORY[0x1E0CB3718];
            objc_msgSend(v18, "centerYAnchor");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "centerYAnchor");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "constraintEqualToAnchor:", v98);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v112[0] = v95;
            objc_msgSend(v18, "widthAnchor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "constraintEqualToConstant:", 50.0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v112[1] = v20;
            objc_msgSend(v18, "heightAnchor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "constraintEqualToConstant:", 50.0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v112[2] = v22;
            objc_msgSend(v18, "trailingAnchor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "constraintEqualToAnchor:constant:", v89, -22.0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v112[3] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "activateConstraints:", v25);

            v15 = v18;
            ++v16;
            v17 = v15;
          }
          while (v86 != v16);
          v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
        }
        while (v86);
        goto LABEL_34;
      }
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v5, "window");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "frame");
    Width = CGRectGetWidth(v115);
    if (Width >= 395.0)
      v27 = 44.0;
    else
      v27 = 36.0;
    if (Width >= 395.0)
      v28 = 34.0;
    else
      v28 = 22.0;
    if (Width < 390.0)
    {
      v28 = 16.0;
      if ((unint64_t)objc_msgSend(v12, "count") >= 3)
        objc_msgSend(v85, "_setPreferredNumberOfVisibleIndicators:", 4);
    }
    v76 = v4;
    v77 = v3;
    v74 = v12;
    v75 = v5;
    if (objc_msgSend((id)v3, "count") == 1)
    {
      objc_msgSend((id)v3, "objectAtIndex:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v29, "centerYAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = v33;
      objc_msgSend(v29, "widthAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToConstant:", 50.0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v111[1] = v102;
      objc_msgSend(v29, "heightAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToConstant:", 50.0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v111[2] = v96;
      objc_msgSend(v29, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v27);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v111[3] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activateConstraints:", v38);
    }
    else
    {
      if (objc_msgSend((id)v3, "count") != 2)
        goto LABEL_29;
      objc_msgSend((id)v3, "objectAtIndex:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "objectAtIndex:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v29, "centerYAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v83 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "constraintEqualToAnchor:", v83);
      v87 = objc_claimAutoreleasedReturnValue();
      v110[0] = v87;
      objc_msgSend(v29, "widthAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToConstant:", 50.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v99;
      objc_msgSend(v29, "heightAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintEqualToConstant:", 50.0);
      v70 = objc_claimAutoreleasedReturnValue();
      v110[2] = v70;
      objc_msgSend(v29, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v28);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v110[3] = v38;
      objc_msgSend(v39, "centerYAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v68);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v110[4] = v66;
      objc_msgSend(v39, "widthAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToConstant:", 50.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v110[5] = v62;
      objc_msgSend(v39, "heightAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToConstant:", 50.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v110[6] = v40;
      objc_msgSend(v39, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, v28 + 50.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v110[7] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "activateConstraints:", v44);

      v33 = (void *)v83;
      v31 = v39;
      v35 = (void *)v70;

      v34 = (void *)v87;
      v32 = v93;

    }
    v4 = v76;
    v3 = v77;
    v12 = v74;
    v5 = v75;
LABEL_29:
    if (objc_msgSend((id)v4, "count") == 1)
    {
      objc_msgSend((id)v4, "objectAtIndex:", 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v15, "centerYAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v48;
      objc_msgSend(v15, "widthAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToConstant:", 50.0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v103;
      objc_msgSend(v15, "heightAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintEqualToConstant:", 50.0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v109[2] = v97;
      objc_msgSend(v15, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -v27);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v109[3] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "activateConstraints:", v53);
    }
    else
    {
      if (objc_msgSend((id)v4, "count") != 2)
        goto LABEL_35;
      objc_msgSend((id)v4, "objectAtIndex:", 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "objectAtIndex:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v15, "centerYAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v84 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:", v84);
      v88 = objc_claimAutoreleasedReturnValue();
      v108[0] = v88;
      objc_msgSend(v15, "widthAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToConstant:", 50.0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v100;
      objc_msgSend(v15, "heightAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToConstant:", 50.0);
      v71 = objc_claimAutoreleasedReturnValue();
      v108[2] = v71;
      objc_msgSend(v15, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "trailingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -v28);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v108[3] = v53;
      objc_msgSend(v54, "centerYAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerYAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v69);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v108[4] = v67;
      objc_msgSend(v54, "widthAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToConstant:", 50.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v108[5] = v63;
      objc_msgSend(v54, "heightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToConstant:", 50.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v108[6] = v55;
      objc_msgSend(v54, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -(v28 + 50.0));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v108[7] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 8);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "activateConstraints:", v59);

      v48 = (void *)v84;
      v46 = v54;
      v50 = (void *)v71;

      v49 = (void *)v88;
      v47 = v94;

    }
LABEL_34:

    v4 = v76;
    v3 = v77;
    v12 = v74;
    v5 = v75;
    goto LABEL_35;
  }
}

- (void)updateTopButtonsLayoutWithLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinY;
  CGFloat MinX;
  id v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[PREditorRootViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection"))
  {
    x = v11;
    y = v10;
    width = v9;
    height = v8;
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinY = CGRectGetMinY(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinX = CGRectGetMinX(v17);
  -[PREditorRootViewController setTopButtonsEdgeInsets:](self, "setTopButtonsEdgeInsets:", MinY, MinX, 0.0, MinX);

}

- (void)setTopButtonsEdgeInsets:(UIEdgeInsets)a3
{
  double left;
  double top;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  left = a3.left;
  top = a3.top;
  if (a3.left != self->_topButtonsEdgeInsets.left
    || a3.top != self->_topButtonsEdgeInsets.top
    || a3.right != self->_topButtonsEdgeInsets.right
    || a3.bottom != self->_topButtonsEdgeInsets.bottom)
  {
    self->_topButtonsEdgeInsets = a3;
    -[PREditorRootViewController leadingTopButtonXConstraint](self, "leadingTopButtonXConstraint");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", left);
    -[PREditorRootViewController leadingTopButtonYConstraint](self, "leadingTopButtonYConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", top);
    -[PREditorRootViewController trailingTopButtonXConstraint](self, "trailingTopButtonXConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", -left);
    -[PREditorRootViewController trailingTopButtonYConstraint](self, "trailingTopButtonYConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", top);

  }
}

- (void)setTopButtonsHidden:(BOOL)a3
{
  if (self->_topButtonsHidden != a3)
  {
    self->_topButtonsHidden = a3;
    -[PREditorRootViewController updateTopButtonAlpha](self, "updateTopButtonAlpha");
  }
}

- (void)updateTopButtonAlpha
{
  double v3;
  void *v4;
  id v5;

  v3 = 0.0;
  if (!-[PREditorRootViewController areTopButtonsHidden](self, "areTopButtonsHidden"))
  {
    if (-[PREditorRootViewController areControlsHidden](self, "areControlsHidden"))
      v3 = 0.0;
    else
      v3 = 1.0;
  }
  -[PREditorRootViewController cancelButton](self, "cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  -[PREditorRootViewController acceptButton](self, "acceptButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (void)setAllUserInteractionDisabledExceptForCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (self->_allUserInteractionDisabledExceptForCancelButton != a3)
  {
    v3 = a3;
    self->_allUserInteractionDisabledExceptForCancelButton = a3;
    -[PREditorRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController acceptButton](self, "acceptButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = !v3;
    objc_msgSend(v6, "setEnabled:", v7);
    if (v7)
    {
      -[PREditorRootViewController touchBlockingView](self, "touchBlockingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromSuperview");

      -[PREditorRootViewController setTouchBlockingView:](self, "setTouchBlockingView:", 0);
    }
    else
    {
      -[PREditorRootViewController cancelButton](self, "cancelButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bringSubviewToFront:", v25);
      v26 = v6;
      v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHitTestsAsOpaque:", 1);

      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v5, "insertSubview:belowSubview:", v8, v25);
      v19 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v8, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v22;
      objc_msgSend(v8, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      objc_msgSend(v8, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v12;
      objc_msgSend(v8, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activateConstraints:", v16);

      -[PREditorRootViewController setTouchBlockingView:](self, "setTouchBlockingView:", v8);
      v6 = v26;

    }
  }
}

- (void)setDepthEffectDisabled:(BOOL)a3
{
  if (self->_depthEffectDisabled != a3)
  {
    self->_depthEffectDisabled = a3;
    -[PREditorRootViewController depthEffectEnablementDidChange](self, "depthEffectEnablementDidChange");
  }
}

- (void)depthEffectEnablementDidChange
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[PREditorRootViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PREditorRootViewController editor](self, "editor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController reticleVibrancyView](self, "reticleVibrancyView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PREditorRootViewController isDepthEffectDisabled](self, "isDepthEffectDisabled");
    if (objc_msgSend(v10, "areViewsSharedBetweenLooks"))
    {
      -[PREditorRootViewController scrollView](self, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorRootViewController floatingContainerView](self, "floatingContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        -[PREditorRootViewController sidebarReticleVibrancyView](self, "sidebarReticleVibrancyView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[PREditorRootViewController sidebarReticleVibrancyView](self, "sidebarReticleVibrancyView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "insertSubview:belowSubview:", v6, v8);
        }
        else
        {
          -[PREditorRootViewController complicationsContainerView](self, "complicationsContainerView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "insertSubview:aboveSubview:", v6, v8);
        }

        goto LABEL_12;
      }
    }
    else
    {
      -[PREditorRootViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditorRootViewController floatingContainerViewsZStackView](self, "floatingContainerViewsZStackView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        -[PREditorRootViewController timeContainerScrollView](self, "timeContainerScrollView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertSubview:aboveSubview:", v6, v9);

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "insertSubview:belowSubview:", v6, v3);
LABEL_12:

  }
}

- (id)imageForDepthEffectActionTopLevelAction:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("square.2.layers.3d.fill");
  else
    v3 = CFSTR("square.2.layers.3d");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSubtitleHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_subtitleHidden != a3)
  {
    v3 = a3;
    self->_subtitleHidden = a3;
    -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pr_setSubtitleHidden:", v3);

  }
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  if (self->_usesEditingLayout != a3)
  {
    v3 = a3;
    self->_usesEditingLayout = a3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PREditorRootViewController_setUsesEditingLayout___block_invoke;
    v6[3] = &__block_descriptor_33_e55_v16__0__UIViewController_PREditorTitleViewController__8l;
    v7 = a3;
    -[PREditorRootViewController enumerateTimeViewControllersUsingBlock:](self, "enumerateTimeViewControllersUsingBlock:", v6);
    -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsesEditingLayout:", v3);

  }
}

uint64_t __51__PREditorRootViewController_setUsesEditingLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setUsesEditingLayout:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setControlsHidden:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_controlsHidden != a3)
  {
    v3 = a3;
    self->_controlsHidden = a3;
    -[PREditorRootViewController updateTopButtonAlpha](self, "updateTopButtonAlpha");
    -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");
    if (v3)
      v5 = 0.0;
    else
      v5 = 1.0;
    -[PREditorRootViewController lookNameLabel](self, "lookNameLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

    -[PREditorRootViewController pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v5);

    -[PREditorRootViewController contentOverlayView](self, "contentOverlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v5);

    -[PREditorRootViewController bottomLegibilityView](self, "bottomLegibilityView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", v5);

    -[PREditorRootViewController controlsDividerView](self, "controlsDividerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v5);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[PREditorRootViewController leadingMenuElementViews](self, "leadingMenuElementViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setAlpha:", v5);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v13);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PREditorRootViewController trailingMenuElementViews](self, "trailingMenuElementViews", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "setAlpha:", v5);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

    if (v3)
      -[PREditorRootViewController endLookInteractionHinting](self, "endLookInteractionHinting");
  }
}

- (void)setComplicationsRowConfigured:(BOOL)a3
{
  if (self->_complicationsRowConfigured != a3)
  {
    self->_complicationsRowConfigured = a3;
    -[PREditorRootViewController _updateComplicationsRowEmptyViewVisibility](self, "_updateComplicationsRowEmptyViewVisibility");
  }
}

- (void)setComplicationSidebarConfigured:(BOOL)a3
{
  if (self->_complicationSidebarConfigured != a3)
  {
    self->_complicationSidebarConfigured = a3;
    -[PREditorRootViewController _updateComplicationSidebarEmptyViewVisibility](self, "_updateComplicationSidebarEmptyViewVisibility");
  }
}

- (void)setFocusedComplicationElement:(int64_t)a3
{
  if (self->_focusedComplicationElement != a3)
  {
    self->_focusedComplicationElement = a3;
    -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");
  }
}

- (void)setFocusedQuickActionPosition:(int64_t)a3
{
  if (self->_focusedQuickActionPosition != a3)
  {
    self->_focusedQuickActionPosition = a3;
    -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");
    -[PREditorRootViewController _setNeedsEditingElementsVisibilityUpdate](self, "_setNeedsEditingElementsVisibilityUpdate");
  }
}

- (void)setTitleReticleActive:(BOOL)a3
{
  if (self->_titleReticleActive != a3)
  {
    self->_titleReticleActive = a3;
    -[PREditorRootViewController setNeedsReticleVisibilityUpdate](self, "setNeedsReticleVisibilityUpdate");
  }
}

- (void)setNeedsReticleVisibilityUpdate
{
  _QWORD block[5];

  if (!self->_needsReticleVisibilityUpdate)
  {
    self->_needsReticleVisibilityUpdate = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PREditorRootViewController_setNeedsReticleVisibilityUpdate__block_invoke;
    block[3] = &unk_1E2184010;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __61__PREditorRootViewController_setNeedsReticleVisibilityUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateReticleVisibilityIfNeeded");
}

- (void)_setNeedsEditingElementsVisibilityUpdate
{
  _QWORD block[5];

  if (!self->_needsEditingElementsVisibilityUpdate)
  {
    self->_needsEditingElementsVisibilityUpdate = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PREditorRootViewController__setNeedsEditingElementsVisibilityUpdate__block_invoke;
    block[3] = &unk_1E2184010;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __70__PREditorRootViewController__setNeedsEditingElementsVisibilityUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEditingElementsVisibilityIfNeeded");
}

- (void)_updateEditingElementsVisibilityIfNeeded
{
  int64_t v3;
  void *v4;
  double v5;
  id v6;

  if (self->_needsEditingElementsVisibilityUpdate)
  {
    self->_needsEditingElementsVisibilityUpdate = 0;
    v3 = -[PREditorRootViewController focusedQuickActionPosition](self, "focusedQuickActionPosition");
    -[PREditorRootViewController timeContainerView](self, "timeContainerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController complicationsContainerView](self, "complicationsContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v5 = 0.0;
    else
      v5 = 1.0;
    objc_msgSend(v6, "setAlpha:", v5);
    objc_msgSend(v4, "setAlpha:", v5);

  }
}

- (void)updateReticleVisibilityIfNeeded
{
  int64_t v3;
  _BOOL8 v4;
  BOOL v5;
  int64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (self->_needsReticleVisibilityUpdate)
  {
    self->_needsReticleVisibilityUpdate = 0;
    v3 = -[PREditorRootViewController focusedComplicationElement](self, "focusedComplicationElement");
    v4 = -[PREditorRootViewController isTitleReticleActive](self, "isTitleReticleActive");
    v5 = -[PREditorRootViewController areControlsHidden](self, "areControlsHidden");
    v6 = -[PREditorRootViewController focusedQuickActionPosition](self, "focusedQuickActionPosition");
    if (v4)
    {
      v7 = 0;
      v8 = 0;
      v9 = 1.0;
      v10 = 0.0;
    }
    else if (v3)
    {
      v7 = v3 == 2;
      v8 = v3 == 3;
      v9 = 0.0;
      if (v3 == 1)
        v10 = 1.0;
      else
        v10 = 0.0;
    }
    else
    {
      if (v6)
        v11 = 1;
      else
        v11 = v5;
      if ((v11 & 1) != 0)
      {
        v7 = 0;
        v8 = 0;
        v10 = 0.0;
        v9 = 0.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "userInterfaceIdiom");

        v10 = 1.0;
        if (v13 == 1)
        {
          -[PREditorRootViewController view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "windowScene");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "interfaceOrientation");

          v7 = (unint64_t)(v17 - 1) < 2;
          v8 = (unint64_t)(v17 - 3) < 2;
        }
        else
        {
          v8 = 0;
          v7 = 1;
        }
        v9 = 1.0;
      }
    }
    -[PREditorRootViewController titleReticleView](self, "titleReticleView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController inlineComplicationReticleView](self, "inlineComplicationReticleView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController complicationRowReticleView](self, "complicationRowReticleView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController complicationSidebarReticleView](self, "complicationSidebarReticleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", v9);
    objc_msgSend(v18, "setAlpha:", v10);
    objc_msgSend(v19, "setAlpha:", (double)v7);
    objc_msgSend(v20, "setAlpha:", (double)v8);
    if (PREditingSupportsLiveBlurs())
    {
      objc_msgSend(v21, "setActive:", v4);
      objc_msgSend(v18, "setActive:", v3 == 1);
      objc_msgSend(v19, "setActive:", v3 == 2);
      objc_msgSend(v20, "setActive:", v3 == 3);
    }
    -[PREditorRootViewController _updateComplicationsRowEmptyViewVisibility](self, "_updateComplicationsRowEmptyViewVisibility");
    -[PREditorRootViewController _updateComplicationSidebarEmptyViewVisibility](self, "_updateComplicationSidebarEmptyViewVisibility");

  }
}

- (void)setContentOverlayView:(id)a3
{
  UIView *v5;
  UIView **p_contentOverlayView;
  UIView *contentOverlayView;
  UIView *v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  UIView *v12;
  UIView *contentOverlayContainerView;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  UIView *v20;

  v5 = (UIView *)a3;
  p_contentOverlayView = &self->_contentOverlayView;
  contentOverlayView = self->_contentOverlayView;
  if (contentOverlayView != v5)
  {
    v20 = v5;
    v8 = contentOverlayView;
    -[PREditorRootViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](v20, "bounds");
    -[UIView setFrame:](v20, "setFrame:");
    objc_storeStrong((id *)&self->_contentOverlayView, a3);
    v10 = -[PREditorRootViewController areControlsHidden](self, "areControlsHidden");
    v11 = 1.0;
    if (v10)
      v11 = 0.0;
    -[UIView setAlpha:](v20, "setAlpha:", v11);
    if (-[PREditorRootViewController isViewLoaded](self, "isViewLoaded") && v9)
    {
      -[UIView superview](v8, "superview");
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIView removeFromSuperview](v8, "removeFromSuperview");
      contentOverlayContainerView = self->_contentOverlayContainerView;
      if (v12 == contentOverlayContainerView)
      {
        -[UIView addSubview:](v12, "addSubview:", v20);
      }
      else
      {
        -[UIView subviews](contentOverlayContainerView, "subviews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_class();
        v17 = v15;
        if (v16)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v17;
          else
            v18 = 0;
        }
        else
        {
          v18 = 0;
        }
        v19 = v18;

        objc_msgSend(v19, "addContentView:", *p_contentOverlayView);
      }

    }
    v5 = v20;
  }

}

- (void)scrollToLook:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a4;
  v6 = a3;
  -[PREditorRootViewController looks](self, "looks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    -[PREditorRootViewController scrollToLookAtIndex:animated:](self, "scrollToLookAtIndex:animated:", v8, v4);
}

- (void)scrollToLookAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  -[PREditorRootViewController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController scrollContentOffsetForLookAtIndex:](self, "scrollContentOffsetForLookAtIndex:", a3);
  objc_msgSend(v7, "setContentOffset:animated:", v4);

}

- (CGPoint)scrollContentOffsetForLook:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  CGPoint result;

  v4 = a3;
  -[PREditorRootViewController looks](self, "looks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[PREditorRootViewController scrollContentOffsetForLookAtIndex:](self, "scrollContentOffsetForLookAtIndex:", v6);
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)scrollContentOffsetForLookAtIndex:(unint64_t)a3
{
  void *v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;

  -[PREditorRootViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  Width = CGRectGetWidth(v11);
  if (objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection"))
  {
    -[PREditorRootViewController looks](self, "looks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "count") + ~a3;

  }
  v8 = 0.0;
  v9 = Width * (double)a3;
  result.y = v8;
  result.x = v9;
  return result;
}

- (id)lookAtScrollContentOffset:(CGPoint)a3
{
  return -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", 0, a3.x, a3.y);
}

- (id)lookAtScrollContentOffset:(CGPoint)a3 fractionOfDistanceThroughLook:(double *)a4
{
  double x;
  void *v7;
  CGFloat Width;
  long double v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double __y;
  CGRect v19;

  x = a3.x;
  -[PREditorRootViewController scrollView](self, "scrollView", a3.x, a3.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  Width = CGRectGetWidth(v19);
  __y = 0.0;
  v9 = modf(x / Width, &__y);
  -[PREditorRootViewController looks](self, "looks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = 0;
  v13 = __y;
  if (__y >= 0.0)
    v12 = -[PREditorRootViewController lookIndexForViewIndex:](self, "lookIndexForViewIndex:", (unint64_t)__y);
  v14 = v11 - 1;
  if (!v11)
    v14 = 0;
  if (v12 >= v11)
    v15 = v14;
  else
    v15 = v12;
  objc_msgSend(v10, "objectAtIndex:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = v9;

  return v16;
}

- (unint64_t)lookIndexForContentOffset:(CGPoint)a3
{
  double x;
  void *v4;
  float v5;
  unint64_t v6;
  CGRect v8;

  x = a3.x;
  -[PREditorRootViewController scrollView](self, "scrollView", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = x / CGRectGetWidth(v8);
  v6 = vcvtms_u32_f32(v5);

  return v6;
}

- (unint64_t)lookIndexForViewIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  if (v6)
  {
    -[PREditorRootViewController looks](self, "looks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "count") + ~a3;

  }
  return a3;
}

- (unint64_t)viewIndexForLookIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[PREditorRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  if (v6)
  {
    -[PREditorRootViewController looks](self, "looks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "count") + ~a3;

  }
  return a3;
}

- (CGRect)frameForPageAtViewIndex:(unint64_t)a3
{
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  -[PREditorRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v9 = CGRectGetWidth(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetHeight(v16);

  v11 = 0.0;
  v12 = v9 * (double)a3;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameForPageAtLookIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PREditorRootViewController frameForPageAtViewIndex:](self, "frameForPageAtViewIndex:", -[PREditorRootViewController viewIndexForLookIndex:](self, "viewIndexForLookIndex:", a3));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3
{
  UIScrollView *scrollView;
  id v4;
  id v5;

  scrollView = self->_scrollView;
  v4 = a3;
  -[UIScrollView panGestureRecognizer](scrollView, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requireGestureRecognizerToFail:", v4);

}

- (void)updatePageControlCurrentPage
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PREditorRootViewController currentLook](self, "currentLook");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController looks](self, "looks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", v6);
  -[PREditorRootViewController pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentPage:", v4);

}

- (void)pageControlCurrentPageDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentPage");
  v6 = objc_msgSend(v4, "interactionState");

  -[PREditorRootViewController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController scrollContentOffsetForLookAtIndex:](self, "scrollContentOffsetForLookAtIndex:", v5);
  objc_msgSend(v7, "setContentOffset:animated:", v6 != 2);
  -[PREditorRootViewController endLookInteractionHinting](self, "endLookInteractionHinting");

}

- (void)titleViewTapped:(id)a3
{
  id v3;

  -[PREditorRootViewController editor](self, "editor", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentTimeStyleEditor");

}

- (id)timeViewControllerForLook:(id)a3
{
  return -[PREditorTitleViewControllerCoordinator titleViewControllerForLook:](self->_titleViewControllerCoordinator, "titleViewControllerForLook:", a3);
}

- (void)enumerateTimeViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[PREditorRootViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PREditorRootViewController looks](self, "looks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)currentLook
{
  void *v2;
  void *v3;

  -[PREditorRootViewController editor](self, "editor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configuredProperties
{
  void *v2;
  void *v3;

  -[PREditorRootViewController editor](self, "editor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultTitleStyleConfigurationForLook:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTitleStyleConfigurationForLook:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)effectiveTitleStyleConfigurationForLook:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveTitleStyleConfigurationForLook:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)extensionBundleURL
{
  void *v2;
  void *v3;

  -[PREditorRootViewController editor](self, "editor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didTransitionToLook:(id)a3 method:(int64_t)a4 progress:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PRLogEditing();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    v28 = 2048;
    v29 = a5;
    v30 = 1024;
    LODWORD(v31) = a4 == 1;
    _os_log_impl(&dword_18B634000, v9, OS_LOG_TYPE_DEFAULT, "did transition to look '%{public}@', progress: %f, discrete: %{BOOL}u", buf, 0x1Cu);

  }
  -[PREditorRootViewController lookTransition](self, "lookTransition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController currentLook](self, "currentLook");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "matchesCurrentLook:destinationLook:", v12, v8) & 1) == 0)
  {
    objc_msgSend(v11, "currentLook");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "destinationLook");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PRLogEditing();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "identifier");
      v25 = a4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v24 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v16;
      v28 = 2114;
      v29 = *(double *)&v17;
      v30 = 2114;
      v31 = v18;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_18B634000, v15, OS_LOG_TYPE_DEFAULT, "Current coordinated transition ('%{public}@' -> '%{public}@') does not match '%{public}@' -> '%{public}@', invalidating", buf, 0x2Au);

      v13 = v24;
      a4 = v25;
    }

    objc_msgSend(v11, "destinationLook");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v8, "isEqual:", v20);

    if (v21)
      objc_msgSend(v11, "finishInteractiveTransition");
    else
      objc_msgSend(v11, "cancelInteractiveTransition");

    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_12:
    -[PREditorRootViewController beginTransitionToLook:method:](self, "beginTransitionToLook:method:", v8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "updateInteractiveTransition:", a5);
  -[PREditorRootViewController editor](self, "editor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 >= 0.0 && a5 <= 1.0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "editor:didTransitionToLook:progress:", v22, v8, a5);

}

- (id)beginTransitionToLook:(id)a3 method:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  PREditorLookTransition *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  PREditorLookTransition *v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  void *v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void (**v24)(_QWORD);
  PREditorSlidingTitleTransition *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PREditorLookTransition *v37;
  void *v39;
  PREditorLookSwitchingComplicationTransition *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD);
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  PREditorRootViewController *v57;
  PREditorLookTransition *v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  PRLogEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v53, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v6;
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Begin coordinated transition to look '%{public}@'", buf, 0xCu);

  }
  -[PREditorRootViewController currentLook](self, "currentLook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PREditorLookTransition initWithCurrentLook:destinationLook:]([PREditorLookTransition alloc], "initWithCurrentLook:destinationLook:", v7, v53);
  -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
  v11 = objc_claimAutoreleasedReturnValue();
  v49 = v9;
  objc_msgSend(v9, "vibrancyConfigurationWithExtensionBundleURL:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vibrancyConfigurationWithExtensionBundleURL:", v11);
  v47 = (void *)v12;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualObjects();
  -[PREditorTitleViewControllerCoordinator prepareInteractiveTransitionForStartingLook:](self->_titleViewControllerCoordinator, "prepareInteractiveTransitionForStartingLook:", v7);
  -[PREditorTitleViewControllerCoordinator cachingVibrancyProviderForLook:](self->_titleViewControllerCoordinator, "cachingVibrancyProviderForLook:", v7);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v53);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __59__PREditorRootViewController_beginTransitionToLook_method___block_invoke;
  v54[3] = &unk_1E2184830;
  v16 = v14;
  v55 = v16;
  v45 = v15;
  v56 = v45;
  v57 = self;
  v17 = v8;
  v58 = v17;
  v18 = MEMORY[0x18D77C604](v54);
  v19 = (void (**)(_QWORD))v18;
  v48 = v10;
  v44 = v16;
  if (a4 == 1)
  {
    (*(void (**)(uint64_t))(v18 + 16))(v18);
    v20 = (void *)v11;
  }
  else
  {
    v20 = (void *)v11;
    if (-[PREditorRootViewController shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:toTitleStyleConfiguration:extensionBundleURL:](self, "shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:toTitleStyleConfiguration:extensionBundleURL:", v49, v10, v11))
    {
      v19[2](v19);
      if ((v13 & 1) == 0)
      {
        objc_msgSend(v16, "pr_baseFont");
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorTitleViewControllerCoordinator beginInteractiveTransitionForStartingLook:toBaseFont:vibrancyConfiguration:](self->_titleViewControllerCoordinator, "beginInteractiveTransitionForStartingLook:toBaseFont:vibrancyConfiguration:", v7, v22, v50);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorLookTransition setTitleStyleTransition:](v17, "setTitleStyleTransition:", v23);

        v19 = v21;
      }
    }
    else
    {
      v24 = v19;
      v25 = -[PREditorSlidingTitleTransition initWithSourceTitleViewController:destinationTitleViewController:]([PREditorSlidingTitleTransition alloc], "initWithSourceTitleViewController:destinationTitleViewController:", v16, v45);
      -[PREditorLookTransition setTitleScrollingTransition:](v17, "setTitleScrollingTransition:", v25);

      v19 = v24;
    }
  }
  objc_msgSend(v7, "displayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "displayName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController lookNameLabel](self, "lookNameLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v26);
  objc_msgSend(v28, "beginInteractiveTransitionToText:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorLookTransition setLookNameTransition:](v17, "setLookNameTransition:", v29);
  if (a4 == 1)
    v30 = 0;
  else
    v30 = v13;
  if ((v30 & 1) == 0)
  {
    v43 = v19;
    v40 = -[PREditorLookSwitchingComplicationTransition initWithFromVibrancyConfiguration:toVibrancyConfiguration:viewController:cachingVibrancyTransitionProvider:]([PREditorLookSwitchingComplicationTransition alloc], "initWithFromVibrancyConfiguration:toVibrancyConfiguration:viewController:cachingVibrancyTransitionProvider:", v47, v50, self, v46);
    -[PREditorLookTransition setComplicationTransition:](v17, "setComplicationTransition:", v40);
    -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
    v39 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController extensionBundleURL](self, "extensionBundleURL");
    v42 = v26;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController editor](self, "editor");
    v52 = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "posterRole");
    v41 = v27;
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "effectiveTimeFontWithExtensionBundleURL:forRole:", v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:", v35, v50, v46);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorLookTransition setSubtitleStyleTransition:](v17, "setSubtitleStyleTransition:", v36);

    v19 = v43;
    v20 = v52;

    v27 = v41;
    v26 = v42;

    v7 = v39;
  }
  -[PREditorRootViewController setLookTransition:](self, "setLookTransition:", v17);
  v37 = v17;

  return v37;
}

void __59__PREditorRootViewController_beginTransitionToLook_method___block_invoke(uint64_t a1)
{
  PREditorFixedTitleTransition *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PREditorFixedTitleTransition *v6;

  v2 = [PREditorFixedTitleTransition alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PREditorFixedTitleTransition initWithSourceTitleViewController:destinationTitleViewController:anchorView:](v2, "initWithSourceTitleViewController:destinationTitleViewController:anchorView:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 56), "setTitleScrollingTransition:", v6);
}

- (void)didFinishTransitionToLook:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRLogEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Did finish transition to look '%{public}@'", (uint8_t *)&v20, 0xCu);

  }
  -[PREditorRootViewController lookTransition](self, "lookTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationLook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);
  if (v7)
  {
    PRLogEditing();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEFAULT, "Finishing transition object successfully", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(v7, "finishInteractiveTransition");
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v12;
        _os_log_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEFAULT, "Canceling transition object (object look: '%{public}@')", (uint8_t *)&v20, 0xCu);

      }
      objc_msgSend(v7, "cancelInteractiveTransition");
    }
    -[PREditorRootViewController setLookTransition:](self, "setLookTransition:", 0);
  }
  -[PREditorRootViewController editor](self, "editor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didFinishTransitionToLook:", v4);
  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v9)
      v15 = 1.0;
    else
      v15 = 0.0;
    PRLogEditing();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2048;
      v23 = v15;
      _os_log_impl(&dword_18B634000, v16, OS_LOG_TYPE_DEFAULT, "Sending final didTransitionToLook delegate method with look '%{public}@', progress: %f", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(v14, "editor:didTransitionToLook:progress:", v13, v8, v15);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    PRLogEditing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_18B634000, v18, OS_LOG_TYPE_DEFAULT, "Sending didFinishTransitionToLook delegate method with look '%{public}@'", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v14, "editor:didFinishTransitionToLook:", v13, v4);
  }

}

- (BOOL)shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:(id)a3 toTitleStyleConfiguration:(id)a4 extensionBundleURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "effectiveTimeFontWithExtensionBundleURL:forRole:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "effectiveTimeFontWithExtensionBundleURL:forRole:", v8, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v13, "isEqual:", v14);
  return (char)v9;
}

- (void)forciblyFinishLookTransition
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController lookTransition](self, "lookTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "destinationLook");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PRLogEditing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "Forcibly ending transition to look '%{public}@'", (uint8_t *)&v12, 0xCu);

    }
    -[PREditorRootViewController currentLook](self, "currentLook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v5) & 1) == 0)
    {
      PRLogEditing();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_18B634000, v9, OS_LOG_TYPE_DEFAULT, "Changing current look while forcibly ending transition to look '%{public}@'", (uint8_t *)&v12, 0xCu);

      }
      -[PREditorRootViewController editor](self, "editor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCurrentLook:", v5);

    }
    -[PREditorRootViewController didFinishTransitionToLook:](self, "didFinishTransitionToLook:", v5);

  }
}

- (id)makeComplicationsHostingScene
{
  PREditorComplicationSceneSpecification *v3;
  void *v4;

  v3 = objc_alloc_init(PREditorComplicationSceneSpecification);
  -[PREditorRootViewController makeComplicationHostingSceneWithSpecification:](self, "makeComplicationHostingSceneWithSpecification:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeComplicationHostingSceneWithSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PREditorRootViewController_makeComplicationHostingSceneWithSpecification___block_invoke;
  v10[3] = &unk_1E2184858;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "createScene:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __76__PREditorRootViewController_makeComplicationHostingSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a2;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PREditor-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setSpecification:", *(_QWORD *)(a1 + 32));
  v9 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", CFSTR("com.apple.PosterBoard"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityForProcessIdentity:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientIdentity:", v10);

}

- (BOOL)_shouldShowQuickActionEditing
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!PRLockPickIsActive())
    return 0;
  -[PREditorRootViewController editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterRole");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PRPosterRoleLockScreen")))
  {
    -[PREditorRootViewController editor](self, "editor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "variant") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)makeQuickActionsHostingScene
{
  PREditorQuickActionsSceneSpecification *v3;
  void *v4;

  v3 = objc_alloc_init(PREditorQuickActionsSceneSpecification);
  -[PREditorRootViewController makeComplicationHostingSceneWithSpecification:](self, "makeComplicationHostingSceneWithSpecification:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeQuickActionsHostingSceneWithSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PREditorRootViewController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PREditorRootViewController_makeQuickActionsHostingSceneWithSpecification___block_invoke;
  v10[3] = &unk_1E2184858;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "createScene:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __76__PREditorRootViewController_makeQuickActionsHostingSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a2;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PREditor-QuickActions-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setSpecification:", *(_QWORD *)(a1 + 32));
  v9 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", CFSTR("com.apple.PosterBoard"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityForProcessIdentity:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientIdentity:", v10);

}

- (void)disconnect
{
  if (!-[PREditorRootViewController isDisconnected](self, "isDisconnected"))
    -[PREditorRootViewController setDisconnected:](self, "setDisconnected:", 1);
}

- (void)reconnect
{
  if (-[PREditorRootViewController isDisconnected](self, "isDisconnected"))
    -[PREditorRootViewController setDisconnected:](self, "setDisconnected:", 0);
}

- (void)setPresentingModalViewController:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v3 = a3;
  v24[4] = *MEMORY[0x1E0C80C00];
  -[PREditorRootViewController presentationDismissalGestureView](self, "presentationDismissalGestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3 || v5)
  {
    if (!v3 && v5)
    {
      objc_msgSend(v5, "removeFromSuperview");
      -[PREditorRootViewController setPresentationDismissalGestureView:](self, "setPresentationDismissalGestureView:", 0);
    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHitTestsAsOpaque:", 1);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_modalPresentationDismissGestureDidFire_);
    objc_msgSend(v6, "addGestureRecognizer:", v23);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditorRootViewController setPresentationDismissalGestureView:](self, "setPresentationDismissalGestureView:", v6);
    -[PREditorRootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);
    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(v6, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    objc_msgSend(v6, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    objc_msgSend(v6, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (void)modalPresentationDismissGestureDidFire:(id)a3
{
  id v3;

  -[PREditorRootViewController editor](self, "editor", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIEdgeInsets)editingChromeDodgingInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  double MinY;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  CGFloat MaxY;
  CGFloat MaxX;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  id *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  UIEdgeInsets result;

  -[PREditorRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PREditorRootViewController editorElementLayoutController](self, "editorElementLayoutController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController editor](self, "editor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "areComplicationsAllowed");

  v15 = -[PREditorRootViewController interfaceOrientation](self, "interfaceOrientation") - 1;
  -[PREditingStandaloneLabelView frame](self->_lookNameLabel, "frame");
  MinY = CGRectGetMinY(v39);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if (v15 >= 2 && (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v20 = 3;
    else
      v20 = 11;
  }
  else
  {
    v20 = 3;
  }
  objc_msgSend(v12, "frameForElements:variant:withBoundingRect:", v20, 3, v5, v7, v9, v11);
  MaxY = CGRectGetMaxY(v40);
  MaxX = 0.0;
  if (v14
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "userInterfaceIdiom"),
        v23,
        (v24 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    v25 = 0.0;
    if (v15 >= 2)
    {
      objc_msgSend(v12, "frameForElements:variant:withBoundingRect:", 16, 3, v5, v7, v9, v11);
      v27 = v26;
      v29 = v28;
      v37 = v31;
      v38 = v30;
      v32 = (id *)MEMORY[0x1E0DC4730];
      if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") != 1)
      {
        v41.origin.x = v27;
        v41.origin.y = v29;
        v41.size.height = v37;
        v41.size.width = v38;
        MaxX = CGRectGetMaxX(v41);
      }
      if (objc_msgSend(*v32, "userInterfaceLayoutDirection") == 1)
      {
        v42.origin.x = v27;
        v42.origin.y = v29;
        v42.size.height = v37;
        v42.size.width = v38;
        v25 = v9 - CGRectGetMinX(v42);
      }
    }
  }
  else
  {
    v25 = 0.0;
  }

  v33 = MaxY;
  v34 = MaxX;
  v35 = v11 - MinY;
  v36 = v25;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PREditorRootViewController *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __41__PREditorRootViewController_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __41__PREditorRootViewController_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)beginLookInteractionHinting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[PREditorRootViewController looks](self, "looks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2
    && !-[PREditorRootViewController areControlsHidden](self, "areControlsHidden"))
  {
    -[PREditorRootViewController lookInteractionHintLabel](self, "lookInteractionHintLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EDIT_LOOKS_INTERACTION_HINT"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __57__PREditorRootViewController_beginLookInteractionHinting__block_invoke;
    v13 = &unk_1E2184880;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "timerWithTimeInterval:repeats:block:", 0, &v10, 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[PREditorRootViewController setLookInteractionHintTimer:](self, "setLookInteractionHintTimer:", v8);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __57__PREditorRootViewController_beginLookInteractionHinting__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endLookInteractionHinting");

}

- (void)endLookInteractionHinting
{
  NSTimer *lookInteractionHintTimer;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  if (!-[PREditorRootViewController isLookInteractionHintCompleted](self, "isLookInteractionHintCompleted"))
  {
    -[PREditorRootViewController setLookInteractionHintCompleted:](self, "setLookInteractionHintCompleted:", 1);
    if (-[NSTimer isValid](self->_lookInteractionHintTimer, "isValid"))
    {
      -[NSTimer invalidate](self->_lookInteractionHintTimer, "invalidate");
      lookInteractionHintTimer = self->_lookInteractionHintTimer;
      self->_lookInteractionHintTimer = 0;

      -[PREditorRootViewController lookInteractionHintLabel](self, "lookInteractionHintLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x1E0C809B0];
      v6 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__PREditorRootViewController_endLookInteractionHinting__block_invoke;
      v13[3] = &unk_1E2184010;
      v14 = v4;
      v7 = v4;
      objc_msgSend(v6, "animateWithDuration:animations:", v13, 0.2);
      -[PREditorRootViewController lookNameLabel](self, "lookNameLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __55__PREditorRootViewController_endLookInteractionHinting__block_invoke_2;
      v11[3] = &unk_1E2184010;
      v12 = v8;
      v10 = v8;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 0, v11, 0, 0.2, 0.1);

    }
  }
}

uint64_t __55__PREditorRootViewController_endLookInteractionHinting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __55__PREditorRootViewController_endLookInteractionHinting__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  id v6;
  int64_t var0;
  double v8;
  long double v9;
  double x;
  double Width;
  void *v12;
  _BOOL4 v13;
  double v14;
  int v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  double v33;
  BOOL v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t i;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t IsZero;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PREditorRootViewController *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  double v84;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[PREditorRootViewController ignoresScrolling](self, "ignoresScrolling"))
  {
    var0 = a4->var0;
    if (a4->var0 != 1)
      -[PREditorRootViewController endLookInteractionHinting](self, "endLookInteractionHinting");
    objc_msgSend(v6, "contentOffset");
    v9 = v8;
    x = a4->var2.x;
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v87);
    -[PREditorRootViewController looks](self, "looks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v12, "count");
    v13 = v9 > Width * (double)(unint64_t)(v76 - 1) || v9 < 0.0;
    v14 = nexttoward(v9 + Width, v9);
    v15 = v9 >= x || v13;
    v16 = v9 < x || v13;
    if (v15)
      v17 = v9;
    else
      v17 = v14;
    if (v16)
      v18 = v9;
    else
      v18 = v14;
    v84 = 0.0;
    -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", &v84, v17, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", 0, v18, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController editor](self, "editor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController currentLook](self, "currentLook");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if ((v22 & 1) == 0)
      objc_msgSend(v79, "setCurrentLook:", v19);
    -[PREditorRootViewController contentOverlayContainerView](self, "contentOverlayContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v78 = v23;
    objc_msgSend(v23, "setFrame:", (double)v9, 0.0);
    v77 = v20;
    if ((PUIDynamicRotationIsActive() & 1) == 0)
    {
      objc_msgSend(v23, "subviews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_class();
      v27 = v25;
      if (v26)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      v29 = v28;

      objc_msgSend(v29, "frame");
      objc_msgSend(v29, "setFrame:", (double)v9, 0.0);

      v20 = v77;
    }
    if (v13)
    {
      objc_msgSend(v12, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v19, "isEqual:", v30);
      v32 = v84 > 0.0;

      v33 = v84;
      if ((v31 & v32) != 0)
        v33 = v84 + 1.0;
    }
    else
    {
      v34 = v9 < x || var0 == 1;
      v33 = v84;
      if (v34)
        v33 = 1.0 - v84;
    }
    -[PREditorRootViewController didTransitionToLook:method:progress:](self, "didTransitionToLook:method:progress:", v20, a4->var0, v33);
    if (objc_msgSend(v79, "areViewsSharedBetweenLooks"))
    {
      -[PREditorRootViewController _updateReticleViewFramesWithOffset:](self, "_updateReticleViewFramesWithOffset:", (double)v9);
    }
    else
    {
      v72 = v19;
      v74 = v12;
      -[PREditorRootViewController timeContainerScrollView](self, "timeContainerScrollView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setContentOffset:", (double)v9, 0.0);

      objc_msgSend(v6, "bounds");
      v37 = v36;
      v75 = v6;
      objc_msgSend(v6, "bounds");
      v39 = v38;
      -[PREditorRootViewController backgroundForegroundContainerViewsZStackView](self, "backgroundForegroundContainerViewsZStackView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "subviews");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "reverseObjectEnumerator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "allObjects");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = self;
      -[PREditorRootViewController floatingContainerViewsZStackView](self, "floatingContainerViewsZStackView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "subviews");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "reverseObjectEnumerator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v46 = v42;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v81;
        v50 = v9;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v81 != v49)
              objc_enumerationMutation(v46);
            v52 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            v53 = fabs(v50);
            v54 = v37 - v50;
            if (v50 <= 0.0)
              v54 = v37;
            if (v53 <= v37)
              v55 = v54;
            else
              v55 = 0.0;
            objc_msgSend(v45, "objectAtIndex:", objc_msgSend(v46, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i), v54));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setFrame:", 0.0, 0.0, v55, v39);
            objc_msgSend(v52, "setFrame:", 0.0, 0.0, v55, v39);
            IsZero = BSFloatIsZero();
            objc_msgSend(v52, "setHidden:", IsZero);
            objc_msgSend(v56, "setHidden:", IsZero);
            objc_msgSend(v52, "layer");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "layer");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if ((IsZero & 1) != 0 || v50 >= 0.0 || v53 > v37)
            {
              objc_msgSend(v58, "setMask:", 0);
              objc_msgSend(v59, "setMask:", 0);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CD2840], "layer");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v53, 0.0, v37 - v53, v39, 0.0);
              v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v60, "setPath:", objc_msgSend(v61, "CGPath"));
              objc_msgSend(v58, "setMask:", v60);
              objc_msgSend(v59, "setMask:", v60);

            }
            v50 = v50 - v37;

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        }
        while (v48);
      }

      v6 = v75;
      v62 = objc_msgSend(v75, "effectiveUserInterfaceLayoutDirection");
      v19 = v72;
      v20 = v77;
      if (v9 >= x)
        v63 = v72;
      else
        v63 = v77;
      v12 = v74;
      v64 = objc_msgSend(v74, "indexOfObject:", v63);
      if (v62)
        v65 = -(v9 - v37 * (double)(v76 - v64));
      else
        v65 = v37 - (v9 - v37 * (double)v64);
      objc_msgSend(v75, "traitCollection");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "displayScale");
      BSFloatRoundForScale();
      v68 = v67;

      -[PREditorRootViewController looksDividerView](v73, "looksDividerView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setFrame:", v65 - v68, 0.0, 8.0, v39);

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double Width;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  long double __y;
  CGRect v17;

  x = a4.x;
  v15 = a3;
  if (!-[PREditorRootViewController ignoresScrolling](self, "ignoresScrolling")
    && (objc_msgSend(v15, "isPagingEnabled") & 1) == 0)
  {
    objc_msgSend(v15, "frame");
    Width = CGRectGetWidth(v17);
    objc_msgSend(v15, "contentOffset");
    v10 = v9 / Width;
    if (x > 0.1 || x >= -0.1 && modf(v10, &__y) >= 0.5)
      v10 = v10 + 1.0;
    a5->x = Width * floor(v10);
    -[PREditorRootViewController lookAtScrollContentOffset:](self, "lookAtScrollContentOffset:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController looks](self, "looks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v11);

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PREditorRootViewController pageControl](self, "pageControl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCurrentPage:", v13);

    }
  }

}

- (void)scrollViewDidEndScrolling:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = -[PREditorRootViewController ignoresScrolling](self, "ignoresScrolling");
  v5 = v13;
  if (!v4)
  {
    objc_msgSend(v13, "contentOffset");
    v7 = v6;
    v9 = v8;
    -[PREditorRootViewController currentLook](self, "currentLook");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorRootViewController lookAtScrollContentOffset:](self, "lookAtScrollContentOffset:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v10) & 1) == 0)
    {
      -[PREditorRootViewController editor](self, "editor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCurrentLook:", v11);

    }
    -[PREditorRootViewController didFinishTransitionToLook:](self, "didFinishTransitionToLook:", v11);

    v5 = v13;
  }

}

- (void)dateProvider:(id)a3 didUpdateDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PREditorRootViewController_dateProvider_didUpdateDate___block_invoke;
  v12[3] = &unk_1E21848A8;
  v6 = v5;
  v13 = v6;
  -[PREditorRootViewController enumerateTimeViewControllersUsingBlock:](self, "enumerateTimeViewControllersUsingBlock:", v12);
  -[PREditorRootViewController subtitleViewController](self, "subtitleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayDate:", v6);

  -[PREditorRootViewController currentLook](self, "currentLook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "isFourDigitTime");
      if (self->_fourDigitTime != (_DWORD)v10)
      {
        v11 = v10;
        -[PREditorRootViewController setFourDigitTime:](self, "setFourDigitTime:", v10);
        -[PREditorElementLayoutController setFourDigitTime:](self->_editorElementLayoutController, "setFourDigitTime:", v11);
        -[PREditorRootViewController updateReticleViewFrames](self, "updateReticleViewFrames");
      }
    }

  }
}

uint64_t __57__PREditorRootViewController_dateProvider_didUpdateDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDisplayDate:", *(_QWORD *)(a1 + 32));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[PREditorRootViewController lookTransition](self, "lookTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v4, CFSTR("lookTransition"), 1);

}

- (PREditor)editor
{
  return (PREditor *)objc_loadWeakRetained((id *)&self->_editor);
}

- (void)setEditor:(id)a3
{
  objc_storeWeak((id *)&self->_editor, a3);
}

- (PRDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void)setDateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dateProvider, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (PREditingReticleView)titleReticleView
{
  return self->_titleReticleView;
}

- (void)setTitleReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleReticleView, a3);
}

- (UILayoutGuide)titlePopoverLayoutGuide
{
  return self->_titlePopoverLayoutGuide;
}

- (void)setTitlePopoverLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_titlePopoverLayoutGuide, a3);
}

- (PREditingBottomLegibilityView)bottomLegibilityView
{
  return self->_bottomLegibilityView;
}

- (void)setBottomLegibilityView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLegibilityView, a3);
}

- (UIView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (void)setBackgroundContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundContainerView, a3);
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (void)setForegroundContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundContainerView, a3);
}

- (UIView)floatingContainerView
{
  return self->_floatingContainerView;
}

- (void)setFloatingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingContainerView, a3);
}

- (UIView)timeContainerView
{
  return self->_timeContainerView;
}

- (void)setTimeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_timeContainerView, a3);
}

- (UIView)complicationsContainerView
{
  return self->_complicationsContainerView;
}

- (void)setComplicationsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationsContainerView, a3);
}

- (UIView)contentOverlayContainerView
{
  return self->_contentOverlayContainerView;
}

- (void)setContentOverlayContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentOverlayContainerView, a3);
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (NSArray)looks
{
  return self->_looks;
}

- (NSArray)leadingMenuElements
{
  return self->_leadingMenuElements;
}

- (void)setLeadingMenuElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (NSArray)trailingMenuElements
{
  return self->_trailingMenuElements;
}

- (void)setTrailingMenuElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (BOOL)isSubtitleHidden
{
  return self->_subtitleHidden;
}

- (UIEdgeInsets)topButtonsEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_topButtonsEdgeInsets.top;
  left = self->_topButtonsEdgeInsets.left;
  bottom = self->_topButtonsEdgeInsets.bottom;
  right = self->_topButtonsEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)areTopButtonsHidden
{
  return self->_topButtonsHidden;
}

- (BOOL)isAllUserInteractionDisabledExceptForCancelButton
{
  return self->_allUserInteractionDisabledExceptForCancelButton;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)isComplicationsRowConfigured
{
  return self->_complicationsRowConfigured;
}

- (BOOL)isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (int64_t)focusedComplicationElement
{
  return self->_focusedComplicationElement;
}

- (BOOL)isTitleReticleActive
{
  return self->_titleReticleActive;
}

- (BOOL)isDepthEffectDisabled
{
  return self->_depthEffectDisabled;
}

- (BOOL)isPresentingModalViewController
{
  return self->_presentingModalViewController;
}

- (BOOL)ignoresScrolling
{
  return self->_ignoresScrolling;
}

- (void)setIgnoresScrolling:(BOOL)a3
{
  self->_ignoresScrolling = a3;
}

- (int64_t)focusedQuickActionPosition
{
  return self->_focusedQuickActionPosition;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (NSArray)leadingMenuElementViews
{
  return self->_leadingMenuElementViews;
}

- (void)setLeadingMenuElementViews:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMenuElementViews, a3);
}

- (NSArray)trailingMenuElementViews
{
  return self->_trailingMenuElementViews;
}

- (void)setTrailingMenuElementViews:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMenuElementViews, a3);
}

- (PREditingCancelButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (PREditingTitledButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
  objc_storeStrong((id *)&self->_acceptButton, a3);
}

- (NSLayoutConstraint)bottomControlsYConstraint
{
  return self->_bottomControlsYConstraint;
}

- (void)setBottomControlsYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsYConstraint, a3);
}

- (NSLayoutConstraint)leadingTopButtonXConstraint
{
  return self->_leadingTopButtonXConstraint;
}

- (void)setLeadingTopButtonXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTopButtonXConstraint, a3);
}

- (NSLayoutConstraint)leadingTopButtonYConstraint
{
  return self->_leadingTopButtonYConstraint;
}

- (void)setLeadingTopButtonYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTopButtonYConstraint, a3);
}

- (NSLayoutConstraint)trailingTopButtonXConstraint
{
  return self->_trailingTopButtonXConstraint;
}

- (void)setTrailingTopButtonXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTopButtonXConstraint, a3);
}

- (NSLayoutConstraint)trailingTopButtonYConstraint
{
  return self->_trailingTopButtonYConstraint;
}

- (void)setTrailingTopButtonYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTopButtonYConstraint, a3);
}

- (PREditingStandaloneLabelView)lookNameLabel
{
  return self->_lookNameLabel;
}

- (void)setLookNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lookNameLabel, a3);
}

- (PREditingStandaloneLabelView)lookInteractionHintLabel
{
  return self->_lookInteractionHintLabel;
}

- (void)setLookInteractionHintLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lookInteractionHintLabel, a3);
}

- (BOOL)presentedGalleryUpdatesLeadingControl
{
  return self->_presentedGalleryUpdatesLeadingControl;
}

- (void)setPresentedGalleryUpdatesLeadingControl:(BOOL)a3
{
  self->_presentedGalleryUpdatesLeadingControl = a3;
}

- (NSTimer)lookInteractionHintTimer
{
  return self->_lookInteractionHintTimer;
}

- (void)setLookInteractionHintTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lookInteractionHintTimer, a3);
}

- (BOOL)isLookInteractionHintCompleted
{
  return self->_lookInteractionHintCompleted;
}

- (void)setLookInteractionHintCompleted:(BOOL)a3
{
  self->_lookInteractionHintCompleted = a3;
}

- (CSProminentDisplayViewController)subtitleViewController
{
  return self->_subtitleViewController;
}

- (void)setSubtitleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleViewController, a3);
}

- (BSUIVibrancyEffectView)reticleVibrancyView
{
  return self->_reticleVibrancyView;
}

- (void)setReticleVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_reticleVibrancyView, a3);
}

- (BSUIVibrancyEffectView)sidebarReticleVibrancyView
{
  return self->_sidebarReticleVibrancyView;
}

- (void)setSidebarReticleVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarReticleVibrancyView, a3);
}

- (BSUIVibrancyEffectView)emptyVibrancyView
{
  return self->_emptyVibrancyView;
}

- (void)setEmptyVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyVibrancyView, a3);
}

- (PREditingReticleView)inlineComplicationReticleView
{
  return self->_inlineComplicationReticleView;
}

- (void)setInlineComplicationReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_inlineComplicationReticleView, a3);
}

- (PREditingReticleView)complicationRowReticleView
{
  return self->_complicationRowReticleView;
}

- (void)setComplicationRowReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationRowReticleView, a3);
}

- (PRComplicationEmptyStateView)complicationRowEmptyStateView
{
  return self->_complicationRowEmptyStateView;
}

- (void)setComplicationRowEmptyStateView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationRowEmptyStateView, a3);
}

- (PREditingReticleView)complicationSidebarReticleView
{
  return self->_complicationSidebarReticleView;
}

- (void)setComplicationSidebarReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSidebarReticleView, a3);
}

- (PRComplicationEmptyStateView)complicationSidebarEmptyStateView
{
  return self->_complicationSidebarEmptyStateView;
}

- (void)setComplicationSidebarEmptyStateView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSidebarEmptyStateView, a3);
}

- (UIView)titleGestureView
{
  return self->_titleGestureView;
}

- (void)setTitleGestureView:(id)a3
{
  objc_storeStrong((id *)&self->_titleGestureView, a3);
}

- (PRComplicationSceneHostViewController)complicationHostViewController
{
  return self->_complicationHostViewController;
}

- (void)setComplicationHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_complicationHostViewController, a3);
}

- (PRQuickActionsSceneHostViewController)quickActionsHostViewController
{
  return self->_quickActionsHostViewController;
}

- (void)setQuickActionsHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionsHostViewController, a3);
}

- (PREditorLookTransition)lookTransition
{
  return self->_lookTransition;
}

- (void)setLookTransition:(id)a3
{
  objc_storeStrong((id *)&self->_lookTransition, a3);
}

- (UIView)presentationDismissalGestureView
{
  return self->_presentationDismissalGestureView;
}

- (void)setPresentationDismissalGestureView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationDismissalGestureView, a3);
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchBlockingView, a3);
}

- (BOOL)needsReticleVisibilityUpdate
{
  return self->_needsReticleVisibilityUpdate;
}

- (void)setNeedsReticleVisibilityUpdate:(BOOL)a3
{
  self->_needsReticleVisibilityUpdate = a3;
}

- (BOOL)needsEditingElementsVisibilityUpdate
{
  return self->_needsEditingElementsVisibilityUpdate;
}

- (void)setNeedsEditingElementsVisibilityUpdate:(BOOL)a3
{
  self->_needsEditingElementsVisibilityUpdate = a3;
}

- (BOOL)initialLayoutFinished
{
  return self->_initialLayoutFinished;
}

- (void)setInitialLayoutFinished:(BOOL)a3
{
  self->_initialLayoutFinished = a3;
}

- (PREditorElementLayoutController)editorElementLayoutController
{
  return self->_editorElementLayoutController;
}

- (void)setEditorElementLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_editorElementLayoutController, a3);
}

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (BSUIVibrancyEffectView)controlsDividerVibrancyView
{
  return self->_controlsDividerVibrancyView;
}

- (void)setControlsDividerVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsDividerVibrancyView, a3);
}

- (UIView)controlsDividerView
{
  return self->_controlsDividerView;
}

- (void)setControlsDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsDividerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsDividerView, 0);
  objc_storeStrong((id *)&self->_controlsDividerVibrancyView, 0);
  objc_storeStrong((id *)&self->_editorElementLayoutController, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_presentationDismissalGestureView, 0);
  objc_storeStrong((id *)&self->_lookTransition, 0);
  objc_storeStrong((id *)&self->_quickActionsHostViewController, 0);
  objc_storeStrong((id *)&self->_complicationHostViewController, 0);
  objc_storeStrong((id *)&self->_titleGestureView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarEmptyStateView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarReticleView, 0);
  objc_storeStrong((id *)&self->_complicationRowEmptyStateView, 0);
  objc_storeStrong((id *)&self->_complicationRowReticleView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationReticleView, 0);
  objc_storeStrong((id *)&self->_emptyVibrancyView, 0);
  objc_storeStrong((id *)&self->_sidebarReticleVibrancyView, 0);
  objc_storeStrong((id *)&self->_reticleVibrancyView, 0);
  objc_storeStrong((id *)&self->_subtitleViewController, 0);
  objc_storeStrong((id *)&self->_lookInteractionHintTimer, 0);
  objc_storeStrong((id *)&self->_lookInteractionHintLabel, 0);
  objc_storeStrong((id *)&self->_lookNameLabel, 0);
  objc_storeStrong((id *)&self->_trailingTopButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTopButtonXConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopButtonXConstraint, 0);
  objc_storeStrong((id *)&self->_bottomControlsYConstraint, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_trailingMenuElementViews, 0);
  objc_storeStrong((id *)&self->_leadingMenuElementViews, 0);
  objc_storeStrong((id *)&self->_trailingMenuElements, 0);
  objc_storeStrong((id *)&self->_leadingMenuElements, 0);
  objc_storeStrong((id *)&self->_looks, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_contentOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_complicationsContainerView, 0);
  objc_storeStrong((id *)&self->_timeContainerView, 0);
  objc_storeStrong((id *)&self->_floatingContainerView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_bottomLegibilityView, 0);
  objc_storeStrong((id *)&self->_titlePopoverLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleReticleView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_editor);
  objc_storeStrong((id *)&self->_titleViewControllerCoordinator, 0);
}

@end
