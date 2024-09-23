@implementation PUPhotoEditMediaToolController

- (PUPhotoEditMediaToolController)init
{
  PUPhotoEditMediaToolController *v2;
  NSMutableArray *v3;
  NSMutableArray *constraints;
  uint64_t v5;
  _UIBackdropView *backdropBackgroundView;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *solidBackgroundView;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditMediaToolController;
  v2 = -[PUPhotoEditToolController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

    v2->_horizontalControlPadding = 5.0;
    v2->_verticalButtonOffset = 0.0;
    v2->_horizontalPrimaryViewPaddingOffset = 0.0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
    backdropBackgroundView = v2->_backdropBackgroundView;
    v2->_backdropBackgroundView = (_UIBackdropView *)v5;

    -[_UIBackdropView groupName](v2->_backdropBackgroundView, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditMediaToolController setBackdropViewGroupName:](v2, "setBackdropViewGroupName:", v7);

    -[_UIBackdropView setHidden:](v2->_backdropBackgroundView, "setHidden:", 1);
    -[_UIBackdropView layer](v2->_backdropBackgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    solidBackgroundView = v2->_solidBackgroundView;
    v2->_solidBackgroundView = v9;

    -[UIView setAlpha:](v2->_solidBackgroundView, "setAlpha:", 0.0);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoEditingBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2->_solidBackgroundView, "setBackgroundColor:", v12);

    v2->_trimControllerScrubberNeedsVisualUpdate = 1;
    -[PUPhotoEditToolController setHasMediaScrubber:](v2, "setHasMediaScrubber:", 1);
  }
  return v2;
}

- (void)loadView
{
  UIView *v3;
  UIView *containerView;
  void *v5;
  double v6;
  UIView *v7;
  UIView *apertureContainer;
  PUPhotoEditToolControllerView *v9;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  containerView = self->_containerView;
  self->_containerView = v3;

  v9 = objc_alloc_init(PUPhotoEditToolControllerView);
  -[PUPhotoEditToolControllerView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolControllerView setBackgroundColor:](v9, "setBackgroundColor:", v5);

  -[PUPhotoEditMediaToolController setView:](self, "setView:", v9);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1132068864;
  -[UIView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", 0, v6);
  -[PUPhotoEditToolControllerView addSubview:](v9, "addSubview:", self->_containerView);
  -[PUPhotoEditToolControllerView insertSubview:belowSubview:](v9, "insertSubview:belowSubview:", self->_backdropBackgroundView, self->_containerView);
  -[PUPhotoEditToolControllerView insertSubview:belowSubview:](v9, "insertSubview:belowSubview:", self->_solidBackgroundView, self->_containerView);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  apertureContainer = self->_apertureContainer;
  self->_apertureContainer = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_apertureContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditToolControllerView addSubview:](v9, "addSubview:", self->_apertureContainer);
  -[_UIBackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_solidBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditMediaToolController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  if (self->_isActiveTool)
  {
    -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
    -[PUPhotoEditMediaToolController updateViewConstraints](self, "updateViewConstraints");
    -[PUPhotoEditMediaToolController _showPrimaryViewIfNeeded](self, "_showPrimaryViewIfNeeded");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_viewHasAppeared = 1;
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUPhotoEditMediaToolController _layoutToolGradient](self, "_layoutToolGradient");
}

- (void)_layoutToolGradient
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (self->_apertureGradientView)
  {
    -[PUPhotoEditMediaToolController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[UIView bounds](self->_apertureContainer, "bounds");
    -[CEKEdgeGradientView setFrame:](self->_apertureGradientView, "setFrame:");
    v8 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    if (v5 >= v7)
      v9 = v7;
    else
      v9 = v5;
    v10 = v9 * 0.03;
    v11 = v9 * 0.07;
    v12 = 44.0;
    if (v8 == 1)
      v12 = 0.0;
    -[CEKEdgeGradientView setGradientDimensions:](self->_apertureGradientView, "setGradientDimensions:", v10, v11, v11, v10 + v12);
    -[CEKEdgeGradientView setContentInsets:](self->_apertureGradientView, "setContentInsets:", 50.0, 0.0, 0.0, 0.0);
  }
}

- (UIButton)livePhotoButton
{
  return (UIButton *)self->_livePhotoButton;
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  void *v7;
  double v8;
  double v9;
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
  int64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *constraints;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double MidX;
  NSMutableArray *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSMutableArray *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  PUVideoEditOverlayViewController *overlayController;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  UIView *apertureContainer;
  __int128 v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  UILayoutGuide *v130;
  UILayoutGuide *apertureContainerLayoutGuide;
  void *v132;
  NSMutableArray *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  int64_t v141;
  NSMutableArray *v142;
  UILayoutGuide *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  int64_t v155;
  BOOL v156;
  double v157;
  UIView *v158;
  void *v159;
  void *v160;
  void *v161;
  NSMutableArray *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  NSMutableArray *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  NSMutableArray *v179;
  int64_t v180;
  void *v181;
  void *v182;
  void *v183;
  UIView *v184;
  void *v185;
  void *v186;
  objc_super v187;
  CGAffineTransform v188;
  CGAffineTransform v189;
  _OWORD v190[3];
  _QWORD v191[4];
  _QWORD v192[2];
  _QWORD v193[3];
  _QWORD v194[6];
  CGRect v195;

  v194[4] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_constraints, "count"))
  {
    -[PUPhotoEditMediaToolController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PUPhotoEditMediaToolController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self->_containerView;
      -[PUPhotoEditMediaToolController primaryView](self, "primaryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUPhotoEditMediaToolController horizontalControlPadding](self, "horizontalControlPadding");
      v9 = v8;
      objc_msgSend(v5, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v6, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);

      objc_msgSend(v5, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v6, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

      v186 = v5;
      objc_msgSend(v5, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v6, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      -[_UIBackdropView leadingAnchor](self->_backdropBackgroundView, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v6, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

      -[_UIBackdropView trailingAnchor](self->_backdropBackgroundView, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v6, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      -[_UIBackdropView topAnchor](self->_backdropBackgroundView, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v6, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setActive:", 1);

      -[_UIBackdropView bottomAnchor](self->_backdropBackgroundView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v6, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setActive:", 1);

      -[UIView leadingAnchor](self->_solidBackgroundView, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v6, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActive:", 1);

      -[UIView trailingAnchor](self->_solidBackgroundView, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v6, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setActive:", 1);

      -[UIView topAnchor](self->_solidBackgroundView, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v6, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setActive:", 1);

      -[UIView bottomAnchor](self->_solidBackgroundView, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v6, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setActive:", 1);

      if (!v7)
      {
        constraints = self->_constraints;
        -[UIView heightAnchor](v6, "heightAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToConstant:", 0.0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](constraints, "addObject:", v62);

LABEL_32:
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);

        goto LABEL_33;
      }
      v43 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "currentLayoutStyle");

      v46 = 8.0;
      if (v43 == 1)
        v46 = 21.0;
      v178 = v45;
      if (v45 == 4)
        v47 = 27.0;
      else
        v47 = v46;
      objc_msgSend(v7, "widthAnchor", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToConstant:", 477.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v50) = 1144750080;
      objc_msgSend(v49, "setPriority:", v50);
      v183 = v49;
      -[NSMutableArray addObject:](self->_constraints, "addObject:", v49);
      -[PUPhotoEditMediaToolController view](self, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "window");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v185 = v7;
      v180 = v43;
      if (v52)
      {
        if (v43 != 1)
        {
          -[PUPhotoEditToolController delegate](self, "delegate");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "mediaView");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "bounds");
          v74 = v73;
          v76 = v75;
          v78 = v77;
          v80 = v79;
          objc_msgSend(v72, "edgeInsets");
          v82 = v74 + v81;
          v84 = v76 + v83;
          v86 = v78 - (v81 + v85);
          v88 = v80 - (v83 + v87);
          -[PUPhotoEditMediaToolController view](self, "view");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "convertRect:fromView:", v72, v82, v84, v86, v88);
          v91 = v90;
          v93 = v92;
          v95 = v94;
          v97 = v96;

          v195.origin.x = v91;
          v195.origin.y = v93;
          v195.size.width = v95;
          v195.size.height = v97;
          MidX = CGRectGetMidX(v195);
          v99 = self->_constraints;
          objc_msgSend(v7, "centerXAnchor");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditMediaToolController view](self, "view");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "leadingAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "constraintEqualToAnchor:constant:", v102, MidX);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v99, "addObject:", v103);

          v7 = v185;
LABEL_16:

          goto LABEL_17;
        }
        v53 = self->_constraints;
        objc_msgSend(v7, "centerXAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditMediaToolController view](self, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "window");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "safeAreaLayoutGuide");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "centerXAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v53, "addObject:", v59);

        v7 = v185;
      }
      else if (v43 != 1)
      {
LABEL_17:
        v104 = self->_constraints;
        v184 = v6;
        -[UIView safeAreaLayoutGuide](v6, "safeAreaLayoutGuide");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "bottomAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bottomAnchor");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, v47);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v104, "addObject:", v108);

        overlayController = self->_overlayController;
        if (overlayController)
        {
          v162 = self->_constraints;
          -[PUVideoEditOverlayViewController view](overlayController, "view");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "widthAnchor");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditMediaToolController view](self, "view");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "widthAnchor");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "constraintEqualToAnchor:", v170);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v194[0] = v168;
          -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "heightAnchor");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditMediaToolController view](self, "view");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "heightAnchor");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "constraintEqualToAnchor:", v163);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v194[1] = v161;
          -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "centerXAnchor");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditMediaToolController view](self, "view");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "centerXAnchor");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "constraintEqualToAnchor:", v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v194[2] = v112;
          -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "centerYAnchor");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditMediaToolController view](self, "view");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "centerYAnchor");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "constraintEqualToAnchor:", v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v194[3] = v117;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 4);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v162, "addObjectsFromArray:", v118);

        }
        if (v180 == 1)
        {
          apertureContainer = self->_apertureContainer;
          v120 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v190[0] = *MEMORY[0x1E0C9BAA8];
          v190[1] = v120;
          v190[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          -[UIView setTransform:](apertureContainer, "setTransform:", v190);
          v179 = self->_constraints;
          objc_msgSend(v186, "widthAnchor");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView widthAnchor](self->_apertureContainer, "widthAnchor");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "constraintEqualToAnchor:", v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v193[0] = v122;
          objc_msgSend(v186, "centerXAnchor");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView centerXAnchor](self->_apertureContainer, "centerXAnchor");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "constraintEqualToAnchor:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v193[1] = v125;
          objc_msgSend(v186, "bottomAnchor");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView bottomAnchor](self->_apertureContainer, "bottomAnchor");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "constraintEqualToAnchor:", v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v193[2] = v128;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 3);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v179, "addObjectsFromArray:", v129);

        }
        else
        {
          v130 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          apertureContainerLayoutGuide = self->_apertureContainerLayoutGuide;
          self->_apertureContainerLayoutGuide = v130;

          -[PUPhotoEditMediaToolController view](self, "view");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "addLayoutGuide:", self->_apertureContainerLayoutGuide);

          v133 = self->_constraints;
          -[UILayoutGuide heightAnchor](self->_apertureContainerLayoutGuide, "heightAnchor");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "heightAnchor");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "constraintEqualToAnchor:", v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v192[0] = v136;
          -[UILayoutGuide centerYAnchor](self->_apertureContainerLayoutGuide, "centerYAnchor");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "centerYAnchor");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "constraintEqualToAnchor:", v138);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v192[1] = v139;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v133, "addObjectsFromArray:", v140);

          v141 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
          v142 = self->_constraints;
          v143 = self->_apertureContainerLayoutGuide;
          if (v141 == 2 || v178 == 4)
          {
            -[UILayoutGuide rightAnchor](v143, "rightAnchor");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v186, "rightAnchor");
            v145 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[UILayoutGuide leftAnchor](v143, "leftAnchor");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v186, "leftAnchor");
            v145 = objc_claimAutoreleasedReturnValue();
          }
          v146 = (void *)v145;
          objc_msgSend(v144, "constraintEqualToAnchor:", v145);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v142, "addObject:", v147);

          v169 = self->_constraints;
          -[UIView centerXAnchor](self->_apertureContainer, "centerXAnchor");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerXAnchor](self->_apertureContainerLayoutGuide, "centerXAnchor");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "constraintEqualToAnchor:", v177);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v191[0] = v175;
          -[UIView centerYAnchor](self->_apertureContainer, "centerYAnchor");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerYAnchor](self->_apertureContainerLayoutGuide, "centerYAnchor");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "constraintEqualToAnchor:", v171);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v191[1] = v167;
          -[UIView widthAnchor](self->_apertureContainer, "widthAnchor");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide heightAnchor](self->_apertureContainerLayoutGuide, "heightAnchor");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "constraintEqualToAnchor:", v149);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v191[2] = v150;
          -[UIView heightAnchor](self->_apertureContainer, "heightAnchor");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide widthAnchor](self->_apertureContainerLayoutGuide, "widthAnchor");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "constraintEqualToAnchor:", v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v191[3] = v153;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 4);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v169, "addObjectsFromArray:", v154);

          v155 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
          v156 = v178 == 4 || v155 == 2;
          v157 = 1.57079633;
          if (v156)
            v157 = -1.57079633;
          CGAffineTransformMakeRotation(&v189, v157);
          v158 = self->_apertureContainer;
          v188 = v189;
          -[UIView setTransform:](v158, "setTransform:", &v188);
        }

        v7 = v185;
        v6 = v184;
        goto LABEL_32;
      }
      -[PUPhotoEditMediaToolController horizontalPrimaryViewPaddingOffset](self, "horizontalPrimaryViewPaddingOffset");
      v64 = v9 + v63;
      objc_msgSend(v7, "leadingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v6, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:constant:", v66, v64);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v67) = *(_DWORD *)"";
      objc_msgSend(v72, "setPriority:", v67);
      -[NSMutableArray addObject:](self->_constraints, "addObject:", v72);
      objc_msgSend(v7, "trailingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v6, "trailingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintLessThanOrEqualToAnchor:constant:", v69, -v64);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v70) = *(_DWORD *)"";
      objc_msgSend(v100, "setPriority:", v70);
      -[NSMutableArray addObject:](self->_constraints, "addObject:", v100);
      goto LABEL_16;
    }
  }
