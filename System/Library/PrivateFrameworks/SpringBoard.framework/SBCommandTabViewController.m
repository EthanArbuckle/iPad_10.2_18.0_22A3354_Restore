@implementation SBCommandTabViewController

+ (BOOL)canActivateWithRecentDisplayItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  char IsActive;
  char v10;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FBSystemAppBundleID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v8 = objc_msgSend(v3, "count");
    IsActive = v8 == 0;
    if (v8 && v7)
      IsActive = SBWorkspaceSpringBoardIsActive();
  }
  else
  {
    IsActive = objc_msgSend(v3, "count") == 0;
  }
  v10 = IsActive ^ 1;

  return v10;
}

- (SBCommandTabViewController)initWithRecentDisplayItems:(id)a3
{
  void *v3;
  id v5;
  SBCommandTabViewController *v6;
  uint64_t v7;
  NSMutableOrderedSet *recentDisplayItems;
  uint64_t v9;
  SBIconController *iconController;
  uint64_t v11;
  SBIconModel *iconModel;
  void *v13;
  int v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  char v19;
  int v20;
  _QWORD *v21;
  uint64_t v22;
  double v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  NSMutableArray *v28;
  NSMutableArray *iconViews;
  void *v30;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBCommandTabViewController;
  v6 = -[SBCommandTabViewController init](&v32, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    recentDisplayItems = v6->_recentDisplayItems;
    v6->_recentDisplayItems = (NSMutableOrderedSet *)v7;

    v6->_selectedIndex = 0;
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    iconController = v6->_iconController;
    v6->_iconController = (SBIconController *)v9;

    -[SBIconController model](v6->_iconController, "model");
    v11 = objc_claimAutoreleasedReturnValue();
    iconModel = v6->_iconModel;
    v6->_iconModel = (SBIconModel *)v11;

    v13 = (void *)(objc_msgSend((id)SBApp, "activeInterfaceOrientation") - 1);
    v14 = __sb__runningInSpringBoard();
    v15 = v14;
    if ((unint64_t)v13 <= 1)
    {
      if (v14)
      {
        if (SBFEffectiveDeviceClass() != 2)
        {
          v16 = (_QWORD *)&unk_1EFC55000;
          v17 = 6;
LABEL_9:
          v16[404] = v17;
LABEL_29:
          v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          iconViews = v6->_iconViews;
          v6->_iconViews = v28;

          v6->_isTouchDown = 0;
          v6->_isIconSelected = 1;
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObserver:selector:name:object:", v6, sel_iconModelDidChange_, SBIconControllerIconModelDidChangeNotification, v6->_iconController);

          goto LABEL_30;
        }
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceIdiom") == 1)
      {
LABEL_11:
        v18 = __sb__runningInSpringBoard();
        v19 = v18;
        if (v18)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v24 = v23 < *(double *)(MEMORY[0x1E0DAB260] + 264);
        v25 = 6;
        v26 = 7;
        goto LABEL_23;
      }
      v21 = (_QWORD *)&unk_1EFC55000;
      v22 = 6;
LABEL_20:
      v21[404] = v22;
LABEL_28:

      goto LABEL_29;
    }
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v16 = &unk_1EFC55000;
        v17 = 8;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceIdiom") != 1)
      {
        v21 = &unk_1EFC55000;
        v22 = 8;
        goto LABEL_20;
      }
    }
    v20 = __sb__runningInSpringBoard();
    v19 = v20;
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v24 = v27 < *(double *)(MEMORY[0x1E0DAB260] + 264);
    v25 = 8;
    v26 = 10;
LABEL_23:
    if (!v24)
      v25 = v26;
    __max_number_of_apps = v25;
    if ((v19 & 1) == 0)

    if ((v15 & 1) != 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_30:

  return v6;
}

- (SBCommandTabViewController)init
{
  void *v3;
  SBCommandTabViewController *v4;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBCommandTabViewController initWithRecentDisplayItems:](self, "initWithRecentDisplayItems:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, SBIconControllerIconModelDidChangeNotification, self->_iconController);

  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabViewController;
  -[SBCommandTabViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *blurredBackgroundView;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  int v18;
  char v19;
  double v20;
  double v21;
  int v22;
  char v23;
  double v24;
  int v25;
  char v26;
  double v27;
  double v28;
  id v29;
  MTShadowView *v30;
  MTShadowView *backgroundShadowView;
  double v32;
  double v33;
  double v34;
  double v35;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  MTMaterialView *v55;
  MTMaterialView *backgroundMaterialView;
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
  UIStackView *v67;
  uint64_t v68;
  UIStackView *stackView;
  UIStackView *v70;
  int v71;
  char v72;
  unint64_t v73;
  int v74;
  char v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  UIPanGestureRecognizer *v84;
  uint64_t v85;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIHoverGestureRecognizer *v87;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  UITapGestureRecognizer *v89;
  UITapGestureRecognizer *tapDismissGestureRecognizer;
  void *v91;
  uint64_t v92;
  int v93;
  int v94;
  double v95;
  int v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  int v105;
  int v106;
  double v107;
  int v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  int v114;
  int v115;
  double v116;
  int v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  UIView *v123;
  UIView *selectionSquareView;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  SBSpringBoardApplicationIcon *v137;
  uint64_t v138;
  SBIconModel *iconModel;
  void *v140;
  void *v141;
  id v142;
  SBCommandTabIconView *v143;
  void *WeakRetained;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  char v150;
  id v151;
  int v152;
  char v153;
  double v154;
  id *v155;
  UILabel *v156;
  UILabel *selectedIconLabel;
  UILabel *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  int v165;
  int v166;
  double v167;
  int v168;
  double v169;
  void *v170;
  void *v171;
  uint64_t v172;
  int v173;
  int v174;
  double v175;
  int v176;
  double v177;
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
  uint64_t v198;
  __int128 v199;
  uint64_t v200;
  objc_super v201;
  _QWORD v202[4];
  _QWORD v203[3];
  _QWORD v204[3];
  _QWORD v205[4];
  const __CFString *v206;
  _QWORD v207[3];

  v207[1] = *MEMORY[0x1E0C80C00];
  v201.receiver = self;
  v201.super_class = (Class)SBCommandTabViewController;
  -[SBCommandTabViewController viewDidLoad](&v201, sel_viewDidLoad);
  -[SBCommandTabViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setAlpha:", 0.0);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  blurredBackgroundView = self->_blurredBackgroundView;
  self->_blurredBackgroundView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurredBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v190 = v4;
  objc_msgSend(v4, "addSubview:", self->_blurredBackgroundView);
  v9 = objc_alloc_init(MEMORY[0x1E0DAA5E8]);
  -[SBCommandTabViewController _configureGridLayoutConfiguration:](self, "_configureGridLayoutConfiguration:", v9);
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA5E0]), "initWithLayoutConfiguration:", v9);
  v11 = objc_alloc(MEMORY[0x1E0DAA430]);
  v206 = CFSTR("SBIconLocationCommandTab");
  v207[0] = v10;
  v186 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v207, &v206, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = (void *)objc_msgSend(v11, "initWithListLayouts:", v12);

  v187 = v9;
  objc_msgSend(v9, "iconImageInfo");
  v15 = v14 / v13;
  v16 = __sb__runningInSpringBoard();
  if ((_DWORD)v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v17 = v15 * 155.0;
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom") != 1)
    {
      v17 = v15 * 155.0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v20 < *(double *)(MEMORY[0x1E0DAB260] + 264))
    v21 = 155.0;
  else
    v21 = 169.5;
  v17 = v15 * v21;
  if ((v19 & 1) == 0)

  if ((v16 & 1) == 0)
    goto LABEL_15;
LABEL_16:
  v22 = __sb__runningInSpringBoard();
  v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v24 = v15 * 106.0;
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v16 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v16, "userInterfaceIdiom") != 1)
    {
      v24 = v15 * 106.0;
LABEL_30:

      goto LABEL_31;
    }
  }
  v25 = __sb__runningInSpringBoard();
  v26 = v25;
  if (v25)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v27 < *(double *)(MEMORY[0x1E0DAB260] + 264))
    v28 = 106.0;
  else
    v28 = 119.5;
  v24 = v15 * v28;
  if ((v26 & 1) == 0)

  if ((v23 & 1) == 0)
    goto LABEL_30;
