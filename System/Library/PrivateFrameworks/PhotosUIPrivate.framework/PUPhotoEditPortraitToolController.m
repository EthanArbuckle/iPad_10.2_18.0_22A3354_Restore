@implementation PUPhotoEditPortraitToolController

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController setupWithAsset:compositionController:editSource:valuesCalculator:](&v7, sel_setupWithAsset_compositionController_editSource_valuesCalculator_, a3, a4, a5, a6);
  -[PUPhotoEditPortraitToolController setToolSelection:](self, "setToolSelection:", -[PUPhotoEditPortraitToolController _defaultPortraitTool](self, "_defaultPortraitTool"));
  -[PUPhotoEditPortraitToolController _refreshFromValuesCalculator](self, "_refreshFromValuesCalculator");
  -[PUPhotoEditPortraitToolController _updateApertureSliderLength](self, "_updateApertureSliderLength");
  -[PUPhotoEditPortraitToolController _updateToolVisibilityAnimated:](self, "_updateToolVisibilityAnimated:", 0);
}

- (void)viewDidLoad
{
  UIView *v3;
  UIView *lightingContainer;
  void *v5;
  UIView *v6;
  UIView *apertureContainer;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditPortraitToolController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  lightingContainer = self->_lightingContainer;
  self->_lightingContainer = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightingContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_lightingContainer);

  v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  apertureContainer = self->_apertureContainer;
  self->_apertureContainer = v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_apertureContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_apertureContainer);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[PUPhotoEditPortraitToolController _updateFocusOverlay](self, "_updateFocusOverlay");
  -[PUPhotoEditToolController asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLivePhoto");

  if ((v5 & 1) == 0)
  {
    v6 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_longPressed_);
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = v6;

    -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "depthAdjustmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer setEnabled:](self->_longPressGestureRecognizer, "setEnabled:", objc_msgSend(v9, "enabled"));
    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", self->_longPressGestureRecognizer);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditPortraitToolController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[PUPhotoEditPortraitToolController _removeFocusOverlayIfNeeded](self, "_removeFocusOverlayIfNeeded");
  -[UILongPressGestureRecognizer view](self->_longPressGestureRecognizer, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_longPressGestureRecognizer);

  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = 0;

}

