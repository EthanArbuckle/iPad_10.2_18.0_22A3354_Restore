@implementation SKUIReviewInAppRatingViewController

- (SKUIReviewInAppRatingViewController)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIReviewInAppRatingViewController *v11;
  SKUIReviewInAppRatingHeaderView *v12;
  SKUIReviewInAppRatingHeaderView *headerView;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKUIReviewInAppRatingViewController;
  v11 = -[SKUIReviewInAppRatingViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  if (v11)
  {
    v12 = -[SKUIReviewInAppRatingHeaderView initWithTitle:message:icon:]([SKUIReviewInAppRatingHeaderView alloc], "initWithTitle:message:icon:", v8, v9, v10);
    headerView = v11->_headerView;
    v11->_headerView = v12;

    v11->_state = 0;
    -[SKUIReviewInAppRatingViewController setTransitioningDelegate:](v11, "setTransitioningDelegate:", v11);
    -[SKUIReviewInAppRatingViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 4);
  }

  return v11;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SKUIReviewInAppRatingControlViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SKUIReviewInAppRatingViewController;
  -[SKUIReviewInAppRatingViewController viewDidLoad](&v23, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEffect:", v4);
  -[SKUIReviewInAppRatingViewController setBackgroundView:](self, "setBackgroundView:", v5);

  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", 16.0);

  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[SKUIReviewInAppRatingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v13 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  -[SKUIReviewInAppRatingViewController setStackView:](self, "setStackView:", v13);

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAxis:", 1);

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIReviewInAppRatingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v18 = objc_alloc_init(SKUIReviewInAppRatingControlViewController);
  -[SKUIReviewInAppRatingControlViewController ratingControl](v18, "ratingControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController setRatingControl:](self, "setRatingControl:", v19);

  -[SKUIReviewInAppRatingViewController ratingControl](self, "ratingControl");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__ratingControlChanged_, 4096);

  objc_msgSend(MEMORY[0x1E0DC38B8], "actionWithCustomContentViewController:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController setRatingControlAction:](self, "setRatingControlAction:", v21);

  -[SKUIReviewInAppRatingViewController ratingControlAction](self, "ratingControlAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEnabled:", 0);

}

- (void)reloadViewsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *constraints;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  double v50;
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
  double v72;
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
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[12];
  _QWORD v143[7];
  void *v144;
  void *v145;
  void *v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v139 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSpacing:", 0.0);

        -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeArrangedSubview:", v11);

        objc_msgSend(v11, "removeFromSuperview");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
    }
    while (v8);
  }

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  constraints = self->_constraints;
  self->_constraints = v14;

  if (-[SKUIReviewInAppRatingViewController state](self, "state") == 2)
  {
    v16 = MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[SKUIReviewInAppRatingViewController ratingControlAction](self, "ratingControlAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  v130 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0DC38C0], "actionGroupWithActions:", v16);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38C8]), "initWithActionGroup:actionHandlerInvocationDelegate:", v129, self);
  -[SKUIReviewInAppRatingViewController headerView](self, "headerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertArrangedHeaderView:atIndex:scrollable:", v19, 0, 0);

  -[SKUIReviewInAppRatingViewController _actions](self, "_actions");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC38C0], "actionGroupWithActions:", v128);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38C8]), "initWithActionGroup:actionHandlerInvocationDelegate:", v127, self);
  -[SKUIReviewInAppRatingViewController _actionsLayoutAxesForCurrentState](self, "_actionsLayoutAxesForCurrentState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowedActionLayoutAxisByPriority:", v21);

  v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v23 = *MEMORY[0x1E0C9D648];
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v27 = (void *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], v24, v25, v26);
  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v27;
  objc_msgSend(v27, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v30);

  objc_msgSend(v20, "insertArrangedHeaderView:atIndex:scrollable:", v27, 0, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v23, v24, v25, v26);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addArrangedSubview:", v31);

  objc_msgSend(v18, "_setContinuousCornerRadius:", 16.0);
  objc_msgSend(v18, "setClipsToBounds:", 1);
  objc_msgSend(v18, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMaskedCorners:", 3);

  objc_msgSend(v18, "_setDrawsBackground:", 0);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v145 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSimultaneouslyPresentedGroupViews:", v34);

  objc_msgSend(v31, "addSubview:", v18);
  objc_msgSend(v20, "_setContinuousCornerRadius:", 16.0);
  objc_msgSend(v20, "setClipsToBounds:", 1);
  objc_msgSend(v20, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMaskedCorners:", 12);

  objc_msgSend(v20, "_setDrawsBackground:", 0);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v144 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSimultaneouslyPresentedGroupViews:", v36);

  objc_msgSend(v31, "addSubview:", v20);
  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:", v131);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v122;
  objc_msgSend(v18, "leftAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v118);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v116;
  v125 = v18;
  objc_msgSend(v18, "rightAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rightAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v112);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2] = v110;
  objc_msgSend(v20, "topAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v106, -10.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v143[3] = v104;
  objc_msgSend(v20, "rightAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v143[4] = v38;
  v124 = v20;
  objc_msgSend(v20, "leftAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v31;
  objc_msgSend(v31, "leftAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v143[5] = v41;
  objc_msgSend(v20, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v143[6] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "addObjectsFromArray:", v45);

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -10.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v50) = 1140457472;
  objc_msgSend(v136, "setPriority:", v50);
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:constant:", v54, -10.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerYAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:constant:", v58, 0.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIReviewInAppRatingViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIReviewInAppRatingViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "layoutMarginsGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintGreaterThanOrEqualToAnchor:constant:", v70, 10.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v72) = 1148829696;
  v123 = v71;
  objc_msgSend(v71, "setPriority:", v72);
  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addObject:", v71);

  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHidden:", 0);

  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v136;
  v142[1] = v134;
  v142[2] = v121;
  v142[3] = v119;
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "widthAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToConstant:", 270.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v142[4] = v109;
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintGreaterThanOrEqualToAnchor:", v117);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v142[5] = v103;
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintLessThanOrEqualToAnchor:", v111);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v142[6] = v99;
  -[SKUIReviewInAppRatingViewController stackView](self, "stackView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingViewController view](self, "view");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintLessThanOrEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v142[7] = v94;
  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "centerYAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v142[8] = v90;
  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "centerXAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "centerXAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v142[9] = v86;
  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "widthAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v142[10] = v78;
  -[SKUIReviewInAppRatingViewController backgroundView](self, "backgroundView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v142[11] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 12);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v83);

  v84 = (void *)MEMORY[0x1E0CB3718];
  -[SKUIReviewInAppRatingViewController constraints](self, "constraints");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "activateConstraints:", v85);

}

- (void)_ratingControlChanged:(id)a3
{
  -[SKUIReviewInAppRatingViewController setState:](self, "setState:", 1);
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (self->_state != a3)
  {
    if (a3 >= 2)
    {
      if (a3 != 2)
      {
LABEL_7:
        self->_state = a3;
        -[SKUIReviewInAppRatingViewController reloadViewsConfiguration](self, "reloadViewsConfiguration");
        return;
      }
      -[SKUIReviewInAppRatingViewController headerView](self, "headerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController ratingControl](self, "ratingControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCompletedWithRating:", objc_msgSend(v6, "userRating"));

    }
    else
    {
      -[SKUIReviewInAppRatingViewController headerView](self, "headerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCompleted:", 0);
    }

    goto LABEL_7;
  }
}

- (id)_actions
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t state;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
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
  _QWORD *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id location;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke;
  aBlock[3] = &unk_1E73A69C0;
  objc_copyWeak(&v41, &location);
  v5 = _Block_copy(aBlock);
  state = self->_state;
  switch(state)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_ACTION_WRITE_REVIEW"), &stru_1E73A9FB0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController _buttonActionWithTitle:style:](self, "_buttonActionWithTitle:style:", v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = v4;
      v33[1] = 3221225472;
      v33[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_6;
      v33[3] = &unk_1E73A1618;
      v21 = v5;
      v33[4] = v21;
      objc_msgSend(v9, "setAfterDismissHandler:", v33);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_ACTION_OK"), &stru_1E73A9FB0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController _buttonActionWithTitle:style:](self, "_buttonActionWithTitle:style:", v23, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v4;
      v29 = 3221225472;
      v30 = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_7;
      v31 = &unk_1E73A1618;
      v32 = v21;
      objc_msgSend(v16, "setAfterDismissHandler:", &v28);
      v43[0] = v9;
      v43[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2, v28, v29, v30, v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v24);

      v25 = v33;
LABEL_10:
      v10 = (id *)(v25 + 4);

      goto LABEL_11;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_ACTION_CANCEL"), &stru_1E73A9FB0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController _buttonActionWithTitle:style:](self, "_buttonActionWithTitle:style:", v12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = v4;
      v37[1] = 3221225472;
      v37[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_3;
      v37[3] = &unk_1E73A1618;
      v13 = v5;
      v37[4] = v13;
      objc_msgSend(v9, "setAfterDismissHandler:", v37);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_ACTION_SUBMIT"), &stru_1E73A9FB0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController _buttonActionWithTitle:style:](self, "_buttonActionWithTitle:style:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setEnabled:", -[SKUIReviewInAppRatingViewController disableSubmit](self, "disableSubmit") ^ 1);
      v34[0] = v4;
      v34[1] = 3221225472;
      v34[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_4;
      v34[3] = &unk_1E73A6CE8;
      objc_copyWeak(&v36, &location);
      v35 = v13;
      objc_msgSend(v16, "setBeforeDismissHandler:", v34);
      -[SKUIReviewInAppRatingViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v17, "effectiveUserInterfaceLayoutDirection") == 1;

      if ((_DWORD)v13)
      {
        v45[0] = v16;
        v45[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
      }
      else
      {
        v44[0] = v9;
        v44[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v18);

      objc_destroyWeak(&v36);
      v25 = v37;
      goto LABEL_10;
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_ACTION_NOT_NOW"), &stru_1E73A9FB0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewInAppRatingViewController _buttonActionWithTitle:style:](self, "_buttonActionWithTitle:style:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = v4;
      v38[1] = 3221225472;
      v38[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_2;
      v38[3] = &unk_1E73A1618;
      v39 = v5;
      objc_msgSend(v9, "setAfterDismissHandler:", v38);
      objc_msgSend(v3, "addObject:", v9);
      v10 = &v39;
LABEL_11:

      break;
  }
  v26 = (void *)objc_msgSend(v3, "copy");

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  return v26;
}

void __47__SKUIReviewInAppRatingViewController__actions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "completion");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, a2);

  }
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__SKUIReviewInAppRatingViewController__actions__block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "ratingControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userRating");

  objc_msgSend(WeakRetained, "ratingHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v8 >= 1)
  {
    objc_msgSend(v5, "setEnabled:", 0);
    objc_msgSend(WeakRetained, "ratingControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    objc_msgSend(WeakRetained, "ratingHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_5;
    v12[3] = &unk_1E73A6BD8;
    v13 = v5;
    v14 = WeakRetained;
    v15 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, uint64_t, _QWORD *))v11)[2](v11, v8, v12);

  }
  *a3 = 0;

}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_5(uint64_t a1, int a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(*(id *)(a1 + 40), "disableSubmit") ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "ratingControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  if (a2)
    return objc_msgSend(*(id *)(a1 + 40), "setState:", 2);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_buttonActionWithTitle:(id)a3 style:(unint64_t)a4
{
  id v5;
  SKUIReviewInAppRatingButtonViewController *v6;
  void *v7;

  v5 = a3;
  v6 = -[SKUIReviewInAppRatingButtonViewController initWithTitle:style:]([SKUIReviewInAppRatingButtonViewController alloc], "initWithTitle:style:", v5, a4);

  +[SKUIReviewInAppRatingAction actionWithCustomContentViewController:](SKUIReviewInAppRatingAction, "actionWithCustomContentViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_actionsLayoutAxesForCurrentState
{
  void *v3;
  void *v4;
  unint64_t state;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  state = self->_state;
  if (state <= 2)
    objc_msgSend(v3, "addObject:", qword_1E73A6D08[state]);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  SKUIReviewInAppRatingPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SKUIReviewInAppRatingPresentationController initWithPresentedViewController:presentingViewController:]([SKUIReviewInAppRatingPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  SKUIReviewInAppRatingAnimatedTransitioning *v6;

  v6 = objc_alloc_init(SKUIReviewInAppRatingAnimatedTransitioning);
  -[SKUIReviewInAppRatingAnimatedTransitioning setViewController:](v6, "setViewController:", self);
  -[SKUIReviewInAppRatingAnimatedTransitioning setPresentation:](v6, "setPresentation:", 1);
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  SKUIReviewInAppRatingAnimatedTransitioning *v4;

  v4 = objc_alloc_init(SKUIReviewInAppRatingAnimatedTransitioning);
  -[SKUIReviewInAppRatingAnimatedTransitioning setViewController:](v4, "setViewController:", self);
  -[SKUIReviewInAppRatingAnimatedTransitioning setPresentation:](v4, "setPresentation:", 0);
  return v4;
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v14 = 1;
    objc_msgSend(v9, "beforeDismissHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (objc_msgSend(v9, "beforeDismissHandler"),
          v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          ((void (**)(_QWORD, id, char *))v11)[2](v11, v9, &v14),
          v11,
          v14))
    {
      objc_msgSend(v9, "afterDismissHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v9, "afterDismissHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIReviewInAppRatingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v13);

      }
      else
      {
        -[SKUIReviewInAppRatingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      }

    }
  }
  else
  {
    v8[2](v8);
  }

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)ratingHandler
{
  return self->_ratingHandler;
}

- (void)setRatingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)disableSubmit
{
  return self->_disableSubmit;
}

- (void)setDisableSubmit:(BOOL)a3
{
  self->_disableSubmit = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (SKUIReviewInAppRatingHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (UIInterfaceAction)ratingControlAction
{
  return self->_ratingControlAction;
}

- (void)setRatingControlAction:(id)a3
{
  objc_storeStrong((id *)&self->_ratingControlAction, a3);
}

- (SKUIStarRatingControl)ratingControl
{
  return self->_ratingControl;
}

- (void)setRatingControl:(id)a3
{
  objc_storeStrong((id *)&self->_ratingControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingControl, 0);
  objc_storeStrong((id *)&self->_ratingControlAction, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong(&self->_ratingHandler, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