LABEL_31:
  v29 = objc_alloc(MEMORY[0x1E0D474A0]);
  v198 = 1061158912;
  v199 = *MEMORY[0x1E0C9D820];
  v200 = 0x4036800000000000;
  v30 = (MTShadowView *)objc_msgSend(v29, "initWithShadowAttributes:maskCornerRadius:", &v198, v17);
  backgroundShadowView = self->_backgroundShadowView;
  self->_backgroundShadowView = v30;

  -[MTShadowView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_blurredBackgroundView, "addSubview:", self->_backgroundShadowView);
  -[MTShadowView shadowOutsets](self->_backgroundShadowView, "shadowOutsets");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v179 = (void *)MEMORY[0x1E0CB3718];
  -[MTShadowView leadingAnchor](self->_backgroundShadowView, "leadingAnchor");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_blurredBackgroundView, "leadingAnchor");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "constraintEqualToAnchor:constant:", v191, -v35);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = v188;
  -[MTShadowView trailingAnchor](self->_backgroundShadowView, "trailingAnchor");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_blurredBackgroundView, "trailingAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "constraintEqualToAnchor:constant:", v181, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v205[1] = v40;
  -[MTShadowView topAnchor](self->_backgroundShadowView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_blurredBackgroundView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, -v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v205[2] = v43;
  -[MTShadowView bottomAnchor](self->_backgroundShadowView, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_blurredBackgroundView, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, v37);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v205[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "activateConstraints:", v47);

  v48 = (void *)MEMORY[0x1E0D47498];
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v49;
  v204[0] = CFSTR("cmdTabLight");
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v203[1] = v50;
  v204[1] = CFSTR("cmdTabLight");
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v203[2] = v51;
  v204[2] = CFSTR("cmdTabDark");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v204, v203, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCommandTabViewController traitCollection](self, "traitCollection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v52, v53, 0, 0, v54, 1.0);
  v55 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v55;

  -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundMaterialView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:", v17);
  -[UIView addSubview:](self->_blurredBackgroundView, "addSubview:", self->_backgroundMaterialView);
  -[UIView _setContinuousCornerRadius:](self->_blurredBackgroundView, "_setContinuousCornerRadius:", v17);
  -[UIView layer](self->_blurredBackgroundView, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAllowsGroupBlending:", 0);

  -[UIView layer](self->_blurredBackgroundView, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setBorderWidth:", 0.3);

  v180 = (void *)MEMORY[0x1E0CB3718];
  -[MTMaterialView leadingAnchor](self->_backgroundMaterialView, "leadingAnchor");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_blurredBackgroundView, "leadingAnchor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "constraintEqualToAnchor:", v192);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v202[0] = v189;
  -[MTMaterialView trailingAnchor](self->_backgroundMaterialView, "trailingAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_blurredBackgroundView, "trailingAnchor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "constraintEqualToAnchor:", v182);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v202[1] = v59;
  -[MTMaterialView topAnchor](self->_backgroundMaterialView, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_blurredBackgroundView, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v202[2] = v62;
  -[MTMaterialView bottomAnchor](self->_backgroundMaterialView, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_blurredBackgroundView, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v202[3] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "activateConstraints:", v66);

  v67 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  v68 = 1080;
  stackView = self->_stackView;
  self->_stackView = v67;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v70 = self->_stackView;
  v71 = __sb__runningInSpringBoard();
  v72 = v71;
  if (v71)
  {
    v73 = 0x1E0CEA000;
    if (SBFEffectiveDeviceClass() != 2)
    {
      -[UIStackView setSpacing:](v70, "setSpacing:", 30.0);
      goto LABEL_46;
    }
  }
  else
  {
    v73 = 0x1E0CEA000uLL;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v68 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v68, "userInterfaceIdiom") != 1)
    {
      -[UIStackView setSpacing:](v70, "setSpacing:", 30.0);
LABEL_45:

      goto LABEL_46;
    }
  }
  v74 = __sb__runningInSpringBoard();
  v75 = v74;
  if (v74)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v76 < *(double *)(MEMORY[0x1E0DAB260] + 264))
    v77 = 30.0;
  else
    v77 = 36.0;
  -[UIStackView setSpacing:](v70, "setSpacing:", v77);
  if ((v75 & 1) == 0)

  if ((v72 & 1) == 0)
    goto LABEL_45;
LABEL_46:
  -[UIView addSubview:](self->_blurredBackgroundView, "addSubview:", self->_stackView);
  -[UIStackView centerXAnchor](self->_stackView, "centerXAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_blurredBackgroundView, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setActive:", 1);

  -[UIStackView centerYAnchor](self->_stackView, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_blurredBackgroundView, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setActive:", 1);

  v84 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handleUIGesture_);
  v85 = 1096;
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v84;

  -[UIStackView addGestureRecognizer:](self->_stackView, "addGestureRecognizer:", self->_panGestureRecognizer);
  v87 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel__handleUIGesture_);
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = v87;

  -[UIStackView addGestureRecognizer:](self->_stackView, "addGestureRecognizer:", self->_hoverGestureRecognizer);
  v89 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapDismissGesture_);
  tapDismissGestureRecognizer = self->_tapDismissGestureRecognizer;
  self->_tapDismissGestureRecognizer = v89;

  objc_msgSend(v190, "addGestureRecognizer:", self->_tapDismissGestureRecognizer);
  -[UIView heightAnchor](self->_blurredBackgroundView, "heightAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = __sb__runningInSpringBoard();
  if ((_DWORD)v92)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v93 = 0;
      v94 = 0;
      v95 = 155.0;
      goto LABEL_56;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v73 + 1288), "currentDevice");
    v85 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v85, "userInterfaceIdiom") != 1)
    {
      v93 = 0;
      v94 = 1;
      v95 = 155.0;
      goto LABEL_56;
    }
  }
  v94 = v92 ^ 1;
  v96 = __sb__runningInSpringBoard();
  if (v96)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v92 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v92, "_referenceBounds");
  }
  v93 = v96 ^ 1;
  BSSizeRoundForScale();
  v95 = 155.0;
  if (v97 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    v95 = 169.5;
LABEL_56:
  objc_msgSend(v91, "constraintEqualToConstant:", v95);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setActive:", 1);

  if (v93)
  if (v94)

  -[UIView centerYAnchor](self->_blurredBackgroundView, "centerYAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "centerYAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setActive:", 1);

  -[UIView leadingAnchor](self->_blurredBackgroundView, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = __sb__runningInSpringBoard();
  if ((_DWORD)v104)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v105 = 0;
      v106 = 0;
      v107 = 39.5;
      goto LABEL_70;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v73 + 1288), "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom") != 1)
    {
      v105 = 0;
      v106 = 1;
      v107 = 39.5;
      goto LABEL_70;
    }
  }
  v106 = v104 ^ 1;
  v108 = __sb__runningInSpringBoard();
  if (v108)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v104 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v104, "_referenceBounds");
  }
  v105 = v108 ^ 1;
  BSSizeRoundForScale();
  v107 = 39.5;
  if (v109 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    v107 = 43.0;
LABEL_70:
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, -v107);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setActive:", 1);

  if (v105)
  if (v106)

  -[UIView trailingAnchor](self->_blurredBackgroundView, "trailingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = __sb__runningInSpringBoard();
  if (!(_DWORD)v113)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom") != 1)
    {
      v114 = 0;
      v115 = 1;
      v116 = 39.5;
      goto LABEL_84;
    }
LABEL_78:
    v115 = v113 ^ 1;
    v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v113, "_referenceBounds");
    }
    v114 = v117 ^ 1;
    BSSizeRoundForScale();
    v116 = 39.5;
    if (v118 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
      v116 = 43.0;
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_78;
  v114 = 0;
  v115 = 0;
  v116 = 39.5;
LABEL_84:
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, v116);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setActive:", 1);

  if (v114)
  if (v115)

  -[UIView centerXAnchor](self->_blurredBackgroundView, "centerXAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "centerXAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setActive:", 1);

  v123 = (UIView *)objc_opt_new();
  selectionSquareView = self->_selectionSquareView;
  self->_selectionSquareView = v123;

  -[UIView _setContinuousCornerRadius:](self->_selectionSquareView, "_setContinuousCornerRadius:", v24);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionSquareView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addSubview:](self->_stackView, "addSubview:", self->_selectionSquareView);
  v125 = __max_number_of_apps;
  v126 = -[NSMutableOrderedSet count](self->_recentDisplayItems, "count");
  if (v125 >= v126)
    v127 = v126;
  else
    v127 = v125;
  v128 = -[NSMutableOrderedSet indexOfObjectPassingTest:](self->_recentDisplayItems, "indexOfObjectPassingTest:", &__block_literal_global_315);
  if (v128 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_recentDisplayItems, "objectAtIndex:", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObject:](self->_recentDisplayItems, "removeObject:", v129);
    if ((SBWorkspaceSpringBoardIsActive() & 1) != 0)
      --v127;
    else
      -[NSMutableOrderedSet insertObject:atIndex:](self->_recentDisplayItems, "insertObject:atIndex:", v129, v127 - 1);

  }
  -[SBIconController iconManager](self->_iconController, "iconManager");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "iconImageCache");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCommandTabViewController traitCollection](self, "traitCollection");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "userInterfaceStyle");

  if (!v127)
    goto LABEL_114;
  v132 = 0;
  v195 = 0;
  do
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_recentDisplayItems, "objectAtIndex:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "bundleIdentifier");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    FBSystemAppBundleID();
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v134, "isEqualToString:", v135);

    if (v136)
    {
      v137 = -[SBSpringBoardApplicationIcon initWithInterfaceStyle:]([SBSpringBoardApplicationIcon alloc], "initWithInterfaceStyle:", v131);
    }
    else
    {
      v138 = objc_msgSend(v133, "type");
      iconModel = self->_iconModel;
      if (v138 == 5)
      {
        objc_msgSend(v133, "webClipIdentifier");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconModel expectedIconForDisplayIdentifier:](iconModel, "expectedIconForDisplayIdentifier:", v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();

        if (v141)
          goto LABEL_107;
        goto LABEL_102;
      }
      -[SBHIconModel expectedIconForDisplayIdentifier:](self->_iconModel, "expectedIconForDisplayIdentifier:", v134);
      v137 = (SBSpringBoardApplicationIcon *)objc_claimAutoreleasedReturnValue();
    }
    v141 = v137;
    if (v137)
    {
LABEL_107:
      v143 = -[SBCommandTabIconView initWithConfigurationOptions:]([SBCommandTabIconView alloc], "initWithConfigurationOptions:", 2);
      -[SBCommandTabIconView setLocation:](v143, "setLocation:", CFSTR("SBIconLocationCommandTab"));
      -[SBCommandTabIconView setDelegate:](v143, "setDelegate:", self);
      -[SBCommandTabIconView setIconImageCache:](v143, "setIconImageCache:", v193);
      -[SBCommandTabIconView setListLayoutProvider:](v143, "setListLayoutProvider:", v194);
      -[SBCommandTabIconView setIcon:](v143, "setIcon:", v141);
      -[SBCommandTabIconView setTranslatesAutoresizingMaskIntoConstraints:](v143, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSMutableArray addObject:](self->_iconViews, "addObject:", v143);
      -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v143);
      if (v136)
        objc_storeStrong((id *)&self->_homeIconView, v143);

      goto LABEL_110;
    }