LABEL_33:
  v187.receiver = self;
  v187.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditMediaToolController updateViewConstraints](&v187, sel_updateViewConstraints);
}

- (void)_invalidateConstraints
{
  void *v3;

  -[PUPhotoEditMediaToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

  if (-[NSMutableArray count](self->_constraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
    -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  }
}

- (void)_updateToolVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void (**v8)(void *, uint64_t);
  _QWORD v9[5];
  BOOL v10;
  _QWORD aBlock[5];
  BOOL v12;

  v3 = a3;
  v5 = self->_toolMode == 1;
  -[PUPhotoEditToolController setToolGradientDistance:](self, "setToolGradientDistance:", 66.0);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke;
  aBlock[3] = &unk_1E58AAD68;
  aBlock[4] = self;
  v12 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke_2;
  v9[3] = &unk_1E58A7A58;
  v9[4] = self;
  v10 = v5;
  v8 = (void (**)(void *, uint64_t))_Block_copy(v9);
  if (v3)
  {
    -[UIView setHidden:](self->_apertureContainer, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v7, v8, 0.25, 0.0);
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }

}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  PUPhotoEditToolActivationButton *livePhotoButton;
  PUPhotoEditToolbarButton *muteButton;
  UILabel *videoLabelView;
  UIButton *stabilizeButton;
  PLRoundProgressView *stabilizeProgressView;
  UIView *portraitVideoButtonDimmingView;
  PUPhotoEditToolActivationButton *portraitVideoButton;
  UIView *apertureButtonContainerDimmingView;
  CEKApertureButton *apertureButton;
  UIView *apertureButtonContainer;
  PUPhotoEditToolbarButton *autoFocusButton;
  PUPhotoEditToolbarButton *rateButton;
  PUVideoEditOverlayViewController *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  PUVideoEditOverlayViewController *v24;
  _QWORD v25[4];
  PUVideoEditOverlayViewController *v26;
  PUPhotoEditMediaToolController *v27;
  objc_super v28;

  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v28, sel_setLayoutOrientation_withTransitionCoordinator_, a3, v6);
  livePhotoButton = self->_livePhotoButton;
  self->_livePhotoButton = 0;

  muteButton = self->_muteButton;
  self->_muteButton = 0;

  videoLabelView = self->_videoLabelView;
  self->_videoLabelView = 0;

  stabilizeButton = self->_stabilizeButton;
  self->_stabilizeButton = 0;

  stabilizeProgressView = self->_stabilizeProgressView;
  self->_stabilizeProgressView = 0;

  portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
  self->_portraitVideoButtonDimmingView = 0;

  portraitVideoButton = self->_portraitVideoButton;
  self->_portraitVideoButton = 0;

  apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
  self->_apertureButtonContainerDimmingView = 0;

  apertureButton = self->_apertureButton;
  self->_apertureButton = 0;

  apertureButtonContainer = self->_apertureButtonContainer;
  self->_apertureButtonContainer = 0;

  autoFocusButton = self->_autoFocusButton;
  self->_autoFocusButton = 0;

  rateButton = self->_rateButton;
  self->_rateButton = 0;

  v19 = self->_overlayController;
  if (!-[PUVideoEditOverlayViewController isHidden](v19, "isHidden"))
  {
    v20 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
    v25[3] = &unk_1E58A40C0;
    v26 = v19;
    v27 = self;
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
    v23[3] = &unk_1E58A7A08;
    v24 = v26;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v25, v23);

  }
  -[PUPhotoEditMediaToolController trimController](self, "trimController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLayoutOrientation:", a3);

  -[PUPhotoEditToolController asset](self, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
  -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");

}

- (id)localizedName
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  PULocalizedString(CFSTR("PHOTOEDIT_LIVEPHOTO_TOOL_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandardVideo");

  if (v5)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_VIDEO_TOOL_BUTTON"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)toolbarIconGlyphName
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPortraitVideo");

  if ((v4 & 1) != 0)
    return CFSTR("cinematic.video");
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStandardVideo");

  if (v7)
    return CFSTR("video");
  else
    return CFSTR("livephoto");
}

- (id)selectedToolbarIconGlyphName
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPortraitVideo");

  if ((v4 & 1) != 0)
    return CFSTR("cinematic.video.fill");
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStandardVideo");

  if (v7)
    return CFSTR("video.fill");
  else
    return CFSTR("livephoto");
}

- (id)toolbarIconAccessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  PULocalizedString(CFSTR("PHOTOEDIT_MEDIA_TOOLBAR_LIVE_PHOTO_BUTTON_AX_LABEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandardVideo");

  if (v5)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_MEDIA_TOOLBAR_VIDEO_BUTTON_AX_LABEL"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (void)setOriginalStillImageTime:(id *)a3
{
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditMediaToolController;
  v6 = *a3;
  -[PUPhotoEditToolController setOriginalStillImageTime:](&v7, sel_setOriginalStillImageTime_, &v6);
  var3 = a3->var3;
  *(_OWORD *)&self->_originalStillImageTime.value = *(_OWORD *)&a3->var0;
  self->_originalStillImageTime.epoch = var3;
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
}

- (void)updateForIncomingAnimation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController updateForIncomingAnimation](&v3, sel_updateForIncomingAnimation);
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
}

- (void)baseMediaInvalidated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController baseMediaInvalidated](&v3, sel_baseMediaInvalidated);
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
}

- (void)setPlaceholderImage:(id)a3
{
  PUTrimToolController *trimController;
  id v5;
  objc_super v6;

  trimController = self->_trimController;
  v5 = a3;
  -[PUTrimToolController setPlaceholderImage:](trimController, "setPlaceholderImage:", v5);
  -[PUTrimToolController livePhotoRenderDidChange:](self->_trimController, "livePhotoRenderDidChange:", self->_trimControllerScrubberNeedsVisualUpdate);
  self->_trimControllerScrubberNeedsVisualUpdate = 0;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController setPlaceholderImage:](&v6, sel_setPlaceholderImage_, v5);

}

- (void)willBecomeActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController willBecomeActiveTool](&v3, sel_willBecomeActiveTool);
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
  -[PUPhotoEditMediaToolController _resetDefaultToolMode](self, "_resetDefaultToolMode");
  if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls"))
    -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", 0);
  -[PUTrimToolController willShowTrimTool](self->_trimController, "willShowTrimTool");
}

- (void)didBecomeActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController didBecomeActiveTool](&v3, sel_didBecomeActiveTool);
  self->_isActiveTool = 1;
  -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
  -[PUPhotoEditMediaToolController updateViewConstraints](self, "updateViewConstraints");
  -[PUPhotoEditMediaToolController _showPrimaryViewIfNeeded](self, "_showPrimaryViewIfNeeded");
}

- (void)reactivate
{
  if (self->_apertureButton)
    -[PUPhotoEditMediaToolController _handleApertureButton:](self, "_handleApertureButton:", 0);
}

- (void)willResignActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController willResignActiveTool](&v3, sel_willResignActiveTool);
  self->_isActiveTool = 0;
  if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls"))
    -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", 0);
  -[PUTrimToolController willHideTrimTool](self->_trimController, "willHideTrimTool");
}