- (void)_updateToolContainerConstraints
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *containerConstraints;
  void *v6;
  uint64_t v7;
  UIView *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  NSMutableArray *v29;
  void *v30;
  uint64_t v31;
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
  int64_t v42;
  BOOL v43;
  double v44;
  UIView *lightingContainer;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIView *v53;
  UIView *apertureContainer;
  CEKLightingNameBadge *lightingNameBadge;
  void *v56;
  NSArray *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSArray *lightingNameBadgeConstraints;
  NSMutableArray *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSMutableArray *v73;
  void *v74;
  void *v75;
  NSMutableArray *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _OWORD v87[3];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  _OWORD v93[3];
  _QWORD v94[4];
  _QWORD v95[4];
  _QWORD v96[2];
  _QWORD v97[5];

  v97[3] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_containerConstraints && self->_lightingContainer)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    containerConstraints = self->_containerConstraints;
    self->_containerConstraints = v4;

    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentLayoutStyle");

    v86 = v3;
    if (-[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation") != 1 || v7 == 4)
    {
      v82 = v7;
      v18 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      -[PUPhotoEditPortraitToolController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addLayoutGuide:", v18);

      v20 = self->_containerConstraints;
      objc_msgSend(v18, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "heightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v23;
      objc_msgSend(v18, "centerYAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v27);

      v28 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      v29 = self->_containerConstraints;
      if (v28 == 2 || v82 == 4)
      {
        objc_msgSend(v18, "rightAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "rightAnchor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v18, "leftAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "leftAnchor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v32 = (void *)v31;
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v29, "addObject:", v33);

      v68 = self->_containerConstraints;
      -[UIView centerXAnchor](self->_lightingContainer, "centerXAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "centerXAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToAnchor:", v74);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = v72;
      -[UIView centerYAnchor](self->_lightingContainer, "centerYAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "centerYAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v69);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v95[1] = v34;
      -[UIView widthAnchor](self->_lightingContainer, "widthAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "heightAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v95[2] = v37;
      -[UIView heightAnchor](self->_lightingContainer, "heightAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v18;
      objc_msgSend(v18, "widthAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v95[3] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v68, "addObjectsFromArray:", v41);

      v42 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      v43 = v82 == 4 || v42 == 2;
      v44 = 1.57079633;
      if (v43)
        v44 = -1.57079633;
      CGAffineTransformMakeRotation(&v92, v44);
      lightingContainer = self->_lightingContainer;
      v91 = v92;
      -[UIView setTransform:](lightingContainer, "setTransform:", &v91);
    }
    else
    {
      v8 = self->_lightingContainer;
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v93[0] = *MEMORY[0x1E0C9BAA8];
      v93[1] = v9;
      v93[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v8, "setTransform:", v93);
      v76 = self->_containerConstraints;
      objc_msgSend(v3, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_lightingContainer, "widthAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v10;
      objc_msgSend(v10, "constraintEqualToAnchor:", v81);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v79;
      objc_msgSend(v3, "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_lightingContainer, "centerXAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v13;
      objc_msgSend(v3, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_lightingContainer, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v97[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v76, "addObjectsFromArray:", v17);

    }
    v73 = self->_containerConstraints;
    -[UIView topAnchor](self->_lightingContainer, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_apertureContainer, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v83);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v80;
    -[UIView bottomAnchor](self->_lightingContainer, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_apertureContainer, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v75);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v71;
    -[UIView leftAnchor](self->_lightingContainer, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_apertureContainer, "leftAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v48;
    -[UIView rightAnchor](self->_lightingContainer, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_apertureContainer, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v73, "addObjectsFromArray:", v52);

    v53 = self->_lightingContainer;
    if (v53)
    {
      -[UIView transform](v53, "transform");
    }
    else
    {
      v89 = 0u;
      v90 = 0u;
      v88 = 0u;
    }
    v3 = v86;
    apertureContainer = self->_apertureContainer;
    v87[0] = v88;
    v87[1] = v89;
    v87[2] = v90;
    -[UIView setTransform:](apertureContainer, "setTransform:", v87);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_containerConstraints);
  }
  lightingNameBadge = self->_lightingNameBadge;
  if (lightingNameBadge)
  {
    if (!self->_lightingNameBadgeConstraints)
    {
      -[CEKLightingNameBadge window](lightingNameBadge, "window");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v57 = (NSArray *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolController delegate](self, "delegate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "mediaView");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "_scrollView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        -[CEKLightingNameBadge bottomAnchor](self->_lightingNameBadge, "bottomAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "bottomAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, -10.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v57, "addObject:", v63);

        -[CEKLightingNameBadge centerXAnchor](self->_lightingNameBadge, "centerXAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "centerXAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v57, "addObject:", v66);

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v57);
        lightingNameBadgeConstraints = self->_lightingNameBadgeConstraints;
        self->_lightingNameBadgeConstraints = v57;

      }
    }
  }

}

- (void)_updateToolConstraints
{
  NSMutableArray *v3;
  NSMutableArray *toolConstraints;
  CEKLightingControl *lightingControl;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  UIView *lightingContainer;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PUPhotoEditApertureToolbar *apertureToolbar;
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
  uint64_t v38;
  NSMutableArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableArray *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[5];
  _QWORD v55[6];

  v55[4] = *MEMORY[0x1E0C80C00];
  if (!self->_toolConstraints)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = v3;

    lightingControl = self->_lightingControl;
    if (lightingControl)
    {
      v39 = self->_toolConstraints;
      -[CEKLightingControl heightAnchor](lightingControl, "heightAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToConstant:", 140.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v46;
      -[UIView widthAnchor](self->_lightingContainer, "widthAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl widthAnchor](self->_lightingControl, "widthAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v37;
      -[UIView centerXAnchor](self->_lightingContainer, "centerXAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl centerXAnchor](self->_lightingControl, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v8;
      -[UIView topAnchor](self->_lightingContainer, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKLightingControl topAnchor](self->_lightingControl, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v55[3] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v39, "addObjectsFromArray:", v12);

      v13 = self->_toolConstraints;
      lightingContainer = self->_lightingContainer;
      if (self->_lightingSlider)
      {
        -[UIView widthAnchor](lightingContainer, "widthAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider widthAnchor](self->_lightingSlider, "widthAnchor");
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "constraintEqualToAnchor:", v38);
        v44 = objc_claimAutoreleasedReturnValue();
        v54[0] = v44;
        -[UIView centerXAnchor](self->_lightingContainer, "centerXAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider centerXAnchor](self->_lightingSlider, "centerXAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v47);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v40;
        -[UIView bottomAnchor](self->_lightingContainer, "bottomAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider bottomAnchor](self->_lightingSlider, "bottomAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToAnchor:", v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v54[2] = v15;
        -[CEKLightingControl bottomAnchor](self->_lightingControl, "bottomAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider topAnchor](self->_lightingSlider, "topAnchor");
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 10.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v54[3] = v19;
        -[CEKSlider heightAnchor](self->_lightingSlider, "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToConstant:", 66.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v54[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", v22);

        v23 = (void *)v38;
        v24 = v42;

        v25 = (void *)v44;
      }
      else
      {
        -[UIView bottomAnchor](lightingContainer, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKLightingControl bottomAnchor](self->_lightingControl, "bottomAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 66.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v13, "addObject:", v25);
      }

    }
    apertureToolbar = self->_apertureToolbar;
    if (apertureToolbar)
    {
      -[PUPhotoEditApertureToolbar view](apertureToolbar, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = self->_toolConstraints;
      -[UIView widthAnchor](self->_apertureContainer, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "widthAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v51);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v48;
      -[UIView centerXAnchor](self->_apertureContainer, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v30;
      -[UIView bottomAnchor](self->_apertureContainer, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v45, "addObjectsFromArray:", v34);

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_toolConstraints);
  }
}

- (void)_updateFocusOverlayConstraints
{
  NSMutableArray *v3;
  NSMutableArray *focusOverlayControllerConstraints;
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
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (self->_focusOverlayController)
  {
    if (!self->_focusOverlayControllerConstraints)
    {
      v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      focusOverlayControllerConstraints = self->_focusOverlayControllerConstraints;
      self->_focusOverlayControllerConstraints = v3;

      -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_focusOverlayControllerConstraints;
      objc_msgSend(v5, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditPortraitToolController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      objc_msgSend(v5, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditPortraitToolController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      objc_msgSend(v5, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditPortraitToolController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v7;
      objc_msgSend(v5, "bottomAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditPortraitToolController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v12);

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_focusOverlayControllerConstraints);
    }
  }
}

- (void)updateViewConstraints
{
  objc_super v3;

  -[PUPhotoEditPortraitToolController _updateToolContainerConstraints](self, "_updateToolContainerConstraints");
  -[PUPhotoEditPortraitToolController _updateToolConstraints](self, "_updateToolConstraints");
  -[PUPhotoEditPortraitToolController _updateFocusOverlayConstraints](self, "_updateFocusOverlayConstraints");
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditPortraitToolController updateViewConstraints](&v3, sel_updateViewConstraints);
}

- (void)previewingOriginalDidStart
{
  id v2;

  -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)previewingOriginalDidStop
{
  id v2;

  -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)longPressed:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") != 2)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolControllerWantsToToggleOriginal:", self);

  }
}

- (BOOL)_canRenderPortraitEffect
{
  int v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = PECanRenderPortrait();
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "portraitAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v6 = (objc_msgSend(v5, "canRenderPortraitEffect") & 1) != 0
      || -[NSDictionary count](self->_cachedPortraitEffectSettings, "count") != 0;
  else
    v6 = 0;

  return v6;
}

- (void)setToolSelection:(int64_t)a3
{
  -[PUPhotoEditPortraitToolController setToolSelection:animated:](self, "setToolSelection:animated:", a3, 0);
}

- (void)setToolSelection:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_toolSelection != a3)
  {
    self->_toolSelection = a3;
    -[PUPhotoEditPortraitToolController _updateToolVisibilityAnimated:](self, "_updateToolVisibilityAnimated:", a4);
  }
}

- (void)_updateToolVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(void *, uint64_t);
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  _QWORD aBlock[5];
  BOOL v14;
  BOOL v15;

  v3 = a3;
  v5 = -[PUPhotoEditPortraitToolController toolSelection](self, "toolSelection") == 1;
  v6 = -[PUPhotoEditPortraitToolController toolSelection](self, "toolSelection") == 2;
  -[PUPhotoEditToolController setToolGradientDistance:](self, "setToolGradientDistance:", dbl_1AB0EF370[v5]);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke;
  aBlock[3] = &unk_1E58A7DF8;
  aBlock[4] = self;
  v14 = v5;
  v15 = v6;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke_2;
  v10[3] = &unk_1E58A3750;
  v10[4] = self;
  v11 = v5;
  v12 = v6;
  v9 = (void (**)(void *, uint64_t))_Block_copy(v10);
  if (v3)
  {
    -[UIView setHidden:](self->_lightingContainer, "setHidden:", 0);
    -[UIView setHidden:](self->_apertureContainer, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v8, v9, 0.25, 0.0);
  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

}

- (void)_updateApertureSliderLength
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  double v12;
  id v13;

  -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldDisplayCompactToolbar");

    if (v5)
    {
      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.0;
      v13 = v6;
    }
    else
    {
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "currentLayoutStyle");

      v10 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      if (v9 != 4 && v10 == 1)
        v12 = 275.0;
      else
        v12 = 375.0;
      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      v7 = v12;
    }
    objc_msgSend(v6, "setSliderWidth:", v7);

  }
}

- (BOOL)_shouldShowPortraitV2
{
  void *v3;
  char v4;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowPortraitV2");

  return (v4 & 1) != 0 || -[PUPhotoEditPortraitToolController majorVersion](self, "majorVersion") > 1;
}

- (BOOL)_shouldShowPortraitFocusEditingUI
{
  return -[PUPhotoEditPortraitToolController sDOFRenderingVersion](self, "sDOFRenderingVersion") > 5;
}

- (void)validateCommand:(id)a3
{
  __CFString *v3;
  void *v4;
  id v5;

  v5 = a3;
  if ((char *)objc_msgSend(v5, "action") == sel_navigateToPreviousTab_)
  {
    v3 = CFSTR("PHOTOEDIT_PORTRAIT_LIGHTING_EFFECTS_KEY_COMMAND_TITLE");
    goto LABEL_5;
  }
  if ((char *)objc_msgSend(v5, "action") == sel_navigateToNextTab_)
  {
    v3 = CFSTR("PHOTOEDIT_PORTRAIT_APERTURE_KEY_COMMAND_TITLE");
LABEL_5:
    PULocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDiscoverabilityTitle:", v4);

  }
}

- (void)_refreshFromValuesCalculator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSNumber *cachedSpillMatteAllowed;
  NSDictionary *v27;
  NSDictionary *cachedPortraitEffectSettings;
  NSNumber *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
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
  NSObject *v47;
  _BOOL4 v48;
  const __CFString *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  BOOL v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  int v73;
  _QWORD v74[4];
  NSNumber *v75;
  id v76;
  int v77;
  uint8_t buf[4];
  const __CFString *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "hasImageValues"))
    goto LABEL_43;
  objc_msgSend(v3, "portraitValuesWithAccuracy:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D71358]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D713B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D713C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D71300]);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v63 = (void *)v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (void *)v8;
  else
    v9 = 0;
  v10 = *MEMORY[0x1E0D71308];
  v11 = v9;
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v62 = (void *)v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = (void *)v12;
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_msgSend(v11, "unsignedIntegerValue");

  -[PUPhotoEditPortraitToolController setMajorVersion:](self, "setMajorVersion:", v15);
  v16 = objc_msgSend(v14, "unsignedIntegerValue");

  -[PUPhotoEditPortraitToolController setMinorVersion:](self, "setMinorVersion:", v16);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D713B8]);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = (void *)v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = (void *)v17;
  else
    v18 = 0;
  -[PUPhotoEditPortraitToolController setSDOFRenderingVersion:](self, "setSDOFRenderingVersion:", objc_msgSend(v18, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D713C8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "portraitAdjustmentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "portraitInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 || !v6)
  {
    objc_msgSend(v23, "portraitInfo");
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cachedPortraitEffectSettings = self->_cachedPortraitEffectSettings;
    self->_cachedPortraitEffectSettings = v27;

    objc_msgSend(v23, "spillMatteAllowed");
    v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    cachedSpillMatteAllowed = self->_cachedSpillMatteAllowed;
    self->_cachedSpillMatteAllowed = v29;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedPortraitEffectSettings, v6);
    objc_storeStrong((id *)&self->_cachedSpillMatteAllowed, v7);
    if (!v23)
      goto LABEL_17;
    v25 = *MEMORY[0x1E0D713A0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke;
    v74[3] = &unk_1E58A3778;
    v75 = v6;
    v77 = v21;
    v76 = v4;
    objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v25, v74);

    cachedSpillMatteAllowed = v75;
  }

LABEL_17:
  v64 = v7;
  v65 = v6;
  v30 = *MEMORY[0x1E0D71340];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D71340]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v33 = v32;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D71348]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "depthAdjustmentController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "depthInfo");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v34, "depthInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("focusRect"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {

      goto LABEL_23;
    }

  }
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v22, "adjustmentConstants");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "PIDepthAdjustmentKey");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke_2;
  v68[3] = &unk_1E58A37A0;
  v69 = v5;
  v73 = v33;
  v70 = v67;
  v71 = v4;
  v72 = v34;
  objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v40, v68);

  v36 = v69;
LABEL_23:

LABEL_24:
  v66 = v5;
  objc_msgSend(v3, "apertureValuesWithAccuracy:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v30);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v34, "depthInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", CFSTR("capturedAperture"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      objc_msgSend(v34, "depthInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v45, "mutableCopy");

      objc_msgSend(v46, "setObject:forKeyedSubscript:", v42, CFSTR("capturedAperture"));
      objc_msgSend(v34, "setDepthInfo:", v46);

    }
  }
  PLPhotoEditGetLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = -[PUPhotoEditPortraitToolController _canRenderPortraitEffect](self, "_canRenderPortraitEffect");
    v49 = CFSTR("N");
    if (v48)
      v49 = CFSTR("Y");
    *(_DWORD *)buf = 138412290;
    v79 = v49;
    _os_log_impl(&dword_1AAB61000, v47, OS_LOG_TYPE_INFO, "PUPhotoEditPortraitToolCOntroller: has portrait? %@", buf, 0xCu);
  }

  -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "hasImageValues");

  if (v51)
  {
    -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "portraitValuesWithAccuracy:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D713A8]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_isStageLightEnabled = objc_msgSend(v54, "BOOLValue") ^ 1;

  }
  v55 = -[PUPhotoEditPortraitToolController _setupDepthControlsIfNeeded](self, "_setupDepthControlsIfNeeded");
  v56 = -[PUPhotoEditPortraitToolController _setupLightingControlsIfNeeded](self, "_setupLightingControlsIfNeeded");
  v57 = -[PUPhotoEditPortraitToolController _setupApertureControlsIfNeeded](self, "_setupApertureControlsIfNeeded");
  if (v55 || v56 || v57)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "toolControllerDidUpdateToolbar:", self);

    -[PUPhotoEditPortraitToolController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setNeedsUpdateConstraints");

  }
  v60 = -[PUPhotoEditPortraitToolController toolSelection](self, "toolSelection");
  if (v34 && !v60)
    -[PUPhotoEditPortraitToolController _resetDefaultToolMode](self, "_resetDefaultToolMode");

LABEL_43:
}