LABEL_102:
    v142 = v195;
    if (!v195)
      v142 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v195 = v142;
    objc_msgSend(v142, "addIndex:", v132);
LABEL_110:

    ++v132;
  }
  while (v127 != v132);
  if (!v195)
  {
LABEL_114:
    v195 = 0;
    goto LABEL_115;
  }
  -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_recentDisplayItems, "removeObjectsAtIndexes:");
  if (!-[NSMutableOrderedSet count](self->_recentDisplayItems, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "viewControllerWantsDismissal:", self);
    goto LABEL_157;
  }
LABEL_115:
  v145 = (void *)MEMORY[0x1E0CEAB40];
  -[SBCommandTabViewController traitCollection](self, "traitCollection");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "preferredContentSizeCategory");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryClip();
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "traitCollectionWithPreferredContentSizeCategory:", v148);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  v149 = __sb__runningInSpringBoard();
  v150 = v149;
  if (v149)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v151 = (id)*MEMORY[0x1E0CEB548];
      goto LABEL_130;
    }
LABEL_119:
    v152 = __sb__runningInSpringBoard();
    v153 = v152;
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
      v155 = (id *)MEMORY[0x1E0CEB558];
    else
      v155 = (id *)MEMORY[0x1E0CEB548];
    v151 = *v155;
    if ((v153 & 1) == 0)

    if ((v150 & 1) == 0)
      goto LABEL_129;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v145, "userInterfaceIdiom") == 1)
      goto LABEL_119;
    v151 = (id)*MEMORY[0x1E0CEB548];