- (void)didResignActiveTool
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController didResignActiveTool](&v4, sel_didResignActiveTool);
  -[PUPhotoEditMediaToolController primaryView](self, "primaryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

- (void)prepareForSave:(BOOL)a3
{
  -[PUTrimToolController willHideTrimTool](self->_trimController, "willHideTrimTool", a3);
}

- (void)leavingEditWithCancel
{
  -[PUTrimToolController willHideTrimTool](self->_trimController, "willHideTrimTool");
}

- (void)_showPrimaryViewIfNeeded
{
  void *v3;
  double v4;
  double v5;
  _QWORD v6[5];

  if (self->_constraints)
  {
    -[PUPhotoEditMediaToolController primaryView](self, "primaryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4;

    if (v5 < 1.0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __58__PUPhotoEditMediaToolController__showPrimaryViewIfNeeded__block_invoke;
      v6[3] = &unk_1E58ABD10;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.2);
    }
  }
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController setupWithAsset:compositionController:editSource:valuesCalculator:](&v7, sel_setupWithAsset_compositionController_editSource_valuesCalculator_, a3, a4, a5, a6);
  if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls"))
    -[PUPhotoEditMediaToolController _initializeCinematographyScript](self, "_initializeCinematographyScript");
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  id v20;

  v20 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "nonVisualAdjustmentTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "isSubsetOfSet:", v8);

  if ((v9 & 1) == 0)
    -[PUPhotoEditMediaToolController _invalidateTrimControlScrubberThumbnails](self, "_invalidateTrimControlScrubberThumbnails");
  objc_msgSend(v5, "PIPortraitVideoAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v20, "containsObject:", v10);

  if (v11)
  {
    -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pause");

    -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
  }
  objc_msgSend(v5, "PITrimAdjustmentKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v20, "containsObject:", v13);

  if (v14)
    -[PUVideoEditOverlayViewController frameTimeDidChange](self->_overlayController, "frameTimeDidChange");
  objc_msgSend(v5, "PISlomoAdjustmentKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v20, "containsObject:", v15);

  if (v16)
  {
    v17 = -[PUTrimToolController isSlomoEnabled](self->_trimController, "isSlomoEnabled");
    v18 = -[PUPhotoEditMediaToolController _isSlomoEnabled](self, "_isSlomoEnabled");
    -[PUTrimToolController setSlomoEnabled:](self->_trimController, "setSlomoEnabled:", -[PUPhotoEditMediaToolController _isSlomoEnabled](self, "_isSlomoEnabled"));
    if (v17 != v18)
    {
      -[PUPhotoEditMediaToolController _updateRateToolbarButton](self, "_updateRateToolbarButton");
      -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
    }
    if (-[PUPhotoEditToolbarButton isHeld](self->_rateButton, "isHeld"))
      -[PUPhotoEditMediaToolController _updateRateToolbarButton](self, "_updateRateToolbarButton");
  }
  -[PUPhotoEditMediaToolController _updateMuteButtonAnimated:](self, "_updateMuteButtonAnimated:", 1);
  -[PUPhotoEditMediaToolController _updateStabilizeButtonAnimated:](self, "_updateStabilizeButtonAnimated:", 1);
  -[PUPhotoEditMediaToolController _updatePortraitVideoButtonAnimated:](self, "_updatePortraitVideoButtonAnimated:", 1);
  -[PUPhotoEditMediaToolController _updateApertureControlsAnimated:](self, "_updateApertureControlsAnimated:", 1);
  -[PUPhotoEditMediaToolController trimController](self, "trimController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "compositionControllerDidChangeForAdjustments:", v20);

}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (int64_t)scrubberOrientation
{
  return 1;
}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  id v4;

  if (a3 == 11
    && -[PUPhotoEditMediaToolController _wantsRateControl](self, "_wantsRateControl")
    && (-[PUPhotoEditToolbarButton isHeld](self->_rateButton, "isHeld") & 1) == 0)
  {
    -[PUPhotoEditToolbarButton contextMenuInteraction](self->_rateButton, "contextMenuInteraction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
}

- (void)increaseScrubberValue:(BOOL)a3
{
  PUTrimToolController *trimController;
  uint64_t v4;

  trimController = self->_trimController;
  if (a3)
    v4 = 6;
  else
    v4 = 1;
  -[PUTrimToolController stepByCount:](trimController, "stepByCount:", v4);
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  PUTrimToolController *trimController;
  uint64_t v4;

  trimController = self->_trimController;
  if (a3)
    v4 = -6;
  else
    v4 = -1;
  -[PUTrimToolController stepByCount:](trimController, "stepByCount:", v4);
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  id v5;

  -[PUVideoEditOverlayViewController renderDidChange:](self->_overlayController, "renderDidChange:", 1, a4);
  -[PUPhotoEditMediaToolController trimController](self, "trimController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaViewDidZoom");

}

- (void)mediaViewDidScroll:(id)a3
{
  -[PUVideoEditOverlayViewController renderDidChange:](self->_overlayController, "renderDidChange:", 1);
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", self->_livePhotoButton))
    goto LABEL_5;
  if (!objc_msgSend(v4, "state"))
  {
    PULocalizedString(CFSTR("PHOTOEDIT_LIVE_SWITCH_OFF"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("PULivePhotoOff");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "state") != 4)
  {
LABEL_5:
    v7 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  -[PUPhotoEditMediaToolController _localizedTitleForCurrentPlaybackVariation](self, "_localizedTitleForCurrentPlaybackVariation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("PULivePhotoOn");
LABEL_9:
  objc_msgSend(v5, "localizedUppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC3418]);
    v9 = objc_msgSend(v13, "initWithTitle:image:imageInsets:scaleImage:", v7, v8, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    goto LABEL_7;
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController accessibilityHUDItemForButton:](&v14, sel_accessibilityHUDItemForButton_, v4);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;

  return v10;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  -[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton", a3, a4);
  -[PUPhotoEditMediaToolController _updateRateToolbarButton](self, "_updateRateToolbarButton");
}

- (void)mediaViewInsetsUpdated
{
  -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
  -[PUPhotoEditMediaToolController updateViewConstraints](self, "updateViewConstraints");
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[PUPhotoEditToolController backdropViewGroupName](self, "backdropViewGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditMediaToolController;
    -[PUPhotoEditToolController setBackdropViewGroupName:](&v8, sel_setBackdropViewGroupName_, v4);
    -[PUPhotoEditToolController backdropViewGroupName](self, "backdropViewGroupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView setGroupName:](self->_backdropBackgroundView, "setGroupName:", v7);

  }
}

- (void)setUseTranslucentBackground:(BOOL)a3
{
  -[PUPhotoEditMediaToolController setUseGradientBackground:animated:](self, "setUseGradientBackground:animated:", a3, 0);
}

- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_useTranslucentBackground = a3;
    -[PUPhotoEditMediaToolController _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
  }
}

- (void)setHorizontalControlPadding:(double)a3
{
  if (self->_horizontalControlPadding != a3)
  {
    self->_horizontalControlPadding = a3;
    -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
  }
}

- (void)setVerticalButtonOffset:(double)a3
{
  if (self->_verticalButtonOffset != a3)
  {
    self->_verticalButtonOffset = a3;
    -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
  }
}

- (void)setPrimaryView:(id)a3
{
  UIView *v5;
  UIView **p_primaryView;
  UIView *primaryView;
  void *v8;
  _BOOL4 v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_primaryView = &self->_primaryView;
  primaryView = self->_primaryView;
  if (primaryView != v5)
  {
    v11 = v5;
    -[PUPhotoEditMediaToolController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIView isDescendantOfView:](primaryView, "isDescendantOfView:", v8);

    if (v9)
      -[UIView removeFromSuperview](*p_primaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_primaryView, a3);
    -[PUPhotoEditMediaToolController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_primaryView);

    -[PUPhotoEditMediaToolController _invalidateConstraints](self, "_invalidateConstraints");
    v5 = v11;
  }

}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (id)leadingToolbarViews
{
  void *v3;
  BOOL v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls");
  if (self->_muteButton && !v4)
    objc_msgSend(v3, "addObject:");
  if (self->_autoFocusButton)
    objc_msgSend(v3, "addObject:");
  if (self->_apertureButtonContainer)
    objc_msgSend(v3, "addObject:");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)centerToolbarView
{
  void *livePhotoButton;

  livePhotoButton = self->_livePhotoButton;
  if (!livePhotoButton)
  {
    livePhotoButton = self->_portraitVideoButton;
    if (!livePhotoButton)
      livePhotoButton = self->_videoLabelView;
  }
  return livePhotoButton;
}

- (id)trailingToolbarViews
{
  void *v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls");
  if (self->_muteButton)
    v5 = !v4;
  else
    v5 = 1;
  if (!v5)
    objc_msgSend(v3, "addObject:");
  if (self->_stabilizeProgressView)
    objc_msgSend(v3, "addObject:");
  if (self->_stabilizeButton)
    objc_msgSend(v3, "addObject:");
  if (self->_rateButton)
    objc_msgSend(v3, "addObject:");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)toolControllerTag
{
  return 1001;
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 useTranslucentBackground;
  _BOOL4 v6;
  UIView *solidBackgroundView;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  PUPhotoEditMediaToolController *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  PUPhotoEditMediaToolController *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  PUPhotoEditMediaToolController *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  PUPhotoEditMediaToolController *v30;

  v3 = a3;
  useTranslucentBackground = self->_useTranslucentBackground;
  v6 = -[UIView isHidden](self->_solidBackgroundView, "isHidden");
  if (useTranslucentBackground)
  {
    if (v6)
      return;
    -[_UIBackdropView setHidden:](self->_backdropBackgroundView, "setHidden:", 0);
    solidBackgroundView = self->_solidBackgroundView;
    if (!v3)
    {
      -[UIView setHidden:](solidBackgroundView, "setHidden:", 1);
      return;
    }
    -[UIView setAlpha:](solidBackgroundView, "setAlpha:", 1.0);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke;
    v29 = &unk_1E58ABD10;
    v30 = self;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_2;
    v24 = &unk_1E58A9910;
    v25 = self;
    v9 = &v26;
    v10 = &v21;
  }
  else
  {
    if (!v6)
      return;
    -[UIView setHidden:](self->_solidBackgroundView, "setHidden:", 0);
    if (!v3)
    {
      -[_UIBackdropView setHidden:](self->_backdropBackgroundView, "setHidden:", 1);
      -[UIView setAlpha:](self->_solidBackgroundView, "setAlpha:", 1.0);
      return;
    }
    -[UIView setAlpha:](self->_solidBackgroundView, "setAlpha:", 0.0);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v15 = self;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_3;
    v19 = &unk_1E58ABD10;
    v20 = self;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_4;
    v14 = &unk_1E58A9910;
    v9 = &v16;
    v10 = &v11;
  }
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v9, v10, 0.2, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30);
}

- (BOOL)_isTrimAllowed
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoopingVideo");

  if (v5)
    v6 = objc_msgSend(v3, "loopBounceTrimAllowed");
  else
    v6 = 1;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStandardVideo");

  if ((v8 & 1) != 0 || v6)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isVideoOn");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_wantsTrimControl
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStandardVideo");

  if ((v4 & 1) != 0)
  {
    v5 = 1;
    goto LABEL_8;
  }
  -[PUPhotoEditToolController asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLivePhoto") & 1) != 0)
  {
    -[PUPhotoEditToolController editSource](self, "editSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mediaType");

    if (v8 == 3)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasLoopingVideoAdjustment");

      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "loopBounceTrimAllowed");

      v5 = v10 ^ 1 | v12;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v5 = 0;
LABEL_8:
  if (self->_toolMode == 1)
    return 0;
  else
    return v5;
}

- (void)_updateTrimControlAndToolbarButtons
{
  void *v3;
  PUTrimToolController *v4;
  PUTrimToolController *trimController;
  void *v6;
  void *v7;
  PUTrimToolController *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  PUTrimToolController *v13;
  void *v14;
  PUTrimToolController *v15;
  void *v16;
  BOOL v17;
  PUTrimToolController *v18;
  PUTrimToolController *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  PUPhotoEditToolbarButton *muteButton;
  void *v29;
  void *v30;
  PUPhotoEditToolbarButton *v31;
  PUPhotoEditToolbarButton *v32;
  void *v33;
  void *v34;
  PUPhotoEditToolActivationButton *v35;
  PUPhotoEditToolActivationButton *portraitVideoButton;
  double v37;
  void *v38;
  UIView *portraitVideoButtonDimmingView;
  UIView *v40;
  UIView *v41;
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
  int v53;
  UIView *v54;
  PUPhotoEditToolActivationButton *v55;
  UIView *v56;
  CEKApertureButton *apertureButton;
  PUPhotoEditApertureButton *v58;
  void *v59;
  _BOOL8 v60;
  PUPhotoEditApertureButtonContainer *v61;
  UIView *apertureButtonContainer;
  UIView *apertureButtonContainerDimmingView;
  UIView *v64;
  UIView *v65;
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
  PUVideoEditOverlayViewController *overlayController;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  PUVideoEditOverlayViewController *v81;
  PUVideoEditOverlayViewController *v82;
  void *v83;
  void *v84;
  void *v85;
  PUPhotoEditApertureToolbar *v86;
  PUPhotoEditApertureToolbar *apertureToolbar;
  PXCinematicEditController *cinematographyController;
  UIView *apertureContainer;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  CEKEdgeGradientView *v102;
  CEKEdgeGradientView *apertureGradientView;
  void *v104;
  PUVideoEditOverlayViewController *v105;
  PUPhotoEditApertureToolbar *v106;
  void *v107;
  PUPhotoEditApertureToolbar *v108;
  CEKEdgeGradientView *v109;
  void *v110;
  int v111;
  UIButton *v112;
  UIButton *stabilizeButton;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  PUPhotoEditToolActivationButton *livePhotoButton;
  void *v122;
  void *v123;
  PUPhotoEditToolActivationButton *v124;
  PUPhotoEditToolActivationButton *v125;
  uint64_t v126;
  void *videoLabelView;
  void *v128;
  void *v129;
  UILabel *v130;
  UILabel *v131;
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
  id *v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  void *v157;
  void *v158;
  void *v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  id from;
  _QWORD v167[4];
  id v168;
  __int128 v169;
  int64_t v170;
  __int128 v171;
  uint64_t v172;
  __int128 v173;
  uint64_t v174;
  __int128 v175;
  uint64_t v176;
  __int128 v177;
  uint64_t v178;
  __int128 location;
  int64_t epoch;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _QWORD v187[5];
  _QWORD v188[5];
  _QWORD v189[4];
  _QWORD v190[4];
  _QWORD v191[7];

  v191[4] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = objc_msgSend(v3, "isStandardVideo");

  if (-[PUPhotoEditMediaToolController _wantsTrimControl](self, "_wantsTrimControl"))
  {
    if (!self->_trimController)
    {
      -[PUPhotoEditMediaToolController makeTrimToolController](self, "makeTrimToolController");
      v4 = (PUTrimToolController *)objc_claimAutoreleasedReturnValue();
      trimController = self->_trimController;
      self->_trimController = v4;

      -[PUTrimToolController view](self->_trimController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 0.0);

      -[PUTrimToolController view](self->_trimController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditMediaToolController setPrimaryView:](self, "setPrimaryView:", v7);

      -[PUPhotoEditMediaToolController addChildViewController:](self, "addChildViewController:", self->_trimController);
      -[PUTrimToolController didMoveToParentViewController:](self->_trimController, "didMoveToParentViewController:", self);
    }
    -[PUTrimToolController setDisabled:](self->_trimController, "setDisabled:", -[PUPhotoEditMediaToolController _isTrimAllowed](self, "_isTrimAllowed") ^ 1);
    if (!self->_trimControllerVisible && self->_viewHasAppeared)
    {
      self->_trimControllerVisible = 1;
      v188[0] = MEMORY[0x1E0C809B0];
      v188[1] = 3221225472;
      v188[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke;
      v188[3] = &unk_1E58ABD10;
      v188[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v188, 0);
    }
  }
  else if (self->_trimControllerVisible)
  {
    self->_trimControllerVisible = 0;
    v187[0] = MEMORY[0x1E0C809B0];
    v187[1] = 3221225472;
    v187[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_2;
    v187[3] = &unk_1E58ABD10;
    v187[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v187, 0);
  }
  v8 = self->_trimController;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolControllerPlaceholderImage:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController setPlaceholderImage:](v8, "setPlaceholderImage:", v10);

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "trimAdjustmentController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v11;
  v12 = (_QWORD *)MEMORY[0x1E0D71470];
  if (v11)
  {
    objc_msgSend(v11, "startTime");
    if ((v185 & 0x100000000) != 0)
      goto LABEL_15;
    objc_msgSend(v155, "endTime");
    if ((v182 & 0x100000000) != 0)
      goto LABEL_15;
  }
  else
  {
    v184 = 0;
    v185 = 0;
    v186 = 0;
    v182 = 0;
    v183 = 0;
    v181 = 0;
  }
  objc_msgSend(v159, "removeAdjustmentWithKey:", *v12);
LABEL_15:
  -[PUTrimToolController setCompositionController:](self->_trimController, "setCompositionController:", v159);
  v13 = self->_trimController;
  -[PUPhotoEditToolController editSource](self, "editSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolController setEditSource:](v13, "setEditSource:", v14);

  v15 = self->_trimController;
  location = *(_OWORD *)&self->_originalStillImageTime.value;
  epoch = self->_originalStillImageTime.epoch;
  -[PUTrimToolController setUnadjustedStillImageTime:](v15, "setUnadjustedStillImageTime:", &location);
  v158 = (void *)objc_msgSend(v159, "copy");
  objc_msgSend(v158, "removeAdjustmentWithKey:", *v12);
  objc_msgSend(v158, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71378]);
  objc_msgSend(v158, "trimAdjustmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v16;
  if (v16)
  {
    objc_msgSend(v16, "startTime");
    v16 = v157;
  }
  else
  {
    v177 = 0uLL;
    v178 = 0;
  }
  v17 = v16 == 0;
  v18 = self->_trimController;
  v175 = v177;
  v176 = v178;
  -[PUTrimToolController setOriginalStartTime:](v18, "setOriginalStartTime:", &v175);
  if (v17)
  {
    v173 = 0uLL;
    v174 = 0;
  }
  else
  {
    objc_msgSend(v157, "endTime");
  }
  v19 = self->_trimController;
  v171 = v173;
  v172 = v174;
  -[PUTrimToolController setOriginalEndTime:](v19, "setOriginalEndTime:", &v171);
  -[PUPhotoEditToolController asset](self, "asset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "showSuggestedKeyFrame");

    if (!v22)
      goto LABEL_29;
    -[PUPhotoEditToolController asset](self, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchPropertySetsIfNeeded");
    location = 0uLL;
    epoch = 0;
    objc_msgSend(v20, "mediaAnalysisProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "bestKeyFrameTime");
    }
    else
    {
      location = 0uLL;
      epoch = 0;
    }

    if ((BYTE12(location) & 1) != 0)
    {
      v169 = location;
      v170 = epoch;
      -[PUTrimToolController setSuggestedKeyFrameTime:](self->_trimController, "setSuggestedKeyFrameTime:", &v169);
    }
  }

LABEL_29:
  -[PUPhotoEditToolController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fontForButtons");
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)&location, self);
  -[PUPhotoEditToolController editSource](self, "editSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "mediaType") == 3)
    v27 = 1;
  else
    v27 = v156;

  muteButton = self->_muteButton;
  if (v27)
  {
    if (!muteButton)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_MUTE_BUTTON_AX_LABEL"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("speaker.wave.2.fill"), CFSTR("speaker.slash.fill"), v29, v30);
      v31 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
      v32 = self->_muteButton;
      self->_muteButton = v31;

      v167[0] = MEMORY[0x1E0C809B0];
      v167[1] = 3221225472;
      v167[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_3;
      v167[3] = &unk_1E58A45C0;
      objc_copyWeak(&v168, (id *)&location);
      -[PUPhotoEditToolbarButton setActionBlock:](self->_muteButton, "setActionBlock:", v167);
      objc_destroyWeak(&v168);
    }
  }
  else if (muteButton)
  {
    self->_muteButton = 0;

  }
  if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls")
    && self->_cinematographyController)
  {
    if (!self->_portraitVideoButton)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_CINEMATIC_SWITCH"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedUppercaseString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditToolActivationButton buttonWithTitle:](PUPhotoEditToolActivationButton, "buttonWithTitle:", v34);
      v35 = (PUPhotoEditToolActivationButton *)objc_claimAutoreleasedReturnValue();
      portraitVideoButton = self->_portraitVideoButton;
      self->_portraitVideoButton = v35;

      -[PUPhotoEditToolActivationButton setTranslatesAutoresizingMaskIntoConstraints:](self->_portraitVideoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v37) = 1144586240;
      -[PUPhotoEditToolActivationButton setContentCompressionResistancePriority:forAxis:](self->_portraitVideoButton, "setContentCompressionResistancePriority:forAxis:", 0, v37);
      objc_initWeak(&from, self);
      v164[0] = MEMORY[0x1E0C809B0];
      v164[1] = 3221225472;
      v164[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_4;
      v164[3] = &unk_1E58A40E8;
      objc_copyWeak(&v165, &from);
      -[PUPhotoEditToolActivationButton setActionBlock:](self->_portraitVideoButton, "setActionBlock:", v164);
      if (MEMORY[0x1AF429AFC](-[PUPhotoEditToolActivationButton addTarget:action:forControlEvents:](self->_portraitVideoButton, "addTarget:action:forControlEvents:", self, sel__handlePortraitVideoButton_, 64)))
      {
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handlePortraitVideoButtonLongPress_);
        -[PUPhotoEditToolActivationButton addGestureRecognizer:](self->_portraitVideoButton, "addGestureRecognizer:", v38);

      }
      if (self->_cinematicButtonsNeedDimmingViews)
      {
        portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
        self->_portraitVideoButtonDimmingView = 0;

        v40 = (UIView *)objc_opt_new();
        v41 = self->_portraitVideoButtonDimmingView;
        self->_portraitVideoButtonDimmingView = v40;

        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "colorWithAlphaComponent:", 0.6);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_portraitVideoButtonDimmingView, "setBackgroundColor:", v43);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_portraitVideoButtonDimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PUPhotoEditToolActivationButton addSubview:](self->_portraitVideoButton, "addSubview:", self->_portraitVideoButtonDimmingView);
        v137 = (void *)MEMORY[0x1E0CB3718];
        -[UIView leadingAnchor](self->_portraitVideoButtonDimmingView, "leadingAnchor");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolActivationButton leadingAnchor](self->_portraitVideoButton, "leadingAnchor");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "constraintEqualToAnchor:", v149);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v191[0] = v143;
        -[UIView trailingAnchor](self->_portraitVideoButtonDimmingView, "trailingAnchor");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolActivationButton trailingAnchor](self->_portraitVideoButton, "trailingAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "constraintEqualToAnchor:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v191[1] = v45;
        -[UIView topAnchor](self->_portraitVideoButtonDimmingView, "topAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolActivationButton topAnchor](self->_portraitVideoButton, "topAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v191[2] = v48;
        -[UIView bottomAnchor](self->_portraitVideoButtonDimmingView, "bottomAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolActivationButton bottomAnchor](self->_portraitVideoButton, "bottomAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "constraintEqualToAnchor:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v191[3] = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "activateConstraints:", v52);

      }
      objc_destroyWeak(&v165);
      objc_destroyWeak(&from);
    }
    if (self->_apertureButton)
    {
      v53 = 1;
      goto LABEL_56;
    }
    v58 = objc_alloc_init(PUPhotoEditApertureButton);
    objc_storeStrong((id *)&self->_apertureButton, v58);
    -[PUPhotoEditMediaToolController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "effectiveUserInterfaceLayoutDirection") != 1;

    -[PUPhotoEditApertureButton setExpansionDirection:](v58, "setExpansionDirection:", v60);
    -[PUPhotoEditApertureButton setTappableEdgeInsets:](v58, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[PUPhotoEditApertureButton setTranslatesAutoresizingMaskIntoConstraints:](v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditApertureButton addTarget:action:forControlEvents:](v58, "addTarget:action:forControlEvents:", self, sel__handleApertureButton_, 64);
    v61 = -[PUPhotoEditApertureButtonContainer initWithApertureButton:]([PUPhotoEditApertureButtonContainer alloc], "initWithApertureButton:", v58);
    apertureButtonContainer = self->_apertureButtonContainer;
    self->_apertureButtonContainer = &v61->super;

    if (self->_cinematicButtonsNeedDimmingViews)
    {
      apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
      self->_apertureButtonContainerDimmingView = 0;

      v64 = (UIView *)objc_opt_new();
      v65 = self->_apertureButtonContainerDimmingView;
      self->_apertureButtonContainerDimmingView = v64;

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "colorWithAlphaComponent:", 0.6);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_apertureButtonContainerDimmingView, "setBackgroundColor:", v67);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_apertureButtonContainerDimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_apertureButtonContainer, "addSubview:", self->_apertureButtonContainerDimmingView);
      v138 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leadingAnchor](self->_apertureButtonContainerDimmingView, "leadingAnchor");
      v152 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_apertureButtonContainer, "leadingAnchor");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "constraintEqualToAnchor:", v150);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v190[0] = v147;
      -[UIView trailingAnchor](self->_apertureButtonContainerDimmingView, "trailingAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_apertureButtonContainer, "trailingAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "constraintEqualToAnchor:", v141);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v190[1] = v68;
      -[UIView topAnchor](self->_apertureButtonContainerDimmingView, "topAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_apertureButtonContainer, "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v190[2] = v71;
      -[UIView bottomAnchor](self->_apertureButtonContainerDimmingView, "bottomAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_apertureButtonContainer, "bottomAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v190[3] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 4);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "activateConstraints:", v75);

    }
    v53 = 1;
  }
  else
  {
    if (self->_portraitVideoButton)
    {
      v54 = self->_portraitVideoButtonDimmingView;
      self->_portraitVideoButtonDimmingView = 0;

      v55 = self->_portraitVideoButton;
      self->_portraitVideoButton = 0;

    }
    if (!self->_apertureButton)
    {
      v53 = 0;
      goto LABEL_56;
    }
    v56 = self->_apertureButtonContainerDimmingView;
    self->_apertureButtonContainerDimmingView = 0;

    apertureButton = self->_apertureButton;
    self->_apertureButton = 0;

    v53 = 0;
    v58 = (PUPhotoEditApertureButton *)self->_apertureButtonContainer;
    self->_apertureButtonContainer = 0;
  }

LABEL_56:
  -[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton");
  overlayController = self->_overlayController;
  if (v53)
  {
    if (!overlayController)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "mediaView");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCinematicEditController cinematographyScript](self->_cinematographyController, "cinematographyScript");
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)v79;
      if (v78 && v79)
      {
        v81 = -[PUVideoEditOverlayViewController initWithMediaView:cineController:]([PUVideoEditOverlayViewController alloc], "initWithMediaView:cineController:", v78, self->_cinematographyController);
        v82 = self->_overlayController;
        self->_overlayController = v81;

        -[PUVideoEditOverlayViewController setOverlayControllerDelegate:](self->_overlayController, "setOverlayControllerDelegate:", self);
        -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[PUPhotoEditMediaToolController addChildViewController:](self, "addChildViewController:", self->_overlayController);
        -[PUVideoEditOverlayViewController didMoveToParentViewController:](self->_overlayController, "didMoveToParentViewController:", self);
        -[PUPhotoEditMediaToolController view](self, "view");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "insertSubview:atIndex:", v85, 0);

      }
    }
    if (!self->_apertureToolbar)
    {
      v86 = objc_alloc_init(PUPhotoEditApertureToolbar);
      apertureToolbar = self->_apertureToolbar;
      self->_apertureToolbar = v86;

      -[PUPhotoEditApertureToolbar setDelegate:](self->_apertureToolbar, "setDelegate:", self);
      -[PUPhotoEditApertureToolbar setLayoutOrientation:](self->_apertureToolbar, "setLayoutOrientation:", -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation"));
      cinematographyController = self->_cinematographyController;
      if (cinematographyController)
      {
        -[PXCinematicEditController minimumCinematicAperture](cinematographyController, "minimumCinematicAperture");
        -[PUPhotoEditApertureToolbar setMinimumApertureValue:](self->_apertureToolbar, "setMinimumApertureValue:");
        -[PXCinematicEditController maximumCinematicAperture](self->_cinematographyController, "maximumCinematicAperture");
        -[PUPhotoEditApertureToolbar setMaximumApertureValue:](self->_apertureToolbar, "setMaximumApertureValue:");
      }
      -[PUPhotoEditApertureToolbar willMoveToParentViewController:](self->_apertureToolbar, "willMoveToParentViewController:", self);
      apertureContainer = self->_apertureContainer;
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](apertureContainer, "addSubview:", v90);

      -[UIView setHidden:](self->_apertureContainer, "setHidden:", 1);
      -[PUPhotoEditMediaToolController view](self, "view");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_apertureContainer, "widthAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "widthAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "constraintEqualToAnchor:", v145);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v142;
      -[UIView centerXAnchor](self->_apertureContainer, "centerXAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "centerXAnchor");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "constraintEqualToAnchor:", v135);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v189[1] = v134;
      -[UIView heightAnchor](self->_apertureContainer, "heightAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "heightAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v189[2] = v94;
      -[UIView bottomAnchor](self->_apertureContainer, "bottomAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "bottomAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v189[3] = v98;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 4);
      v99 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addConstraints:", v99);

      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v99) = objc_msgSend(v100, "currentLayoutStyle") == 4;

      if ((v99 & 1) == 0)
      {
        v101 = objc_alloc(MEMORY[0x1E0D0D050]);
        v102 = (CEKEdgeGradientView *)objc_msgSend(v101, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        apertureGradientView = self->_apertureGradientView;
        self->_apertureGradientView = v102;

        -[CEKEdgeGradientView setEdgeGradientStyleMask](self->_apertureGradientView, "setEdgeGradientStyleMask");
        -[UIView setMaskView:](self->_apertureContainer, "setMaskView:", self->_apertureGradientView);
      }
      -[PUPhotoEditMediaToolController _updateApertureSliderLength](self, "_updateApertureSliderLength");
    }
  }
  else
  {
    if (overlayController)
    {
      -[PUVideoEditOverlayViewController willMoveToParentViewController:](overlayController, "willMoveToParentViewController:", 0);
      -[PUPhotoEditMediaToolController removeChildViewController:](self, "removeChildViewController:", self->_overlayController);
      -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "removeFromSuperview");

      v105 = self->_overlayController;
      self->_overlayController = 0;

    }
    v106 = self->_apertureToolbar;
    if (v106)
    {
      -[PUPhotoEditApertureToolbar removeFromParentViewController](v106, "removeFromParentViewController");
      -[PUPhotoEditApertureToolbar view](self->_apertureToolbar, "view");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "removeFromSuperview");

      v108 = self->_apertureToolbar;
      self->_apertureToolbar = 0;

      v109 = self->_apertureGradientView;
      self->_apertureGradientView = 0;

    }
  }
  -[PUPhotoEditMediaToolController _updateRateToolbarButton](self, "_updateRateToolbarButton");
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "enableVideoStabilizion");

  if ((v111 & v156) != 0 && !self->_stabilizeButton)
  {
    v112 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    stabilizeButton = self->_stabilizeButton;
    self->_stabilizeButton = v112;

    -[UIButton addTarget:action:forControlEvents:](self->_stabilizeButton, "addTarget:action:forControlEvents:", self, sel__handleStabilizeButton_, 64);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_stabilizeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v153);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("s.square"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "imageWithSymbolConfiguration:", v114);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("s.square.fill"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "imageWithSymbolConfiguration:", v114);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_stabilizeButton, "setImage:forState:", v116, 0);
    -[UIButton setImage:forState:](self->_stabilizeButton, "setImage:forState:", v118, 4);

  }
  -[PUPhotoEditToolController asset](self, "asset");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "isLivePhotoVisibilityAdjustmentAllowed");

  livePhotoButton = self->_livePhotoButton;
  if (v120)
  {
    if (livePhotoButton)
      goto LABEL_81;
    -[PUPhotoEditMediaToolController _localizedTitleForCurrentPlaybackVariation](self, "_localizedTitleForCurrentPlaybackVariation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "localizedUppercaseString");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditToolActivationButton buttonWithTitle:](PUPhotoEditToolActivationButton, "buttonWithTitle:", v123);
    v124 = (PUPhotoEditToolActivationButton *)objc_claimAutoreleasedReturnValue();
    v125 = self->_livePhotoButton;
    self->_livePhotoButton = v124;

    -[PUPhotoEditToolActivationButton setSelectedGlyphName:](self->_livePhotoButton, "setSelectedGlyphName:", CFSTR("livephoto"));
    -[PUPhotoEditToolActivationButton setUnselectedGlyphName:](self->_livePhotoButton, "setUnselectedGlyphName:", CFSTR("livephoto.slash"));
    objc_initWeak(&from, self);
    v126 = MEMORY[0x1E0C809B0];
    v162[0] = MEMORY[0x1E0C809B0];
    v162[1] = 3221225472;
    v162[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_5;
    v162[3] = &unk_1E58A40E8;
    objc_copyWeak(&v163, &from);
    -[PUPhotoEditToolActivationButton setActionBlock:](self->_livePhotoButton, "setActionBlock:", v162);
    v160[0] = v126;
    v160[1] = 3221225472;
    v160[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_6;
    v160[3] = &unk_1E58A4110;
    objc_copyWeak(&v161, &from);
    -[PUPhotoEditToolActivationButton setIsSelectedBlock:](self->_livePhotoButton, "setIsSelectedBlock:", v160);
    objc_destroyWeak(&v161);
    objc_destroyWeak(&v163);
    objc_destroyWeak(&from);

  }
  else
  {
    if (!livePhotoButton)
      goto LABEL_81;
    self->_livePhotoButton = 0;

    -[PUPhotoEditToolController delegate](self, "delegate");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "dismissLivePhotoRevertConfirmationAlert");
  }

LABEL_81:
  videoLabelView = self->_videoLabelView;
  if (v156)
  {
    if (!videoLabelView)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_VIDEO_TOP_LABEL"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "localizedUppercaseString");
      videoLabelView = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v154, "photoEditingTopToolbarToolLabelButtonColor");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v131 = self->_videoLabelView;
      self->_videoLabelView = v130;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_videoLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setText:](self->_videoLabelView, "setText:", videoLabelView);
      -[UILabel setTextColor:](self->_videoLabelView, "setTextColor:", v129);
      objc_msgSend(v154, "topToolbarToolLabelFont");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_videoLabelView, "setFont:", v132);