- (BOOL)_setupDepthControlsIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  PUPhotoEditToolActivationButton *portraitToolbarButton;
  uint64_t v8;
  void *v9;
  void *v10;
  PUPhotoEditToolActivationButton *v11;
  PUPhotoEditToolActivationButton *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "canRenderDepth");
  v6 = objc_msgSend(v4, "enabled");
  portraitToolbarButton = self->_portraitToolbarButton;
  if (!v5)
  {
    if (portraitToolbarButton)
    {
      self->_portraitToolbarButton = 0;

      goto LABEL_6;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (portraitToolbarButton)
    goto LABEL_7;
  v8 = v6;
  -[PUPhotoEditPortraitToolController _depthButtonTitle](self, "_depthButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedUppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditToolActivationButton buttonWithTitle:](PUPhotoEditToolActivationButton, "buttonWithTitle:", v10);
  v11 = (PUPhotoEditToolActivationButton *)objc_claimAutoreleasedReturnValue();
  v12 = self->_portraitToolbarButton;
  self->_portraitToolbarButton = v11;

  -[PUPhotoEditToolActivationButton setTranslatesAutoresizingMaskIntoConstraints:](self->_portraitToolbarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __64__PUPhotoEditPortraitToolController__setupDepthControlsIfNeeded__block_invoke;
  v22 = &unk_1E58A40E8;
  objc_copyWeak(&v23, &location);
  -[PUPhotoEditToolActivationButton setActionBlock:](self->_portraitToolbarButton, "setActionBlock:", &v19);
  -[PUPhotoEditToolActivationButton setSelected:](self->_portraitToolbarButton, "setSelected:", v8, v19, v20, v21, v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_6:
  v13 = 1;
LABEL_8:
  if (-[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2")
    && -[PUPhotoEditPortraitToolController _shouldShowPortraitFocusEditingUI](self, "_shouldShowPortraitFocusEditingUI"))
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "depthAdjustmentController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "enabled");
    focusOverlayController = self->_focusOverlayController;
    if (v16)
    {
      if (!focusOverlayController)
        goto LABEL_14;
    }
    else if (focusOverlayController)
    {
LABEL_14:
      v13 = 1;
    }
    -[PUPhotoEditPortraitToolController _updateFocusOverlay](self, "_updateFocusOverlay");

  }
  return v13;
}

- (BOOL)_setupLightingControlsIfNeeded
{
  _BOOL4 v3;
  CEKLightingControl *lightingControl;
  id v5;
  CEKLightingControl *v6;
  CEKLightingControl *v7;
  BOOL v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  _PULightingGradientView *v12;
  _PULightingGradientView *lightingGradient;
  NSArray *lightingControlConstraints;
  CEKLightingControl *v15;
  _BOOL4 v16;
  PUPhotoEditToolbarButton *lightingIntensityButton;
  void *v18;
  PUPhotoEditToolbarButton *v19;
  PUPhotoEditToolbarButton *v20;
  CEKSlider *v21;
  CEKSlider *lightingSlider;
  NSMutableDictionary *v23;
  NSMutableDictionary *lightingIntensityCache;
  void *v25;
  void *v26;
  double v27;
  CEKSlider *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id location;

  v3 = -[PUPhotoEditPortraitToolController _canRenderPortraitEffect](self, "_canRenderPortraitEffect");
  lightingControl = self->_lightingControl;
  if (!v3)
  {
    if (lightingControl)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_lightingControlConstraints);
      lightingControlConstraints = self->_lightingControlConstraints;
      self->_lightingControlConstraints = 0;

      -[CEKLightingControl removeFromSuperview](self->_lightingControl, "removeFromSuperview");
      v15 = self->_lightingControl;
      self->_lightingControl = 0;

      v8 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (lightingControl)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v5 = objc_alloc(MEMORY[0x1E0D0D070]);
  v6 = (CEKLightingControl *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = self->_lightingControl;
  self->_lightingControl = v6;

  -[UIView addSubview:](self->_lightingContainer, "addSubview:", self->_lightingControl);
  -[CEKLightingControl setDelegate:](self->_lightingControl, "setDelegate:", self);
  -[CEKLightingControl preloadEffectChangeAnimation](self->_lightingControl, "preloadEffectChangeAnimation");
  -[CEKLightingControl setTranslatesAutoresizingMaskIntoConstraints:](self->_lightingControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = 1;
  -[CEKLightingControl setHighlighted:](self->_lightingControl, "setHighlighted:", 1);
  -[CEKLightingControl setNameBadgeHidden:](self->_lightingControl, "setNameBadgeHidden:", 1);
  v9 = -[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2");
  v10 = 2;
  if (v9)
    v10 = 3;
  if (self->_isStageLightEnabled)
    v11 = v10;
  else
    v11 = 1;
  -[CEKLightingControl setLightingEffectSet:](self->_lightingControl, "setLightingEffectSet:", v11);
  v12 = objc_alloc_init(_PULightingGradientView);
  lightingGradient = self->_lightingGradient;
  self->_lightingGradient = v12;

  -[_PULightingGradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightingGradient, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditPortraitToolController _updateLightingControl](self, "_updateLightingControl");
  self->_initialLightingType = -[CEKLightingControl selectedLightingType](self->_lightingControl, "selectedLightingType");
LABEL_12:
  v16 = -[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2");
  lightingIntensityButton = self->_lightingIntensityButton;
  if (v16)
  {
    if (!lightingIntensityButton)
    {
      objc_initWeak(&location, self);
      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("camera.lightcontrol"), 0, &stru_1E58AD278, v18);
      v19 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
      v20 = self->_lightingIntensityButton;
      self->_lightingIntensityButton = v19;

      -[PUPhotoEditToolbarButton setSelectedGlyphHasHighlightColor:](self->_lightingIntensityButton, "setSelectedGlyphHasHighlightColor:", 1);
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __67__PUPhotoEditPortraitToolController__setupLightingControlsIfNeeded__block_invoke;
      v33 = &unk_1E58A45C0;
      objc_copyWeak(&v34, &location);
      -[PUPhotoEditToolbarButton setActionBlock:](self->_lightingIntensityButton, "setActionBlock:", &v30);
      -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 0, v30, v31, v32, v33);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      v8 = 1;
    }
    if (!self->_lightingSlider)
    {
      +[PUPhotoEditSupport createEditSlider](PUPhotoEditSupport, "createEditSlider");
      v21 = (CEKSlider *)objc_claimAutoreleasedReturnValue();
      lightingSlider = self->_lightingSlider;
      self->_lightingSlider = v21;

      v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lightingIntensityCache = self->_lightingIntensityCache;
      self->_lightingIntensityCache = v23;

      -[CEKSlider setDelegate:](self->_lightingSlider, "setDelegate:", self);
      -[CEKSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_lightingSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_lightingContainer, "addSubview:", self->_lightingSlider);
      -[PUPhotoEditToolController compositionController](self, "compositionController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "portraitAdjustmentController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v26, "strength");
        -[CEKSlider setValue:](self->_lightingSlider, "setValue:");
      }
      -[CEKSlider setMinimumValue:](self->_lightingSlider, "setMinimumValue:", 0.0);
      -[CEKSlider setMaximumValue:](self->_lightingSlider, "setMaximumValue:", 1.0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[CEKSlider setLabelVerticalPadding:](self->_lightingSlider, "setLabelVerticalPadding:", -35.0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[CEKSlider setValueLabelVisibility:](self->_lightingSlider, "setValueLabelVisibility:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[CEKSlider setAnimationDuration:](self->_lightingSlider, "setAnimationDuration:", 0.5);
      -[PUPhotoEditPortraitToolController _updateLightingSliderAnimated:](self, "_updateLightingSliderAnimated:", 0);
      -[PUPhotoEditPortraitToolController _updateLightingIntensityCache](self, "_updateLightingIntensityCache");
      -[CEKSlider value](self->_lightingSlider, "value");
      self->_initialLightingIntensity = v27;

      return 1;
    }
  }
  else
  {
    if (lightingIntensityButton)
    {
      self->_lightingIntensityButton = 0;

      v8 = 1;
    }
    v28 = self->_lightingSlider;
    if (v28)
    {
      self->_lightingSlider = 0;

      return 1;
    }
  }
  return v8;
}

- (BOOL)_setupApertureControlsIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  PUPhotoEditApertureToolbar **p_apertureToolbar;
  PUPhotoEditApertureToolbar *apertureToolbar;
  BOOL v8;
  PUPhotoEditApertureToolbar *v9;
  double v10;
  UIView *apertureContainer;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  int v17;
  void *v18;
  PUPhotoEditApertureButton *v19;
  CEKApertureButton *apertureButton;
  void *v21;
  _BOOL8 v22;
  void *v23;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "canAdjustApertureValue");
  p_apertureToolbar = &self->_apertureToolbar;
  apertureToolbar = self->_apertureToolbar;
  if (v5)
  {
    v8 = apertureToolbar == 0;
    if (!apertureToolbar)
    {
      v9 = objc_alloc_init(PUPhotoEditApertureToolbar);
      -[PUPhotoEditApertureToolbar setDelegate:](v9, "setDelegate:", self);
      -[PUPhotoEditApertureToolbar setLayoutOrientation:](v9, "setLayoutOrientation:", -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation"));
      objc_msgSend(v4, "minimumAperture");
      -[PUPhotoEditApertureToolbar setMinimumApertureValue:](v9, "setMinimumApertureValue:");
      objc_msgSend(v4, "maximumAperture");
      -[PUPhotoEditApertureToolbar setMaximumApertureValue:](v9, "setMaximumApertureValue:");
      objc_msgSend(v4, "aperture");
      if (v10 > 0.0)
        -[PUPhotoEditApertureToolbar setApertureValueClosestTo:](v9, "setApertureValueClosestTo:");
      apertureContainer = self->_apertureContainer;
      -[PUPhotoEditApertureToolbar view](v9, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](apertureContainer, "addSubview:", v12);

      objc_msgSend(v4, "depthInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("capturedAperture"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "floatValue");
      if (v14 && v15 > 0.0)
        -[PUPhotoEditApertureToolbar setOriginalApertureValueClosestTo:](v9, "setOriginalApertureValueClosestTo:", v15);
      objc_storeStrong((id *)&self->_apertureToolbar, v9);
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "apertureSliderHasOffPosition");

      if (v17)
        -[PUPhotoEditApertureToolbar setDepthIsOn:](*p_apertureToolbar, "setDepthIsOn:", objc_msgSend(v4, "enabled"));
      else
        -[PUPhotoEditApertureToolbar setEnabled:](*p_apertureToolbar, "setEnabled:", objc_msgSend(v4, "enabled"));

    }
    if (!self->_apertureButton)
    {
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc_init(PUPhotoEditApertureButton);
      apertureButton = self->_apertureButton;
      self->_apertureButton = &v19->super;

      -[PUPhotoEditPortraitToolController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "effectiveUserInterfaceLayoutDirection") != 1;

      -[CEKApertureButton setExpansionDirection:](self->_apertureButton, "setExpansionDirection:", v22);
      -[CEKApertureButton setTappableEdgeInsets:](self->_apertureButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
      -[CEKApertureButton setTranslatesAutoresizingMaskIntoConstraints:](self->_apertureButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v18, "photoEditingToolbarMainButtonColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKApertureButton setTintColor:](self->_apertureButton, "setTintColor:", v23);

      -[CEKApertureButton addTarget:action:forControlEvents:](self->_apertureButton, "addTarget:action:forControlEvents:", self, sel__handlePortraitNavigationButtons_, 64);
      -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 0);
      goto LABEL_18;
    }
  }
  else
  {
    v8 = apertureToolbar != 0;
    if (apertureToolbar)
    {
      *p_apertureToolbar = 0;

    }
    v18 = self->_apertureButton;
    if (v18)
    {
      self->_apertureButton = 0;
LABEL_18:

      v8 = 1;
    }
  }

  return v8;
}

- (void)_selectNextEffectType:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[CEKLightingControl lightingEffectSet](self->_lightingControl, "lightingEffectSet");
  if (v5 > 3)
    v6 = 0;
  else
    v6 = (void *)qword_1E58A3828[v5];
  v7 = -[CEKLightingControl selectedLightingType](self->_lightingControl, "selectedLightingType");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v16 = v3;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v18;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
      v8 = objc_msgSend(v14, "integerValue");
      if (v11)
        break;
      v11 = v7 == v8;
      if (v7 != v8)
        v10 = objc_msgSend(v14, "integerValue");
      if (v9 == ++v13)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v8;
        if (v8)
          goto LABEL_6;
        break;
      }
    }
    v3 = v16;
  }
  else
  {
    v10 = 0;
  }
  if (v3)
    v15 = v10;
  else
    v15 = v8;
  if (v15)
  {
    -[CEKLightingControl setSelectedLightingType:animated:](self->_lightingControl, "setSelectedLightingType:animated:", v15, 1);
    -[PUPhotoEditPortraitToolController lightingControlDidChangeSelectedLightingType:](self, "lightingControlDidChangeSelectedLightingType:", self->_lightingControl);
  }
}

- (void)_handlePortraitNavigationButtons:(id)a3
{
  uint64_t v4;

  if (-[PUPhotoEditPortraitToolController toolSelection](self, "toolSelection", a3) == 1)
    v4 = 2;
  else
    v4 = 1;
  -[PUPhotoEditPortraitToolController setToolSelection:animated:](self, "setToolSelection:animated:", v4, 1);
  -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 1);
}

- (void)_createFocusOverlayIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PUPhotoEditPortraitFocusOverlayViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  PUPhotoEditPortraitFocusOverlayViewController *v13;
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  if (!self->_focusOverlayController)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "composition");
    v4 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithComposition:", v4);
    objc_msgSend(v5, "setName:", CFSTR("PUPhotoEditPortraitToolController-imageProperties"));
    v20 = 0;
    objc_msgSend(v5, "submitSynchronous:", &v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    objc_msgSend(v6, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isHDR") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v7, "hasGainMap");
    v9 = [PUPhotoEditPortraitFocusOverlayViewController alloc];
    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUPhotoEditPortraitFocusOverlayViewController initWithMediaView:isHDR:delegate:](v9, "initWithMediaView:isHDR:delegate:", v11, v8, v12);
    focusOverlayController = self->_focusOverlayController;
    self->_focusOverlayController = v13;

    -[PUPhotoEditPortraitFocusOverlayViewController setPortraitFocusDelegate:](self->_focusOverlayController, "setPortraitFocusDelegate:", self);
    -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUPhotoEditPortraitToolController addChildViewController:](self, "addChildViewController:", self->_focusOverlayController);
    -[PUPhotoEditPortraitFocusOverlayViewController didMoveToParentViewController:](self->_focusOverlayController, "didMoveToParentViewController:", self);
    -[PUPhotoEditPortraitToolController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "insertSubview:atIndex:", v17, 0);
  }
}