LABEL_129:

  }
LABEL_130:
  v156 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  selectedIconLabel = self->_selectedIconLabel;
  self->_selectedIconLabel = v156;

  v158 = self->_selectedIconLabel;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", v151, WeakRetained);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v158, "setFont:", v159);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_selectedIconLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addSubview:](self->_stackView, "addSubview:", self->_selectedIconLabel);
  -[UIView centerYAnchor](self->_selectionSquareView, "centerYAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView centerYAnchor](self->_stackView, "centerYAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:", v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setActive:", 1);

  -[UIView heightAnchor](self->_selectionSquareView, "heightAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = __sb__runningInSpringBoard();
  if ((_DWORD)v164)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v165 = 0;
      v166 = 0;
      v167 = 106.0;
      goto LABEL_139;
    }
LABEL_134:
    v165 = v164 ^ 1;
    v168 = __sb__runningInSpringBoard();
    if (v168)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v164 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v164, "_referenceBounds");
    }
    v166 = v168 ^ 1;
    BSSizeRoundForScale();
    v167 = dbl_1D0E8B480[v169 >= *(double *)(MEMORY[0x1E0DAB260] + 264)];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v161, "userInterfaceIdiom") == 1)
      goto LABEL_134;
    v166 = 0;
    v165 = 1;
    v167 = 106.0;
  }