LABEL_86:
    }
  }
  else if (videoLabelView)
  {
    self->_videoLabelView = 0;
    goto LABEL_86;
  }
  objc_destroyWeak((id *)&location);

}

- (BOOL)_updateAutoFocusToolbarButton
{
  void *v3;
  PXCinematicEditController *cinematographyController;
  void *v5;
  void *v6;
  PUPhotoEditToolbarButton *v7;
  PUPhotoEditToolbarButton *v8;
  PUPhotoEditToolbarButton *autoFocusButton;
  BOOL v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls")
    || (cinematographyController = self->_cinematographyController) == 0)
  {
    autoFocusButton = self->_autoFocusButton;
    if (autoFocusButton)
    {
      self->_autoFocusButton = 0;

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (!-[PXCinematicEditController isInAutoFocusState](cinematographyController, "isInAutoFocusState")
    || (-[PXCinematicEditController canToggleBackToUserFocusState](self->_cinematographyController, "canToggleBackToUserFocusState") & 1) != 0)
  {
    if (!self->_autoFocusButton)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_CINEMATIC_AUTO_FOCUS_AX_LABEL"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("dot.viewfinder"), CFSTR("dot.circle.viewfinder"), v5, v6);
      v7 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
      v8 = self->_autoFocusButton;
      self->_autoFocusButton = v7;

      -[PUPhotoEditToolbarButton setSelectedGlyphHasHighlightColor:](self->_autoFocusButton, "setSelectedGlyphHasHighlightColor:", 1);
      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __63__PUPhotoEditMediaToolController__updateAutoFocusToolbarButton__block_invoke;
      v16 = &unk_1E58A45C0;
      objc_copyWeak(&v17, &location);
      -[PUPhotoEditToolbarButton setActionBlock:](self->_autoFocusButton, "setActionBlock:", &v13);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
LABEL_9:
      v10 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:
  if ((-[PUPhotoEditToolbarButton isSelected](self->_autoFocusButton, "isSelected", v13, v14, v15, v16) & 1) != 0)
    objc_msgSend(v3, "photoEditingToolbarButtonSelectedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setTintColor:](self->_autoFocusButton, "setTintColor:", v11);

  return v10;
}

- (id)makeTrimToolController
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  PUTrimToolController *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  PUTrimToolController *v22;
  PXCinematicEditController *cinematographyController;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLoopingVideo"))
  {

LABEL_4:
    v6 = objc_alloc(MEMORY[0x1E0D7BB20]);
    -[PUPhotoEditToolController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithNUMediaView:", v8);

    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "isLoopingVideo");

    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0D71268], "autoloopStabilizedVideoFilter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      v12 = (void **)v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D71268], "stripAllTimeAdjustmentsFilter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v11;
      v12 = &v25;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFullVideoPipelineFilters:", v13);

    -[PUPhotoEditToolController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayerItemSource:", v14);
    goto LABEL_9;
  }
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandardVideo");

  if (v5)
    goto LABEL_4;
  v15 = objc_alloc(MEMORY[0x1E0D7BB18]);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mainLivePhotoView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v15, "initWithLivePhotoView:", v16);

LABEL_9:
  v17 = [PUTrimToolController alloc];
  -[PUPhotoEditToolController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isStandardVideo");
  v20 = -[PUPhotoEditMediaToolController _isSlomoEnabled](self, "_isSlomoEnabled");
  -[PUPhotoEditToolController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PUTrimToolController initWithPlayerWrapper:playButtonEnabled:slomoEnabled:portraitVideoEnabled:](v17, "initWithPlayerWrapper:playButtonEnabled:slomoEnabled:portraitVideoEnabled:", v9, v19, v20, objc_msgSend(v21, "isPortraitVideo"));

  cinematographyController = self->_cinematographyController;
  if (cinematographyController)
  {
    -[PXCinematicEditController setFocusTimelineDelegate:](cinematographyController, "setFocusTimelineDelegate:", v22);
    -[PXCinematicEditController cinematographyWasEdited](self->_cinematographyController, "cinematographyWasEdited");
  }
  -[PUTrimToolController setDelegate:](v22, "setDelegate:", self);

  return v22;
}

- (PUTrimToolController)trimController
{
  return self->_trimController;
}

- (void)_invalidateTrimControlScrubberThumbnails
{
  self->_trimControllerScrubberNeedsVisualUpdate = 1;
}

- (void)videoRenderingChanged
{
  -[PUTrimToolController livePhotoRenderDidChange:](self->_trimController, "livePhotoRenderDidChange:", self->_trimControllerScrubberNeedsVisualUpdate);
  self->_trimControllerScrubberNeedsVisualUpdate = 0;
  -[PUVideoEditOverlayViewController renderDidChange:](self->_overlayController, "renderDidChange:", 0);
}

- (void)reloadToolbarButtons:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  PUPhotoEditToolActivationButton *livePhotoButton;
  PUPhotoEditToolbarButton *muteButton;
  UIButton *stabilizeButton;
  UIView *portraitVideoButtonDimmingView;
  PUPhotoEditToolActivationButton *portraitVideoButton;

  v3 = a3;
  -[PUPhotoEditToolController editSource](self, "editSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[PUPhotoEditToolController editSource](self, "editSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
  }
  if (v3)
  {
    livePhotoButton = self->_livePhotoButton;
    self->_livePhotoButton = 0;

    muteButton = self->_muteButton;
    self->_muteButton = 0;

    stabilizeButton = self->_stabilizeButton;
    self->_stabilizeButton = 0;

    portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
    self->_portraitVideoButtonDimmingView = 0;

    portraitVideoButton = self->_portraitVideoButton;
    self->_portraitVideoButton = 0;

  }
  -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
  -[PUPhotoEditMediaToolController updateToolbarButtonsAnimated:](self, "updateToolbarButtonsAnimated:", 0);
}

- (void)updateToolbarButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController updateToolbarButtonsAnimated:](&v5, sel_updateToolbarButtonsAnimated_);
  -[PUPhotoEditMediaToolController _updateLivePhotoButtonAnimated:](self, "_updateLivePhotoButtonAnimated:", v3);
  -[PUPhotoEditMediaToolController _updateMuteButtonAnimated:](self, "_updateMuteButtonAnimated:", v3);
  -[PUPhotoEditMediaToolController _updateStabilizeButtonAnimated:](self, "_updateStabilizeButtonAnimated:", v3);
  -[PUPhotoEditMediaToolController _updatePortraitVideoButtonAnimated:](self, "_updatePortraitVideoButtonAnimated:", v3);
  -[PUPhotoEditMediaToolController _updateApertureControlsAnimated:](self, "_updateApertureControlsAnimated:", v3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  char v6;
  objc_super v7;

  if (sel_togglePlayback_ == a3)
  {
    -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReadyToPlay");

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPhotoEditMediaToolController;
    return -[PUPhotoEditMediaToolController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)togglePlayback:(id)a3
{
  id v3;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPlaying"))
    objc_msgSend(v3, "pause");
  else
    objc_msgSend(v3, "play");

}

- (void)_updateLivePhotoButtonAnimated:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (self->_livePhotoButton)
  {
    v4 = a3;
    -[PUPhotoEditToolController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureEnablenessOfControlButton:animated:canVisuallyDisable:", self->_livePhotoButton, v4, 0);

  }
  -[PUPhotoEditToolController asset](self, "asset", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLivePhotoVisibilityAdjustmentAllowed");

  -[PUPhotoEditToolActivationButton setHidden:](self->_livePhotoButton, "setHidden:", v7 ^ 1u);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolActivationButton setSelected:](self->_livePhotoButton, "setSelected:", objc_msgSend(v8, "isVideoOn"));

  v9 = (void *)MEMORY[0x1E0D7BB50];
  if (-[PUPhotoEditToolActivationButton isSelected](self->_livePhotoButton, "isSelected"))
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v9, "configurationWithCursorEffect:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIButton setPx_configuration:](self->_livePhotoButton, "setPx_configuration:", v11);

}

- (void)_updateLivePhotoButton:(id)a3
{
  -[PUPhotoEditMediaToolController _updateLivePhotoButtonAnimated:](self, "_updateLivePhotoButtonAnimated:", 1);
}

- (void)_handleLivePhotoButton:(id)a3
{
  uint64_t v4;
  void (**v5)(void *, uint64_t);
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void *, uint64_t);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, uint64_t);
  _QWORD v23[4];
  void (**v24)(void *, uint64_t);
  _QWORD aBlock[6];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke;
  aBlock[3] = &unk_1E58A9910;
  aBlock[4] = self;
  v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVideoOn");

  if ((v7 & 1) != 0)
  {
    v5[2](v5, 1);
  }
  else
  {
    -[PUPhotoEditMediaToolController livePortraitBehaviorController](self, "livePortraitBehaviorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "confirmationWarningStringForAction:compositionController:", 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v20, v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("OK"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v4;
      v23[1] = 3221225472;
      v23[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_2;
      v23[3] = &unk_1E58AB6C0;
      v14 = v5;
      v24 = v14;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v15);

      v16 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("CANCEL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v4;
      v21[1] = 3221225472;
      v21[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_3;
      v21[3] = &unk_1E58AB6C0;
      v22 = v14;
      objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v18);

      -[PUPhotoEditMediaToolController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
    }
    else
    {
      v5[2](v5, 1);
    }

  }
}

- (id)_localizedTitleForCurrentPlaybackVariation
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoLoopAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flavor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = PIAutoLoopFlavorFromString();
  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_1E58A4268[v5];
  PULocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateMuteButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PUPhotoEditToolbarButton *muteButton;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id v26;

  v3 = a3;
  -[PUPhotoEditToolController asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isLivePhoto") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isLoopingVideo") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isStandardVideo");

    }
  }

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "autoLoopAdjustmentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flavor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isLoopingVideo"))
    v12 = PIAutoLoopFlavorFromString() != 2;
  else
    v12 = 1;

  if (v6)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isVideoOn") & v12;

  }
  else
  {
    v14 = 0;
  }
  if (self->_muteButton)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureEnablenessOfControlButton:animated:canVisuallyDisable:", self->_muteButton, v3, 1);

    muteButton = self->_muteButton;
  }
  else
  {
    muteButton = 0;
  }
  -[PUPhotoEditToolbarButton setHidden:](muteButton, "setHidden:", v6 ^ 1u);
  -[PUPhotoEditToolbarButton setEnabled:](self->_muteButton, "setEnabled:", v14);
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "adjustmentControllerForKey:", *MEMORY[0x1E0D71380]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_msgSend(v18, "enabled");
  }
  else
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "hasLoopingVideoAdjustment");

  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v21, "photoEditingIrisDisabledColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("PHOTOEDIT_MUTE_BUTTON_AX_VALUE_ON");
  }
  else
  {
    objc_msgSend(v21, "photoEditingIrisEnabledColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("PHOTOEDIT_MUTE_BUTTON_AX_VALUE_OFF");
  }
  -[PUPhotoEditToolbarButton setTintColor:](self->_muteButton, "setTintColor:", v23);
  -[PUPhotoEditToolbarButton setSelected:](self->_muteButton, "setSelected:", v19);
  PULocalizedString(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setAccessibilityValue:](self->_muteButton, "setAccessibilityValue:", v25);

}