- (void)_removeFocusOverlayIfNeeded
{
  NSMutableArray *focusOverlayControllerConstraints;
  void *v4;
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;

  if (self->_focusOverlayController)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_focusOverlayControllerConstraints);
    focusOverlayControllerConstraints = self->_focusOverlayControllerConstraints;
    self->_focusOverlayControllerConstraints = 0;

    -[PUPhotoEditPortraitFocusOverlayViewController willMoveToParentViewController:](self->_focusOverlayController, "willMoveToParentViewController:", 0);
    -[PUPhotoEditPortraitToolController removeChildViewController:](self, "removeChildViewController:", self->_focusOverlayController);
    -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    focusOverlayController = self->_focusOverlayController;
    self->_focusOverlayController = 0;

  }
}

- (void)_resetDefaultToolMode
{
  -[PUPhotoEditPortraitToolController setToolSelection:animated:](self, "setToolSelection:animated:", -[PUPhotoEditPortraitToolController _defaultPortraitTool](self, "_defaultPortraitTool"), 1);
  -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 1);
}

- (int64_t)_defaultPortraitTool
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "depthAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (objc_msgSend(v3, "canAdjustApertureValue"))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateNavigationButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  v5 = -[PUPhotoEditPortraitToolController toolSelection](self, "toolSelection");
  if (v3)
  {
    -[CEKApertureButton superview](self->_apertureButton, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

  }
  -[PUPhotoEditToolbarButton setSelected:](self->_lightingIntensityButton, "setSelected:", v5 != 2);
  -[CEKApertureButton setActive:](self->_apertureButton, "setActive:", v5 == 2);
  if (v5 == 2)
  {
    v10 = 0;
  }
  else
  {
    -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "apertureValue");
    -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");

    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "depthAdjustmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "enabled");
  }
  -[CEKApertureButton setShouldShowApertureValue:animated:](self->_apertureButton, "setShouldShowApertureValue:animated:", v10, v3);
  -[CEKApertureButton superview](self->_apertureButton, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PUPhotoEditToolbarButton isSelected](self->_lightingIntensityButton, "isSelected") & 1) != 0)
    objc_msgSend(v12, "photoEditingToolbarButtonSelectedColor");
  else
    objc_msgSend(v12, "photoEditingToolbarButtonColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setTintColor:](self->_lightingIntensityButton, "setTintColor:", v13);
  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__PUPhotoEditPortraitToolController__updateNavigationButtonsAnimated___block_invoke;
    v14[3] = &unk_1E58ABD10;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v14, 0.25);
  }

}