LABEL_139:
  objc_msgSend(v163, "constraintEqualToConstant:", v167);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setActive:", 1);

  if (v166)
  if (v165)

  -[UIView widthAnchor](self->_selectionSquareView, "widthAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = __sb__runningInSpringBoard();
  if (!(_DWORD)v172)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v161, "userInterfaceIdiom") != 1)
    {
      v174 = 0;
      v173 = 1;
      v175 = 106.0;
      goto LABEL_152;
    }
LABEL_147:
    v173 = v172 ^ 1;
    v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v172 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v172, "_referenceBounds");
    }
    v174 = v176 ^ 1;
    BSSizeRoundForScale();
    v175 = dbl_1D0E8B480[v177 >= *(double *)(MEMORY[0x1E0DAB260] + 264)];
    goto LABEL_152;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_147;
  v173 = 0;
  v174 = 0;
  v175 = 106.0;
LABEL_152:
  objc_msgSend(v171, "constraintEqualToConstant:", v175);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setActive:", 1);

  if (v174)
  if (v173)

  -[SBCommandTabViewController _updateForUserInterfaceStyle](self, "_updateForUserInterfaceStyle");
  -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:", self->_selectedIndex);

LABEL_157:
}

uint64_t __41__SBCommandTabViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSystemAppBundleID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)showCommandTabBar
{
  id v2;

  -[SBCommandTabViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)next
{
  unint64_t selectedIndex;
  unint64_t v4;

  selectedIndex = self->_selectedIndex;
  if (selectedIndex == -[NSMutableArray count](self->_iconViews, "count") - 1)
    v4 = 0;
  else
    v4 = self->_selectedIndex + 1;
  self->_selectedIndex = v4;
  -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
}

- (void)previous
{
  uint64_t v3;
  unint64_t selectedIndex;

  v3 = -[NSMutableArray count](self->_iconViews, "count");
  if (v3 != 1)
  {
    selectedIndex = self->_selectedIndex;
    if (!selectedIndex)
      selectedIndex = v3;
    self->_selectedIndex = selectedIndex - 1;
    -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
  }
}

- (id)selectedApplicationDisplayItem
{
  void *v2;

  if (self->_isIconSelected)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_recentDisplayItems, "objectAtIndex:", self->_selectedIndex);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)removeDisplayItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t selectedIndex;
  uint64_t v8;
  unint64_t v9;
  id WeakRetained;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    v5 = -[SBCommandTabViewController indexOfDisplayItem:](self, "indexOfDisplayItem:", v4);
    v4 = v11;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");
      -[NSMutableArray removeObject:](self->_iconViews, "removeObject:", v6);
      selectedIndex = self->_selectedIndex;
      v8 = -[NSMutableArray count](self->_iconViews, "count");
      if (selectedIndex >= v8 - 1)
        v9 = v8 - 1;
      else
        v9 = selectedIndex;
      self->_selectedIndex = v9;
      -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:");
      -[NSMutableOrderedSet removeObject:](self->_recentDisplayItems, "removeObject:", v11);
      if (!-[NSMutableOrderedSet count](self->_recentDisplayItems, "count")
        || !-[NSMutableArray count](self->_iconViews, "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "viewControllerWantsDismissal:", self);

      }
      v4 = v11;
    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)iconModelDidChange:(id)a3
{
  SBIconModel *v4;
  SBIconModel *iconModel;

  -[SBIconController model](self->_iconController, "model", a3);
  v4 = (SBIconModel *)objc_claimAutoreleasedReturnValue();
  iconModel = self->_iconModel;
  self->_iconModel = v4;

}