- (void)_handleMuteButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D7B348];
  -[PUPhotoEditToolController compositionController](self, "compositionController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "muteToggleActionWithCompositionController:isLoopingVideo:", v5, objc_msgSend(v6, "isLoopingVideo"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditMediaToolController undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeWithUndoManager:completionHandler:", v7, &__block_literal_global_59689);

}

- (void)_updateStabilizeButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  UIButton *stabilizeButton;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  UIButton *v13;
  UIButton *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStandardVideo");

  if (self->_stabilizeButton)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureEnablenessOfControlButton:animated:canVisuallyDisable:", self->_stabilizeButton, v3, 1);

    stabilizeButton = self->_stabilizeButton;
  }
  else
  {
    stabilizeButton = 0;
  }
  -[UIButton setHidden:](stabilizeButton, "setHidden:", v6 ^ 1);
  -[UIButton setEnabled:](self->_stabilizeButton, "setEnabled:", v6);
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "videoStabilizeAdjustmentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "enabled");
  else
    v11 = 0;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_stabilizeButton;
  if (v11)
  {
    -[UIButton setSelected:](v13, "setSelected:", 1);
    v14 = self->_stabilizeButton;
    objc_msgSend(v12, "photoEditingToolbarMainButtonColor");
  }
  else
  {
    -[UIButton setSelected:](v13, "setSelected:", 0);
    v14 = self->_stabilizeButton;
    objc_msgSend(v12, "photoEditingToolbarSecondaryButtonColor");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](v14, "setTintColor:", v15);

}