- (void)_updateLightingControl
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portraitAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "enabled")
    || (v5 = +[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:](PUPhotoEditEffectsSupport, "lightingEffectTypeForIdentifier:", v4)) == 0)
  {
    v5 = -[CEKLightingControl defaultLightingType](self->_lightingControl, "defaultLightingType");
  }
  -[PUPhotoEditPortraitToolController _updateLightingMarkerForType:](self, "_updateLightingMarkerForType:", v5);
  -[CEKLightingControl setSelectedLightingType:](self->_lightingControl, "setSelectedLightingType:", v5);
  -[CEKLightingNameBadge setLightingType:](self->_lightingNameBadge, "setLightingType:", v5);
  -[PUPhotoEditPortraitToolController _updateLightingNameBadgeForOrientation:expanded:](self, "_updateLightingNameBadgeForOrientation:expanded:", -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation"), -[CEKLightingControl isExpanded](self->_lightingControl, "isExpanded"));

}

- (void)_updateLightingMarkerForType:(int64_t)a3
{
  double initialLightingIntensity;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_initialLightingType == a3)
      initialLightingIntensity = self->_initialLightingIntensity;
    else
      initialLightingIntensity = 1.79769313e308;
    -[CEKSlider setMarkedValue:](self->_lightingSlider, "setMarkedValue:", initialLightingIntensity);
  }
}

- (void)_updateLightingSliderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v3 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portraitAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "strength");
    -[CEKSlider setValue:](self->_lightingSlider, "setValue:");
  }
  v7 = -[CEKLightingControl selectedLightingType](self->_lightingControl, "selectedLightingType");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PUPhotoEditPortraitToolController__updateLightingSliderAnimated___block_invoke;
  v10[3] = &unk_1E58AAD68;
  v10[4] = self;
  v11 = v7 > 1;
  v8 = _Block_copy(v10);
  v9 = v8;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v8, 0, 0.25, 0.0);
  else
    (*((void (**)(void *))v8 + 2))(v8);

}

- (void)_updateFocusOverlay
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthAdjustmentController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "enabled")
    || !-[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2")
    || !-[PUPhotoEditPortraitToolController _shouldShowPortraitFocusEditingUI](self, "_shouldShowPortraitFocusEditingUI"))
  {
    if (!self->_focusOverlayController)
    {
      v4 = 1;
      goto LABEL_10;
    }
    -[PUPhotoEditPortraitToolController _removeFocusOverlayIfNeeded](self, "_removeFocusOverlayIfNeeded");
    v4 = 1;
    goto LABEL_8;
  }
  if (!self->_focusOverlayController)
  {
    -[PUPhotoEditPortraitToolController _createFocusOverlayIfNeeded](self, "_createFocusOverlayIfNeeded");
    v4 = 0;
LABEL_8:
    -[PUPhotoEditPortraitToolController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdateConstraints");

    goto LABEL_10;
  }
  v4 = 0;
LABEL_10:
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolControllerDidChangeWantsTapToToggleOriginalEnabled:enabled:", self, v4);

}

- (void)_handlePortraitEffectButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[PUPhotoEditToolController compositionController](self, "compositionController", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "depthAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enabled");

  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "livePortraitBehaviorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPhotoEditEffectsSupport updateCompositionController:withDepthEnabled:livePortraitBehaviorController:](PUPhotoEditEffectsSupport, "updateCompositionController:withDepthEnabled:livePortraitBehaviorController:", v10, v5 ^ 1u, v7);
  PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_SWITCH"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v8);

  -[PUPhotoEditPortraitToolController _updateLightingControl](self, "_updateLightingControl");
  -[PUPhotoEditPortraitToolController _updateLightingSliderAnimated:](self, "_updateLightingSliderAnimated:", 0);
  -[PUPhotoEditPortraitToolController _updateFocusOverlay](self, "_updateFocusOverlay");

}

- (id)_depthButtonTitle
{
  return PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_SWITCH"));
}

- (id)localizedName
{
  return PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_TOOL_BUTTON"));
}

- (id)toolbarIconGlyphName
{
  return CFSTR("f.cursive.circle");
}

- (id)selectedToolbarIconGlyphName
{
  return CFSTR("f.cursive.circle.fill");
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_TOOLBAR_BUTTON_AX_LABEL"));
}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (void)willBecomeActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController willBecomeActiveTool](&v3, sel_willBecomeActiveTool);
  -[PUPhotoEditPortraitToolController _resetDefaultToolMode](self, "_resetDefaultToolMode");
  -[PUPhotoEditPortraitToolController _updateLightingControl](self, "_updateLightingControl");
  -[PUPhotoEditPortraitToolController _updateLightingSliderAnimated:](self, "_updateLightingSliderAnimated:", 0);
}