- (void)iconTouchBegan:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray count](self->_iconViews, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        self->_selectedIndex = v4;
        -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:", v4);
      }

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_iconViews, "count"));
  }

}

- (void)icon:(id)a3 touchEnded:(BOOL)a4
{
  void *v5;
  id WeakRetained;

  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SBCommandTabViewController selectedApplicationDisplayItem](self, "selectedApplicationDisplayItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "viewController:selectedApplicationWithDisplayItem:", self, v5);

  }
}

- (void)iconTapped:(id)a3
{
  unint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a3;
  if (-[NSMutableArray count](self->_iconViews, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v8))
      {
        self->_selectedIndex = v4;
        -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:", v4);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[SBCommandTabViewController selectedApplicationDisplayItem](self, "selectedApplicationDisplayItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "viewController:selectedApplicationWithDisplayItem:", self, v7);

      }
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_iconViews, "count"));
  }

}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  SBIconController *iconController;
  void *v4;

  iconController = self->_iconController;
  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(iconController) = -[SBIconController allowsBadgingForIcon:](iconController, "allowsBadgingForIcon:", v4);

  return (char)iconController;
}

- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3
{
  SBIconView *v5;
  SBIconView *selectedIconView;
  id v7;

  if (-[NSMutableArray count](self->_iconViews, "count") > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", a3);
    v5 = (SBIconView *)objc_claimAutoreleasedReturnValue();
    selectedIconView = self->_selectedIconView;
    self->_selectedIconView = v5;

    -[UIView setAlpha:](self->_selectionSquareView, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_selectedIconLabel, "setAlpha:", 1.0);
    self->_isIconSelected = 1;
    -[SBCommandTabViewController _updateIconSelectionPositionAndLabelText](self, "_updateIconSelectionPositionAndLabelText");
    -[SBCommandTabViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsDisplay");

  }
}

- (void)_updateIconSelectionPositionAndLabelText
{
  NSLayoutConstraint *v3;
  NSLayoutConstraint *selectionXLayoutConstraint;
  UILabel *selectedIconLabel;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *selectedLabelXConstraint;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *selectedLabelBottomConstraint;

  -[UIStackView removeConstraint:](self->_stackView, "removeConstraint:", self->_selectionXLayoutConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectionSquareView, 9, 0, self->_selectedIconView, 9, 1.0, 0.0);
  v3 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  selectionXLayoutConstraint = self->_selectionXLayoutConstraint;
  self->_selectionXLayoutConstraint = v3;

  -[UIStackView addConstraint:](self->_stackView, "addConstraint:", self->_selectionXLayoutConstraint);
  selectedIconLabel = self->_selectedIconLabel;
  -[SBIconView icon](self->_selectedIconView, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](selectedIconLabel, "setText:", v7);

  -[UILabel sizeToFit](self->_selectedIconLabel, "sizeToFit");
  -[UIStackView removeConstraint:](self->_stackView, "removeConstraint:", self->_selectedLabelXConstraint);
  -[UIStackView removeConstraint:](self->_stackView, "removeConstraint:", self->_selectedLabelBottomConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectedIconLabel, 9, 0, self->_selectionSquareView, 9, 1.0, 0.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  selectedLabelXConstraint = self->_selectedLabelXConstraint;
  self->_selectedLabelXConstraint = v8;

  -[UIStackView addConstraint:](self->_stackView, "addConstraint:", self->_selectedLabelXConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectedIconLabel, 12, 0, self->_blurredBackgroundView, 4, 1.0, -8.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  selectedLabelBottomConstraint = self->_selectedLabelBottomConstraint;
  self->_selectedLabelBottomConstraint = v10;

  -[UIView addConstraint:](self->_blurredBackgroundView, "addConstraint:", self->_selectedLabelBottomConstraint);
}

- (unint64_t)indexOfDisplayItem:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_recentDisplayItems, "indexOfObject:", a3);
}

- (void)_handleUIGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  UIHoverGestureRecognizer *v18;
  CGPoint v19;
  CGPoint v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v18 = (UIHoverGestureRecognizer *)a3;
  self->_isTouchDown = 1;
  -[UIStackView superview](self->_stackView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIHoverGestureRecognizer locationInView:](v18, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (self->_hoverGestureRecognizer == v18)
  {
    if (v6 == self->_lastHoverLocation.x && v8 == self->_lastHoverLocation.y)
      goto LABEL_15;
    self->_lastHoverLocation.x = v6;
    self->_lastHoverLocation.y = v8;
  }
  -[UIStackView frame](self->_stackView, "frame");
  v19.x = v6;
  v19.y = v8;
  if (CGRectContainsPoint(v22, v19))
  {
    if (-[NSMutableArray count](self->_iconViews, "count"))
    {
      v10 = 0;
      while (1)
      {
        -[UIHoverGestureRecognizer locationInView:](v18, "locationInView:", self->_stackView);
        v12 = v11;
        v14 = v13;
        -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v20.x = v12;
        v20.y = v14;
        if (CGRectContainsPoint(v23, v20))
          break;

        if (++v10 >= -[NSMutableArray count](self->_iconViews, "count"))
          goto LABEL_15;
      }
      self->_selectedIndex = v10;
      -[SBCommandTabViewController _moveSelectionSquareToIconAtIndex:](self, "_moveSelectionSquareToIconAtIndex:", v10);

    }
  }
  else
  {
    -[UIView setAlpha:](self->_selectionSquareView, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_selectedIconLabel, "setAlpha:", 0.0);
    self->_isIconSelected = 0;
  }
LABEL_15:
  if (-[UIHoverGestureRecognizer state](v18, "state") == 3)
  {
    self->_isTouchDown = 0;
    -[SBCommandTabViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView frame](self->_stackView, "frame");
    v21.x = v6;
    v21.y = v8;
    if (CGRectContainsPoint(v24, v21) && self->_isIconSelected)
    {
      -[SBCommandTabViewController selectedApplicationDisplayItem](self, "selectedApplicationDisplayItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewController:selectedApplicationWithDisplayItem:", self, v17);

    }
  }

}

- (void)_handleTapDismissGesture:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[SBCommandTabViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerWantsDismissal:", self);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCommandTabViewController;
  v4 = a3;
  -[SBCommandTabViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[SBCommandTabViewController traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[SBCommandTabViewController _updateForUserInterfaceStyle](self, "_updateForUserInterfaceStyle");
}

- (void)_updateForUserInterfaceStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  id v8;
  UIView *selectionSquareView;
  void *v10;
  void *v11;
  UILabel *selectedIconLabel;
  void *v13;
  void *v14;
  SBSpringBoardApplicationIcon *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[SBCommandTabViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  -[UIView layer](self->_blurredBackgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v4 == 2)
  {
    v6 = 1.0;
    v7 = 2;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v6, 0.08);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  selectionSquareView = self->_selectionSquareView;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedColorWithTraitCollection:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](selectionSquareView, "setBackgroundColor:", v11);

  -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_selectionSquareView, "_setDrawsAsBackdropOverlayWithBlendMode:", v7);
  selectedIconLabel = self->_selectedIconLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolvedColorWithTraitCollection:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](selectedIconLabel, "setTextColor:", v14);

  -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_selectedIconLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", v7);
  v15 = -[SBSpringBoardApplicationIcon initWithInterfaceStyle:]([SBSpringBoardApplicationIcon alloc], "initWithInterfaceStyle:", v4);
  -[SBIconView iconImageCache](self->_homeIconView, "iconImageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "purgeCachedImagesForIcons:", v17);

  -[SBIconView setIcon:](self->_homeIconView, "setIcon:", v15);
}

- (void)_configureGridLayoutConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "iconAccessoryVisualConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0DAA438], "currentDeviceScreenType");
  v6 = 16.0;
  if (v5 > 0x2F)
  {
LABEL_8:
    v7 = 11.0;
    v8 = 26.0;
    v9 = 0x404E000000000000;
    goto LABEL_4;
  }
  if (((1 << v5) & 0x5AFDE0000000) == 0)
  {
    if (((1 << v5) & 0xA50200000000) != 0)
    {
      v7 = 12.0;
      v8 = 27.0;
      v10 = 83.5;
      v6 = 18.5;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  v7 = 11.0;
  v8 = 26.0;
  v9 = 0x4053000000000000;
LABEL_4:
  v10 = *(double *)&v9;
LABEL_7:
  objc_msgSend(v12, "setFontSize:", v6);
  objc_msgSend(v12, "setSize:", v8, v8);
  objc_msgSend(v12, "setOffset:", v7, v7);
  -[SBCommandTabViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  MEMORY[0x1D17E3B70](v10);
  SBIconImageInfoMake();
  objc_msgSend(v4, "setIconImageInfo:");

}

- (SBCommandTabViewControllerDelegate)delegate
{
  return (SBCommandTabViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_homeIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_selectedLabelXConstraint, 0);
  objc_storeStrong((id *)&self->_selectionXLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_selectedIconLabel, 0);
  objc_storeStrong((id *)&self->_selectedIconView, 0);
  objc_storeStrong((id *)&self->_selectionSquareView, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_backgroundShadowView, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_recentDisplayItems, 0);
}

@end