- (void)_handleStabilizeButton:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustmentConstants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoStabilizeAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "PIVideoStabilizeAdjustmentKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v8, &__block_literal_global_178);

  }
  else if (!self->_stabilizationInProgress)
  {
    -[PUPhotoEditMediaToolController _updateStabilizationInProgress:](self, "_updateStabilizationInProgress:", 1);
    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x1E0D712D0]);
    objc_msgSend(v5, "composition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithComposition:", v10);

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "videoStabilizeMaxCropFraction");
    objc_msgSend(v11, "setAllowedCropFraction:");

    objc_msgSend(v11, "setName:", CFSTR("PU-PIVideoStabilizeRequest"));
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_2;
    v20[3] = &unk_1E58A4298;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v11, "setProgressHandler:", v20);
    objc_msgSend(v11, "allowedCropFraction");
    v15 = v14;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_3;
    v16[3] = &unk_1E58A4B60;
    v17 = v5;
    v18 = v6;
    v19[1] = v15;
    objc_copyWeak(v19, &location);
    objc_msgSend(v11, "submit:", v16);
    objc_destroyWeak(v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (void)_updateStabilizeProgressViewAnimated:(BOOL)a3
{
  PLRoundProgressView *stabilizeProgressView;
  PLRoundProgressView *v5;
  PLRoundProgressView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  stabilizeProgressView = self->_stabilizeProgressView;
  if (self->_stabilizationInProgress)
  {
    if (stabilizeProgressView)
      return;
    v5 = (PLRoundProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", 3, 0.0, 0.0, 20.0, 20.0);
    v6 = self->_stabilizeProgressView;
    self->_stabilizeProgressView = v5;

    -[PLRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_stabilizeProgressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[PLRoundProgressView widthAnchor](self->_stabilizeProgressView, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 20.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    -[PLRoundProgressView heightAnchor](self->_stabilizeProgressView, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 20.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v12);

  }
  else
  {
    if (!stabilizeProgressView)
      return;
    self->_stabilizeProgressView = 0;

  }
  -[PUPhotoEditToolController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolControllerDidUpdateToolbar:", self);

}

- (void)_reportStabilizeProgress:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotoEditMediaToolController__reportStabilizeProgress___block_invoke;
  v3[3] = &unk_1E58AACF0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)_updateStabilizationInProgress:(BOOL)a3
{
  self->_stabilizationInProgress = a3;
  -[PUPhotoEditMediaToolController _updateStabilizeButtonAnimated:](self, "_updateStabilizeButtonAnimated:", 1);
  -[PUPhotoEditMediaToolController _updateStabilizeProgressViewAnimated:](self, "_updateStabilizeProgressViewAnimated:", 1);
}

- (BOOL)_isSlomoEnabled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighframeRateVideo");

  if (_os_feature_enabled_impl())
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slomoAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "rate");
      v4 = v8 < 1.0;
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)_wantsRateControl
{
  int v3;
  void *v4;
  char v5;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHighframeRateVideo");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setPlaybackRate:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "slomoAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "rate");
  else
    v7 = 1.0;
  if (v7 != a3)
  {
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    if (a3 != 1.0
      || (-[PUPhotoEditToolController asset](self, "asset"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "mediaSubtypes"),
          v8,
          (v9 & 0x20000) != 0))
    {
      v10 = *MEMORY[0x1E0D71450];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__PUPhotoEditMediaToolController__setPlaybackRate___block_invoke;
      v13[3] = &unk_1E58A41C0;
      *(double *)&v13[5] = a3;
      v13[4] = self;
      objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v10, v13);
    }
    else
    {
      objc_msgSend(v12, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71450]);
    }
    PULocalizedString(CFSTR("PhotoEditPlaybackRateChangeActionName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v11);
    -[PUPhotoEditMediaToolController _updateRateToolbarButton](self, "_updateRateToolbarButton");

  }
}

- (void)_updateRateToolbarButton
{
  _BOOL4 v3;
  PUPhotoEditToolbarButton *rateButton;
  void *v5;
  PUPhotoEditToolbarButton *v6;
  PUPhotoEditToolbarButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void (**)(_QWORD, _QWORD));
  void *v17;
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PUPhotoEditMediaToolController _wantsRateControl](self, "_wantsRateControl");
  rateButton = self->_rateButton;
  if (v3)
  {
    if (!rateButton)
    {
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("gauge.with.dots.needle.33percent"), CFSTR("gauge.with.dots.needle.33percent"), &stru_1E58AD278, v5);
      v6 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
      v7 = self->_rateButton;
      self->_rateButton = v6;

      -[PUPhotoEditToolbarButton setShowsMenuAsPrimaryAction:](self->_rateButton, "setShowsMenuAsPrimaryAction:", 1);
    }
  }
  else if (rateButton)
  {
    self->_rateButton = 0;

  }
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC36F8];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __58__PUPhotoEditMediaToolController__updateRateToolbarButton__block_invoke;
  v17 = &unk_1E58A4AA0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v8, "elementWithUncachedProvider:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC39D0];
  PULocalizedString(CFSTR("PHOTOEDIT_SLOMO_RATE_MENU_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithTitle:image:identifier:options:children:", v11, 0, 0, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setMenu:](self->_rateButton, "setMenu:", v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)_rateToolbarButtonMenuElements
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  _QWORD v23[4];
  id v24;
  float v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackRateOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "slomoAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  if (v5)
  {
    objc_msgSend(v5, "rate", v5);
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "playbackRate", v20);
        v14 = v13;
        objc_msgSend(v12, "localizedTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v16 = (void *)MEMORY[0x1E0DC3428];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __64__PUPhotoEditMediaToolController__rateToolbarButtonMenuElements__block_invoke;
        v23[3] = &unk_1E58A41E8;
        objc_copyWeak(&v24, &location);
        v25 = v14;
        objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedSubtitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSubtitle:", v18);

        objc_msgSend(v17, "setState:", v7 == v14);
        objc_msgSend(v8, "addObject:", v17);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  return v8;
}

- (PTCinematographyScript)cinematographyScript
{
  return (PTCinematographyScript *)-[PXCinematicEditController cinematographyScript](self->_cinematographyController, "cinematographyScript");
}

- (BOOL)_wantsPortraitVideoControls
{
  void *v2;
  char v3;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPortraitVideo");

  return v3;
}

- (void)_updatePortraitVideoButtonAnimated:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PUTrimToolController *trimController;
  _BOOL8 v11;
  id v12;

  if (self->_portraitVideoButton && self->_cinematographyController)
  {
    v4 = a3;
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portraitVideoAdjustmentController");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
      v6 = objc_msgSend(v12, "enabled");
    else
      v6 = 0;
    -[PUPhotoEditToolActivationButton setSelected:](self->_portraitVideoButton, "setSelected:", v6);
    v7 = (void *)MEMORY[0x1E0D7BB50];
    if (-[PUPhotoEditToolActivationButton isSelected](self->_portraitVideoButton, "isSelected"))
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(v7, "configurationWithCursorEffect:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIButton setPx_configuration:](self->_portraitVideoButton, "setPx_configuration:", v9);

    trimController = self->_trimController;
    if ((_DWORD)v6)
      v11 = -[PUPhotoEditToolController isActiveTool](self, "isActiveTool");
    else
      v11 = 0;
    -[PUTrimToolController enableFocusTimeline:](trimController, "enableFocusTimeline:", v11);
    -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", v4);

  }
}

- (void)_updateTrackerDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  BOOL v7;
  int v8;
  int64_t toolMode;
  int64_t v10;
  PUVideoEditOverlayViewController *overlayController;
  _BOOL4 v12;
  _BOOL8 isLoadingCinematographyScript;
  BOOL v14;

  v3 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hideTrackersDuringPlayback");

  if (v6)
    v7 = -[PUTrimToolController state](self->_trimController, "state") == 1;
  else
    v7 = 0;
  v8 = -[PUPhotoEditToolActivationButton isSelected](self->_portraitVideoButton, "isSelected");
  toolMode = self->_toolMode;
  v10 = -[PUTrimToolController currentlyInteractingElement](self->_trimController, "currentlyInteractingElement");
  overlayController = self->_overlayController;
  v12 = -[PUPhotoEditToolController isActiveTool](self, "isActiveTool");
  isLoadingCinematographyScript = 1;
  if (v12 && !v7)
  {
    if (v8)
      v14 = toolMode == 1;
    else
      v14 = 1;
    if (!v14 && (unint64_t)(v10 - 1) >= 2)
      isLoadingCinematographyScript = self->_isLoadingCinematographyScript;
  }
  -[PUVideoEditOverlayViewController setHidden:animated:](overlayController, "setHidden:animated:", isLoadingCinematographyScript, v3);
}