- (void)reactivate
{
  void *v3;
  void (**v4)(void);

  if (self->_lightingIntensityButton && self->_apertureButton)
    -[PUPhotoEditPortraitToolController _handlePortraitNavigationButtons:](self, "_handlePortraitNavigationButtons:", 0);
  else
    -[PUPhotoEditPortraitToolController _resetDefaultToolMode](self, "_resetDefaultToolMode");
  -[PUPhotoEditToolController ppt_didBecomeActiveToolBlock](self, "ppt_didBecomeActiveToolBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolController ppt_didBecomeActiveToolBlock](self, "ppt_didBecomeActiveToolBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController setBackdropViewGroupName:](&v7, sel_setBackdropViewGroupName_, v4);
  -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackdropViewGroupName:", v4);

  }
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (objc_msgSend(a3, "isEqual:", self->_portraitToolbarButton))
  {
    -[PUPhotoEditPortraitToolController _depthButtonTitle](self, "_depthButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedUppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0DC3418]);
    v7 = (void *)objc_msgSend(v6, "initWithTitle:image:imageInsets:scaleImage:", v5, 0, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  BOOL v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;

  v4 = a3;
  if (self->_suspendUIUpdatesFromComposition)
    goto LABEL_26;
  v33 = v4;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustmentConstants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PIDepthAdjustmentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "containsObject:", v7))
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "PIPortraitAdjustmentKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v33, "containsObject:", v8);

  if (v9)
  {
LABEL_5:
    objc_msgSend(v5, "depthAdjustmentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "enabled");
    -[PUPhotoEditToolActivationButton setSelected:](self->_portraitToolbarButton, "setSelected:", v11);
    -[UILongPressGestureRecognizer setEnabled:](self->_longPressGestureRecognizer, "setEnabled:", v11);
    v12 = (void *)MEMORY[0x1E0D7BB50];
    if (-[PUPhotoEditToolActivationButton isSelected](self->_portraitToolbarButton, "isSelected"))
      v13 = 2;
    else
      v13 = 1;
    objc_msgSend(v12, "configurationWithCursorEffect:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIButton setPx_configuration:](self->_portraitToolbarButton, "setPx_configuration:", v14);

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "apertureSliderHasOffPosition");

    if ((v16 & 1) == 0)
    {
      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEnabled:", v11);

    }
    -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 1);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "apertureSliderHasOffPosition");

    if ((v19 & 1) != 0)
    {
      if ((_DWORD)v11)
      {
        objc_msgSend(v10, "aperture");
        if (v20 > 0.0)
        {
          v21 = v20;
          -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setApertureValueClosestTo:", v21);

          -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "apertureValue");
          -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");

          v24 = self->_focusOverlayController == 0;
          goto LABEL_19;
        }
LABEL_18:
        v24 = 0;
LABEL_19:
        if (v24 || self->_focusOverlayController)
        {
          -[PUPhotoEditPortraitToolController _updateFocusOverlay](self, "_updateFocusOverlay");
          -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "layer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setNeedsDisplay");

        }
        goto LABEL_23;
      }
      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDepthIsOn:", 0);
    }
    else
    {
      objc_msgSend(v10, "aperture");
      if (v25 <= 0.0)
        goto LABEL_18;
      v26 = v25;
      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setApertureValueClosestTo:", v26);

      -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "apertureValue");
      -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");
    }

    goto LABEL_18;
  }
LABEL_23:
  objc_msgSend(v6, "PIPortraitAdjustmentKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v33, "containsObject:", v31);

  if (v32)
  {
    -[PUPhotoEditPortraitToolController _updateLightingControl](self, "_updateLightingControl");
    -[PUPhotoEditPortraitToolController _updateLightingSliderAnimated:](self, "_updateLightingSliderAnimated:", 0);
  }

  v4 = v33;
LABEL_26:

}

- (id)leadingToolbarViews
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_lightingIntensityButton)
    objc_msgSend(v3, "addObject:");
  if (self->_apertureButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)centerToolbarView
{
  return self->_portraitToolbarButton;
}

- (int64_t)toolControllerTag
{
  return 1000;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  void *v3;
  void *v4;
  int v5;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2")
    && -[PUPhotoEditPortraitToolController _shouldShowPortraitFocusEditingUI](self, "_shouldShowPortraitFocusEditingUI"))
  {
    v5 = objc_msgSend(v4, "enabled") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (void)increaseScrubberValue:(BOOL)a3
{
  _BOOL8 v3;
  PUPhotoEditApertureToolbar *apertureToolbar;

  v3 = a3;
  if (-[UIView isHidden](self->_lightingContainer, "isHidden"))
  {
    if (!-[UIView isHidden](self->_apertureContainer, "isHidden"))
    {
      if (-[PUPhotoEditApertureToolbar setNextApertureValue:coarse:](self->_apertureToolbar, "setNextApertureValue:coarse:", 1, v3))
      {
        apertureToolbar = self->_apertureToolbar;
        -[PUPhotoEditApertureToolbar apertureValue](apertureToolbar, "apertureValue");
        -[PUPhotoEditPortraitToolController apertureToolbar:didChangeValue:](self, "apertureToolbar:didChangeValue:", apertureToolbar);
      }
    }
  }
  else
  {
    -[PUPhotoEditPortraitToolController _selectNextEffectType:](self, "_selectNextEffectType:", 1);
  }
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  _BOOL8 v3;
  PUPhotoEditApertureToolbar *apertureToolbar;

  v3 = a3;
  if (-[UIView isHidden](self->_lightingContainer, "isHidden"))
  {
    if (!-[UIView isHidden](self->_apertureContainer, "isHidden"))
    {
      if (-[PUPhotoEditApertureToolbar setNextApertureValue:coarse:](self->_apertureToolbar, "setNextApertureValue:coarse:", 0, v3))
      {
        apertureToolbar = self->_apertureToolbar;
        -[PUPhotoEditApertureToolbar apertureValue](apertureToolbar, "apertureValue");
        -[PUPhotoEditPortraitToolController apertureToolbar:didChangeValue:](self, "apertureToolbar:didChangeValue:", apertureToolbar);
      }
    }
  }
  else
  {
    -[PUPhotoEditPortraitToolController _selectNextEffectType:](self, "_selectNextEffectType:", 0);
  }
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)increaseSliderValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[UIView isHidden](self->_lightingContainer, "isHidden"))
  {
    +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", self->_lightingSlider, 1, v3);
    -[PUPhotoEditPortraitToolController _updateCompositionWithLightingIntensity](self, "_updateCompositionWithLightingIntensity");
  }
}

- (void)decreaseSliderValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[UIView isHidden](self->_lightingContainer, "isHidden"))
  {
    +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", self->_lightingSlider, 0, v3);
    -[PUPhotoEditPortraitToolController _updateCompositionWithLightingIntensity](self, "_updateCompositionWithLightingIntensity");
  }
}

- (void)navigateToPreviousTab:(id)a3
{
  -[PUPhotoEditPortraitToolController setToolSelection:animated:](self, "setToolSelection:animated:", 1, 1);
  -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 1);
}

- (void)navigateToNextTab:(id)a3
{
  -[PUPhotoEditPortraitToolController setToolSelection:animated:](self, "setToolSelection:animated:", 2, 1);
  -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 1);
}

- (void)lightingControlDidChangeSelectedLightingType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PUPhotoEditPortraitToolController *v9;

  v4 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PUPhotoEditPortraitToolController_lightingControlDidChangeSelectedLightingType___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

}

- (void)lightingControl:(id)a3 willChangeExpanded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  _QWORD v20[6];

  v4 = a4;
  v6 = a3;
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", v4);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", v4);
  if (v4)
  {
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    -[CEKLightingControl frame](self->_lightingControl, "frame");
    PXRectWithOriginAndSize();
    -[_PULightingGradientView setFrame:](self->_lightingGradient, "setFrame:");
    -[CEKLightingControl setMaskView:](self->_lightingControl, "setMaskView:", self->_lightingGradient);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__PUPhotoEditPortraitToolController_lightingControl_willChangeExpanded___block_invoke;
  v20[3] = &unk_1E58AACF0;
  v20[4] = self;
  *(double *)&v20[5] = (double)v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v20, 0.25);
  -[PUPhotoEditPortraitToolController _updateLightingNameBadgeForOrientation:expanded:](self, "_updateLightingNameBadgeForOrientation:expanded:", -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation"), v4);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePortraitBehaviorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasLivePortrait"))
  {
    if (v4)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_livePhotoOnBeforeAdjustingLighting = objc_msgSend(v9, "isVideoOn");
LABEL_6:

      goto LABEL_7;
    }
    v15 = objc_msgSend(v6, "selectedLightingType");
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "changeLightingDisablesLive");

    if (v17)
    {
      if ((unint64_t)(v15 - 2) < 5)
        goto LABEL_7;
    }
    else if ((unint64_t)(v15 - 4) < 3)
    {
      goto LABEL_7;
    }
    if (self->_livePhotoOnBeforeAdjustingLighting)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isVideoOn");

      if ((v19 & 1) == 0)
      {
        -[PUPhotoEditToolController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "toggleLivePhotoActive");
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "portraitAdjustmentController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v11, "enabled") & 1) == 0)
  {
    if (-[PUPhotoEditPortraitToolController _shouldShowPortraitV2](self, "_shouldShowPortraitV2"))
      v12 = 2;
    else
      v12 = 1;
    +[PUPhotoEditEffectsSupport identifierForLightingType:lightingVersion:](PUPhotoEditEffectsSupport, "identifierForLightingType:lightingVersion:", objc_msgSend(v6, "selectedLightingType"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditEffectsSupport updateCompositionController:withLightingIdentifier:portraitInfo:spillMatteAllowed:](PUPhotoEditEffectsSupport, "updateCompositionController:withLightingIdentifier:portraitInfo:spillMatteAllowed:", v14, v13, self->_cachedPortraitEffectSettings, self->_cachedSpillMatteAllowed);

  }
}

- (void)lightingControlDidChangeExpanded:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = -[CEKLightingControl isExpanded](self->_lightingControl, "isExpanded", a3);
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", v4);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", v4);
  if ((v4 & 1) == 0)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_LIGHTING_ACTION_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v5);

    -[CEKLightingControl setMaskView:](self->_lightingControl, "setMaskView:", 0);
  }
}