- (void)_updateApertureControlsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  PUPhotoEditApertureToolbar *apertureToolbar;
  BOOL v16;
  double v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  void (**v20)(void *, uint64_t);
  _QWORD v21[5];
  BOOL v22;
  _QWORD aBlock[5];
  BOOL v24;

  v3 = a3;
  if (a3)
  {
    -[UIView superview](self->_apertureButtonContainer, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
  v6 = -[PXCinematicEditController cinematicAdjustmentActive](self->_cinematographyController, "cinematicAdjustmentActive");
  -[PXCinematicEditController cinematicAperture](self->_cinematographyController, "cinematicAperture");
  v8 = v7;
  -[CEKApertureButton setActive:](self->_apertureButton, "setActive:", self->_toolMode == 1);
  -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:", v8);
  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldAllowApertureButtonExpansion");

  if (self->_toolMode == 1)
    v11 = 0;
  else
    v11 = v6;
  if (v8 <= 0.0)
    v11 = 0;
  -[CEKApertureButton setShouldShowApertureValue:animated:](self->_apertureButton, "setShouldShowApertureValue:animated:", v11 & v10, v3);
  -[CEKApertureButton superview](self->_apertureButton, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "apertureSliderHasOffPosition");

  apertureToolbar = self->_apertureToolbar;
  if ((v14 & 1) == 0)
  {
    -[PUPhotoEditApertureToolbar setEnabled:](apertureToolbar, "setEnabled:", v6);
    if (!(_DWORD)v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  -[PUPhotoEditApertureToolbar setDepthIsOn:](apertureToolbar, "setDepthIsOn:", v6);
  if ((_DWORD)v6)
LABEL_12:
    -[PUPhotoEditApertureToolbar setApertureValueClosestTo:](self->_apertureToolbar, "setApertureValueClosestTo:", v8);
LABEL_13:
  v16 = self->_toolMode == 1;
  v17 = 66.0;
  if (self->_toolMode != 1)
    v17 = 0.0;
  -[PUPhotoEditToolController setToolGradientDistance:](self, "setToolGradientDistance:", v17);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke;
  aBlock[3] = &unk_1E58AAD68;
  aBlock[4] = self;
  v24 = v16;
  v19 = (void (**)(_QWORD))_Block_copy(aBlock);
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke_2;
  v21[3] = &unk_1E58A7A58;
  v21[4] = self;
  v22 = v16;
  v20 = (void (**)(void *, uint64_t))_Block_copy(v21);
  if (v3)
  {
    -[UIView setHidden:](self->_apertureContainer, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v19, v20, 0.25, 0.0);
  }
  else
  {
    v19[2](v19);
    v20[2](v20, 1);
  }

}

- (void)_handleApertureButton:(id)a3
{
  -[PUPhotoEditMediaToolController _setToolMode:](self, "_setToolMode:", self->_toolMode != 1);
}

- (void)_resetDefaultToolMode
{
  -[PUPhotoEditMediaToolController _setToolMode:](self, "_setToolMode:", 0);
}

- (void)_setToolMode:(int64_t)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_toolMode != a3)
  {
    self->_toolMode = a3;
    v4 = a3 == 1;
    -[PUPhotoEditToolController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toolController:showVideoScrubber:animated:", self, v4, v4);

    -[PUPhotoEditMediaToolController _updateApertureControlsAnimated:](self, "_updateApertureControlsAnimated:", 1);
    -[PUPhotoEditMediaToolController _updateTrimControlAndToolbarButtons](self, "_updateTrimControlAndToolbarButtons");
  }
}

- (void)_handlePortraitVideoButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  char v12;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  v5 = -[PUPhotoEditToolActivationButton isSelected](self->_portraitVideoButton, "isSelected");
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustmentConstants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PIPortraitVideoAdjustmentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PUPhotoEditMediaToolController__handlePortraitVideoButton___block_invoke;
  v11[3] = &__block_descriptor_33_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
  v12 = v5;
  objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", v7, v11);

  if (v5)
    v8 = CFSTR("PHOTOEDIT_CINEMATIC_ENABLE_ACTION");
  else
    v8 = CFSTR("PHOTOEDIT_CINEMATIC_DISABLE_ACTION");
  PULocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v9);
  -[PUPhotoEditMediaToolController _updatePortraitVideoButtonAnimated:](self, "_updatePortraitVideoButtonAnimated:", 1);
  -[PUPhotoEditMediaToolController _updateApertureControlsAnimated:](self, "_updateApertureControlsAnimated:", 1);
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");

}

- (void)_handlePortraitVideoButtonLongPress:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PUPhotoEditMediaToolController _presentPortraitVideoDebugControls](self, "_presentPortraitVideoDebugControls");
}

- (void)_presentPortraitVideoDebugControls
{
  PUPortraitVideoDebugController *v3;
  void *v4;
  PUPortraitVideoDebugController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PUPortraitVideoDebugController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PUPortraitVideoDebugController initWithNibName:bundle:]([PUPortraitVideoDebugController alloc], "initWithNibName:bundle:", 0, 0);
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPortraitVideoDebugController setCompositionController:](v3, "setCompositionController:", v4);

  v5 = v3;
  -[PUPortraitVideoDebugController loadViewIfNeeded](v5, "loadViewIfNeeded");
  -[PUPhotoEditMediaToolController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  if (v8 == 1)
  {
    v9 = (PUPortraitVideoDebugController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);

    -[PUPortraitVideoDebugController setTitle:](v5, "setTitle:", CFSTR("Cinematic Debug Settings"));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__dismissPortraitVideoDebugControls_);
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPortraitVideoDebugController navigationItem](v5, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItems:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPortraitVideoDebugController view](v5, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[PUPortraitVideoDebugController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  }
  else
  {
    -[PUPortraitVideoDebugController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
    -[PUPortraitVideoDebugController popoverPresentationController](v5, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceView:", self->_portraitVideoButton);
    -[PUPhotoEditToolActivationButton bounds](self->_portraitVideoButton, "bounds");
    objc_msgSend(v16, "setSourceRect:");
    -[PUPortraitVideoDebugController setPreferredContentSize:](v5, "setPreferredContentSize:", 580.0, 340.0);

    v9 = v5;
  }
  -[PUPhotoEditMediaToolController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_dismissPortraitVideoDebugControls:(id)a3
{
  -[PUPhotoEditMediaToolController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateApertureSliderLength
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  BOOL v9;

  if (self->_apertureToolbar)
  {
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldDisplayCompactToolbar");

    v5 = 0.0;
    if ((v4 & 1) == 0)
    {
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec", 0.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "currentLayoutStyle");

      v8 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      v9 = v7 != 4 && v8 == 1;
      v5 = 275.0;
      if (!v9)
        v5 = 375.0;
    }
    -[PUPhotoEditApertureToolbar setSliderWidth:](self->_apertureToolbar, "setSliderWidth:", v5);
  }
}

- (void)_handleAutoFocusButton:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "Auto focus button pressed", v8, 2u);
  }

  -[PUVideoEditOverlayViewController localizedStringForCinematicTrackingBadgeMessage:](self->_overlayController, "localizedStringForCinematicTrackingBadgeMessage:", -[PXCinematicEditController isInAutoFocusState](self->_cinematographyController, "isInAutoFocusState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoEditOverlayViewController showTrackingInformationalString:](self->_overlayController, "showTrackingInformationalString:", v5);
  -[PUVideoEditOverlayViewController setNeedsUpdateTrackingFrame](self->_overlayController, "setNeedsUpdateTrackingFrame");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B360]), "initWithCinematicController:", self->_cinematographyController);
  objc_msgSend(v6, "setLocalizedActionName:", v5);
  -[PUPhotoEditMediaToolController undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeWithUndoManager:completionHandler:", v7, &__block_literal_global_217);

  -[PUPhotoEditMediaToolController cinematographyWasEdited](self, "cinematographyWasEdited");
  -[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton");

}

- (void)_initializeCinematographyScript
{
  void *v3;
  void *v4;
  NSObject *v5;
  PXCinematicEditController *v6;
  PXCinematicEditController *cinematographyController;
  PXCinematicEditController *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController editSource](self, "editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolController editSource](self, "editSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUPhotoEditToolController editSource](self, "editSource");
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (PXCinematicEditController *)objc_alloc_init(MEMORY[0x1E0D7B268]);
        cinematographyController = self->_cinematographyController;
        self->_cinematographyController = v6;

        -[PXCinematicEditController setDelegate:](self->_cinematographyController, "setDelegate:", self);
        -[PXCinematicEditController setFocusTimelineDelegate:](self->_cinematographyController, "setFocusTimelineDelegate:", self->_trimController);
        v8 = self->_cinematographyController;
        -[PUPhotoEditToolController asset](self, "asset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCinematicEditController setAsset:editSource:](v8, "setAsset:editSource:", v9, v5);

        if (self->_apertureToolbar)
        {
          -[PXCinematicEditController minimumCinematicAperture](self->_cinematographyController, "minimumCinematicAperture");
          -[PUPhotoEditApertureToolbar setMinimumApertureValue:](self->_apertureToolbar, "setMinimumApertureValue:");
          -[PXCinematicEditController maximumCinematicAperture](self->_cinematographyController, "maximumCinematicAperture");
          -[PUPhotoEditApertureToolbar setMaximumApertureValue:](self->_apertureToolbar, "setMaximumApertureValue:");
        }
        goto LABEL_12;
      }
    }
    else
    {

    }
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PUPhotoEditToolController editSource](self, "editSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Cannot initialize cinematography; edit source is not a PLVideoEditSource: %@",
        (uint8_t *)&v12,
        0xCu);

    }
    v5 = 0;
  }
  else
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Cannot initialize cinematography; edit source is nil",
        (uint8_t *)&v12,
        2u);
    }
  }
LABEL_12:

}

- (void)disableCinematicUIForLoadingAsset
{
  self->_isLoadingCinematographyScript = 1;
  -[PUTrimToolController enableFocusTimeline:](self->_trimController, "enableFocusTimeline:", 0);
  -[PUTrimToolController enableUIForCinematographyScriptLoad:](self->_trimController, "enableUIForCinematographyScriptLoad:", 0);
  -[PUVideoEditOverlayViewController setHidden:](self->_overlayController, "setHidden:", 1);
  -[PUVideoEditOverlayViewController enableUIForCinematographyScriptLoad:](self->_overlayController, "enableUIForCinematographyScriptLoad:", 0);
  self->_cinematicButtonsNeedDimmingViews = 1;
}