- (void)_setShowLightingControl:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  _BOOL4 v6;
  double v7;
  uint64_t v8;
  _QWORD v9[6];

  if (a3)
    v5 = 1.0;
  else
    v5 = 0.0;
  if (!a4 || (v6 = a3, -[CEKLightingControl alpha](self->_lightingControl, "alpha"), v7 == v5))
  {
    -[CEKLightingControl setAlpha:](self->_lightingControl, "setAlpha:", v5);
  }
  else
  {
    if (v6)
      v8 = 0x10000;
    else
      v8 = 0x20000;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PUPhotoEditPortraitToolController__setShowLightingControl_animated___block_invoke;
    v9[3] = &unk_1E58AACF0;
    v9[4] = self;
    *(double *)&v9[5] = v5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v8, v9, 0, 0.5, 0.0);
  }
}

- (void)sliderWillBeginScrolling:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    -[PUPhotoEditPortraitToolController _setShowLightingControl:animated:](self, "_setShowLightingControl:animated:", 0, 1);
  }
}

- (void)sliderDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portraitAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "strength");
  objc_msgSend(v4, "value");

  LOBYTE(v4) = PXFloatEqualToFloatWithTolerance();
  if ((v4 & 1) == 0)
    -[PUPhotoEditPortraitToolController _updateCompositionWithLightingIntensity](self, "_updateCompositionWithLightingIntensity");
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;

  x = a4.x;
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0, a5, a4.x, a4.y);
  if (x == 0.0)
    -[PUPhotoEditPortraitToolController _didModifyLightingIntensity](self, "_didModifyLightingIntensity");
}

- (void)sliderDidEndScrolling:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
  -[PUPhotoEditPortraitToolController _didModifyLightingIntensity](self, "_didModifyLightingIntensity");
}

- (void)_didModifyLightingIntensity
{
  id v3;
  id v4;

  -[PUPhotoEditPortraitToolController _updateLightingIntensityCache](self, "_updateLightingIntensityCache");
  -[PUPhotoEditPortraitToolController _setShowLightingControl:animated:](self, "_setShowLightingControl:animated:", 1, 1);
  PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_LIGHTING_INTENSITY_ACTION_TITLE"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v4);

}

- (void)setPhotoEditSpec:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController setPhotoEditSpec:](&v4, sel_setPhotoEditSpec_, a3);
  -[PUPhotoEditPortraitToolController _updateLabelOrientation](self, "_updateLabelOrientation");
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[6];
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoEditPortraitToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v13, sel_setLayoutOrientation_withTransitionCoordinator_, a3, v6);
  -[PUPhotoEditPortraitToolController _updateLabelOrientation](self, "_updateLabelOrientation");
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E58AACF0;
  aBlock[4] = self;
  aBlock[5] = a3;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  if (v6)
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
    v10[3] = &unk_1E58A4058;
    v11 = v8;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v10, 0);

  }
  else
  {
    v8[2](v8);
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditPortraitToolController;
  v7 = a4;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PUPhotoEditPortraitToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E58A7A08;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)_updateLabelOrientation
{
  void *v3;
  uint64_t v4;

  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle");

  if (v4 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
    -[CEKSlider setTextOrientation:animated:](self->_lightingSlider, "setTextOrientation:animated:", 2 * (-[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation") == 2), 1);
}

- (void)_updateLightingNameBadgeForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  CEKLightingNameBadge *lightingNameBadge;
  CEKLightingNameBadge *v10;
  CEKLightingNameBadge *v11;
  void *v12;
  int v13;
  double v14;
  NSArray *v15;
  CEKLightingNameBadge *v16;
  NSArray *lightingNameBadgeConstraints;
  void *v18;

  v4 = a4;
  -[PUPhotoEditPortraitToolController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = a3 != 1 || !v4;
    -[CEKLightingControl setNameBadgeHidden:animated:](self->_lightingControl, "setNameBadgeHidden:animated:", v8, 1);
    lightingNameBadge = self->_lightingNameBadge;
    if (a3 == 1)
    {
      if (lightingNameBadge)
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_lightingNameBadgeConstraints);
        -[CEKLightingNameBadge removeFromSuperview](self->_lightingNameBadge, "removeFromSuperview");
        v16 = self->_lightingNameBadge;
        self->_lightingNameBadge = 0;

        lightingNameBadgeConstraints = self->_lightingNameBadgeConstraints;
        self->_lightingNameBadgeConstraints = 0;

      }
    }
    else
    {
      if (!lightingNameBadge)
      {
        v10 = (CEKLightingNameBadge *)objc_alloc_init(MEMORY[0x1E0D0D080]);
        v11 = self->_lightingNameBadge;
        self->_lightingNameBadge = v10;

        -[CEKLightingNameBadge setHighlighted:](self->_lightingNameBadge, "setHighlighted:", 1);
        -[CEKLightingNameBadge setTranslatesAutoresizingMaskIntoConstraints:](self->_lightingNameBadge, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[CEKLightingNameBadge setLightingType:](self->_lightingNameBadge, "setLightingType:", -[CEKLightingControl selectedLightingType](self->_lightingControl, "selectedLightingType"));
        -[PUPhotoEditPortraitToolController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", self->_lightingNameBadge);

        v13 = -[CEKLightingControl isExpanded](self->_lightingControl, "isExpanded");
        v14 = 0.0;
        if (v13)
          v14 = 1.0;
        -[CEKLightingNameBadge setAlpha:](self->_lightingNameBadge, "setAlpha:", v14);
      }
      if (self->_lightingNameBadgeConstraints)
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
        v15 = self->_lightingNameBadgeConstraints;
        self->_lightingNameBadgeConstraints = 0;

        -[PUPhotoEditPortraitToolController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setNeedsUpdateConstraints");

      }
    }
  }
}

- (void)_updateCompositionWithLightingIntensity
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PIPortraitAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PUPhotoEditPortraitToolController__updateCompositionWithLightingIntensity__block_invoke;
  v6[3] = &unk_1E58AB408;
  v6[4] = self;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v4, v6);

}

- (void)_restoreCachedLightingIntensity
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *lightingIntensityCache;
  void *v6;
  float v7;
  double v8;
  id v9;

  -[PUPhotoEditPortraitToolController _updateLightingSliderAnimated:](self, "_updateLightingSliderAnimated:", 1);
  -[PUPhotoEditPortraitToolController lightingControl](self, "lightingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedLightingType");

  if (v4)
  {
    lightingIntensityCache = self->_lightingIntensityCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lightingIntensityCache, "objectForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      v8 = v7;
    }
    else
    {
      v8 = 0.5;
    }
    if (-[CEKSlider isEnabled](self->_lightingSlider, "isEnabled"))
    {
      -[CEKSlider setValue:](self->_lightingSlider, "setValue:", v8);
      -[PUPhotoEditPortraitToolController _updateCompositionWithLightingIntensity](self, "_updateCompositionWithLightingIntensity");
    }

  }
}

- (void)_updateLightingIntensityCache
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *lightingIntensityCache;
  void *v6;
  void *v7;
  id v8;

  if (self->_lightingSlider)
  {
    -[PUPhotoEditPortraitToolController lightingControl](self, "lightingControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "selectedLightingType");

    if (v4)
    {
      lightingIntensityCache = self->_lightingIntensityCache;
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[CEKSlider value](self->_lightingSlider, "value");
      objc_msgSend(v6, "numberWithDouble:");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](lightingIntensityCache, "setObject:forKey:", v8, v7);

    }
  }
}

- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[PUPhotoEditToolController compositionController](self, "compositionController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PIDepthAdjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PUPhotoEditPortraitToolController_apertureToolbar_didChangeValue___block_invoke;
  v8[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
  *(double *)&v8[4] = a4;
  objc_msgSend(v7, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (void)apertureToolbarDidStartSliding:(id)a3
{
  double v4;
  double v5;
  id v6;

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUPhotoEditApertureToolbar apertureValue](self->_apertureToolbar, "apertureValue");
  if (v4 > 0.0)
  {
    -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "apertureValue");
    self->_lastKnownAperture = v5;

  }
}

- (void)apertureToolbarDidStopSliding:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double lastKnownAperture;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
  PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_APERTURE_ACTION_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v4);

  -[PUPhotoEditPortraitToolController apertureToolbar](self, "apertureToolbar");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "apertureValue");
  if (v6 == 0.0)
  {
    lastKnownAperture = self->_lastKnownAperture;

    if (lastKnownAperture <= 0.0)
      return;
    self->_suspendUIUpdatesFromComposition = 1;
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adjustmentConstants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "PIDepthAdjustmentKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PUPhotoEditPortraitToolController_apertureToolbarDidStopSliding___block_invoke;
    v11[3] = &unk_1E58A37E8;
    v11[4] = self;
    objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", v9, v11);

    self->_suspendUIUpdatesFromComposition = 0;
  }

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

- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[PUPhotoEditToolController compositionController](self, "compositionController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "livePortraitBehaviorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPhotoEditEffectsSupport updateCompositionController:withDepthEnabled:livePortraitBehaviorController:](PUPhotoEditEffectsSupport, "updateCompositionController:withDepthEnabled:livePortraitBehaviorController:", v8, v4, v7);
}

- (BOOL)apertureToolbarIsDepthActive
{
  void *v2;
  void *v3;
  char v4;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "depthAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabled");

  return v4;
}

- (void)focusRectChanged:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustmentConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PIDepthAdjustmentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PUPhotoEditPortraitToolController_focusRectChanged___block_invoke;
  v13[3] = &__block_descriptor_64_e32_v16__0__PIAdjustmentController_8l;
  *(CGFloat *)&v13[4] = x;
  *(CGFloat *)&v13[5] = y;
  *(CGFloat *)&v13[6] = width;
  *(CGFloat *)&v13[7] = height;
  objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v9, v13);

  PULocalizedString(CFSTR("PHOTOEDIT_PORTRAIT_FOCUS_RECT_ACTION_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v10);

}

- (CGRect)currentFocusRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "depthAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "focusRect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v8, "depthInfo"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("focusRect")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("x"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("y"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("w"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("h"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v2 = v15;
      objc_msgSend(v12, "floatValue");
      v3 = v16;
      objc_msgSend(v13, "floatValue");
      v4 = v17;
      objc_msgSend(v14, "floatValue");
      v5 = v18;

    }
  }

  v19 = v2;
  v20 = v3;
  v21 = v4;
  v22 = v5;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)toolControllerWantsToShowOriginal:(BOOL)a3
{
  id v4;

  -[PUPhotoEditToolController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerWantsToToggleOriginal:", self);

}

- (void)mediaViewIsReady
{
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;

  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController)
    -[PUPhotoEditPortraitFocusOverlayViewController mediaViewIsReady](focusOverlayController, "mediaViewIsReady");
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;
  void *v6;
  void *v7;
  id v8;

  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController)
  {
    -[PUPhotoEditPortraitFocusOverlayViewController view](focusOverlayController, "view", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsDisplay");

  }
}

- (void)mediaViewDidScroll:(id)a3
{
  PUPhotoEditPortraitFocusOverlayViewController *focusOverlayController;
  void *v5;
  void *v6;
  id v7;

  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController)
  {
    -[PUPhotoEditPortraitFocusOverlayViewController view](focusOverlayController, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[PUPhotoEditPortraitFocusOverlayViewController view](self->_focusOverlayController, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsDisplay");

  }
}

- (PUPhotoEditApertureToolbar)apertureToolbar
{
  return self->_apertureToolbar;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (int64_t)toolSelection
{
  return self->_toolSelection;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  self->_majorVersion = a3;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  self->_minorVersion = a3;
}

- (unint64_t)sDOFRenderingVersion
{
  return self->_sDOFRenderingVersion;
}

- (void)setSDOFRenderingVersion:(unint64_t)a3
{
  self->_sDOFRenderingVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_focusOverlayControllerConstraints, 0);
  objc_storeStrong((id *)&self->_focusOverlayController, 0);
  objc_storeStrong((id *)&self->_lightingIntensityCache, 0);
  objc_storeStrong((id *)&self->_cachedSpillMatteAllowed, 0);
  objc_storeStrong((id *)&self->_cachedPortraitEffectSettings, 0);
  objc_storeStrong((id *)&self->_toolConstraints, 0);
  objc_storeStrong((id *)&self->_apertureToolbar, 0);
  objc_storeStrong((id *)&self->_lightingSlider, 0);
  objc_storeStrong((id *)&self->_lightingControlConstraints, 0);
  objc_storeStrong((id *)&self->_lightingNameBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingGradient, 0);
  objc_storeStrong((id *)&self->_portraitToolbarButton, 0);
  objc_storeStrong((id *)&self->_containerConstraints, 0);
  objc_storeStrong((id *)&self->_apertureContainer, 0);
  objc_storeStrong((id *)&self->_lightingContainer, 0);
  objc_storeStrong((id *)&self->_lightingIntensityButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
}

void __54__PUPhotoEditPortraitToolController_focusRectChanged___block_invoke(double *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("h"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("w"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("x"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("y"));

  objc_msgSend(v4, "setFocusRect:", v9);
}

uint64_t __67__PUPhotoEditPortraitToolController_apertureToolbarDidStopSliding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAperture:", *(double *)(*(_QWORD *)(a1 + 32) + 1288));
}

uint64_t __68__PUPhotoEditPortraitToolController_apertureToolbar_didChangeValue___block_invoke(uint64_t a1, void *a2)
{
  float v2;

  v2 = *(double *)(a1 + 32);
  return objc_msgSend(a2, "setAperture:", v2);
}

void __76__PUPhotoEditPortraitToolController__updateCompositionWithLightingIntensity__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1272);
  v4 = a2;
  objc_msgSend(v2, "value");
  *(float *)&v3 = v3;
  objc_msgSend(v4, "setStrength:", *(float *)&v3);

}

void __88__PUPhotoEditPortraitToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsDisplay");

}

void __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_updateLightingNameBadgeForOrientation:expanded:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "isExpanded"));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[156])
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1248);
    *(_QWORD *)(v3 + 1248) = 0;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdateConstraints");

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[150])
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1200);
    *(_QWORD *)(v6 + 1200) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[162])
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1296);
    *(_QWORD *)(v8 + 1296) = 0;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsUpdateConstraints");

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_updateApertureSliderLength");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsUpdateConstraints");

}

uint64_t __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__PUPhotoEditPortraitToolController__setShowLightingControl_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __72__PUPhotoEditPortraitToolController_lightingControl_willChangeExpanded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "setAlpha:", *(double *)(a1 + 40));
}

void __82__PUPhotoEditPortraitToolController_lightingControlDidChangeSelectedLightingType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "selectedLightingType");
  if (objc_msgSend(*(id *)(a1 + 40), "_shouldShowPortraitV2"))
    v3 = 2;
  else
    v3 = 1;
  +[PUPhotoEditEffectsSupport identifierForLightingType:lightingVersion:](PUPhotoEditEffectsSupport, "identifierForLightingType:lightingVersion:", v2, v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditEffectsSupport updateCompositionController:withLightingIdentifier:portraitInfo:spillMatteAllowed:](PUPhotoEditEffectsSupport, "updateCompositionController:withLightingIdentifier:portraitInfo:spillMatteAllowed:", v4, v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1304), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1312));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "setLightingType:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "invalidateIntrinsicContentSize");
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "livePortraitBehaviorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "apertureSliderHasOffPosition");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "compositionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditEffectsSupport updateCompositionController:withDepthEnabled:livePortraitBehaviorController:](PUPhotoEditEffectsSupport, "updateCompositionController:withDepthEnabled:livePortraitBehaviorController:", v9, 1, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySideEffectsForAction:compositionController:", 1, v10);

  objc_msgSend(*(id *)(a1 + 40), "_restoreCachedLightingIntensity");
  objc_msgSend(*(id *)(a1 + 40), "_updateLightingMarkerForType:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_updateFocusOverlay");

}

uint64_t __67__PUPhotoEditPortraitToolController__updateLightingSliderAnimated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "setAlpha:", v1);
}

void __70__PUPhotoEditPortraitToolController__updateNavigationButtonsAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "superview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __67__PUPhotoEditPortraitToolController__setupLightingControlsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePortraitNavigationButtons:", v3);

}

void __64__PUPhotoEditPortraitToolController__setupDepthControlsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePortraitEffectButton:", v3);

}

void __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPortraitInfo:", v3);
  objc_msgSend(v4, "setStrength:", *(float *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D713C0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpillMatteAllowed:", v5);

}

void __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDepthInfo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setAperture:", *(float *)(a1 + 64));
  objc_msgSend(v5, "setFocusRect:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D71350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlassesMatteAllowed:", v3);

  objc_msgSend(*(id *)(a1 + 56), "depthInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v5, "setEnabled:", 0);

}

uint64_t __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 41))
    v3 = 1.0;
  else
    v3 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setAlpha:", v3);
}

uint64_t __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setHidden:", *(_BYTE *)(a1 + 41) == 0);
}

@end