- (void)cineScriptBecameAvailable:(id)a3
{
  void *v4;
  int v5;
  PUTrimToolController *trimController;
  _BOOL8 v7;
  UIView *portraitVideoButtonDimmingView;
  UIView *apertureButtonContainerDimmingView;
  void *v10;
  PUPhotoEditApertureToolbar *apertureToolbar;
  void *v12;
  id v13;

  self->_isLoadingCinematographyScript = 0;
  -[PUVideoEditOverlayViewController enableUIForCinematographyScriptLoad:](self->_overlayController, "enableUIForCinematographyScriptLoad:", 1);
  -[PUTrimToolController enableUIForCinematographyScriptLoad:](self->_trimController, "enableUIForCinematographyScriptLoad:", 1);
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "portraitVideoAdjustmentController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v5 = objc_msgSend(v13, "enabled");
    trimController = self->_trimController;
    if (v5)
      v7 = -[PUPhotoEditToolController isActiveTool](self, "isActiveTool");
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
    trimController = self->_trimController;
  }
  -[PUTrimToolController enableFocusTimeline:](trimController, "enableFocusTimeline:", v7);
  self->_cinematicButtonsNeedDimmingViews = 0;
  -[UIView removeFromSuperview](self->_portraitVideoButtonDimmingView, "removeFromSuperview");
  portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
  self->_portraitVideoButtonDimmingView = 0;

  -[UIView removeFromSuperview](self->_apertureButtonContainerDimmingView, "removeFromSuperview");
  apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
  self->_apertureButtonContainerDimmingView = 0;

  -[PUVideoEditOverlayViewController scriptDidUpdate](self->_overlayController, "scriptDidUpdate");
  -[PXCinematicEditController updateFocusDecisions](self->_cinematographyController, "updateFocusDecisions");
  if (-[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton"))
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolControllerDidUpdateToolbar:", self);

  }
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
  -[PUPhotoEditMediaToolController _updateApertureControlsAnimated:](self, "_updateApertureControlsAnimated:", 0);
  apertureToolbar = self->_apertureToolbar;
  -[PXCinematicEditController originalAperture](self->_cinematographyController, "originalAperture");
  -[PUPhotoEditApertureToolbar setOriginalApertureValueClosestTo:](apertureToolbar, "setOriginalApertureValueClosestTo:");
  -[PUPhotoEditToolController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initialCinematographyLoadComplete");

}

- (void)cineScriptCouldNotInitializeWithError:(id)a3
{
  PXCinematicEditController *cinematographyController;
  void *v5;
  PUVideoEditOverlayViewController *overlayController;

  self->_isLoadingCinematographyScript = 0;
  cinematographyController = self->_cinematographyController;
  self->_cinematographyController = 0;

  -[PUTrimToolController enableFocusTimeline:](self->_trimController, "enableFocusTimeline:", 0);
  -[PUTrimToolController showFocusTimeline:](self->_trimController, "showFocusTimeline:", 0);
  -[PUVideoEditOverlayViewController willMoveToParentViewController:](self->_overlayController, "willMoveToParentViewController:", 0);
  -[PUPhotoEditMediaToolController removeChildViewController:](self, "removeChildViewController:", self->_overlayController);
  -[PUVideoEditOverlayViewController view](self->_overlayController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  overlayController = self->_overlayController;
  self->_overlayController = 0;

}

- (void)cinematographyWasEdited
{
  void *v3;
  id v4;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[PXCinematicEditController cinematographyWasEdited](self->_cinematographyController, "cinematographyWasEdited");
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
  if (-[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton"))
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolControllerDidUpdateToolbar:", self);

  }
}

- (void)cinematographyWasEditedAtTime:(id *)a3
{
  void *v5;
  id v6;
  PXCinematicEditController *cinematographyController;
  void *v8;
  void *v9;
  _QWORD v10[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pause");

  v6 = objc_alloc(MEMORY[0x1E0D7B350]);
  cinematographyController = self->_cinematographyController;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PUPhotoEditMediaToolController_cinematographyWasEditedAtTime___block_invoke;
  v10[3] = &__block_descriptor_56_e35_v16__0__PXCinematicEditController_8l;
  v11 = *a3;
  v8 = (void *)objc_msgSend(v6, "initWithCinematicController:changeBlock:", cinematographyController, v10);
  -[PUPhotoEditMediaToolController undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeWithUndoManager:", v9);

  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
}

- (void)updateCinematicVideoControlsEnableState
{
  void *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  if (-[PUPhotoEditMediaToolController _updateAutoFocusToolbarButton](self, "_updateAutoFocusToolbarButton"))
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toolControllerDidUpdateToolbar:", self);

  }
  v4 = -[PXCinematicEditController cinematicAdjustmentActive](self->_cinematographyController, "cinematicAdjustmentActive");
  v5 = -[PXCinematicEditController isInAutoFocusState](self->_cinematographyController, "isInAutoFocusState");
  v6 = -[PXCinematicEditController canToggleBackToUserFocusState](self->_cinematographyController, "canToggleBackToUserFocusState");
  v7 = v5 ^ 1u;
  -[PUPhotoEditToolbarButton setSelected:](self->_autoFocusButton, "setSelected:", v7);
  -[PUPhotoEditToolbarButton setEnabled:](self->_autoFocusButton, "setEnabled:", v4 & (v7 | v6));
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[PXCinematicEditController focusTimelineDelegate](self->_cinematographyController, "focusTimelineDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *a3;
  objc_msgSend(v4, "objectTrackingStartedAtTime:", &v5);

}

- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[PXCinematicEditController focusTimelineDelegate](self->_cinematographyController, "focusTimelineDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  objc_msgSend(v6, "updateObjectTrackingProgressAtTime:shouldStop:", &v7, a4);

}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXCinematicEditController focusTimelineDelegate](self->_cinematographyController, "focusTimelineDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectTrackingFinishedWithSuccess:", v3);

}

- (void)interactionBegan
{
  id v2;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (BOOL)hasTrimmedVideo
{
  void *v3;
  char isKindOfClass;
  void *v5;
  int v6;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showsUntrimmed") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)trimToolControllerDidChange:(id)a3 state:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  PUTrimToolController *trimController;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v5 = a3;
  -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", 1);
  v6 = objc_msgSend(v5, "state");

  if (!v6)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStandardVideo");

    if (v8)
    {
      trimController = self->_trimController;
      if (trimController)
      {
        -[PUTrimToolController playheadTime](trimController, "playheadTime");
      }
      else
      {
        v14 = 0uLL;
        v15 = 0;
      }
      -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v13 = v15;
      objc_msgSend(v10, "setVideoFrameTime:", &v12);

      -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "precomputeImageValues");

    }
  }
}

- (void)removeFocusDecisionAtTime:(id *)a3
{
  id v5;
  PXCinematicEditController *cinematographyController;
  void *v7;
  void *v8;
  _QWORD v9[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v5 = objc_alloc(MEMORY[0x1E0D7B350]);
  cinematographyController = self->_cinematographyController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PUPhotoEditMediaToolController_removeFocusDecisionAtTime___block_invoke;
  v9[3] = &__block_descriptor_56_e35_v16__0__PXCinematicEditController_8l;
  v10 = *a3;
  v7 = (void *)objc_msgSend(v5, "initWithCinematicController:changeBlock:", cinematographyController, v9);
  -[PUPhotoEditMediaToolController undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeWithUndoManager:", v8);

}

- (id)axDescriptionForFocusDecisionAtTime:(id *)a3
{
  PXCinematicEditController *cinematographyController;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  cinematographyController = self->_cinematographyController;
  v5 = *a3;
  -[PXCinematicEditController axDescriptionForFocusDecisionAtTime:](cinematographyController, "axDescriptionForFocusDecisionAtTime:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)trimToolController:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4
{
  id v6;

  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_wasPlayingBeforeBeginningToScrubVideo = objc_msgSend(v6, "isPlaying");
  objc_msgSend(v6, "pause");
  if ((unint64_t)(a4 - 1) > 1)
  {
    -[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls");
  }
  else
  {
    -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
    if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls"))
      -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", 0);
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  }

}

- (void)trimToolController:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  if (-[PUPhotoEditMediaToolController _wantsPortraitVideoControls](self, "_wantsPortraitVideoControls"))
    -[PUPhotoEditMediaToolController _updateTrackerDisplay:](self, "_updateTrackerDisplay:", 1);
  if ((unint64_t)(a4 - 1) <= 1)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_TRIM_ACTION_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v6);

  }
  -[PUTrimToolController playerWrapper](self->_trimController, "playerWrapper");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pauseAfterMovingPlayhead");

  if (a4 != 2 && self->_wasPlayingBeforeBeginningToScrubVideo && (v8 & 1) == 0)
    objc_msgSend(v9, "play");

}

- (void)trimToolController:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", a4);
}

- (void)removeCropToolGainMap
{
  id v2;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCropToolGainMap");

}

- (void)addCropToolGainMapIfNeeded
{
  id v2;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCropToolGainMapIfNeeded");

}

- (id)livePortraitBehaviorController
{
  void *v2;
  void *v3;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "livePortraitBehaviorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4
{
  -[PXCinematicEditController setCinematicAperture:](self->_cinematographyController, "setCinematicAperture:", a3, a4);
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
}

- (BOOL)apertureToolbarShouldRotateLabelsWithOrientation:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle") == 4;

  return v4;
}

- (void)apertureToolbarDidStartSliding:(id)a3
{
  double v4;
  double v5;

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUPhotoEditApertureToolbar apertureValue](self->_apertureToolbar, "apertureValue");
  if (v4 > 0.0)
  {
    -[PUPhotoEditApertureToolbar apertureValue](self->_apertureToolbar, "apertureValue");
    self->_lastKnownAperture = v5;
  }
}

- (void)apertureToolbarDidStopSliding:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
  PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_APERTURE_ACTION_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v4);

  -[PUPhotoEditApertureToolbar apertureValue](self->_apertureToolbar, "apertureValue");
  if (v5 == 0.0 && self->_lastKnownAperture > 0.0)
  {
    self->_suspendUIUpdatesFromComposition = 1;
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustmentConstants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PIPortraitVideoAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PUPhotoEditMediaToolController_apertureToolbarDidStopSliding___block_invoke;
    v9[3] = &unk_1E58A4B88;
    v9[4] = self;
    objc_msgSend(v8, "modifyAdjustmentWithKey:modificationBlock:", v7, v9);

    self->_suspendUIUpdatesFromComposition = 0;
  }
}

- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4
{
  -[PXCinematicEditController setCinematicAdjustmentActive:](self->_cinematographyController, "setCinematicAdjustmentActive:", a4);
  -[PUPhotoEditMediaToolController updateCinematicVideoControlsEnableState](self, "updateCinematicVideoControlsEnableState");
}

- (BOOL)apertureToolbarIsDepthActive
{
  return -[PXCinematicEditController cinematicAdjustmentActive](self->_cinematographyController, "cinematicAdjustmentActive");
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (double)horizontalControlPadding
{
  return self->_horizontalControlPadding;
}

- (double)horizontalPrimaryViewPaddingOffset
{
  return self->_horizontalPrimaryViewPaddingOffset;
}

- (double)verticalButtonOffset
{
  return self->_verticalButtonOffset;
}

- (BOOL)useTranslucentBackground
{
  return self->_useTranslucentBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_apertureGradientView, 0);
  objc_storeStrong((id *)&self->_cinematographyController, 0);
  objc_storeStrong((id *)&self->_apertureContainerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_apertureToolbar, 0);
  objc_storeStrong((id *)&self->_apertureContainer, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_rateButton, 0);
  objc_storeStrong((id *)&self->_autoFocusButton, 0);
  objc_storeStrong((id *)&self->_apertureButtonContainer, 0);
  objc_storeStrong((id *)&self->_apertureButtonContainerDimmingView, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_portraitVideoButtonDimmingView, 0);
  objc_storeStrong((id *)&self->_portraitVideoButton, 0);
  objc_storeStrong((id *)&self->_stabilizeProgressView, 0);
  objc_storeStrong((id *)&self->_stabilizeButton, 0);
  objc_storeStrong((id *)&self->_videoLabelView, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_trimController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
}

void __64__PUPhotoEditMediaToolController_apertureToolbarDidStopSliding___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 1344);
  v4 = a2;
  objc_msgSend(v2, "numberWithDouble:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAperture:", v5);

}

uint64_t __60__PUPhotoEditMediaToolController_removeFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "removeFocusDecisionAtTime:", &v3);
}

uint64_t __64__PUPhotoEditMediaToolController_cinematographyWasEditedAtTime___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "cinematographyWasEditedAtTime:", &v3);
}

uint64_t __61__PUPhotoEditMediaToolController__handlePortraitVideoButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "setAlpha:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrackerDisplay:", 1);
}

uint64_t __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

void __64__PUPhotoEditMediaToolController__rateToolbarButtonMenuElements__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPlaybackRate:", *(float *)(a1 + 40));

}

void __58__PUPhotoEditMediaToolController__updateRateToolbarButton__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_rateToolbarButtonMenuElements");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  a2[2](v4, v7);

}

void __51__PUPhotoEditMediaToolController__setPlaybackRate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMTimeRange range;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch epoch;
  CMTimeRange v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  objc_msgSend(v3, "setRate:", *(double *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(v3, "startTime");
    if ((v18 & 0x100000000) != 0)
    {
      objc_msgSend(v3, "endTime");
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  v4 = (void *)MEMORY[0x1E0C8AF90];
  objc_msgSend(*(id *)(a1 + 32), "editSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionAdjustmentsForAsset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  memset(&v15, 0, sizeof(v15));
  if (v8)
    objc_msgSend(v8, "slowMotionTimeRange");
  v13 = *(_OWORD *)&v15.start.value;
  epoch = v15.start.epoch;
  objc_msgSend(v3, "setStartTime:", &v13);
  range = v15;
  CMTimeRangeGetEnd(&v12, &range);
  v10 = v12;
  objc_msgSend(v3, "setEndTime:", &v10);

LABEL_9:
}

uint64_t __59__PUPhotoEditMediaToolController__reportStabilizeProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setProgress:", *(double *)(a1 + 40));
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_2(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportStabilizeProgress:", a2);

}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_4;
  block[3] = &unk_1E58A92B0;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9[1] = a1[7];
  v4 = v3;
  objc_copyWeak(v9, a1 + 6);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v9);

}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "PIVideoStabilizeAdjustmentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_5;
    v8[3] = &unk_1E58A4198;
    v9 = v3;
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateStabilizationInProgress:", 0);

}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyframes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyframes:", v4);

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "stabCropRect");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  objc_msgSend(v3, "setStabCropRect:", v6);
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v3, "setCropFraction:", *(double *)(a1 + 40));
  objc_msgSend(v3, "setAnalysisType:", objc_msgSend(*(id *)(a1 + 32), "analysisType"));

}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v2, "enabled") ^ 1);

}

void __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toggleLivePhotoActive");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isVideoOn");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "livePortraitBehaviorController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "compositionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applySideEffectsForAction:compositionController:", 4, v6);

    }
  }
}

uint64_t __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PUPhotoEditMediaToolController__updateAutoFocusToolbarButton__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAutoFocusButton:", v3);

}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleMuteButton:", v3);

}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePortraitVideoButton:", v3);

}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleLivePhotoButton:", v3);

}

uint64_t __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoOn");

  return v3;
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", 0.0);
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1449));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1449) == 0);
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", 1.0);
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1449));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1449) == 0);
}

void __58__PUPhotoEditMediaToolController__showPrimaryViewIfNeeded__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "primaryView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:animated:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_updateApertureSliderLength");
}

uint64_t __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderDidChange:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:animated:", 0, 1);
}

uint64_t __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "setAlpha:", v1);
}

uint64_t __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

@end
