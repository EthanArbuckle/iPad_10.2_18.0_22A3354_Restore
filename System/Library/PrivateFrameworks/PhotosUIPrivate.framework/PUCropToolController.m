@implementation PUCropToolController

- (PUCropToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUCropToolController *v4;
  id v5;
  uint64_t v6;
  UIView *containerView;
  PUCropPerspectiveAdjustmentsDataSource *v8;
  PUCropPerspectiveAdjustmentsDataSource *dataSource;
  PUAdjustmentsViewController *v10;
  PUAdjustmentsViewController *adjustmentsViewController;
  PUCropToolControllerSpec *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUCropToolController;
  v4 = -[PUPhotoEditToolController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v6;

    v8 = objc_alloc_init(PUCropPerspectiveAdjustmentsDataSource);
    dataSource = v4->_dataSource;
    v4->_dataSource = v8;

    -[PUCropPerspectiveAdjustmentsDataSource setDelegate:](v4->_dataSource, "setDelegate:", v4);
    v10 = objc_alloc_init(PUAdjustmentsViewController);
    adjustmentsViewController = v4->_adjustmentsViewController;
    v4->_adjustmentsViewController = v10;

    -[PUAdjustmentsViewController setDelegate:](v4->_adjustmentsViewController, "setDelegate:", v4);
    -[PUAdjustmentsViewController setDataSource:](v4->_adjustmentsViewController, "setDataSource:", v4->_dataSource);
    -[PUAdjustmentsViewController setShouldDisplayMappedValues:](v4->_adjustmentsViewController, "setShouldDisplayMappedValues:", 0);
    v12 = objc_alloc_init(PUCropToolControllerSpec);
    -[PUPhotoEditToolController setToolControllerSpec:](v4, "setToolControllerSpec:", v12);

    v4->_needsMediaLoad = 1;
    v4->_needsImageLoad = 1;
    v4->_needsModelLoad = 1;
    -[PUPhotoEditToolController setHasMediaScrubber:](v4, "setHasMediaScrubber:", 1);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  CGImageRelease(self->_gainMapImage);
  -[PUCropToolController cropView](self, "cropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tearDownMediaViewAndLayers");

  v4.receiver = self;
  v4.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  PUCropToolControllerSpec *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *adjustmentPickerView;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
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
  NSString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id obj;
  id firstValue;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  PUCropToolController *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  objc_super v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _QWORD v136[2];
  _QWORD v137[4];

  v137[2] = *MEMORY[0x1E0C80C00];
  v133.receiver = self;
  v133.super_class = (Class)PUCropToolController;
  -[PUCropToolController viewDidLoad](&v133, sel_viewDidLoad);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PUCropToolControllerSpec);
  -[PUPhotoEditToolController setToolControllerSpec:](self, "setToolControllerSpec:", v3);

  -[PUCropToolController cropView](self, "cropView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropHandleViewsByHandle](self, "cropHandleViewsByHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumCropHandleViewSize");
  v11 = v10;
  v13 = v12;

  _NSDictionaryOfVariableBindings(CFSTR("cropView, containerView"), v4, v6, 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = CFSTR("handleWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = CFSTR("handleHeight");
  v137[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropCanvasView](self, "cropCanvasView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[PUCropToolController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v4;
  objc_msgSend(v18, "addSubview:", v4);

  -[PUCropToolController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v5;
  objc_msgSend(v19, "addSubview:", v5);

  -[PUCropToolController addChildViewController:](self, "addChildViewController:", self->_adjustmentsViewController);
  -[PUAdjustmentsViewController view](self->_adjustmentsViewController, "view");
  v20 = (UIView *)objc_claimAutoreleasedReturnValue();
  adjustmentPickerView = self->_adjustmentPickerView;
  self->_adjustmentPickerView = v20;

  v112 = v6;
  objc_msgSend(v6, "addSubview:", self->_adjustmentPickerView);
  -[PUCropToolController _updateCropActionButtons](self, "_updateCropActionButtons");
  v22 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v124 = self;
  -[PUCropToolController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v22;
  objc_msgSend(v23, "addSubview:", v22);

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v24 = v8;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v130 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        v30 = objc_msgSend(v29, "isLateral");
        -[PUCropToolController view](v124, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v30)
          objc_msgSend(v31, "insertSubview:belowSubview:", v29, v22);
        else
          objc_msgSend(v31, "insertSubview:aboveSubview:", v29, v22);

        _NSDictionaryOfVariableBindings(CFSTR("handleView"), v29, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "isRight") & 1) != 0 || objc_msgSend(v29, "isLeft"))
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[handleView(handleWidth)]"), 0x10000, v123, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addConstraints:", v34);

        }
        if ((objc_msgSend(v29, "isTop") & 1) != 0 || objc_msgSend(v29, "isBottom"))
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[handleView(handleHeight)]"), 0, v123, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addConstraints:", v35);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
    }
    while (v26);
  }

  objc_msgSend(v22, "removeFromSuperview");
  -[PUCropToolController view](v124, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[cropView]|"), 0x10000, v123, v115);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addConstraints:", v37);

  -[PUCropToolController view](v124, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[cropView]|"), 0, v123, v115);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addConstraints:", v39);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  obj = v24;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
  v41 = (void *)v5;
  if (v40)
  {
    v42 = v40;
    v120 = *(_QWORD *)v126;
    do
    {
      v43 = 0;
      v117 = v42;
      do
      {
        if (*(_QWORD *)v126 != v120)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v43);
        objc_msgSend(v44, "layoutReferenceItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "layoutReferenceItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "isCorner"))
        {
          if (objc_msgSend(v44, "isTop"))
            v47 = 3;
          else
            v47 = 4;
          if (objc_msgSend(v44, "isLeft"))
            v48 = 1;
          else
            v48 = 2;
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, v47, 0, v46, v47, 1.0, 0.0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v49);

          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, v48, 0, v46, v48, 1.0, 0.0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v50);

        }
        if (objc_msgSend(v44, "isLateral"))
        {
          objc_msgSend(v44, "adjacentHandles");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "layoutReferenceItem");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCropToolController cropHandleViewsByHandle](v124, "cropHandleViewsByHandle");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKeyedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "layoutReferenceItem");
          firstValue = (id)objc_claimAutoreleasedReturnValue();

          -[PUCropToolController cropHandleViewsByHandle](v124, "cropHandleViewsByHandle");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "layoutReferenceItem");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v44, "isTop") & 1) != 0 || objc_msgSend(v44, "isBottom"))
          {
            v60 = 0x10000;
            v61 = CFSTR("H");
          }
          else
          {
            v60 = 0;
            v61 = CFSTR("V");
          }
          if ((objc_msgSend(v44, "isTop") & 1) != 0)
          {
            v62 = 3;
          }
          else if ((objc_msgSend(v44, "isLeft") & 1) != 0)
          {
            v62 = 1;
          }
          else if (objc_msgSend(v44, "isRight"))
          {
            v62 = 2;
          }
          else
          {
            v62 = 4;
          }
          _NSDictionaryOfVariableBindings(CFSTR("adjacent1, handleItem, adjacent2"), firstValue, v52, v59, 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:[adjacent1][handleItem][adjacent2]"), v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v64, v60, 0, v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObjectsFromArray:", v65);

          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, v62, 0, v46, v62, 1.0, 0.0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v66);

          v41 = v116;
          v42 = v117;
        }

        ++v43;
      }
      while (v42 != v43);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
    }
    while (v42);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v121);
  -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
    goto LABEL_48;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "maintainCropAspectLockState");

  if (v69)
  {
    objc_msgSend(MEMORY[0x1E0D7BB48], "buttonWithType:", 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController setAspectRatioLockButton:](v124, "setAspectRatioLockButton:", v70);

    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addTarget:action:forControlEvents:", v124, sel__aspectLockButtonTapped, 64);

    -[PUCropToolController view](v124, "view");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", v74);

    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutReferenceItem");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78, 20.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setActive:", 1);

    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "rightAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutReferenceItem");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "rightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, -20.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setActive:", 1);

    -[PUCropToolController aspectRatioLockButton](v124, "aspectRatioLockButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setEnabled:", 1);
LABEL_48:

  }
  -[PUCropToolController updateAspectRatioLockButton](v124, "updateAspectRatioLockButton");
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v124, sel__accessibilityLongPressChanged_);
  objc_msgSend(v85, "setMinimumPressDuration:", 0.15);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "preferredContentSizeCategory");
  v87 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setEnabled:", UIContentSizeCategoryIsAccessibilityCategory(v87));

  -[PUCropToolController view](v124, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addGestureRecognizer:", v85);

  -[PUCropToolController setAccessibilityLongPressGestureRecognizer:](v124, "setAccessibilityLongPressGestureRecognizer:", v85);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObserver:selector:name:object:", v124, sel__preferredContentSizeCategoryChanged, *MEMORY[0x1E0DC48E8], 0);

  -[PUCropToolController view](v124, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController toolContainerView](v124, "toolContainerView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bringSubviewToFront:", v91);

  v92 = objc_alloc(MEMORY[0x1E0D0D028]);
  v93 = (void *)objc_msgSend(v92, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUCropToolController setBadgeView:](v124, "setBadgeView:", v93);

  -[PUCropToolController badgeView](v124, "badgeView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setUserInteractionEnabled:", 0);

  objc_msgSend(v114, "photoEditingBadgeViewFillColor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController badgeView](v124, "badgeView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "_setFillColor:", v95);

  objc_msgSend(v114, "photoEditingBadgeViewContentColor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController badgeView](v124, "badgeView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "_setContentColor:", v97);

  -[PUCropToolController badgeView](v124, "badgeView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "_setFillCornerRadius:", 4.0);

  -[PUCropToolController badgeView](v124, "badgeView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  v102 = v101 + 3.0;
  v104 = v103 + 3.0;
  v106 = v105 + 1.0;
  v108 = v107 + 1.0;
  -[PUCropToolController badgeView](v124, "badgeView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "_setTextInsets:", v108, v102, v106, v104);

  -[PUCropToolController view](v124, "view");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController badgeView](v124, "badgeView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "addSubview:", v111);

  -[PUCropToolController px_enableImageModulation](v124, "px_enableImageModulation");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[PUCropToolController setNeedsModelLoad:](self, "setNeedsModelLoad:", 1);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandardVideo");

  if (v5)
  {
    -[PUCropToolController createVideoScrubber](self, "createVideoScrubber");
    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[PUCropToolController playPauseButton](self, "playPauseButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

  }
  -[PUCropToolController setToolBadgeDoesHide:](self, "setToolBadgeDoesHide:", 1);
  -[PUCropToolController _updateCropActionButtons](self, "_updateCropActionButtons");
}

- (void)_layoutAdjustmentTools
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double MinX;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  UIView *adjustmentPickerView;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  double MinY;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double MaxY;
  void *v54;
  double v55;
  double v56;
  void *v57;
  id v58;
  _OWORD v59[3];
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v3 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentLayoutStyle");

  -[PUCropToolController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (v12 >= v14)
    v15 = v12;
  else
    v15 = v14;
  -[PUPhotoEditToolController setToolGradientDistance:](self, "setToolGradientDistance:", v15);
  if (v5 == 4)
  {
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 1);
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    MinX = CGRectGetMinX(v60);

    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "center");
    v21 = v20;

    -[PUCropToolController badgeView](self, "badgeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = MinX + v23 * -0.5 + -6.0;

    -[PUCropToolController badgeView](self, "badgeView");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCenter:", v24, v21);
  }
  else
  {
    if (v3 == 1)
    {
      -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 0);
      adjustmentPickerView = self->_adjustmentPickerView;
      v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v59[0] = *MEMORY[0x1E0C9BAA8];
      v59[1] = v26;
      v59[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](adjustmentPickerView, "setTransform:", v59);
      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frame");
      -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      UIRectGetCenter();
      -[UIView setCenter:](self->_adjustmentPickerView, "setCenter:");

      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      MinY = CGRectGetMinY(v61);

      UIRectGetCenter();
      v32 = v31;
      -[PUCropToolController badgeView](self, "badgeView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v35 = MinY + v34 * -0.5 + -6.0;

      -[PUCropToolController badgeView](self, "badgeView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCenter:", v32, v35);

      return;
    }
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 1);
    -[PUPhotoEditToolController delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "toolControllerMainContainerView:", self);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = v39;
    }
    else
    {
      -[PUCropToolController view](self, "view");
      v41 = (id)objc_claimAutoreleasedReturnValue();
    }
    v58 = v41;

    objc_msgSend(v58, "bounds");
    UIRectGetCenter();
    v43 = v42;
    -[PUCropToolController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "safeAreaInsets");
    v46 = v8 + v45;
    v48 = v10 + v47;
    v50 = v12 - (v45 + v49);
    v52 = v14 - (v47 + v51);

    v62.origin.x = v46;
    v62.origin.y = v48;
    v62.size.width = v50;
    v62.size.height = v52;
    MaxY = CGRectGetMaxY(v62);
    -[PUCropToolController badgeView](self, "badgeView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v56 = MaxY + v55 * -0.5;

    -[PUCropToolController badgeView](self, "badgeView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCenter:", v43, v56);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer");
  -[PUCropToolController cropView](self, "cropView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldEnableImageModulation:", objc_msgSend(v5, "toolControllerShouldEnableImageModulation:", self));

  -[PUCropToolController cropView](self, "cropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "toolControllerImageModulationOptions:", self);
  objc_msgSend(v6, "setImageModulationOptions:", v8, v9);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  BOOL v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  CGFloat Height;
  double v76;
  double v77;
  double v78;
  CGFloat Width;
  void *v80;
  double v81;
  void *v82;
  double v83;
  CGFloat MidX;
  double v85;
  double v86;
  double v87;
  BOOL v88;
  double v89;
  CGFloat v90;
  void *v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double MinX;
  CGFloat v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  CGFloat MinY;
  double v113;
  objc_super v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v114.receiver = self;
  v114.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController viewDidLayoutSubviews](&v114, sel_viewDidLayoutSubviews);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolControllerMainContainerView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PUCropToolController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[PUCropToolController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  UIRectGetCenter();
  objc_msgSend(v17, "convertPoint:fromView:", v7);
  v19 = v18;
  v21 = v20;

  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);

  -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[PUCropToolController cropView](self, "cropView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCanvasFrame:", v24, v26, v28, v30);

  if (-[PUCropToolController modelLoadingSuspended](self, "modelLoadingSuspended"))
    goto LABEL_9;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
    goto LABEL_9;
  v33 = (void *)v32;
  if (!-[PUCropToolController needsModelLoad](self, "needsModelLoad"))
  {
    -[PUCropToolController cropView](self, "cropView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[PUCropToolController cropViewFrameForLastModelLoad](self, "cropViewFrameForLastModelLoad");
    v129.origin.x = v43;
    v129.origin.y = v44;
    v129.size.width = v45;
    v129.size.height = v46;
    v115.origin.x = v36;
    v115.origin.y = v38;
    v115.size.width = v40;
    v115.size.height = v42;
    v47 = CGRectEqualToRect(v115, v129);

    if (!v47)
      goto LABEL_10;
LABEL_9:
    -[PUCropToolController cropView](self, "cropView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setNeedsLayout");

    goto LABEL_11;
  }

LABEL_10:
  -[PUCropToolController _loadStateFromModelAnimated:](self, "_loadStateFromModelAnimated:", 0);
LABEL_11:
  -[PUCropToolController _layoutAdjustmentTools](self, "_layoutAdjustmentTools");
  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "scrubberViewMargin");
  v51 = v50;
  v53 = v52;
  v55 = v54;

  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "cropWindowView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "frame");
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  objc_msgSend(v57, "superview");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "convertRect:fromView:", v67, v60, v62, v64, v66);
  v69 = v68;
  v71 = v70;
  v73 = v72;
  Height = v74;

  v116.origin.x = v69;
  v116.origin.y = v71;
  v116.size.width = v73;
  v116.size.height = Height;
  if (CGRectGetWidth(v116) < 210.0)
  {
    if (-[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation") == 1)
    {
      v117.origin.x = v69;
      v117.origin.y = v71;
      v117.size.width = v73;
      v117.size.height = Height;
      MinY = CGRectGetMinY(v117);
      objc_msgSend(v7, "frame");
      v76 = v55;
      v77 = v53;
      v78 = v51;
      Width = CGRectGetWidth(v118);
      v119.origin.x = v69;
      v119.origin.y = v71;
      v119.size.width = v73;
      v119.size.height = Height;
      Height = CGRectGetHeight(v119);
      v69 = 0.0;
      v73 = Width;
      v51 = v78;
      v53 = v77;
      v55 = v76;
      v71 = MinY;
    }
    else
    {
      -[PUCropToolController view](self, "view");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "frame");
      v81 = CGRectGetWidth(v120);
      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "frame");
      v83 = v81 - CGRectGetWidth(v121);

      v122.origin.x = v69;
      v122.origin.y = v71;
      v122.size.width = v73;
      v122.size.height = Height;
      MidX = CGRectGetMidX(v122);
      v85 = v83 - MidX + v83 - MidX;
      v123.origin.x = v69;
      v123.origin.y = v71;
      v123.size.width = v73;
      v123.size.height = Height;
      v86 = v85 - CGRectGetWidth(v123);
      v87 = v86 * 0.5;
      v88 = v86 == 0.0;
      if (v86 == 0.0)
        v86 = -0.0;
      v73 = v73 + v86;
      v89 = 0.0;
      if (!v88)
        v89 = v87;
      v69 = v69 - v89;
    }
  }
  v113 = v51;
  v124.origin.x = v69;
  v124.origin.y = v71;
  v124.size.width = v73;
  v124.size.height = Height;
  v90 = fmin(CGRectGetWidth(v124) - v51 - v55, 477.0);
  -[PUCropToolController videoScrubberView](self, "videoScrubberView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "intrinsicContentSize");
  v93 = v92;

  v125.origin.x = v69;
  v125.origin.y = v71;
  v125.size.width = v73;
  v125.size.height = Height;
  v94 = CGRectGetMidX(v125) + v90 * -0.5;
  v126.origin.x = v69;
  v126.origin.y = v71;
  v126.size.width = v73;
  v126.size.height = Height;
  v95 = CGRectGetMaxY(v126) - v93 - v53;
  -[PUCropToolController playPauseButton](self, "playPauseButton");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "sizeToFit");

  -[PUCropToolController playPauseButton](self, "playPauseButton");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "frame");
  v99 = v98;
  v101 = v100;

  v127.origin.x = v94;
  v127.origin.y = v95;
  v127.size.width = v90;
  v127.size.height = v93;
  MinX = CGRectGetMinX(v127);
  v128.origin.x = v94;
  v128.origin.y = v95;
  v128.size.width = v90;
  v128.size.height = v93;
  v103 = CGRectGetMinY(v128) + -7.0;
  -[PUCropToolController playPauseButton](self, "playPauseButton");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setFrame:", MinX, v103, v99, v101);

  -[PUCropToolController videoScrubberView](self, "videoScrubberView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setFrame:", v94 + v113 + v99, v95, v90 + (v113 + v99) * -2.0, v93);

  -[PUCropToolController videoScrubberView](self, "videoScrubberView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    -[PUCropToolController view](self, "view");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "bringSubviewToFront:", v108);

  }
  -[PUCropToolController playPauseButton](self, "playPauseButton");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    -[PUCropToolController view](self, "view");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController playPauseButton](self, "playPauseButton");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "bringSubviewToFront:", v111);

  }
}

- (void)updateViewConstraints
{
  objc_super v3;

  -[PUCropToolController _updateCropCanvasConstraintsIfNeeded](self, "_updateCropCanvasConstraintsIfNeeded");
  -[PUCropToolController _updateCropToggleConstraintsIfNeeded](self, "_updateCropToggleConstraintsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PUCropToolController;
  -[PUCropToolController updateViewConstraints](&v3, sel_updateViewConstraints);
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController setupWithAsset:compositionController:editSource:valuesCalculator:](&v10, sel_setupWithAsset_compositionController_editSource_valuesCalculator_, a3, a4, a5, a6);
  -[PUCropToolController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupWithCompositionController:valuesCalculator:", v8, v9);

}

- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3
{
  void *v4;

  objc_msgSend(a3, "selectedAdjustmentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController _updateBadgeTextWithInfo:](self, "_updateBadgeTextWithInfo:", v4);

  if (-[PUCropToolController toolBadgeDoesHide](self, "toolBadgeDoesHide"))
    -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer");
}

- (void)adjustmentsViewControllerToolWillBeginScrubbing:(id)a3
{
  if (-[PUCropToolController toolBadgeDoesHide](self, "toolBadgeDoesHide", a3))
    -[PUCropToolController showToolLabel](self, "showToolLabel");
}

- (void)adjustmentsViewControllerToolDidEndScrubbing:(id)a3
{
  if (-[PUCropToolController toolBadgeDoesHide](self, "toolBadgeDoesHide", a3))
    -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer");
}

- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3
{
  -[PUCropToolController showVideoScrubber:](self, "showVideoScrubber:", 0);
  -[PUCropToolController setTrackingAdjustmentControl:](self, "setTrackingAdjustmentControl:", 1);
  -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
}

- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
}

- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3
{
  -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer", a3);
  -[PUCropToolController setTrackingAdjustmentControl:](self, "setTrackingAdjustmentControl:", 0);
  -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
}

- (void)_updateBadgeTextWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PUCropToolController badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedUppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setText:", v7);

  -[PUCropToolController badgeView](self, "badgeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  -[PUCropToolController _layoutAdjustmentTools](self, "_layoutAdjustmentTools");
}

- (void)_invalidateConstraintsForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PUCropToolController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUCropToolController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pu_removeAllConstraintsForKey:", v5);

  }
}

- (BOOL)_hasConstraintsForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUCropToolController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pu_hasConstraintForKey:", v4);

  return v6;
}

- (void)_updateCropCanvasConstraintsIfNeeded
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
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
  id v35;

  if (!-[PUCropToolController _hasConstraintsForKey:](self, "_hasConstraintsForKey:", CFSTR("PUCropCanvasConstraints")))
  {
    -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "minimumCropInset");
    v5 = v4;

    v6 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 1)
    {
      objc_msgSend(v7, "standardBottomBarHeight");
      v10 = v9;
      v11 = v5;
      v12 = v5;
    }
    else
    {
      objc_msgSend(v7, "standardSideBarWidth");
      v11 = v13;

      -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cropAspectRatioScrollHeight");
      v10 = v15;

      -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "currentLayoutStyle");

      if (v17 == 4)
      {
        v12 = v11;
LABEL_8:
        -[PUCropToolController cropCanvasView](self, "cropCanvasView");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safeAreaLayoutGuide");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "leftAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "leftAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v24);

        objc_msgSend(v20, "rightAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "rightAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

        objc_msgSend(v20, "topAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "topAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -v5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v30);

        objc_msgSend(v20, "bottomAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bottomAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v33);

        -[PUCropToolController view](self, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pu_addConstraints:forKey:", v21, CFSTR("PUCropCanvasConstraints"));

        return;
      }
      -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cropAspectFlipperWidth");
      v12 = v18;
    }

    goto LABEL_8;
  }
}

- (void)_updateCropToggleConstraintsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
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
  uint64_t v28;
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
  uint64_t v43;
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
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;

  -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v67 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController cropAspectFlipperView](self, "cropAspectFlipperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUCropToolController _hasConstraintsForKey:](self, "_hasConstraintsForKey:", CFSTR("PUCropToggleConstraints")))
  {
    v5 = (void *)objc_opt_new();
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentLayoutStyle");

    v8 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    if (v8 == 2)
    {
      if (!v67)
      {
LABEL_12:
        -[PUCropToolController view](self, "view");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "pu_addConstraints:forKey:", v5, CFSTR("PUCropToggleConstraints"));

        goto LABEL_13;
      }
      objc_msgSend(v67, "rightAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "rightAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v32);

      if (v7 != 4)
      {
        objc_msgSend(v67, "topAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "topAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
        objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v47);

        objc_msgSend(v67, "bottomAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "bottomAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "constraintEqualToAnchor:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v51);

        objc_msgSend(v4, "leftAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "safeAreaLayoutGuide");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "leftAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "constraintEqualToAnchor:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v56);

        -[PUCropToolController view](self, "view");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "window");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "convertPoint:toView:", v59, 0.0, 0.0);
        v61 = v60;

        objc_msgSend(v4, "centerYAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController view](self, "view");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "centerYAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, v61 * -0.5);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v65);

        objc_msgSend(v4, "setLayoutOrientation:", 1);
        -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        v43 = 1;
        goto LABEL_11;
      }
      objc_msgSend(v67, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, -27.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v36);

      objc_msgSend(v67, "heightAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToConstant:", 38.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v38);

      objc_msgSend(v67, "leftAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leftAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 != 1 || !v67)
        goto LABEL_12;
      objc_msgSend(v67, "leftAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leftAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      objc_msgSend(v67, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

      objc_msgSend(v67, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -10.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v20);

      objc_msgSend(v67, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToConstant:", 38.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

      objc_msgSend(v4, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -17.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v25);

      objc_msgSend(v4, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerXAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (void *)v28;
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v40);

    objc_msgSend(v4, "setLayoutOrientation:", 0);
    -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    v43 = 0;
LABEL_11:
    objc_msgSend(v41, "setLayoutOrientation:", v43);

    goto LABEL_12;
  }
LABEL_13:

}

- (id)filter
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUCropToolController;
    -[PUPhotoEditToolController setDelegate:](&v6, sel_setDelegate_, v4);
  }

}

- (void)_performLocalModelChanges:(id)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changes != nil"));

  }
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 698, CFSTR("Need a composition to perform this operation"));

  }
  v6 = -[PUCropToolController isModelChangeLocal](self, "isModelChangeLocal");
  -[PUCropToolController setModelChangeLocal:](self, "setModelChangeLocal:", 1);
  v9[2]();
  -[PUCropToolController setModelChangeLocal:](self, "setModelChangeLocal:", v6);

}

- (void)_performLocalCropModelChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PUCropToolController__performLocalCropModelChanges___block_invoke;
  v6[3] = &unk_1E58AB968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUCropToolController _performLocalModelChanges:](self, "_performLocalModelChanges:", v6);

}

- (void)_createRendererIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  -[PUCropToolController renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController renderer](self, "renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v9;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D71990]);
    -[PUPhotoEditToolController editSource](self, "editSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithEditSource:renderPriority:", v8, 3);

    -[PUCropToolController setRenderer:](self, "setRenderer:", v9);
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    v6 = v5;
  }
  objc_msgSend(v4, "setCompositionController:", v6);

}

- (void)_loadImageIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *imageLoadingQueue;
  NSMutableArray *v9;
  NSMutableArray *imageLoadingQueueCompletionBlocks;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PUCropToolController *v15;
  SEL v16;
  _QWORD block[5];

  v4 = (void (**)(_QWORD))a3;
  if (!-[PUCropToolController needsImageLoad](self, "needsImageLoad"))
  {
    if (v4)
      v4[2](v4);
    goto LABEL_11;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[PUCropToolController imageLoadingQueue](self, "imageLoadingQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (OS_dispatch_queue *)dispatch_queue_create("PUCropToolController image loading", v6);
      imageLoadingQueue = self->_imageLoadingQueue;
      self->_imageLoadingQueue = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      imageLoadingQueueCompletionBlocks = self->_imageLoadingQueueCompletionBlocks;
      self->_imageLoadingQueueCompletionBlocks = v9;

    }
    if (v4)
    {
      -[PUCropToolController imageLoadingQueueCompletionBlocks](self, "imageLoadingQueueCompletionBlocks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _Block_copy(v4);
      objc_msgSend(v11, "addObject:", v12);

    }
    if (!-[PUCropToolController imageLoadingInProgress](self, "imageLoadingInProgress"))
    {
      -[PUCropToolController setImageLoadingInProgress:](self, "setImageLoadingInProgress:", 1);
      -[PUPhotoEditToolController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateProgressIndicatorAnimated:", 1);

      -[PUCropToolController imageLoadingQueue](self, "imageLoadingQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke;
      block[3] = &unk_1E58ABD10;
      block[4] = self;
      dispatch_async(v14, block);

    }
LABEL_11:

    return;
  }
  v15 = (PUCropToolController *)_PFAssertFailHandler();
  -[PUCropToolController _loadMediaIfNeeded](v15, v16);
}

- (void)_loadMediaIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  if (-[PUCropToolController needsMediaLoad](self, "needsMediaLoad"))
  {
    -[PUCropToolController setNeedsMediaLoad:](self, "setNeedsMediaLoad:", 0);
    -[PUPhotoEditToolController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController cropView](self, "cropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "isStandardVideo"))
    {
      v12 = 0uLL;
      v13 = 0;
      objc_msgSend(v3, "mediaView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "currentTime");
      }
      else
      {
        v12 = 0uLL;
        v13 = 0;
      }

      v10 = v12;
      v11 = v13;
      objc_msgSend(v4, "setVideoComposition:withSeekTime:", v6, &v10);
    }
    else if (objc_msgSend(v3, "isLoopingVideo"))
    {
      objc_msgSend(v4, "setAutoloopComposition:", v6);
    }
    -[PUCropToolController _installRenderedImageAndDisplayIfNeeded](self, "_installRenderedImageAndDisplayIfNeeded");

  }
}

- (void)_setupCropModelFromCompositionController:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NUCropModel *cropModel;
  NUCropModel *v8;
  NUCropModel *v9;
  NUCropModel *v10;
  NUCropModel *v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;

  objc_msgSend(a3, "cropAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v15 = v4;
    v6 = objc_msgSend(v4, "enabled");
    v5 = v15;
    if (v6)
    {
      cropModel = self->_cropModel;
      objc_msgSend(v15, "yawRadians");
      -[NUCropModel setYawRadians:](cropModel, "setYawRadians:");
      v8 = self->_cropModel;
      objc_msgSend(v15, "pitchRadians");
      -[NUCropModel setPitchRadians:](v8, "setPitchRadians:");
      v9 = self->_cropModel;
      objc_msgSend(v15, "angleRadians");
      -[NUCropModel setRollRadians:](v9, "setRollRadians:");
      v10 = self->_cropModel;
      objc_msgSend(v15, "cropRect");
      -[NUCropModel setCropRect:](v10, "setCropRect:");
      v11 = self->_cropModel;
      objc_msgSend(v15, "cropRect");
      v13 = (uint64_t)v12;
      objc_msgSend(v15, "cropRect");
      -[NUCropModel setAspectRatio:](v11, "setAspectRatio:", v13, (uint64_t)v14);
      v5 = v15;
    }
  }

}

- (void)_handleDidCreateEditedImage:(id)a3 inputExtent:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NUCropModel *v13;
  NUCropModel *cropModel;
  NUCropModel *v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;
  id v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = a3;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "imageOrientation");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717B0]), "initWithInputSize:inputOrientation:", v10, width, height);
  -[PUCropToolController setGeometry:](self, "setGeometry:", v11);
  -[PUCropToolController cropView](self, "cropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (width > 0.0 && height > 0.0)
  {
    v13 = (NUCropModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52080]), "initWithMasterImageSize:", width, height);
    cropModel = self->_cropModel;
    self->_cropModel = v13;

    v15 = self->_cropModel;
    -[NUCropModel masterImageSize](v15, "masterImageSize");
    v17 = (uint64_t)v16;
    -[NUCropModel masterImageSize](self->_cropModel, "masterImageSize");
    -[NUCropModel setAspectRatio:](v15, "setAspectRatio:", v17, (uint64_t)v18);
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController _setupCropModelFromCompositionController:](self, "_setupCropModelFromCompositionController:", v19);

    objc_msgSend(v12, "_setCropModel:", self->_cropModel);
    if (!v20)
    {
      objc_msgSend(v12, "setImageSize:", width, height);
      goto LABEL_8;
    }
    objc_msgSend(v12, "setImage:", v20);
    goto LABEL_6;
  }
  if (v20)
LABEL_6:
    -[PUCropToolController setImage:](self, "setImage:", v20);
LABEL_8:
  -[PUCropToolController setInputExtent:](self, "setInputExtent:", x, y, width, height);
  -[PUCropToolController _installRenderedImageAndDisplayIfNeeded](self, "_installRenderedImageAndDisplayIfNeeded");

}

- (void)setViewCropRect:(CGRect)a3
{
  -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStraightenAngle:(double)a3
{
  -[PUCropToolController _setStraightenAngle:animated:](self, "_setStraightenAngle:animated:", 0, a3);
}

- (void)setPitchAngle:(double)a3
{
  -[PUCropToolController _setPitchAngle:animated:](self, "_setPitchAngle:animated:", 0, a3);
}

- (void)setYawAngle:(double)a3
{
  -[PUCropToolController _setYawAngle:animated:](self, "_setYawAngle:animated:", 0, a3);
}

- (void)setCropAspect:(id)a3
{
  -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", a3, 0);
}

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;
  id v6;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    -[PUCropToolController cropView](self, "cropView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGainMapImage:", self->_gainMapImage);

  }
}

- (void)setGainMapValue:(float)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PUCropToolController cropView](self, "cropView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController gainMapValue](self, "gainMapValue");
    objc_msgSend(v5, "setGainMapValue:");

  }
}

- (void)_performGeometryChange:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double height;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;
  CGAffineTransform v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  _QWORD v63[5];
  id v64;
  CGRect v65;
  CGRect v66;

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  -[PUCropToolController geometry](self, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "appliedOrientation");
  v6[2](v6, v7);

  v9 = objc_msgSend(v7, "appliedOrientation");
  -[PUCropToolController cropView](self, "cropView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOrientation:", v9);

  -[PUCropToolController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOrientation:", v9);

  if (v8 != v9)
  {
    -[PUAdjustmentsViewController resetControls](self->_adjustmentsViewController, "resetControls");
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    v12 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke;
    v63[3] = &unk_1E58ABCA8;
    v63[4] = self;
    v13 = v7;
    v64 = v13;
    -[PUCropToolController _performLocalModelChanges:](self, "_performLocalModelChanges:", v63);
    memset(&v62, 0, sizeof(v62));
    if (v13)
      objc_msgSend(v13, "transformFromOrientation:", v8);
    else
      memset(&v62, 0, 32);
    *(_OWORD *)&v62.tx = 0uLL;
    -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame", 3221225472);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PUCropToolController viewCropRect](self, "viewCropRect");
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    v61 = v62;
    v66 = CGRectApplyAffineTransform(v65, &v61);
    v26 = PURectWithSizeThatFitsInRect(v66.size.width, v66.size.height, v15, v17, v19, v21);
    v30 = PURoundRectToPixel(v26, v27, v28, v29);
    if (v4)
    {
      v34 = v30;
      v35 = v31;
      v36 = v32;
      v37 = v33;
      -[PUCropToolController rotateSnapshotView](self, "rotateSnapshotView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        -[PUCropToolController cropView](self, "cropView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, x, y, width, height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUCropToolController setRotateSnapshotView:](self, "setRotateSnapshotView:", v38);
        -[PUCropToolController view](self, "view");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addSubview:", v38);

        objc_msgSend(v38, "setFrame:", x, y, width, height);
      }
      -[PUCropToolController setRotatingAnimationCount:](self, "setRotatingAnimationCount:", -[PUCropToolController rotatingAnimationCount](self, "rotatingAnimationCount") + 1);
      -[PUCropToolController setContentViewsHidden:](self, "setContentViewsHidden:", 1);
      v41 = (void *)MEMORY[0x1E0DC3F10];
      v54[0] = v12;
      v54[1] = v51;
      v54[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_3;
      v54[3] = &unk_1E58A59F0;
      v42 = v38;
      v56 = v62;
      v55 = v42;
      v57 = v34;
      v58 = v35;
      v59 = v36;
      v60 = v37;
      v52[0] = v12;
      v52[1] = v51;
      v52[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_4;
      v52[3] = &unk_1E58AAE08;
      v52[4] = self;
      v53 = v42;
      v43 = v42;
      objc_msgSend(v41, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v54, v52);

    }
    -[PUCropToolController cropAspect](self, "cropAspect", v30);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = PLOrientationBetweenOrientations();
    v46 = v45;
    if (v44 && (unint64_t)(v45 - 5) <= 3)
    {
      objc_msgSend(v44, "inverseAspect");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController setCropAspect:](self, "setCropAspect:", v47);

      -[PUCropToolController _recomposeCropRectAnimated:](self, "_recomposeCropRectAnimated:", 0);
      v48 = v46 - 2;
    }
    else
    {
      -[PUCropToolController _recomposeCropRectAnimated:](self, "_recomposeCropRectAnimated:", 0);
      v48 = v46 - 2;
      if ((unint64_t)(v46 - 2) > 6)
      {
        v49 = CFSTR("PHOTOEDIT_CROP_GENERIC_ACTION_TITLE");
        goto LABEL_15;
      }
    }
    v49 = off_1E589E128[v48];
LABEL_15:
    PULocalizedString(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v50);

  }
}

- (void)_removeSnapshotView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PUCropToolController rotateSnapshotView](self, "rotateSnapshotView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PUCropToolController setRotateSnapshotView:](self, "setRotateSnapshotView:", 0);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLoopingVideo");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__PUCropToolController__removeSnapshotView___block_invoke;
    v12[3] = &unk_1E58ABD10;
    v13 = v4;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __44__PUCropToolController__removeSnapshotView___block_invoke_2;
    v10[3] = &unk_1E58A9910;
    v11 = v13;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v12, v10, 0.5);

  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
  }

}

- (void)_setCropAspect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_cropAspect) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cropAspect, a3);
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __48__PUCropToolController__setCropAspect_animated___block_invoke;
    v42 = &unk_1E58A4638;
    v7 = v7;
    v43 = v7;
    -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", &v39);
    if (v7 && -[PUCropToolController isActiveTool](self, "isActiveTool"))
    {
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[NUCropModel masterImageRect](self->_cropModel, "masterImageRect");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[PUCropToolController geometry](self, "geometry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isSizeInverted");

      if (v25)
      {
        objc_msgSend(v7, "inverseAspect");
        v26 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v26;
      }
      -[PUCropToolController straightenAngle](self, "straightenAngle");
      objc_msgSend(v7, "constrainRect:boundingRect:boundingAngle:minSize:", v9, v11, v13, v15, v17, v19, v21, v23, v27, *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8), v39, v40, v41, v42);
      -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      -[PUCropToolController cropView](self, "cropView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setImageCropRectFromViewCropRect:animated:", v4, v29, v31, v33, v35);

      -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v4, v29, v31, v33, v35);
      -[PUCropToolController cropView](self, "cropView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      objc_msgSend(v37, "setModelCropRect:viewCropRect:");

      -[PUCropToolController cropView](self, "cropView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "updateLayerTransformsAnimated:", v4);

    }
    -[PUCropToolController _updateAspectRatioControls](self, "_updateAspectRatioControls");
    -[PUCropToolController _updateCropActionButtons](self, "_updateCropActionButtons");
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
    -[PUCropToolController aspectRatioLockChanged](self, "aspectRatioLockChanged");

  }
}

- (void)_setViewCropRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  CGRect *p_viewCropRect;
  void *v11;
  double v12;
  CGSize size;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  CGPoint v18;
  CGSize v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  CGPoint origin;
  CGSize v26;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewCropRect = &self->_viewCropRect;
  if ((PURectIsApproximatelyEqualToRect() & 1) == 0)
  {
    -[PUCropToolController _cancelAnimationForKeyPath:](self, "_cancelAnimationForKeyPath:", CFSTR("_imageCropRect"));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController _setAnimationTarget:forKeyPath:](self, "_setAnimationTarget:forKeyPath:", v11, CFSTR("_imageCropRect"));

    v12 = (double)!v4;
    size = p_viewCropRect->size;
    origin = p_viewCropRect->origin;
    v26 = size;
    p_viewCropRect->origin.x = x;
    p_viewCropRect->origin.y = y;
    p_viewCropRect->size.width = width;
    p_viewCropRect->size.height = height;
    v14 = MEMORY[0x1E0C809B0];
    if (self->_cropModel)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke;
      v24[3] = &unk_1E58A4638;
      v24[4] = self;
      -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v24);
    }
    v17[0] = v14;
    v18 = origin;
    v17[1] = 3221225472;
    v17[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke_2;
    v17[3] = &unk_1E589DF28;
    v19 = v26;
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
    v17[4] = self;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke_3;
    v16[3] = &unk_1E58A9910;
    v16[4] = self;
    -[PUCropToolController _animateValueFromValue:toValue:interpolation:completion:](self, "_animateValueFromValue:toValue:interpolation:completion:", v17, v16, v12, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController _setAnimation:forKeyPath:](self, "_setAnimation:forKeyPath:", v15, CFSTR("_imageCropRect"));
    -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");

  }
}

- (void)_setStraightenAngle:(double)a3 animated:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];

  if (vabdd_f64(a3, self->_straightenAngle) >= *MEMORY[0x1E0D523B8])
  {
    self->_straightenAngle = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PUCropToolController__setStraightenAngle_animated___block_invoke;
    v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&v7[4] = a3;
    -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v7);
    -[PUCropToolController cropView](self, "cropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStraightenAngle:", a3);

    -[PUAdjustmentsViewController updateControls](self->_adjustmentsViewController, "updateControls");
    -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  }
}

- (void)_setPitchAngle:(double)a3 animated:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];

  if (vabdd_f64(a3, self->_pitchAngle) >= *MEMORY[0x1E0D523B8])
  {
    self->_pitchAngle = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PUCropToolController__setPitchAngle_animated___block_invoke;
    v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&v7[4] = a3;
    -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v7);
    -[PUCropToolController cropView](self, "cropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPitchAngle:", a3);

    -[PUAdjustmentsViewController updateControls](self->_adjustmentsViewController, "updateControls");
    -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  }
}

- (void)_setYawAngle:(double)a3 animated:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];

  if (vabdd_f64(a3, self->_yawAngle) >= *MEMORY[0x1E0D523B8])
  {
    self->_yawAngle = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PUCropToolController__setYawAngle_animated___block_invoke;
    v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&v7[4] = a3;
    -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v7);
    -[PUCropToolController cropView](self, "cropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setYawAngle:", a3);

    -[PUAdjustmentsViewController updateControls](self->_adjustmentsViewController, "updateControls");
    -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  }
}

- (void)_cancelAnimationForKeyPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUCropToolController _animationForKeyPath:](self, "_animationForKeyPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[PUCropToolController _setAnimation:forKeyPath:](self, "_setAnimation:forKeyPath:", 0, v5);
}

- (id)_animationForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUCropToolController animationsByKeyPath](self, "animationsByKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setAnimation:(id)a3 forKeyPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUCropToolController animationsByKeyPath](self, "animationsByKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (id)_animationTargetForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUCropToolController animationTargetsByKeyPath](self, "animationTargetsByKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setAnimationTarget:(id)a3 forKeyPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUCropToolController animationTargetsByKeyPath](self, "animationTargetsByKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)setGridVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_gridVisible = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PUCropGridVisible"));

}

- (NSMutableDictionary)animationsByKeyPath
{
  NSMutableDictionary *animationsByKeyPath;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  animationsByKeyPath = self->_animationsByKeyPath;
  if (!animationsByKeyPath)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_animationsByKeyPath;
    self->_animationsByKeyPath = v4;

    animationsByKeyPath = self->_animationsByKeyPath;
  }
  return animationsByKeyPath;
}

- (NSMutableDictionary)animationTargetsByKeyPath
{
  NSMutableDictionary *animationTargetsByKeyPath;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  animationTargetsByKeyPath = self->_animationTargetsByKeyPath;
  if (!animationTargetsByKeyPath)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_animationTargetsByKeyPath;
    self->_animationTargetsByKeyPath = v4;

    animationTargetsByKeyPath = self->_animationTargetsByKeyPath;
  }
  return animationTargetsByKeyPath;
}

- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6
{
  void (**v10)(_QWORD, double);
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];
  void (**v17)(_QWORD, double);
  void (**v18)(id, uint64_t);
  double v19;
  _QWORD v20[4];
  void (**v21)(_QWORD, double);

  v10 = (void (**)(_QWORD, double))a5;
  v11 = (void (**)(id, uint64_t))a6;
  if (a3 == a4)
  {
    v10[2](v10, a4);
    if (v11)
      v11[2](v11, 1);
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", a3, 0.0, a4, 300.0, 1.0, 0.01);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke;
    v20[3] = &unk_1E589E600;
    v21 = v10;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke_2;
    v16[3] = &unk_1E589DF70;
    v17 = v21;
    v19 = a4;
    v18 = v11;
    v16[4] = self;
    objc_msgSend(v12, "runWithValueApplier:completion:", v20, v16);

  }
  return v12;
}

- (void)_updatePreviewViewInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double MaxX;
  double v42;
  double v43;
  double v44;
  double v45;
  double MinX;
  double MaxY;
  double v48;
  double MinY;
  double v50;
  CGFloat v51;
  CGFloat v52;
  id v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[PUCropToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v52 = v5;
  v53 = v4;
  v7 = v6;
  v51 = v8;

  -[PUCropToolController viewCropRect](self, "viewCropRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUCropToolController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropView](self, "cropView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:fromView:", v18, v10, v12, v14, v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v55.origin.x = v20;
  v55.origin.y = v22;
  v55.size.width = v24;
  v55.size.height = v26;
  if (!CGRectIsEmpty(v55)
    || ((-[PUCropToolController previewViewInsets](self, "previewViewInsets"),
         v30 == *(double *)(MEMORY[0x1E0DC49E8] + 8))
      ? (v31 = v27 == *MEMORY[0x1E0DC49E8])
      : (v31 = 0),
        v31 ? (v32 = v29 == *(double *)(MEMORY[0x1E0DC49E8] + 24)) : (v32 = 0),
        v32 ? (v33 = v28 == *(double *)(MEMORY[0x1E0DC49E8] + 16)) : (v33 = 0),
        v33))
  {
    v56.origin.x = v20;
    v56.origin.y = v22;
    v56.size.width = v24;
    v56.size.height = v26;
    if (CGRectIsEmpty(v56))
    {
      -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "standardBottomBarHeight");
      v36 = v35;

      v37 = 0.0;
      v38 = 0.0;
      v39 = 0.0;
    }
    else
    {
      v57.origin.x = v20;
      v57.origin.y = v22;
      v57.size.width = v24;
      v57.size.height = v26;
      MinY = CGRectGetMinY(v57);
      *(_QWORD *)&v58.origin.x = v53;
      v58.origin.y = v7;
      v58.size.width = v52;
      v58.size.height = v51;
      v50 = MinY - CGRectGetMinY(v58);
      *(_QWORD *)&v59.origin.x = v53;
      v59.origin.y = v7;
      v59.size.width = v52;
      v59.size.height = v51;
      MaxY = CGRectGetMaxY(v59);
      v60.origin.x = v20;
      v60.origin.y = v22;
      v60.size.width = v24;
      v60.size.height = v26;
      v48 = MaxY - CGRectGetMaxY(v60);
      v61.origin.x = v20;
      v61.origin.y = v22;
      v61.size.width = v24;
      v61.size.height = v26;
      MinX = CGRectGetMinX(v61);
      *(_QWORD *)&v62.origin.x = v53;
      v62.origin.y = v7;
      v62.size.width = v52;
      v62.size.height = v51;
      v40 = MinX - CGRectGetMinX(v62);
      *(_QWORD *)&v63.origin.x = v53;
      v63.origin.y = v7;
      v63.size.width = v52;
      v36 = v48;
      v39 = v50;
      v63.size.height = v51;
      v38 = v40;
      MaxX = CGRectGetMaxX(v63);
      v64.origin.x = v20;
      v64.origin.y = v22;
      v64.size.width = v24;
      v64.size.height = v26;
      v37 = MaxX - CGRectGetMaxX(v64);
    }
    -[PUCropToolController previewViewInsets](self, "previewViewInsets", *(_QWORD *)&MinX);
    if (v38 != v45 || v39 != v42 || v37 != v44 || v36 != v43)
    {
      -[PUCropToolController setPreviewViewInsets:](self, "setPreviewViewInsets:", v39, v38, v36, v37);
      -[PUPhotoEditToolController delegate](self, "delegate");
      v54 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "toolController:didChangePreferredPreviewViewInsetsAnimated:", self, 0);

    }
  }
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController compositionControllerDidChangeForAdjustments:](&v10, sel_compositionControllerDidChangeForAdjustments_, v4);
  -[PUCropPerspectiveAdjustmentsDataSource compositionControllerDidChange](self->_dataSource, "compositionControllerDidChange");
  if (!-[PUCropToolController isModelChangeLocal](self, "isModelChangeLocal")
    && -[PUCropToolController isActiveTool](self, "isActiveTool"))
  {
    -[PUCropToolController _loadStateFromModelAnimated:](self, "_loadStateFromModelAnimated:", 1);
  }
  if ((objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D71328]) & 1) == 0
    && (objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D71390]) & 1) == 0)
  {
    -[PUCropToolController basePhotoInvalidated](self, "basePhotoInvalidated");
    -[PUCropToolController baseMediaInvalidated](self, "baseMediaInvalidated");
  }
  -[PUPhotoEditToolController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStandardVideo");

  if (v6)
  {
    -[PUCropToolController _beginObservingVideoPlayer](self, "_beginObservingVideoPlayer");
    -[PUCropToolController cropView](self, "cropView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoMediaView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pause");

    -[PUCropToolController _updateVideoScrubber](self, "_updateVideoScrubber");
  }

}

- (void)_loadStateFromModelAnimated:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke;
  v3[3] = &unk_1E58AA4F0;
  v3[4] = self;
  v3[5] = a2;
  v4 = a3;
  -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", v3);
}

- (BOOL)setLockedCropAspectIfNeededIgnoringCurrentLock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v3 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maintainCropAspectLockState");

  if (v6)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cropAdjustmentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "cropRect");
    v10 = v9;
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("PUPhotoEditCropAspectRatioLocked2"));

    -[NUCropModel masterImageRect](self->_cropModel, "masterImageRect");
    if (v10 == v15)
    {
      -[NUCropModel masterImageRect](self->_cropModel, "masterImageRect");
      v17 = v12 == v16;
    }
    else
    {
      v17 = 0;
    }
    v19 = objc_msgSend(v8, "constraintWidth") < 1 || objc_msgSend(v8, "constraintHeight") < 1;
    v18 = v14 & v17 & (v19 || v3);
    if (v18 == 1)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "toolControllerOriginalOrientedImageSize:", self);
      v22 = v21;
      v24 = v23;

      +[PUCropAspect originalAspectForWidth:height:](PUCropAspect, "originalAspectForWidth:height:", (unint64_t)v22, (unint64_t)v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", v25, 0);

    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  return v18;
}

- (double)_defaultStraightenAngle
{
  return 0.0;
}

- (double)_defaultPitchAngle
{
  return 0.0;
}

- (double)_defaultYawAngle
{
  return 0.0;
}

- (int64_t)_defaultOrientation
{
  return 1;
}

- (CGRect)_defaultImageCropRect
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PUCropToolController cropModel](self, "cropModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "masterImageRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_defaultViewCropRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PUCropToolController _defaultImageCropRect](self, "_defaultImageCropRect");
  -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_resetAllValuesAnimated:(BOOL)a3
{
  -[PUCropToolController _resetAllValuesAnimated:skipLayerTransformUpdate:](self, "_resetAllValuesAnimated:skipLayerTransformUpdate:", a3, 0);
}

- (void)_resetAllValuesAnimated:(BOOL)a3 skipLayerTransformUpdate:(BOOL)a4
{
  _BOOL4 v5;
  int64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  _QWORD v57[8];
  CGRect v58;
  CGRect v59;

  v5 = a3;
  v7 = -[PUCropToolController _defaultOrientation](self, "_defaultOrientation");
  -[PUCropToolController geometry](self, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "appliedOrientation");

  -[PUCropToolController _defaultStraightenAngle](self, "_defaultStraightenAngle");
  v11 = v10;
  -[PUCropToolController straightenAngle](self, "straightenAngle");
  v56 = v12;
  -[PUCropToolController _defaultPitchAngle](self, "_defaultPitchAngle");
  v14 = v13;
  -[PUCropToolController pitchAngle](self, "pitchAngle");
  v16 = v15;
  -[PUCropToolController _defaultYawAngle](self, "_defaultYawAngle");
  v18 = v17;
  -[PUCropToolController yawAngle](self, "yawAngle");
  v20 = v18 == v19;
  -[PUCropToolController _defaultImageCropRect](self, "_defaultImageCropRect");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v59.origin.x = v29;
  v59.origin.y = v30;
  v59.size.width = v31;
  v59.size.height = v32;
  v58.origin.x = v22;
  v58.origin.y = v24;
  v33 = v18;
  v58.size.width = v26;
  v58.size.height = v28;
  v34 = !CGRectEqualToRect(v58, v59);
  if (v7 == v9)
    v34 = 1;
  if (v11 != v56)
    v34 = 1;
  if (v14 != v16)
    v34 = 1;
  if (v34)
    v35 = v7 == v9;
  else
    v35 = v20;
  v36 = v35 & v5;
  -[PUCropToolController cropView](self, "cropView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_resetCropRect");

  self->_straightenAngle = v11;
  self->_pitchAngle = v14;
  self->_yawAngle = v18;
  -[PUCropToolController _defaultViewCropRect](self, "_defaultViewCropRect");
  -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v36);
  -[PUCropToolController cropView](self, "cropView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[PUCropToolController viewCropRect](self, "viewCropRect");
  objc_msgSend(v38, "setModelCropRect:viewCropRect:", v40, v42, v44, v46, v47, v48, v49, v50);

  if (!a4)
  {
    -[PUCropToolController cropView](self, "cropView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "updateLayerTransformsAnimated:", v36);

  }
  -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);
  -[PUCropToolController setHasAppliedPerspectiveSuggestion:](self, "setHasAppliedPerspectiveSuggestion:", 0);
  -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  -[PUCropToolController cropModel](self, "cropModel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "makeCurrentAspectRatioFreeForm");

  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __73__PUCropToolController__resetAllValuesAnimated_skipLayerTransformUpdate___block_invoke;
  v57[3] = &unk_1E589DFB8;
  v57[4] = self;
  *(double *)&v57[5] = v14;
  *(double *)&v57[6] = v33;
  *(double *)&v57[7] = v11;
  -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v57);
  if (!-[PUCropToolController setLockedCropAspectIfNeededIgnoringCurrentLock:](self, "setLockedCropAspectIfNeededIgnoringCurrentLock:", 1))
  {
    -[PUCropToolController setCropAspect:](self, "setCropAspect:", 0);
    -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCurrentCropAspect:", 0);

  }
  -[PUCropToolController adjustmentsViewController](self, "adjustmentsViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "resetControls");

  -[PUPhotoEditToolController aggregateSession](self, "aggregateSession");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "notifyDidResetCrop");

  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
}

- (void)baseMediaInvalidated
{
  -[PUCropToolController setNeedsMediaLoad:](self, "setNeedsMediaLoad:", 1);
  if (-[PUCropToolController isActiveTool](self, "isActiveTool"))
    -[PUCropToolController _loadMediaIfNeeded](self, "_loadMediaIfNeeded");
}

- (void)basePhotoInvalidated
{
  -[PUCropToolController setNeedsImageLoad:](self, "setNeedsImageLoad:", 1);
  if (-[PUCropToolController isActiveTool](self, "isActiveTool"))
    -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", 0);
}

- (void)_loadCropSuggestionIfNeeded
{
  void *v3;
  int v4;
  _QWORD v5[5];

  if (!-[PUCropToolController hasAutoAppliedCropSuggestion](self, "hasAutoAppliedCropSuggestion")
    && !-[PUCropToolController hasRequestedCropSuggestion](self, "hasRequestedCropSuggestion"))
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autoCropEnabled");

    if (v4)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __51__PUCropToolController__loadCropSuggestionIfNeeded__block_invoke;
      v5[3] = &unk_1E58ABD10;
      v5[4] = self;
      -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", v5);
    }
  }
}

- (void)_autoApplyCropAndPerspectiveSuggestionIfNeeded
{
  if ((!-[PUCropToolController hasAutoAppliedCropSuggestion](self, "hasAutoAppliedCropSuggestion")
     || !-[PUCropToolController hasAppliedPerspectiveSuggestion](self, "hasAppliedPerspectiveSuggestion"))
    && (-[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion")
     || -[PUCropToolController _hasPerspectiveSuggestion](self, "_hasPerspectiveSuggestion")))
  {
    -[PUCropToolController _applyCropAndPerspectiveSuggestion](self, "_applyCropAndPerspectiveSuggestion");
    -[PUCropToolController setHasAutoAppliedCropSuggestion:](self, "setHasAutoAppliedCropSuggestion:", 1);
    -[PUCropToolController setHasAutoAppliedPerspectiveSuggestion:](self, "setHasAutoAppliedPerspectiveSuggestion:", 1);
  }
}

- (void)_applyCropRect:(CGRect)a3 straightenAngle:(double)a4 pitchAngle:(double)a5 yawAngle:(double)a6 isAutoCrop:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[8];
  BOOL v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v38 = *MEMORY[0x1E0C9D648];
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  else
  {
    -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:", x, y, width, height);
    v37 = v17;
    v38 = v16;
    v35 = v19;
    v36 = v18;
  }
  self->_straightenAngle = a4;
  self->_yawAngle = a6;
  self->_pitchAngle = a5;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  if (!CGRectIsEmpty(v41))
    -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", x, y, width, height);
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v20 = v42.origin.x;
  v21 = v42.origin.y;
  v22 = v42.size.width;
  v23 = v42.size.height;
  v24 = CGRectGetWidth(v42);
  v43.origin.x = v20;
  v43.origin.y = v21;
  v43.size.width = v22;
  v43.size.height = v23;
  v25 = v24 * CGRectGetHeight(v43);
  -[NUCropModel setRollAngle:constrainCropRectWithTargetArea:](self->_cropModel, "setRollAngle:constrainCropRectWithTargetArea:", a4, v25);
  -[NUCropModel setYawAngle:constrainCropRectWithTargetArea:](self->_cropModel, "setYawAngle:constrainCropRectWithTargetArea:", a6, v25);
  -[NUCropModel setPitchAngle:constrainCropRectWithTargetArea:](self->_cropModel, "setPitchAngle:constrainCropRectWithTargetArea:", a5, v25);
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUCropToolController cropView](self, "cropView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStraightenAngle:", a4);

  -[PUCropToolController cropView](self, "cropView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setYawAngle:", a6);

  -[PUCropToolController cropView](self, "cropView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPitchAngle:", a5);

  v44.origin.x = v38;
  v44.origin.y = v37;
  v44.size.width = v36;
  v44.size.height = v35;
  if (!CGRectIsEmpty(v44))
  {
    -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", 1, v38, v37, v36, v35);
    -[PUCropToolController cropView](self, "cropView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    objc_msgSend(v29, "setModelCropRect:viewCropRect:");

  }
  -[PUCropToolController cropView](self, "cropView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "updateLayerTransformsAnimated:", 1);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __86__PUCropToolController__applyCropRect_straightenAngle_pitchAngle_yawAngle_isAutoCrop___block_invoke;
  v39[3] = &unk_1E589DFE0;
  *(double *)&v39[5] = a4;
  *(double *)&v39[6] = a5;
  *(double *)&v39[7] = a6;
  v39[4] = self;
  v40 = v7;
  -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v39);
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_GENERIC_ACTION_TITLE"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v31);

  if (v7)
  {
    -[PUPhotoEditToolController aggregateSession](self, "aggregateSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "notifyDidApplyAutoCrop");

    if (a5 != 0.0 || a6 != 0.0)
    {
      -[PUPhotoEditToolController aggregateSession](self, "aggregateSession");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "notifyDidApplyPerspectiveAutoCrop");

    }
  }
  self->_hasAppliedPerspectiveSuggestion = v7;
  self->_hasAppliedCropSuggestion = v7;
  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
  -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
  -[PUCropToolController adjustmentsViewController](self, "adjustmentsViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "resetControls");

}

- (void)_applyCropAndPerspectiveSuggestion
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
  double v12;
  double v13;
  double v14;
  double v15;

  -[PUCropToolController suggestedCrop](self, "suggestedCrop");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUCropToolController suggestedStraightenAngle](self, "suggestedStraightenAngle");
  v12 = v11;
  -[PUCropToolController suggestedPitchAngle](self, "suggestedPitchAngle");
  v14 = v13;
  -[PUCropToolController suggestedYawAngle](self, "suggestedYawAngle");
  -[PUCropToolController _applyCropRect:straightenAngle:pitchAngle:yawAngle:isAutoCrop:](self, "_applyCropRect:straightenAngle:pitchAngle:yawAngle:isAutoCrop:", 1, v4, v6, v8, v10, v12, v14, v15);
}

- (BOOL)_hasCropSuggestion
{
  CGRect v3;

  -[PUCropToolController suggestedCrop](self, "suggestedCrop");
  return !CGRectIsEmpty(v3);
}

- (void)_toggleCropAndPerspective
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  int v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  int v11;

  v3 = -[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion");
  v4 = -[PUCropToolController _hasPerspectiveSuggestion](self, "_hasPerspectiveSuggestion");
  if (v4)
  {
    v5 = -[PUCropToolController hasAppliedPerspectiveSuggestion](self, "hasAppliedPerspectiveSuggestion");
    v6 = !-[PUCropToolController hasAppliedPerspectiveSuggestion](self, "hasAppliedPerspectiveSuggestion");
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if (-[PUCropToolController canResetToDefaultValue](self, "canResetToDefaultValue"))
    v7 = v6 | !v4;
  else
    v7 = 0;
  if (v3)
  {
    v8 = -[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion");
    v9 = !-[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion");
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = -[PUCropToolController canResetToDefaultValue](self, "canResetToDefaultValue");
  v11 = v9 | !v3;
  if (!v10)
    v11 = 0;
  if (v8 || v5 || !v3 && !v4 && v11 | v7)
  {
    -[PUCropToolController _resetAllValuesAnimated:](self, "_resetAllValuesAnimated:", 1);
  }
  else if ((v9 | v6) == 1)
  {
    -[PUCropToolController _applyCropAndPerspectiveSuggestion](self, "_applyCropAndPerspectiveSuggestion");
  }
}

- (void)setHasAppliedCropSuggestion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = a3;
  self->_hasAppliedCropSuggestion = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PUCropToolController_setHasAppliedCropSuggestion___block_invoke;
  v7[3] = &__block_descriptor_33_e36_v16__0__PICropAdjustmentController_8l;
  v8 = a3;
  -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v7);
  -[PUPhotoEditToolController aggregateSession](self, "aggregateSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "notifyDidApplyAutoCrop");
  else
    objc_msgSend(v5, "notifyDidAdjustCrop");

  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
}

- (void)_loadPerspectiveSuggestionIfNeeded
{
  _QWORD v3[5];

  if (!-[PUCropToolController hasAutoAppliedPerspectiveSuggestion](self, "hasAutoAppliedPerspectiveSuggestion")
    && !-[PUCropToolController hasRequestedPerspectiveSuggestion](self, "hasRequestedPerspectiveSuggestion"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __58__PUCropToolController__loadPerspectiveSuggestionIfNeeded__block_invoke;
    v3[3] = &unk_1E58ABD10;
    v3[4] = self;
    -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", v3);
  }
}

- (BOOL)_hasPerspectiveSuggestion
{
  double v3;
  double v5;

  -[PUCropToolController suggestedPitchAngle](self, "suggestedPitchAngle");
  if (v3 != 0.0)
    return 1;
  -[PUCropToolController suggestedYawAngle](self, "suggestedYawAngle");
  return v5 != 0.0;
}

- (void)setHasAppliedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasAppliedPerspectiveSuggestion = a3;
  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
}

- (PUCropPerspectiveView)cropView
{
  PUCropPerspectiveView *cropView;
  PUCropPerspectiveView *v3;
  PUCropPerspectiveView *v5;
  PUCropPerspectiveView *v6;
  PUCropPerspectiveView *v7;

  cropView = self->_cropView;
  if (cropView)
  {
    v3 = cropView;
  }
  else
  {
    v5 = objc_alloc_init(PUCropPerspectiveView);
    -[PUCropPerspectiveView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUCropTransformedImageView setDelegate:](v5, "setDelegate:", self);
    v6 = self->_cropView;
    self->_cropView = v5;
    v7 = v5;

    v3 = self->_cropView;
  }
  return v3;
}

- (PUCropOverlayView)cropOverlayView
{
  PUCropOverlayView *cropOverlayView;
  PUCropOverlayView *v3;
  PUCropOverlayView *v5;
  void *v6;
  PUCropOverlayView *v7;
  PUCropOverlayView *v8;

  cropOverlayView = self->_cropOverlayView;
  if (cropOverlayView)
  {
    v3 = cropOverlayView;
  }
  else
  {
    v5 = objc_alloc_init(PUCropOverlayView);
    -[PUCropOverlayView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_gridVisible = objc_msgSend(v6, "BOOLForKey:", CFSTR("PUCropGridVisible"));

    -[PUCropOverlayView setCropGridVisible:animated:](v5, "setCropGridVisible:animated:", self->_gridVisible, 0);
    v7 = self->_cropOverlayView;
    self->_cropOverlayView = v5;
    v8 = v5;

    v3 = self->_cropOverlayView;
  }
  return v3;
}

- (NSDictionary)cropHandleViewsByHandle
{
  NSDictionary *cropHandleViewsByHandle;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  PUTouchingGestureRecognizer *v13;
  id v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  cropHandleViewsByHandle = self->_cropHandleViewsByHandle;
  if (cropHandleViewsByHandle)
    return cropHandleViewsByHandle;
  +[PUCropHandleView allHandles](PUCropHandleView, "allHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = -[PUCropHandleView initForHandle:]([PUCropHandleView alloc], "initForHandle:", objc_msgSend(v11, "unsignedIntegerValue"));
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);
        v13 = objc_alloc_init(PUTouchingGestureRecognizer);
        -[PUTouchingGestureRecognizer addTarget:action:](v13, "addTarget:action:", self, sel__handleTouchingGesture_);
        -[PUTouchingGestureRecognizer setDelegate:](v13, "setDelegate:", self);
        objc_msgSend(v12, "addGestureRecognizer:", v13);
        v14 = objc_alloc_init(MEMORY[0x1E0DC3AA0]);
        objc_msgSend(v14, "addTarget:action:", self, sel__handleCropHandlePan_);
        objc_msgSend(v12, "addGestureRecognizer:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = (NSDictionary *)objc_msgSend(v6, "copy");
  v16 = self->_cropHandleViewsByHandle;
  self->_cropHandleViewsByHandle = v15;

  v17 = self->_cropHandleViewsByHandle;
  return v17;
}

- (UIView)cropCanvasView
{
  UIView *cropCanvasView;
  UIView *v3;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  cropCanvasView = self->_cropCanvasView;
  if (cropCanvasView)
  {
    v3 = cropCanvasView;
  }
  else
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    v6 = self->_cropCanvasView;
    self->_cropCanvasView = v5;
    v7 = v5;

    v3 = self->_cropCanvasView;
  }
  return v3;
}

- (void)_updateCropActionButtons
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
  void *v12;
  void *v13;
  PUCropAspectViewController *cropAspectViewController;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id from;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (!self->_rotateButton)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_CROP_ROTATE_ACCESSIBILITY_LABEL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("rotate.left"), CFSTR("rotate.left.fill"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke;
    v32[3] = &unk_1E58A45C0;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v6, "setActionBlock:", v32);
    -[PUCropToolController setRotateButton:](self, "setRotateButton:", v6);
    objc_destroyWeak(&v33);

  }
  if (!self->_flipButton)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_CROP_FLIP_ACCESSIBILITY_LABEL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("arrow.left.and.right.righttriangle.left.righttriangle.right"), CFSTR("arrow.left.and.right.righttriangle.left.righttriangle.right.fill"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke_2;
    v30[3] = &unk_1E58A45C0;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v9, "setActionBlock:", v30);
    -[PUCropToolController setFlipButton:](self, "setFlipButton:", v9);
    objc_destroyWeak(&v31);

  }
  if (!self->_aspectButton)
  {
    PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_ACCESSIBILITY_LABEL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("aspectratio"), CFSTR("aspectratio.fill"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke_3;
    v28[3] = &unk_1E58A45C0;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v12, "setActionBlock:", v28);
    -[PUCropToolController setAspectButton:](self, "setAspectButton:", v12);
    objc_destroyWeak(&v29);

  }
  if (!self->_autoButton)
  {
    +[PUPhotoEditToolActivationButton buttonWithTitle:](PUPhotoEditToolActivationButton, "buttonWithTitle:", &stru_1E58AD278);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_autoButton, v13);
    objc_msgSend(v13, "setUnselectedGlyphName:", CFSTR("viewfinder"));
    objc_msgSend(v13, "setSelectedGlyphName:", CFSTR("viewfinder"));
    objc_initWeak(&from, self);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __48__PUCropToolController__updateCropActionButtons__block_invoke_4;
    v25 = &unk_1E58A45C0;
    objc_copyWeak(&v26, &from);
    objc_msgSend(v13, "setActionBlock:", &v22);
    -[PUCropToolController setAutoButtonMode:](self, "setAutoButtonMode:", 1, v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);

  }
  -[PUCropToolController _updateCropToggleButtonMode](self, "_updateCropToggleButtonMode");
  cropAspectViewController = self->_cropAspectViewController;
  -[PUCropToolController aspectButton](self, "aspectButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", cropAspectViewController != 0);

  -[PUCropToolController cropAspect](self, "cropAspect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "allowOrientationChange");
  -[PUCropToolController cropAspectFlipperView](self, "cropAspectFlipperView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v17);

  -[PUCropToolController aspectButton](self, "aspectButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isSelected"))
    objc_msgSend(v3, "photoEditingToolbarButtonSelectedColor");
  else
    objc_msgSend(v3, "photoEditingToolbarButtonColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController aspectButton](self, "aspectButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTintColor:", v20);

  objc_destroyWeak(&location);
}

- (void)setAutoButtonMode:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t autoButtonMode;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_autoButtonMode != a3)
  {
    self->_autoButtonMode = a3;
    if (a3 == 3)
      v4 = CFSTR("PHOTOEDIT_CROP_AUTO_RESET");
    else
      v4 = CFSTR("PHOTOEDIT_CROP_AUTO_CROP");
    PULocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController autoButton](self, "autoButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

    autoButtonMode = self->_autoButtonMode;
    -[PUCropToolController autoButton](self, "autoButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    if (autoButtonMode == 3)
    {
      objc_msgSend(v9, "unselectedConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackground:", v11);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "background");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

      objc_msgSend(v10, "setTitleTextAttributesTransformer:", &__block_literal_global_22824);
      objc_msgSend(v10, "setImage:", 0);
      -[PUCropToolController autoButton](self, "autoButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setOverrideButtonConfiguration:", v10);

    }
    else
    {
      objc_msgSend(v9, "setOverrideButtonConfiguration:", 0);

    }
  }
}

- (void)_updateCropToggleButtonMode
{
  uint64_t v3;

  if (-[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion"))
  {
    v3 = 1;
  }
  else if (-[PUCropToolController _hasPerspectiveSuggestion](self, "_hasPerspectiveSuggestion"))
  {
    v3 = 1;
  }
  else
  {
    v3 = 3;
  }
  -[PUCropToolController setAutoButtonMode:](self, "setAutoButtonMode:", v3);
}

- (void)_updateCropToggleButton
{
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  int v6;
  int v7;
  int64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  if (-[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion"))
    v3 = -[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion");
  else
    v3 = 0;
  if (-[PUCropToolController _hasPerspectiveSuggestion](self, "_hasPerspectiveSuggestion"))
    v4 = -[PUCropToolController hasAppliedPerspectiveSuggestion](self, "hasAppliedPerspectiveSuggestion");
  else
    v4 = 0;
  if (-[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion"))
    v5 = !-[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion");
  else
    v5 = 0;
  if (-[PUCropToolController _hasPerspectiveSuggestion](self, "_hasPerspectiveSuggestion"))
    v6 = !-[PUCropToolController hasAppliedPerspectiveSuggestion](self, "hasAppliedPerspectiveSuggestion");
  else
    v6 = 0;
  if (-[PUCropToolController canResetToDefaultValue](self, "canResetToDefaultValue"))
  {
    if (((v5 | v6) & 1) != 0)
      v7 = 1;
    else
      v7 = !-[PUCropToolController _hasCropSuggestion](self, "_hasCropSuggestion");
  }
  else
  {
    v7 = 0;
  }
  v8 = -[PUCropToolController autoButtonMode](self, "autoButtonMode");
  -[PUCropToolController autoButton](self, "autoButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 == 3;
  v12 = v8 == 3;
  if (v11)
  {
    objc_msgSend(v9, "setSelected:", 1);

    if (v7)
    {
      v12 = -[PUCropToolController editValuesCalculatorDidFinishComputingGeometricValues](self, "editValuesCalculatorDidFinishComputingGeometricValues") ^ 1;
      -[PUCropToolController autoButtonMode](self, "autoButtonMode");
LABEL_26:
      -[PUCropToolController autoButton](self, "autoButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v9, "setSelected:", v3 | v4);

  }
  if (-[PUCropToolController autoButtonMode](self, "autoButtonMode") == 3)
    v13 = v7;
  else
    v13 = 1;
  if ((v13 & 1) != 0)
    goto LABEL_26;
  -[PUCropToolController autoButton](self, "autoButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = 0;
LABEL_28:
  objc_msgSend(v14, "setEnabled:", v16);

  -[PUCropToolController autoButton](self, "autoButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v12);

  v18 = (void *)MEMORY[0x1E0D7BB50];
  -[PUCropToolController autoButton](self, "autoButton");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isSelected"))
    v19 = 2;
  else
    v19 = 1;
  objc_msgSend(v18, "configurationWithCursorEffect:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController autoButton](self, "autoButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPx_configuration:", v20);

}

- (void)_updateCropViewsForInteraction
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  BOOL v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[PUCropToolController isTrackingAdjustmentControl](self, "isTrackingAdjustmentControl");
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStraightenGridVisible:animated:", v3, 1);

  -[PUCropToolController cropView](self, "cropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isTracking"))
  {

  }
  else
  {
    -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
  }
  -[PUCropToolController _showGridAndCancelDelayedHide](self, "_showGridAndCancelDelayedHide");
  -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
LABEL_5:
  -[PUCropToolController cropView](self, "cropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isTracking") & 1) != 0)
  {
LABEL_8:

LABEL_9:
    -[PUCropToolController _showMaskedContentAndCancelDelayedHide](self, "_showMaskedContentAndCancelDelayedHide");
    goto LABEL_10;
  }
  -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_8;
  }
  v26 = -[PUCropToolController isTrackingAdjustmentControl](self, "isTrackingAdjustmentControl");

  if (v26)
    goto LABEL_9;
  v27 = -[PUCropToolController canResetToDefaultValue](self, "canResetToDefaultValue");
  if (-[PUCropToolController rotatingAnimationCount](self, "rotatingAnimationCount"))
  {
    -[PUCropToolController _hideGrid](self, "_hideGrid");
    -[PUCropToolController _hideMaskedContent](self, "_hideMaskedContent");
  }
  else
  {
    if (!v27)
    {
      -[PUCropToolController animationsByKeyPath](self, "animationsByKeyPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29)
        goto LABEL_36;
    }
    if (-[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion")
      && (-[PUCropToolController animationsByKeyPath](self, "animationsByKeyPath"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "count"),
          v30,
          v31))
    {
LABEL_36:
      -[PUCropToolController _showGridAndCancelDelayedHide](self, "_showGridAndCancelDelayedHide");
      -[PUCropToolController _showMaskedContentAndCancelDelayedHide](self, "_showMaskedContentAndCancelDelayedHide");
      -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
    }
    else
    {
      if (v27 || -[PUCropToolController hasAppliedCropSuggestion](self, "hasAppliedCropSuggestion"))
      {
        -[PUCropToolController _hideGridDelayed](self, "_hideGridDelayed");
        -[PUCropToolController _hideMaskedContentDelayed](self, "_hideMaskedContentDelayed");
      }
      else
      {
        -[PUCropToolController _hideGrid](self, "_hideGrid");
        -[PUCropToolController _hideMaskedContent](self, "_hideMaskedContent");
      }
      -[PUCropToolController _recomposeCropRectDelayed](self, "_recomposeCropRectDelayed");
    }
  }
LABEL_10:
  -[PUCropToolController cropView](self, "cropView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isTracking") & 1) != 0)
  {
    -[PUCropToolController cropView](self, "cropView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDecelerating");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {

  }
  v12 = !-[PUCropToolController isTrackingAdjustmentControl](self, "isTrackingAdjustmentControl");
LABEL_15:
  if (-[PUCropToolController isTrackingAdjustmentControl](self, "isTrackingAdjustmentControl"))
  {
    v13 = 0;
  }
  else
  {
    -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 == 0;

  }
  -[PUCropToolController cropView](self, "cropView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", v13);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[PUCropToolController cropHandleViewsByHandle](self, "cropHandleViewsByHandle", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
        -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == v23)
        {
          v25 = 1;
        }
        else
        {
          -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

        }
        objc_msgSend(v22, "setUserInteractionEnabled:", v25 & v12);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

  -[PUCropToolController updateViewOrdering](self, "updateViewOrdering");
}

- (void)_updateAspectRatioControls
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[PUCropToolController viewCropRect](self, "viewCropRect");
  if (v3 != v4)
    -[PUCropToolController updateCropAspectRatioOrientation:](self, "updateCropAspectRatioOrientation:", v3 < v4);
  -[PUCropToolController cropAspect](self, "cropAspect");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentCropAspect:", v6);

}

- (void)updateViewOrdering
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUCropToolController cropHandleViewsByHandle](self, "cropHandleViewsByHandle", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[PUCropToolController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bringSubviewToFront:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[PUCropToolController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController badgeView](self, "badgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bringSubviewToFront:", v12);

}

- (void)_hideGrid
{
  id v3;

  if (!-[PUCropToolController gridVisible](self, "gridVisible"))
  {
    -[PUCropToolController cropOverlayView](self, "cropOverlayView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCropGridVisible:animated:", 0, 1);

  }
}

- (void)_hideGridDelayed
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideGrid, 0);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropRecomposeDelay");
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideGrid, 0);

}

- (void)_showGridAndCancelDelayedHide
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideGrid, 0);
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCropGridVisible:animated:", 1, 1);

}

- (void)_hideMaskedContent
{
  id v2;

  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaskedContentVisible:animated:", 0, 1);

}

- (void)_hideMaskedContentDelayed
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideMaskedContent, 0);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropRecomposeDelay");
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideMaskedContent, 0);

}

- (void)_showMaskedContentAndCancelDelayedHide
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideMaskedContent, 0);
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedContentVisible:animated:", 1, 1);

}

- (BOOL)_needsRecomposeCropRect
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  double v20;

  -[PUCropToolController viewCropRect](self, "viewCropRect");
  v4 = v3;
  v6 = v5;
  -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame");
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  UIRectGetCenter();
  v17 = vabdd_f64(v12, v16);
  v18 = v4 < v8;
  if (v6 >= v10)
    v18 = 0;
  v19 = v17 < 2.22044605e-16;
  v20 = vabdd_f64(v14, v15);
  if (!v19)
    v18 = 1;
  return v20 >= 2.22044605e-16 || v18;
}

- (void)_autoRecomposeCropRect
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PUCropToolController _needsRecomposeCropRect](self, "_needsRecomposeCropRect"))
  {
    -[PUCropToolController viewCropRect](self, "viewCropRect");
    if (v3 >= 1.0)
    {
      -[PUCropToolController viewCropRect](self, "viewCropRect");
      if (v4 >= 1.0)
      {
        -[PUCropToolController cropView](self, "cropView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCropToolController viewCropRect](self, "viewCropRect");
        objc_msgSend(v5, "setImageCropRectFromViewCropRect:animated:", 1);

        -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
        -[PUCropToolController _recomposeCropRectAnimated:](self, "_recomposeCropRectAnimated:", 1);
        PULocalizedString(CFSTR("PHOTOEDIT_CROP_GENERIC_ACTION_TITLE"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v6);

        -[PUCropToolController cropView](self, "cropView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateLayerTransformsAnimated:", 1);

        -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
      }
    }
  }
}

- (void)_recomposeCropRectDelayed
{
  id v3;

  -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropRecomposeDelay");
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__autoRecomposeCropRect, 0);

}

- (void)_cancelDelayedRecomposeCropRect
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__autoRecomposeCropRect, 0);
}

- (void)_handleTouchingGesture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  PUCropToolController *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  CGSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = objc_msgSend(v4, "state");
  if (v5 == 1)
  {
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController setSelectedCropHandleView:](self, "setSelectedCropHandleView:", v9);
      -[PUCropToolController cropModel](self, "cropModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cropRect");
      v12 = v11;
      v14 = v13;

      -[PUCropToolController viewCropRect](self, "viewCropRect");
      v16 = 2.0 / v12 * v15;
      -[PUCropToolController viewCropRect](self, "viewCropRect");
      -[PUCropToolController setMinimumViewCropRectSizeForHandleGesture:](self, "setMinimumViewCropRectSizeForHandleGesture:", v16, 2.0 / v14 * v17);
      PLPhotoEditGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[PUCropToolController minimumViewCropRectSizeForHandleGesture](self, "minimumViewCropRectSizeForHandleGesture");
        NSStringFromCGSize(v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v19;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEBUG, "minimumViewCropRectSizeForHandleGesture : %@", (uint8_t *)&v24, 0xCu);

      }
    }
    -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
    v20 = self;
    v21 = 1;
LABEL_11:
    -[PUPhotoEditToolController setPerformingLiveInteraction:](v20, "setPerformingLiveInteraction:", v21);
    -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
    goto LABEL_12;
  }
  if (v6 == 3)
  {
    objc_msgSend(v4, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 == v23)
      -[PUCropToolController setSelectedCropHandleView:](self, "setSelectedCropHandleView:", 0);
    -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
    v20 = self;
    v21 = 0;
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_handleCropHandlePan:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a3;
  v4 = objc_msgSend(v21, "state");
  -[PUCropToolController initialLocationsInHandlesByHandle](self, "initialLocationsInHandlesByHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v4 - 3) <= 1)
    -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer");
  -[PUCropToolController selectedCropHandleView](self, "selectedCropHandleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v8 = objc_msgSend(v6, "handle");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    if (v4 == 2)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "CGPointValue");
      v18 = v17;
      v20 = v19;

      -[PUCropToolController _cropRectFromPanningHandle:byAmount:](self, "_cropRectFromPanningHandle:byAmount:", v8, v12 - v18, v14 - v20);
      -[PUCropToolController setViewCropRect:](self, "setViewCropRect:");
    }
    else if (v4 == 1)
    {
      -[PUCropToolController viewCropRect](self, "viewCropRect");
      -[PUCropToolController setInitialHandlePanCropRect:](self, "setInitialHandlePanCropRect:");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v9);

      -[PUCropToolController showVideoScrubber:](self, "showVideoScrubber:", 0);
    }
    -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);
    -[PUCropToolController setHasAppliedPerspectiveSuggestion:](self, "setHasAppliedPerspectiveSuggestion:", 0);
    -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");

  }
}

- (CGVector)_applyAspectOfCropRect:(CGRect)a3 toHandleMovement:(CGVector)a4
{
  float v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  CGVector result;

  v4 = a3.size.height * a3.size.height + a3.size.width * a3.size.width;
  v5 = 1.0 / sqrtf(v4);
  v6 = a3.size.width * v5;
  v7 = a3.size.height * v5;
  v8 = a4.dy * (a3.size.height * v5) + a4.dx * v6;
  v9 = v6 * v8;
  v10 = v7 * v8;
  result.dy = v10;
  result.dx = v9;
  return result;
}

- (NSMutableDictionary)initialLocationsInHandlesByHandle
{
  NSMutableDictionary *initialLocationsInHandlesByHandle;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  initialLocationsInHandlesByHandle = self->_initialLocationsInHandlesByHandle;
  if (!initialLocationsInHandlesByHandle)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    +[PUCropHandleView allHandles](PUCropHandleView, "allHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_initialLocationsInHandlesByHandle;
    self->_initialLocationsInHandlesByHandle = v6;

    initialLocationsInHandlesByHandle = self->_initialLocationsInHandlesByHandle;
  }
  return initialLocationsInHandlesByHandle;
}

- (void)showToolLabel
{
  -[PUCropToolController showBadgeView:animated:](self, "showBadgeView:animated:", 1, 1);
}

- (void)showVideoScrubber:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PUCropToolController_showVideoScrubber___block_invoke;
  v3[3] = &unk_1E58AAD68;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.25);
}

- (void)resetToolLabelHidingTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[PUCropToolController badgeShowingExpirationTimer](self, "badgeShowingExpirationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUCropToolController badgeShowingExpirationTimer](self, "badgeShowingExpirationTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[PUCropToolController setBadgeShowingExpirationTimer:](self, "setBadgeShowingExpirationTimer:", 0);
  }
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__PUCropToolController_resetToolLabelHidingTimer__block_invoke;
  v10 = &unk_1E58A46D8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v7, 1.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController setBadgeShowingExpirationTimer:](self, "setBadgeShowingExpirationTimer:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (CGRect)_cropRectFromPanningHandle:(unint64_t)a3 byAmount:(CGVector)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double x;
  double v39;
  double y;
  double width;
  double height;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSObject *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v93;
  double v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  uint64_t v102;
  CGSize v103;
  CGRect v104;
  CGRect v105;
  CGRect result;
  CGRect v107;

  v102 = *MEMORY[0x1E0C80C00];
  -[PUCropToolController initialHandlePanCropRect](self, "initialHandlePanCropRect");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  if (a3 - 1 > 6)
    v14 = 3;
  else
    v14 = qword_1AB0EF988[a3 - 1];
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a3, v6, v7, v8, v9);
  v16 = v15;
  v18 = v17;
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", v14, v10, v11, v12, v13);
  v20 = v19;
  v22 = v21;
  -[PUCropToolController cropAspect](self, "cropAspect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController _deltaMaskForHandle:](self, "_deltaMaskForHandle:", a3);
  v25 = v12;
  v26 = v13;
  v28 = a4.dx * v27;
  v29 = a4.dy * v24;
  if (v23)
  {
    v93 = v25;
    v94 = v26;
    v91 = v10;
    objc_msgSend(v23, "ratio");
    if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    {
      v31 = v30 * v30 + 1.0;
      v32 = 1.0 / sqrtf(v31);
      v33 = v30 * v32;
      if (a3 - 5 < 2)
        v32 = -v32;
      -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 1, v33 * (v29 * v32 + v28 * v33), v32 * (v29 * v32 + v28 * v33), v10, v11, v93, v94);
      v35 = v34 + v16;
      v37 = v36 + v18;
      x = fmin(v20, v35);
      v39 = v22;
      y = fmin(v22, v37);
      width = vabdd_f64(v20, v35);
      height = vabdd_f64(v39, v37);
    }
    else
    {
      width = v93;
      height = v94;
      y = v11;
      x = v10;
      if (a3 <= 3)
      {
        -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 1, v28, v29, v10, v11, v93, v94);
        v54 = v53;
        v56 = v55;
        v57 = a3 & 0xFFFFFFFFFFFFFFFBLL;
        -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame");
        -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "minimumCropSize");
        v60 = v59;
        v62 = v61;

        if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || ((0xC8u >> a3) & 1) != 0)
        {
          v71 = -v56;
          if (v57)
            v71 = v56;
          -[PUCropToolController _addHeight:toRect:anchorTop:](self, "_addHeight:toRect:anchorTop:", v57 != 0, v71, v91, v11, v93, v94);
        }
        else
        {
          v63 = -v54;
          if (((0x52u >> a3) & 1) == 0)
            v63 = v54;
          -[PUCropToolController _addWidth:toRect:anchorLeft:](self, "_addWidth:toRect:anchorLeft:", ((0x52u >> a3) & 1) == 0, v63, v91, v11, v93, v94);
        }
        objc_msgSend(v23, "constrainRect:boundingRect:boundingAngle:minSize:", 0, v60, v62);
        x = v72;
        y = v73;
        width = v74;
        height = v75;
        v10 = v91;
      }
    }
    -[PUCropToolController minimumViewCropRectSizeForHandleGesture](self, "minimumViewCropRectSizeForHandleGesture");
    if (width < v76)
    {
      v77 = v93;
      v78 = v94;
      goto LABEL_48;
    }
    -[PUCropToolController minimumViewCropRectSizeForHandleGesture](self, "minimumViewCropRectSizeForHandleGesture");
    v77 = v93;
    v78 = v94;
    if (height < v79)
      goto LABEL_48;
  }
  else
  {
    -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 0, v28, a4.dy * v24, v10, v11, v25, v26);
    v44 = v43 + v16;
    v46 = v45 + v18;
    -[PUCropToolController minimumViewCropRectSizeForHandleGesture](self, "minimumViewCropRectSizeForHandleGesture");
    x = fmin(v20, v44);
    width = vabdd_f64(v20, v44);
    height = vabdd_f64(v22, v46);
    if (width < v47)
    {
      v49 = v47 - width;
      if (((a3 < 7) & (0x52u >> a3)) == 0)
        v49 = 0.0;
      x = x - v49;
      width = v47;
    }
    y = fmin(v22, v46);
    if (height < v48)
    {
      v50 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 5;
      v51 = v48 - height;
      if (!v50)
        v51 = 0.0;
      y = y - v51;
      height = v48;
    }
    if (a3 <= 3)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      if ((unint64_t)(v14 - 1) > 6)
        v52 = &unk_1E59B9DC0;
      else
        v52 = (void *)qword_1E589DE98[v14 - 1];
      v64 = v52;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v66; ++i)
          {
            if (*(_QWORD *)v96 != v67)
              objc_enumerationMutation(v64);
            -[PUCropToolController _pointForHandle:](self, "_pointForHandle:", objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "unsignedIntegerValue"));
            v104.size.width = vabdd_f64(v69, v44);
            v104.size.height = vabdd_f64(v70, v46);
            v104.origin.x = fmin(v69, v44);
            v104.origin.y = fmin(v70, v46);
            v107.origin.x = x;
            v107.origin.y = y;
            v107.size.width = width;
            v107.size.height = height;
            v105 = CGRectUnion(v104, v107);
            x = v105.origin.x;
            y = v105.origin.y;
            width = v105.size.width;
            height = v105.size.height;
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
        }
        while (v66);
      }

    }
  }
  PLPhotoEditGetLog();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    v103.width = width;
    v103.height = height;
    NSStringFromCGSize(v103);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v100 = v81;
    _os_log_impl(&dword_1AAB61000, v80, OS_LOG_TYPE_DEBUG, "_cropRectFromPanningHandle: panning rect size: %@", buf, 0xCu);

  }
  -[PUCropToolController cropView](self, "cropView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "validateViewCropRectAgainstModelCropRect:", x, y, width, height);
  v10 = v83;
  v11 = v84;
  v77 = v85;
  v78 = v86;

LABEL_48:
  v87 = v10;
  v88 = v11;
  v89 = v77;
  v90 = v78;
  result.size.height = v90;
  result.size.width = v89;
  result.origin.y = v88;
  result.origin.x = v87;
  return result;
}

- (CGRect)_addWidth:(double)a3 toRect:(CGRect)a4 anchorLeft:(BOOL)a5
{
  _BOOL4 v5;
  double width;
  double x;
  double MidY;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = a5;
  width = a4.size.width;
  x = a4.origin.x;
  MidY = CGRectGetMidY(a4);
  v11 = width + a3;
  -[PUCropToolController cropAspect](self, "cropAspect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightForWidth:", v11);
  v14 = v13;

  v15 = 0.0;
  if (!v5)
    v15 = a3;
  v16 = x - v15;
  v17 = MidY + v14 * -0.5;
  v18 = v11;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_addHeight:(double)a3 toRect:(CGRect)a4 anchorTop:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double y;
  double MidX;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = a5;
  height = a4.size.height;
  y = a4.origin.y;
  MidX = CGRectGetMidX(a4);
  v11 = height + a3;
  -[PUCropToolController cropAspect](self, "cropAspect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthForHeight:", v11);
  v14 = v13;

  v15 = 0.0;
  if (!v5)
    v15 = a3;
  v16 = y - v15;
  v17 = MidX + v14 * -0.5;
  v18 = v14;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (CGVector)_correctInputVector:(CGVector)a3 forHandle:(unint64_t)a4 onCropRect:(CGRect)a5 lockDirection:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double MinX;
  double MaxY;
  double MinY;
  double dy;
  double dx;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  CGFloat rect;
  CGVector result;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v42 = v13;
  v43 = v14;
  -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame");
  v16 = v15;
  v18 = v17;
  rect = v19;
  v21 = v20;
  -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minimumCropSize");
  v24 = v23;
  v45 = v25;

  if (a4 <= 6 && ((0x52u >> a4) & 1) != 0)
  {
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    MaxX = CGRectGetMaxX(v48) - v24;
  }
  else
  {
    v49.origin.x = v16;
    v49.origin.y = v18;
    v49.size.width = rect;
    v49.size.height = v21;
    MaxX = CGRectGetMaxX(v49);
  }
  v41 = MaxX;
  if (a4 <= 7 && ((0xA4u >> a4) & 1) != 0)
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinX = v24 + CGRectGetMinX(v50);
  }
  else
  {
    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = rect;
    v51.size.height = v21;
    MinX = CGRectGetMinX(v51);
  }
  v40 = MinX;
  if (a4 <= 5 && ((1 << a4) & 0x31) != 0)
  {
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    MaxY = CGRectGetMaxY(v52) - v45;
  }
  else
  {
    v53.origin.x = v16;
    v53.origin.y = v18;
    v53.size.width = rect;
    v53.size.height = v21;
    MaxY = CGRectGetMaxY(v53);
  }
  if (a4 <= 7 && ((0xC8u >> a4) & 1) != 0)
  {
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    MinY = v45 + CGRectGetMinY(v54);
  }
  else
  {
    v55.origin.x = v16;
    v55.origin.y = v18;
    v55.size.width = rect;
    v55.size.height = v21;
    MinY = CGRectGetMinY(v55);
  }
  dx = a3.dx;
  dy = a3.dy;
  if (v6)
  {
    v32 = 1.0;
    v33 = 1.0;
    v34 = 1.0;
    if (a3.dx != 0.0)
    {
      v33 = (v41 - v42) / a3.dx;
      v34 = (v40 - v42) / a3.dx;
    }
    v35 = 1.0;
    if (a3.dy != 0.0)
    {
      v32 = (MaxY - v43) / a3.dy;
      v35 = (MinY - v43) / a3.dy;
    }
    v36 = fmax(v33, v34);
    v37 = fmax(v32, v35);
    if (v36 < 1.0 || v37 < 1.0)
    {
      v38 = fmin(v36, v37);
      dx = a3.dx * v38;
      dy = a3.dy * v38;
    }
  }
  else
  {
    dx = fmax(v40, fmin(v41, a3.dx + v42)) - v42;
    dy = fmax(MinY, fmin(MaxY, a3.dy + v43)) - v43;
  }
  v39 = dx;
  result.dy = dy;
  result.dx = v39;
  return result;
}

- (CGVector)_deltaMaskForHandle:(unint64_t)a3
{
  unint64_t v3;
  double v4;
  double v5;
  CGVector result;

  v3 = a3 - 1;
  if (a3 - 1 > 6)
  {
    v5 = 1.0;
    v4 = 0.0;
  }
  else
  {
    v4 = dbl_1AB0EF9C0[v3];
    v5 = dbl_1AB0EF9F8[v3];
  }
  result.dy = v5;
  result.dx = v4;
  return result;
}

- (CGPoint)_pointForHandle:(unint64_t)a3
{
  double v5;
  double v6;
  CGPoint result;

  -[PUCropToolController viewCropRect](self, "viewCropRect");
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a3);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_pointForHandle:(unint64_t)a3 onCropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  double MaxY;
  double MaxX;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3 <= 5 && ((1 << a3) & 0x31) != 0)
  {
    v9 = a4.origin.y;
  }
  else
  {
    if (a3 <= 7 && ((0xC8u >> a3) & 1) != 0)
      MaxY = CGRectGetMaxY(a4);
    else
      MaxY = CGRectGetMidY(a4);
    v9 = MaxY;
  }
  if (a3 > 6 || ((0x52u >> a3) & 1) == 0)
  {
    if (a3 <= 7 && ((0xA4u >> a3) & 1) != 0)
    {
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MaxX = CGRectGetMaxX(v15);
    }
    else
    {
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      MaxX = CGRectGetMidX(v16);
    }
    x = MaxX;
  }
  v12 = x;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)_cropCanvasFrame
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PUCropToolController cropCanvasView](self, "cropCanvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_suggestedCropRectForImageRect:(CGRect)a3
{
  double height;
  double width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[PUCropToolController _cropCanvasFrame](self, "_cropCanvasFrame", a3.origin.x, a3.origin.y);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PUCropToolController geometry](self, "geometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSizeInverted");
  if (v15)
    v16 = height;
  else
    v16 = width;
  if (v15)
    height = width;

  v17 = PURectWithSizeThatFitsInRect(v16, height, v7, v9, v11, v13);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_recomposeCropRectAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;

  v3 = a3;
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
  PURoundRectToPixel(v5, v6, v7, v8);
  -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v3);
  -[PUCropToolController cropView](self, "cropView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  objc_msgSend(v9, "setModelCropRect:viewCropRect:");

  -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
}

- (void)updateCropAspectRatioOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PUCropToolController cropAspect](self, "cropAspect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUCropToolController cropAspect](self, "cropAspect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "width");
    v8 = v7;
    -[PUCropToolController cropAspect](self, "cropAspect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "height");
    v11 = v10;
    -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentCropSize:", v8, v11);

  }
  -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAspectOrientation:", a3);

  -[PUCropToolController cropAspect](self, "cropAspect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCurrentCropAspect:", v14);

  -[PUCropAspectFlipperView setAspectRatioOrientation:](self->_cropAspectFlipperView, "setAspectRatioOrientation:", a3);
}

- (void)updateAspectRatioLockButton
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maintainCropAspectLockState");

  if (v4)
  {
    -[PUCropToolController cropAspect](self, "cropAspect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    if (v5)
      v6 = (double)(objc_msgSend(v5, "isFreeformCrop") ^ 1);
    else
      v6 = 0.0;
    v7 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 17.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:forState:", v9, 0);

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.95);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1063675494;
    objc_msgSend(v14, "setShadowOpacity:", v15);

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowOffset:", 2.0, 2.0);

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowRadius:", 6.0);

    -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", v6);

  }
}

- (void)_aspectLockButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PUCropToolController cropAspect](self, "cropAspect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "isFreeformCrop");
  else
    v4 = 1;
  -[PUCropToolController _userChangedAspectRatioLocked:](self, "_userChangedAspectRatioLocked:", v4);
  -[PUCropToolController setAspectRatioLocked:](self, "setAspectRatioLocked:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
  objc_msgSend(v5, "impactOccurred");

}

- (void)_userChangedAspectRatioLocked:(BOOL)a3
{
  _BOOL8 v3;
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
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  __CFString *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double MinX;
  void *v31;
  double v32;
  uint64_t v33;
  id v34;
  void (**v35)(_QWORD);
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  void (**v42)(_QWORD);
  _QWORD v43[5];
  _QWORD aBlock[5];
  id v45;
  CGRect v46;
  CGRect v47;

  v3 = a3;
  -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PUCropToolController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromView:", v16, v7, v9, v11, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if (v3)
    v25 = CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_LOCKED");
  else
    v25 = CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_UNLOCKED");
  PULocalizedString(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "transientBadgeWidthForText:", v26);
  v29 = v28;

  v46.origin.x = v18;
  v46.origin.y = v20;
  v46.size.width = v22;
  v46.size.height = v24;
  MinX = CGRectGetMinX(v46);
  -[PUCropToolController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v32 = (v29 + CGRectGetWidth(v47)) * 0.5;

  v33 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke;
  aBlock[3] = &unk_1E58ABCA8;
  aBlock[4] = self;
  v34 = v26;
  v45 = v34;
  v35 = (void (**)(_QWORD))_Block_copy(aBlock);
  v36 = v35;
  if (MinX >= v32 || !v3)
  {
    v35[2](v35);
  }
  else
  {
    v38 = (void *)MEMORY[0x1E0DC3F10];
    v43[0] = v33;
    v43[1] = 3221225472;
    v43[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_2;
    v43[3] = &unk_1E58ABD10;
    v43[4] = self;
    v41[0] = v33;
    v41[1] = 3221225472;
    v41[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_3;
    v41[3] = &unk_1E58AB7D8;
    v41[4] = self;
    v42 = v35;
    objc_msgSend(v38, "animateWithDuration:animations:completion:", v43, v41, 0.2);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKey:", v40, CFSTR("PUPhotoEditCropAspectRatioLocked2"));

}

- (id)bestAspectRatioForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  PUCropAspect *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -[PUCropAspect initWithWidth:height:]([PUCropAspect alloc], "initWithWidth:height:", (double)a3, (double)a4);
  -[PUCropAspectViewController matchingCropAspectTo:ignoreFreeform:](self->_cropAspectViewController, "matchingCropAspectTo:ignoreFreeform:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  if (a3)
  {
    -[PUCropToolController viewCropRect](self, "viewCropRect");
    -[PUCropToolController bestAspectRatioForWidth:height:](self, "bestAspectRatioForWidth:height:", (unint64_t)v4, (unint64_t)v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", v6, 0);

  }
  else
  {
    -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", 0, 0);
  }
}

- (void)createVideoScrubber
{
  void *v3;
  int v4;
  void *v5;
  PUAVKitMediaTimelineView *v6;
  PUAVKitMediaTimelineView *videoScrubberView;
  void *v8;
  int v9;
  double v10;
  void *v11;
  UIButton *v12;
  UIButton *playPauseButton;
  UIButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStandardVideo");

  if (v4)
  {
    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(PUAVKitMediaTimelineView);
      videoScrubberView = self->_videoScrubberView;
      self->_videoScrubberView = v6;

      -[PUPhotoEditToolController asset](self, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "mediaSubtypes");

      v10 = 4.0;
      if ((*(_QWORD *)&v9 & 0x100000) == 0)
        v10 = 1.0;
      -[PUAVKitMediaTimelineView setWhiteValue:](self->_videoScrubberView, "setWhiteValue:", v10);
      -[PUAVKitMediaTimelineView setDelegate:](self->_videoScrubberView, "setDelegate:", self);
      -[PUAVKitMediaTimelineView setOverrideUserInterfaceStyle:](self->_videoScrubberView, "setOverrideUserInterfaceStyle:", 2);
      -[PUAVKitMediaTimelineView setShowsTimeLabels:](self->_videoScrubberView, "setShowsTimeLabels:", 1);
      -[PUAVKitMediaTimelineView setPlaying:](self->_videoScrubberView, "setPlaying:", 1);
      -[PUAVKitMediaTimelineView setAlpha:](self->_videoScrubberView, "setAlpha:", 0.0);
      -[PUCropToolController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_videoScrubberView);

      +[PUPhotoEditSupport createPlayPauseButton](PUPhotoEditSupport, "createPlayPauseButton");
      v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
      playPauseButton = self->_playPauseButton;
      self->_playPauseButton = v12;

      objc_initWeak(&location, self);
      v14 = self->_playPauseButton;
      v15 = (void *)MEMORY[0x1E0DC3428];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __43__PUCropToolController_createVideoScrubber__block_invoke;
      v23 = &unk_1E58AB5D0;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v15, "actionWithHandler:", &v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton addAction:forControlEvents:](v14, "addAction:forControlEvents:", v16, 64, v20, v21, v22, v23);

      v17 = (void *)MEMORY[0x1E0DC3658];
      -[PUAVKitMediaTimelineView whiteValue](self->_videoScrubberView, "whiteValue");
      objc_msgSend(v17, "colorWithWhite:alpha:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_playPauseButton, "setTintColor:", v18);

      -[PUCropToolController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_playPauseButton);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    -[PUCropToolController _updateVideoScrubber](self, "_updateVideoScrubber");
  }
}

- (void)_playPauseButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  -[PUCropToolController _beginObservingVideoPlayer](self, "_beginObservingVideoPlayer");
  -[PUCropToolController cropView](self, "cropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoMediaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "playbackState") == 3)
    objc_msgSend(v5, "pause");
  else
    objc_msgSend(v5, "play");

}

- (void)_beginObservingVideoPlayer
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[PUCropToolController cropView](self, "cropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoMediaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController videoScrubberTimeObserver](self, "videoScrubberTimeObserver");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[PUCropToolController videoScrubberObservedPlayer](self, "videoScrubberObservedPlayer"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v5 != v8))
  {
    -[PUCropToolController videoScrubberTimeObserver](self, "videoScrubberTimeObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PUCropToolController videoScrubberObservedPlayer](self, "videoScrubberObservedPlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropToolController videoScrubberTimeObserver](self, "videoScrubberTimeObserver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", v11);

    }
    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __50__PUCropToolController__beginObservingVideoPlayer__block_invoke;
    v16 = &unk_1E58A4CB8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v5, "addPlaybackTimeObserver:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController setVideoScrubberTimeObserver:](self, "setVideoScrubberTimeObserver:", v12, v13, v14, v15, v16);

    -[PUCropToolController setVideoScrubberObservedPlayer:](self, "setVideoScrubberObservedPlayer:", v5);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)_updateVideoScrubber
{
  uint64_t v3;
  void *v4;
  BOOL v5;
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
  void *v16;
  float Seconds;
  void *v18;
  double v19;
  float v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  CMTime v29;
  CMTime lhs;
  CMTime time;
  char v32;
  char v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;

  -[PUCropToolController videoScrubberView](self, "videoScrubberView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PUCropToolController isScrubbingVideo](self, "isScrubbingVideo");

    if (!v5)
    {
      -[PUCropToolController cropView](self, "cropView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "videoMediaView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[PUPhotoEditToolController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaView");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      memset(&v36, 0, sizeof(v36));
      objc_msgSend(v9, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "mediaDuration");
      else
        memset(&v36, 0, sizeof(v36));

      memset(&v35, 0, sizeof(v35));
      CMTimeMake(&v35, 0, v36.timescale);
      memset(&v34, 0, sizeof(v34));
      objc_msgSend(v9, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "currentTime");
      else
        memset(&v34, 0, sizeof(v34));

      -[PUPhotoEditToolController compositionController](self, "compositionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trimAdjustmentController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "startTime");
        if ((v33 & 1) != 0)
        {
          objc_msgSend(v16, "endTime");
          if ((v32 & 1) != 0)
          {
            objc_msgSend(v16, "startTime");
            v35 = time;
            objc_msgSend(v16, "endTime");
            v36 = time;
            lhs = v35;
            -[PUPhotoEditToolController displayedTimeForOriginalAssetTime:](self, "displayedTimeForOriginalAssetTime:", &lhs);
            v35 = time;
            lhs = v36;
            -[PUPhotoEditToolController displayedTimeForOriginalAssetTime:](self, "displayedTimeForOriginalAssetTime:", &lhs);
            v36 = time;
          }
        }
      }
      if ((v35.flags & 1) != 0 && (v36.flags & 1) != 0 && (v34.flags & 1) != 0)
      {
        lhs = v35;
        v29 = v34;
        CMTimeAdd(&time, &lhs, &v29);
        v34 = time;
        time = v35;
        Seconds = CMTimeGetSeconds(&time);
        -[PUCropToolController videoScrubberView](self, "videoScrubberView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v19 = Seconds;
        objc_msgSend(v18, "setMinValue:", v19);

        time = v36;
        v20 = CMTimeGetSeconds(&time);
        -[PUCropToolController videoScrubberView](self, "videoScrubberView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v22 = v20;
        objc_msgSend(v21, "setMaxValue:", v22);

        time = v34;
        v23 = CMTimeGetSeconds(&time);
        -[PUCropToolController videoScrubberView](self, "videoScrubberView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v25 = v23;
        objc_msgSend(v24, "setCurrentValue:", v25);

        objc_msgSend(v9, "player");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "playbackState") == 3)
        {
          time = v34;
          lhs = v36;
          v27 = CMTimeCompare(&time, &lhs) != 0;
        }
        else
        {
          v27 = 0;
        }

        -[PUCropToolController playPauseButton](self, "playPauseButton");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSelected:", v27);

      }
    }
  }
}

- (void)showBadgeView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  BOOL v14;

  v4 = a3;
  if (a4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__PUCropToolController_showBadgeView_animated___block_invoke;
    v13[3] = &unk_1E58AAD68;
    v13[4] = self;
    v14 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v13, &__block_literal_global_231, 0.25, 0.0);
  }
  else
  {
    -[PUCropToolController badgeView](self, "badgeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", (double)v4);

    v7 = (double)!v4;
    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);

    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alpha");
    v10 = v9;
    -[PUCropToolController playPauseButton](self, "playPauseButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", v10);

  }
}

- (void)mediaTimelineControlViewWillBeginChanging:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  -[PUCropToolController setIsScrubbingVideo:](self, "setIsScrubbingVideo:", 1);
  -[PUCropToolController cropView](self, "cropView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoMediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "playbackRate");
  -[PUCropToolController setWasPlayingBeforeBeginningToScrubVideo:](self, "setWasPlayingBeforeBeginningToScrubVideo:", v6 == 1.0);
  objc_msgSend(v7, "pause");
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);

}

- (void)mediaTimelineControlViewDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int32_t v8;
  float v9;
  float v10;
  float v11;
  CMTime v12;
  CMTime lhs;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  -[PUCropToolController cropView](self, "cropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoMediaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_5:
    v8 = 600;
    goto LABEL_6;
  }
  objc_msgSend(v7, "currentTime");
  v8 = v18;
  if (!(_DWORD)v18)
    goto LABEL_5;
LABEL_6:
  memset(&v16, 0, sizeof(v16));
  objc_msgSend(v4, "currentValue");
  CMTimeMakeWithSeconds(&v16, v9, v8);
  memset(&v15, 0, sizeof(v15));
  objc_msgSend(v4, "minValue");
  v11 = v10;

  CMTimeMakeWithSeconds(&v15, v11, v8);
  if ((v16.flags & 1) != 0 && (v15.flags & 1) != 0)
  {
    memset(&v14, 0, sizeof(v14));
    lhs = v16;
    v12 = v15;
    CMTimeSubtract(&v14, &lhs, &v12);
    lhs = v14;
    objc_msgSend(v7, "seekToTime:exact:", &lhs, 0);
  }

}

- (void)mediaTimelineControlViewDidEndChanging:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[PUCropToolController setIsScrubbingVideo:](self, "setIsScrubbingVideo:", 0);
  if (-[PUCropToolController wasPlayingBeforeBeginningToScrubVideo](self, "wasPlayingBeforeBeginningToScrubVideo"))
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pauseAfterMovingPlayhead");

    if (v5)
    {
      -[PUCropToolController playPauseButton](self, "playPauseButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
    }
    else
    {
      -[PUCropToolController cropView](self, "cropView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "videoMediaView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "play");

      -[PUCropToolController playPauseButton](self, "playPauseButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1;
    }
    objc_msgSend(v6, "setSelected:", v8);

  }
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)cropTransformedImageViewWillBeginTracking:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  -[PUCropToolController viewCropRect](self, "viewCropRect", a3);
  v8 = v7;
  if (v5 > 1.0 && v6 > 1.0)
  {
    v10 = v4;
    v11 = v5;
    v12 = v6;
    if (-[PUCropToolController _needsRecomposeCropRect](self, "_needsRecomposeCropRect"))
    {
      -[PUCropToolController cropView](self, "cropView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImageCropRectFromViewCropRect:animated:", 1, v8, v10, v11, v12);

      -[PUCropToolController cropView](self, "cropView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      objc_msgSend(v14, "setModelCropRect:viewCropRect:");

    }
  }
  if (-[PUCropToolController loadingStateFromModel](self, "loadingStateFromModel"))
    -[PUCropToolController setWasLoadingStateFromModelWhenTrackingBegan:](self, "setWasLoadingStateFromModelWhenTrackingBegan:", 1);
  else
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  -[PUCropToolController _showGridAndCancelDelayedHide](self, "_showGridAndCancelDelayedHide");
  -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
  -[PUCropToolController showVideoScrubber:](self, "showVideoScrubber:", 0);
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
}

- (void)cropTransformedImageViewDidTrack:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PUPhotoEditToolController compositionController](self, "compositionController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 2684, CFSTR("Need a composition to perform this operation"));

  }
  if (!-[PUCropToolController ignoreTrackingUpdates](self, "ignoreTrackingUpdates"))
  {
    if (-[PUCropToolController isActiveTool](self, "isActiveTool"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__PUCropToolController_cropTransformedImageViewDidTrack___block_invoke;
      v7[3] = &unk_1E58A4638;
      v7[4] = self;
      -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v7);
      -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);
      -[PUCropToolController setHasAppliedPerspectiveSuggestion:](self, "setHasAppliedPerspectiveSuggestion:", 0);
    }
  }
}

- (void)cropTransformedImageViewDidEndTracking:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _QWORD v19[5];

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController viewCropRect](self, "viewCropRect");
  objc_msgSend(v4, "setCropRect:");

  -[PUCropToolController cropView](self, "cropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PUCropToolController viewCropRect](self, "viewCropRect");
  objc_msgSend(v5, "setModelCropRect:viewCropRect:", v7, v9, v11, v13, v14, v15, v16, v17);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__PUCropToolController_cropTransformedImageViewDidEndTracking___block_invoke;
  v19[3] = &unk_1E58A4638;
  v19[4] = self;
  -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v19);
  if (-[PUCropToolController wasLoadingStateFromModelWhenTrackingBegan](self, "wasLoadingStateFromModelWhenTrackingBegan"))
  {
    -[PUCropToolController setWasLoadingStateFromModelWhenTrackingBegan:](self, "setWasLoadingStateFromModelWhenTrackingBegan:", 0);
  }
  else
  {
    PULocalizedString(CFSTR("PHOTOEDIT_CROP_GENERIC_ACTION_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v18);

  }
  -[PUCropToolController _updateCropViewsForInteraction](self, "_updateCropViewsForInteraction");
  -[PUCropToolController resetToolLabelHidingTimer](self, "resetToolLabelHidingTimer");
}

- (void)cropTransformedImageView:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", a4);
}

- (void)prepareForToolTransitionWithCompletion:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandardVideo");

  if (v5)
    -[PUCropToolController basePhotoInvalidated](self, "basePhotoInvalidated");
  -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", v6);

}

- (id)localizedName
{
  return PULocalizedString(CFSTR("PHOTOEDIT_CROP_TOOL_BUTTON"));
}

- (id)toolbarIconGlyphName
{
  return CFSTR("crop.rotate");
}

- (id)selectedToolbarIconGlyphName
{
  return CFSTR("crop.rotate");
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(CFSTR("PHOTOEDIT_CROP_AND_ROTATE_TOOLBAR_BUTTON_AX_LABEL"));
}

- (BOOL)canResetToDefaultValue
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUCropToolController cropModel](self, "cropModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "masterImageSize");
    if ((objc_msgSend(v4, "isCropIdentityForImageSize:") & 1) != 0)
      v6 = 0;
    else
      v6 = objc_msgSend(v4, "enabled");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localizedResetToolActionTitle
{
  return PULocalizedString(CFSTR("PHOTOEDIT_RESET_CROP"));
}

- (BOOL)wantsDefaultPreviewView
{
  return !-[PUCropToolController wantsPreviewViewHidden](self, "wantsPreviewViewHidden");
}

- (BOOL)suppressesEditUpdates
{
  return 1;
}

- (BOOL)handlesVideoPlaying
{
  return 1;
}

- (BOOL)handlesMediaViewInsets
{
  return 1;
}

- (BOOL)supportsPreviewingOriginal
{
  return 0;
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  id v21;

  v3 = a3;
  -[PUCropToolController adjustmentsViewController](self, "adjustmentsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  if (v3)
  {
    if (-[PUCropToolController isTrackingAdjustmentControl](self, "isTrackingAdjustmentControl"))
    {
      objc_msgSend(v21, "hideUnselectedAdjustments:", 1);
      objc_msgSend(v21, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1.0;
    }
    else
    {
      objc_msgSend(v21, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0.0;
    }
    objc_msgSend(v6, "setAlpha:", v8);

    -[PUCropToolController playPauseButton](self, "playPauseButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0.0;
  }
  else
  {
    objc_msgSend(v5, "hideUnselectedAdjustments:", 0);
    objc_msgSend(v21, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 1.0);

    -[PUCropToolController videoScrubberView](self, "videoScrubberView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alpha");
    v12 = v11;

    if (v12 <= 0.0)
      goto LABEL_9;
    -[PUCropToolController playPauseButton](self, "playPauseButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 1.0;
  }
  objc_msgSend(v13, "setAlpha:", v15);

LABEL_9:
  -[PUCropToolController cropAspect](self, "cropAspect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    v18 = objc_msgSend(v16, "isFreeformCrop");
  else
    v18 = 1;
  v19 = (double)((v3 | v18) ^ 1u);
  -[PUCropToolController aspectRatioLockButton](self, "aspectRatioLockButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", v19);

}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  PUCropAspectViewController *cropAspectViewController;
  BOOL v4;
  BOOL v5;
  _BOOL4 v6;

  if (self->_aspectButton)
  {
    cropAspectViewController = self->_cropAspectViewController;
    v4 = a3 != 7;
    v5 = cropAspectViewController == 0;
    if (cropAspectViewController)
      v6 = 0;
    else
      v6 = a3 == 6;
    if (v5)
      v4 = 1;
    if (v6 || !v4)
      -[PUCropToolController _aspectButtonTapped:](self, "_aspectButtonTapped:");
  }
}

- (void)increaseSliderValue:(BOOL)a3
{
  -[PUAdjustmentsViewController increaseAdjustmentValue:](self->_adjustmentsViewController, "increaseAdjustmentValue:", a3);
}

- (void)decreaseSliderValue:(BOOL)a3
{
  -[PUAdjustmentsViewController decreaseAdjustmentValue:](self->_adjustmentsViewController, "decreaseAdjustmentValue:", a3);
}

- (void)setContentViewsHidden:(BOOL)a3
{
  -[PUCropToolController _setContentViewsHidden:animated:](self, "_setContentViewsHidden:animated:", a3, 0);
}

- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[PUCropToolController _setContentViewsHidden:animated:completion:](self, "_setContentViewsHidden:animated:completion:", a3, a4, 0);
}

- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[7];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_contentViewsHidden != v6)
  {
    self->_contentViewsHidden = v6;
    -[PUCropToolController setContentViewsHiddenAnimationCount:](self, "setContentViewsHiddenAnimationCount:", -[PUCropToolController contentViewsHiddenAnimationCount](self, "contentViewsHiddenAnimationCount") + 1);
    v9 = (double)!v6;
    v10 = 0.0;
    if (v5)
      v11 = 0.3;
    else
      v11 = 0.0;
    -[PUCropToolController cropAspect](self, "cropAspect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "isFreeformCrop"))
        v10 = 0.0;
      else
        v10 = (double)!v6;
    }
    -[PUCropToolController cropOverlayView](self, "cropOverlayView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v9);

    v15 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke;
    v18[3] = &unk_1E58A5BB0;
    v18[4] = self;
    *(double *)&v18[5] = v9;
    *(double *)&v18[6] = v10;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke_2;
    v16[3] = &unk_1E58AB7D8;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 6, v18, v16, v11, 0.0);

  }
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PUCropToolController *v28;
  objc_super v29;

  v6 = a4;
  v7 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
  v29.receiver = self;
  v29.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v29, sel_setLayoutOrientation_withTransitionCoordinator_, a3, v6);
  if (v7 != a3)
  {
    if (-[PUCropToolController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUCropToolController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[PUCropToolController rotateButton](self, "rotateButton");
    v9 = objc_claimAutoreleasedReturnValue();
    -[PUCropToolController aspectButton](self, "aspectButton");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v8 && -[PUCropToolController isActiveTool](self, "isActiveTool") && v9 | v10)
    {
      -[PUCropToolController setRotateButton:](self, "setRotateButton:", 0);
      -[PUCropToolController setAspectButton:](self, "setAspectButton:", 0);
      -[PUCropToolController _invalidateConstraintsForKey:](self, "_invalidateConstraintsForKey:", CFSTR("PUCropActionButtonConstraints"));
      -[PUCropToolController _updateCropActionButtons](self, "_updateCropActionButtons");
      if (v6)
      {
        objc_msgSend(v8, "layoutIfNeeded");
        -[PUCropToolController rotateButton](self, "rotateButton");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAlpha:", 0.0);

        -[PUCropToolController aspectButton](self, "aspectButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAlpha:", 0.0);

        v13 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
        v25[3] = &unk_1E589E0A8;
        v26 = (id)v9;
        v27 = (id)v10;
        v28 = self;
        v22[0] = v13;
        v22[1] = 3221225472;
        v22[2] = __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
        v22[3] = &unk_1E58A40C0;
        v23 = v26;
        v24 = v27;
        objc_msgSend(v6, "animateAlongsideTransition:completion:", v25, v22);

      }
      else
      {
        objc_msgSend((id)v9, "removeFromSuperview");
        objc_msgSend((id)v10, "removeFromSuperview");
      }
    }
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "currentLayoutStyle");

    -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUCropToolController adjustmentPickerView](self, "adjustmentPickerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v16 || v15 == 4)
    {
      objc_msgSend(v17, "setHidden:", 0);

      -[PUCropToolController badgeView](self, "badgeView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 0;
    }
    else
    {
      objc_msgSend(v17, "setHidden:", 1);

      -[PUCropToolController badgeView](self, "badgeView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 1;
    }
    objc_msgSend(v19, "setHidden:", v21);

    -[PUCropToolController _invalidateConstraintsForKey:](self, "_invalidateConstraintsForKey:", CFSTR("PUCropCanvasConstraints"));
    -[PUCropToolController _invalidateConstraintsForKey:](self, "_invalidateConstraintsForKey:", CFSTR("PUCropTiltControlConstraints"));
    -[PUCropToolController _invalidateConstraintsForKey:](self, "_invalidateConstraintsForKey:", CFSTR("PUCropToggleConstraints"));
    -[PUCropToolController setNeedsModelLoad:](self, "setNeedsModelLoad:", 1);
    objc_msgSend(v8, "setNeedsUpdateConstraints");

  }
}

- (BOOL)canBecomeActiveTool
{
  -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", 0);
  return 1;
}

- (void)willBecomeActiveTool
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController willBecomeActiveTool](&v13, sel_willBecomeActiveTool);
  -[PUCropToolController setNeedsModelLoad:](self, "setNeedsModelLoad:", 1);
  -[PUCropToolController lastKnownComposition](self, "lastKnownComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController lastKnownComposition](self, "lastKnownComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:visualChangesOnly:", v5, 1) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustmentControllerForKey:", *MEMORY[0x1E0D71380]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "enabled");
  }
  else
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "hasLoopingVideoAdjustment");

  }
  -[PUCropToolController cropView](self, "cropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMuted:", v9);

  if (v6)
    -[PUCropToolController setNeedsImageLoad:](self, "setNeedsImageLoad:", 1);
  -[PUCropToolController setNeedsMediaLoad:](self, "setNeedsMediaLoad:", 1);
  -[PUCropToolController _loadImageIfNeededWithCompletion:](self, "_loadImageIfNeededWithCompletion:", 0);
  -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "precomputeGeometricValues");

  -[PUCropToolController setWantsPreviewViewHidden:](self, "setWantsPreviewViewHidden:", 0);
  -[PUCropToolController setContentViewsHidden:](self, "setContentViewsHidden:", 1);

}

- (void)reactivate
{
  if (self->_aspectButton)
    -[PUCropToolController _aspectButtonTapped:](self, "_aspectButtonTapped:");
}

- (void)_performInitialAction
{
  if (-[PUCropToolController initialAction](self, "initialAction") == 1)
  {
    -[PUCropToolController rotateAssetsCounterclockwise:](self, "rotateAssetsCounterclockwise:", 0);
  }
  else if (-[PUCropToolController initialAction](self, "initialAction") == 2)
  {
    -[PUCropToolController rotateAssetsClockwise:](self, "rotateAssetsClockwise:", 0);
  }
  -[PUCropToolController setInitialAction:](self, "setInitialAction:", 0);
}

- (void)_installRenderedImageAndDisplayIfNeeded
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[PUCropToolController image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!-[PUCropToolController isActiveTool](self, "isActiveTool")
      || -[PUCropToolController needsMediaLoad](self, "needsMediaLoad"))
    {
      goto LABEL_10;
    }
LABEL_8:
    -[PUCropToolController cropOverlayView](self, "cropOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaskedContentVisible:", 0);

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PUCropToolController__installRenderedImageAndDisplayIfNeeded__block_invoke;
    v7[3] = &unk_1E58AA420;
    objc_copyWeak(&v8, &location);
    -[PUCropToolController _setContentViewsHidden:animated:completion:](self, "_setContentViewsHidden:animated:completion:", 0, 1, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isStandardVideo") || !-[PUCropToolController isActiveTool](self, "isActiveTool"))
  {

    goto LABEL_10;
  }
  v5 = -[PUCropToolController needsMediaLoad](self, "needsMediaLoad");

  if (!v5)
    goto LABEL_8;
LABEL_10:

}

- (void)didBecomeActiveTool
{
  objc_super v3;

  -[PUCropToolController setActiveTool:](self, "setActiveTool:", 1);
  if (-[PUCropToolController needsMediaLoad](self, "needsMediaLoad"))
    -[PUCropToolController _loadMediaIfNeeded](self, "_loadMediaIfNeeded");
  else
    -[PUCropToolController _installRenderedImageAndDisplayIfNeeded](self, "_installRenderedImageAndDisplayIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PUCropToolController;
  -[PUPhotoEditToolController didBecomeActiveTool](&v3, sel_didBecomeActiveTool);
}

- (void)willResignActiveTool
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
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  -[PUCropToolController setModelLoadingSuspended:](self, "setModelLoadingSuspended:", 1);
  -[PUCropToolController setActiveTool:](self, "setActiveTool:", 0);
  -[PUCropToolController _updatePreviewViewInsets](self, "_updatePreviewViewInsets");
  -[PUCropToolController _closeAspectRatioPicker](self, "_closeAspectRatioPicker");
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[PUCropToolController setLastKnownComposition:](self, "setLastKnownComposition:", v5);

  -[PUCropToolController setContentViewsHidden:](self, "setContentViewsHidden:", 1);
  -[PUCropToolController rotateSnapshotView](self, "rotateSnapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[PUCropToolController setRotateSnapshotView:](self, "setRotateSnapshotView:", 0);
  -[PUCropToolController _cancelDelayedRecomposeCropRect](self, "_cancelDelayedRecomposeCropRect");
  -[PUCropToolController handleResigningCropTool](self, "handleResigningCropTool");
  -[PUCropToolController cropView](self, "cropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoMediaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pause");
  v17 = 0uLL;
  v18 = 0;
  if (v9)
  {
    objc_msgSend(v9, "currentTime");
    if ((BYTE12(v17) & 1) != 0)
    {
      -[PUPhotoEditToolController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mediaView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v16 = v18;
      objc_msgSend(v12, "seekToTime:exact:forceSeek:", &v15, 1, 1);

    }
  }
  -[PUCropToolController cropView](self, "cropView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tearDownMediaViewAndLayers");

  -[PUCropToolController badgeView](self, "badgeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 0.0);

}

- (void)prepareForSave:(BOOL)a3
{
  if (a3)
    -[PUCropToolController handleResigningCropTool](self, "handleResigningCropTool");
}

- (void)handleResigningCropTool
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[16];
  _QWORD v22[8];
  CGRect v23;

  if (-[PUCropToolController _needsRecomposeCropRect](self, "_needsRecomposeCropRect"))
  {
    -[PUCropToolController cropView](self, "cropView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController viewCropRect](self, "viewCropRect");
    objc_msgSend(v3, "setImageCropRectFromViewCropRect:animated:", 0);

    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    if (CGRectIsEmpty(v23))
    {
      PLPhotoEditGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Crop model rect is empty in [PUCropToolController handleResigningCropTool]", buf, 2u);
      }

    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__PUCropToolController_handleResigningCropTool__block_invoke;
      v22[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
      *(CGFloat *)&v22[4] = x;
      *(CGFloat *)&v22[5] = y;
      *(CGFloat *)&v22[6] = width;
      *(CGFloat *)&v22[7] = height;
      -[PUCropToolController _performLocalCropModelChanges:](self, "_performLocalCropModelChanges:", v22);
    }
  }
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cropAdjustmentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cropRect");
  if (v12 < 1.0 || v11 < 1.0)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "PICropAdjustmentKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAdjustmentWithKey:", v16);

  }
  else if (objc_msgSend(v10, "enabled"))
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "PICropAdjustmentKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__PUCropToolController_handleResigningCropTool__block_invoke_248;
    v20[3] = &unk_1E58A4638;
    v20[4] = self;
    objc_msgSend(v17, "modifyAdjustmentWithKey:modificationBlock:", v19, v20);

  }
}

- (void)didResignActiveTool
{
  id v3;

  -[PUCropToolController setModelLoadingSuspended:](self, "setModelLoadingSuspended:", 0);
  -[PUCropToolController setContentViewsHidden:](self, "setContentViewsHidden:", 0);
  -[PUCropToolController cropView](self, "cropView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoloopComposition:", 0);

}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (id)leadingToolbarViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PUCropToolController flipButton](self, "flipButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[PUCropToolController rotateButton](self, "rotateButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trailingToolbarViews
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PUCropToolController aspectButton](self, "aspectButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (id)toolActionsForMenu
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PUCropToolController cropAspect](self, "cropAspect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("lock.fill");
  v6 = CFSTR("PHOTOEDIT_CROP_MENU_LOCK_ASPECT_RATIO");
  if (v3 && !objc_msgSend(v3, "isFreeformCrop"))
  {
    v6 = CFSTR("PHOTOEDIT_CROP_MENU_UNLOCK_ASPECT_RATIO");
    v5 = CFSTR("lock.open.fill");
  }
  PULocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PUCropToolController_toolActionsForMenu__block_invoke;
  v12[3] = &unk_1E58A6930;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v7, v8, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3
{
  -[PUCropToolController _loadCropSuggestionIfNeeded](self, "_loadCropSuggestionIfNeeded", a3);
  -[PUCropToolController _loadPerspectiveSuggestionIfNeeded](self, "_loadPerspectiveSuggestionIfNeeded");
  -[PUCropToolController _updateCropToggleButtonMode](self, "_updateCropToggleButtonMode");
  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
}

- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3
{
  -[PUCropToolController setEditValuesCalculatorDidFinishComputingGeometricValues:](self, "setEditValuesCalculatorDidFinishComputingGeometricValues:", 1);
}

- (void)rotateAssetsCounterclockwise:(id)a3
{
  -[PUCropToolController _rotateByApplyingOrientation:](self, "_rotateByApplyingOrientation:", 8);
}

- (void)rotateAssetsClockwise:(id)a3
{
  -[PUCropToolController _rotateByApplyingOrientation:](self, "_rotateByApplyingOrientation:", 6);
}

- (void)_rotateByApplyingOrientation:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PUCropToolController__rotateByApplyingOrientation___block_invoke;
  v4[3] = &__block_descriptor_40_e25_v16__0__PLImageGeometry_8l;
  v4[4] = a3;
  -[PUCropToolController _performGeometryChange:animated:](self, "_performGeometryChange:animated:", v4, 1);
  -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);
  -[PUCropToolController _updateAspectRatioControls](self, "_updateAspectRatioControls");
}

- (void)_rotateButtonTapped:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 3188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sender isKindOfClass:[UIButton class]]"));

  }
  -[PUCropToolController _rotateByApplyingOrientation:](self, "_rotateByApplyingOrientation:", 8);
}

- (void)_flipButtonTapped:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 3193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sender isKindOfClass:[UIButton class]]"));

  }
  -[PUCropToolController _performGeometryChange:animated:](self, "_performGeometryChange:animated:", &__block_literal_global_259, 1);
  -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);
}

- (void)_gridButtonTapped:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 3203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sender isKindOfClass:[UIButton class]]"));

  }
  -[PUCropToolController setGridVisible:](self, "setGridVisible:", -[PUCropToolController gridVisible](self, "gridVisible") ^ 1);
  -[PUCropToolController cropOverlayView](self, "cropOverlayView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCropGridVisible:animated:", -[PUCropToolController gridVisible](self, "gridVisible"), 1);

}

- (void)_closeAspectRatioPicker
{
  PUCropAspectViewController *cropAspectViewController;
  void *v4;
  PUCropAspectViewController *v5;
  void *v6;
  void *v7;
  PUCropAspectFlipperView *cropAspectFlipperView;

  cropAspectViewController = self->_cropAspectViewController;
  if (cropAspectViewController)
  {
    -[PUCropAspectViewController removeFromParentViewController](cropAspectViewController, "removeFromParentViewController");
    -[PUCropAspectViewController view](self->_cropAspectViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v5 = self->_cropAspectViewController;
    self->_cropAspectViewController = 0;

    -[PUCropToolController _invalidateConstraintsForKey:](self, "_invalidateConstraintsForKey:", CFSTR("PUCropToggleConstraints"));
    -[PUCropToolController adjustmentPickerView](self, "adjustmentPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    -[PUCropToolController badgeView](self, "badgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[PUCropAspectFlipperView removeFromSuperview](self->_cropAspectFlipperView, "removeFromSuperview");
    cropAspectFlipperView = self->_cropAspectFlipperView;
    self->_cropAspectFlipperView = 0;

  }
}

- (void)_aspectButtonTapped:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  _BOOL8 v19;
  PUCropAspectViewController *v20;
  void *v21;
  void *v22;
  PUCropAspectViewController *v23;
  PUCropAspectViewController *cropAspectViewController;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  PUCropAspectFlipperView *v30;
  PUCropAspectFlipperView *cropAspectFlipperView;
  void *v32;
  PUCropAspectFlipperView *v33;
  void *v34;
  void *v35;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 3226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sender isKindOfClass:[UIButton class]]"));

  }
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolControllerOriginalOrientedImageSize:", self);
  v9 = v8;
  v11 = v10;

  -[PUCropToolController viewCropRect](self, "viewCropRect");
  if (self->_cropAspectViewController)
  {
    -[PUCropToolController _closeAspectRatioPicker](self, "_closeAspectRatioPicker");
  }
  else
  {
    v14 = v12;
    v15 = v13;
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "currentLayoutStyle");

    v18 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    v19 = v17 != 4 && v18 != 1;
    v20 = [PUCropAspectViewController alloc];
    -[PUCropToolController cropAspect](self, "cropAspect");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PUCropAspectViewController initWithLayoutOrientation:originalSize:currentSize:currentCropAspect:spec:](v20, "initWithLayoutOrientation:originalSize:currentSize:currentCropAspect:spec:", v19, v21, v22, v9, v11, v14, v15);
    cropAspectViewController = self->_cropAspectViewController;
    self->_cropAspectViewController = v23;

    -[PUCropAspectViewController setDelegate:](self->_cropAspectViewController, "setDelegate:", self);
    -[PUCropAspectViewController setParentViewController:](self->_cropAspectViewController, "setParentViewController:", self);
    -[PUCropToolController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropAspectViewController view](self->_cropAspectViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

    if (v17 == 4)
    {
      v27 = 0;
    }
    else
    {
      v27 = v18 != 1;
      -[PUCropToolController adjustmentPickerView](self, "adjustmentPickerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHidden:", 1);

      -[PUCropToolController badgeView](self, "badgeView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 1);

    }
    v30 = -[PUCropAspectFlipperView initWithLayoutOrientation:]([PUCropAspectFlipperView alloc], "initWithLayoutOrientation:", v27);
    cropAspectFlipperView = self->_cropAspectFlipperView;
    self->_cropAspectFlipperView = v30;

    -[PUCropAspectFlipperView setDelegate:](self->_cropAspectFlipperView, "setDelegate:", self);
    if (v17 == 4)
    {
      v33 = self->_cropAspectFlipperView;
      -[PUCropToolController cropAspectViewController](self, "cropAspectViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setScrollExtraLeftView:", v33);

    }
    else
    {
      -[PUCropToolController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", self->_cropAspectFlipperView);

    }
  }
  -[PUCropAspectFlipperView setAspectRatioOrientation:](self->_cropAspectFlipperView, "setAspectRatioOrientation:", -[PUCropAspectViewController aspectOrientation](self->_cropAspectViewController, "aspectOrientation"));
  -[PUCropToolController _updateCropToggleButton](self, "_updateCropToggleButton");
  -[PUCropToolController _updateCropActionButtons](self, "_updateCropActionButtons");
}

- (void)_cropToggleTapped:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropToolController.m"), 3268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sender isKindOfClass:[UIButton class]]"));

  }
  -[PUCropToolController _toggleCropAndPerspective](self, "_toggleCropAndPerspective");
}

- (int64_t)toolControllerTag
{
  return 1004;
}

- (void)cropAspectController:(id)a3 cropAspectSelected:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", v7, 1);
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_ACTION_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v5);

  if (v7)
    v6 = objc_msgSend(v7, "isFreeformCrop") ^ 1;
  else
    v6 = 0;
  -[PUCropToolController _userChangedAspectRatioLocked:](self, "_userChangedAspectRatioLocked:", v6);
  -[PUCropToolController setHasAppliedCropSuggestion:](self, "setHasAppliedCropSuggestion:", 0);

}

- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUCropToolController cropAspect](self, "cropAspect", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    -[PUCropToolController cropAspect](self, "cropAspect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inverseAspect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropToolController _setCropAspect:animated:](self, "_setCropAspect:animated:", v8, 1);

    PULocalizedString(CFSTR("PHOTOEDIT_CROP_ORIENTATION_ACTION_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v9);

  }
  -[PUCropToolController updateCropAspectRatioOrientation:](self, "updateCropAspectRatioOrientation:", a4);
}

- (void)adjustmentsDataChanged:(id)a3
{
  -[PUAdjustmentsViewController updateControls](self->_adjustmentsViewController, "updateControls", a3);
}

- (id)adjustmentsRenderer:(id)a3
{
  void *v4;
  void *v5;

  -[PUPhotoEditToolController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerMainRenderer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_preferredContentSizeCategoryChanged
{
  void *v2;
  NSString *v3;
  id v4;

  -[PUCropToolController accessibilityLongPressGestureRecognizer](self, "accessibilityLongPressGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", UIContentSizeCategoryIsAccessibilityCategory(v3));

}

- (void)_accessibilityLongPressChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[PUCropToolController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropToolController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "locationInView:", v5);
  objc_msgSend(v4, "hitTest:withEvent:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolController rotateButton](self, "rotateButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v5)
  {
    -[PUCropToolController rotateButton](self, "rotateButton");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = (void *)v8;
    goto LABEL_8;
  }
  -[PUCropToolController aspectButton](self, "aspectButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    -[PUCropToolController aspectButton](self, "aspectButton");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[PUCropToolController autoButton](self, "autoButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
  {
    -[PUCropToolController autoButton](self, "autoButton");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v13 = 0;
LABEL_8:
  v14 = objc_msgSend(v21, "state");
  if ((unint64_t)(v14 - 1) < 2)
  {
    if (v13)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC3418]);
      objc_msgSend(v13, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithTitle:image:imageInsets:scaleImage:", v17, v19, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

      if (v20)
        -[PUCropToolController _showAccessibilityHUDItem:](self, "_showAccessibilityHUDItem:", v20);
      else
        -[PUCropToolController _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");

      goto LABEL_19;
    }
LABEL_15:
    -[PUCropToolController _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");
    goto LABEL_19;
  }
  if (v14 != 3)
    goto LABEL_15;
  if (v13)
  {
    -[PUCropToolController _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");
    objc_msgSend(v13, "pu_sendActionForControlEventsWithHighlightTimeout:", 64);
  }
LABEL_19:

}

- (BOOL)isHDREnabled
{
  int v2;

  if ((objc_msgSend(MEMORY[0x1E0D52108], "enableDash5") & 1) != 0
    || (v2 = objc_msgSend(MEMORY[0x1E0D52108], "renderMeteorPlusAsHDR")) != 0)
  {
    LOBYTE(v2) = PXUserAllowFullHDR();
  }
  return v2;
}

- (BOOL)imageLoadingInProgress
{
  return self->_imageLoadingInProgress;
}

- (void)setImageLoadingInProgress:(BOOL)a3
{
  self->_imageLoadingInProgress = a3;
}

- (int64_t)initialAction
{
  return self->_initialAction;
}

- (void)setInitialAction:(int64_t)a3
{
  self->_initialAction = a3;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (PUAdjustmentsViewController)adjustmentsViewController
{
  return self->_adjustmentsViewController;
}

- (void)setAdjustmentsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentsViewController, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)adjustmentPickerView
{
  return self->_adjustmentPickerView;
}

- (void)setAdjustmentPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentPickerView, a3);
}

- (PUPhotoEditToolActivationButton)autoButton
{
  return self->_autoButton;
}

- (void)setAutoButton:(id)a3
{
  objc_storeStrong((id *)&self->_autoButton, a3);
}

- (int64_t)autoButtonMode
{
  return self->_autoButtonMode;
}

- (PUPhotoEditToolbarButton)rotateButton
{
  return self->_rotateButton;
}

- (void)setRotateButton:(id)a3
{
  objc_storeStrong((id *)&self->_rotateButton, a3);
}

- (PUPhotoEditToolbarButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
  objc_storeStrong((id *)&self->_flipButton, a3);
}

- (PUPhotoEditToolbarButton)aspectButton
{
  return self->_aspectButton;
}

- (void)setAspectButton:(id)a3
{
  objc_storeStrong((id *)&self->_aspectButton, a3);
}

- (void)setCropView:(id)a3
{
  objc_storeStrong((id *)&self->_cropView, a3);
}

- (void)setCropCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_cropCanvasView, a3);
}

- (void)setCropOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_cropOverlayView, a3);
}

- (void)setCropHandleViewsByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cropHandleViewsByHandle, a3);
}

- (PUCropHandleView)selectedCropHandleView
{
  return self->_selectedCropHandleView;
}

- (void)setSelectedCropHandleView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCropHandleView, a3);
}

- (UIView)rotateSnapshotView
{
  return self->_rotateSnapshotView;
}

- (void)setRotateSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_rotateSnapshotView, a3);
}

- (PUCropAspectViewController)cropAspectViewController
{
  return self->_cropAspectViewController;
}

- (void)setCropAspectViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cropAspectViewController, a3);
}

- (PUCropAspectFlipperView)cropAspectFlipperView
{
  return self->_cropAspectFlipperView;
}

- (void)setCropAspectFlipperView:(id)a3
{
  objc_storeStrong((id *)&self->_cropAspectFlipperView, a3);
}

- (CGSize)minimumViewCropRectSizeForHandleGesture
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumViewCropRectSizeForHandleGesture.width;
  height = self->_minimumViewCropRectSizeForHandleGesture.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumViewCropRectSizeForHandleGesture:(CGSize)a3
{
  self->_minimumViewCropRectSizeForHandleGesture = a3;
}

- (UIButton)aspectRatioLockButton
{
  return self->_aspectRatioLockButton;
}

- (void)setAspectRatioLockButton:(id)a3
{
  objc_storeStrong((id *)&self->_aspectRatioLockButton, a3);
}

- (PUCropPerspectiveAdjustmentsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setInitialLocationsInHandlesByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_initialLocationsInHandlesByHandle, a3);
}

- (CGRect)initialHandlePanCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialHandlePanCropRect.origin.x;
  y = self->_initialHandlePanCropRect.origin.y;
  width = self->_initialHandlePanCropRect.size.width;
  height = self->_initialHandlePanCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialHandlePanCropRect:(CGRect)a3
{
  self->_initialHandlePanCropRect = a3;
}

- (BOOL)contentViewsHidden
{
  return self->_contentViewsHidden;
}

- (UIEdgeInsets)previewViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_previewViewInsets.top;
  left = self->_previewViewInsets.left;
  bottom = self->_previewViewInsets.bottom;
  right = self->_previewViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreviewViewInsets:(UIEdgeInsets)a3
{
  self->_previewViewInsets = a3;
}

- (BOOL)wantsPreviewViewHidden
{
  return self->_wantsPreviewViewHidden;
}

- (void)setWantsPreviewViewHidden:(BOOL)a3
{
  self->_wantsPreviewViewHidden = a3;
}

- (BOOL)ignoreTrackingUpdates
{
  return self->_ignoreTrackingUpdates;
}

- (void)setIgnoreTrackingUpdates:(BOOL)a3
{
  self->_ignoreTrackingUpdates = a3;
}

- (void)setAnimationsByKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_animationsByKeyPath, a3);
}

- (void)setAnimationTargetsByKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_animationTargetsByKeyPath, a3);
}

- (unint64_t)rotatingAnimationCount
{
  return self->_rotatingAnimationCount;
}

- (void)setRotatingAnimationCount:(unint64_t)a3
{
  self->_rotatingAnimationCount = a3;
}

- (unint64_t)contentViewsHiddenAnimationCount
{
  return self->_contentViewsHiddenAnimationCount;
}

- (void)setContentViewsHiddenAnimationCount:(unint64_t)a3
{
  self->_contentViewsHiddenAnimationCount = a3;
}

- (BOOL)isTrackingAdjustmentControl
{
  return self->_trackingAdjustmentControl;
}

- (void)setTrackingAdjustmentControl:(BOOL)a3
{
  self->_trackingAdjustmentControl = a3;
}

- (NSTimer)badgeShowingExpirationTimer
{
  return self->_badgeShowingExpirationTimer;
}

- (void)setBadgeShowingExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeShowingExpirationTimer, a3);
}

- (BOOL)toolBadgeDoesHide
{
  return self->_toolBadgeDoesHide;
}

- (void)setToolBadgeDoesHide:(BOOL)a3
{
  self->_toolBadgeDoesHide = a3;
}

- (BOOL)modelLoadingSuspended
{
  return self->_modelLoadingSuspended;
}

- (void)setModelLoadingSuspended:(BOOL)a3
{
  self->_modelLoadingSuspended = a3;
}

- (BOOL)loadingStateFromModel
{
  return self->_loadingStateFromModel;
}

- (void)setLoadingStateFromModel:(BOOL)a3
{
  self->_loadingStateFromModel = a3;
}

- (BOOL)wasLoadingStateFromModelWhenTrackingBegan
{
  return self->_wasLoadingStateFromModelWhenTrackingBegan;
}

- (void)setWasLoadingStateFromModelWhenTrackingBegan:(BOOL)a3
{
  self->_wasLoadingStateFromModelWhenTrackingBegan = a3;
}

- (BOOL)needsImageLoad
{
  return self->_needsImageLoad;
}

- (void)setNeedsImageLoad:(BOOL)a3
{
  self->_needsImageLoad = a3;
}

- (BOOL)initialImageLoaded
{
  return self->_initialImageLoaded;
}

- (void)setInitialImageLoaded:(BOOL)a3
{
  self->_initialImageLoaded = a3;
}

- (BOOL)needsMediaLoad
{
  return self->_needsMediaLoad;
}

- (void)setNeedsMediaLoad:(BOOL)a3
{
  self->_needsMediaLoad = a3;
}

- (BOOL)isActiveTool
{
  return self->_activeTool;
}

- (void)setActiveTool:(BOOL)a3
{
  self->_activeTool = a3;
}

- (BOOL)needsModelLoad
{
  return self->_needsModelLoad;
}

- (void)setNeedsModelLoad:(BOOL)a3
{
  self->_needsModelLoad = a3;
}

- (CGRect)cropViewFrameForLastModelLoad
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropViewFrameForLastModelLoad.origin.x;
  y = self->_cropViewFrameForLastModelLoad.origin.y;
  width = self->_cropViewFrameForLastModelLoad.size.width;
  height = self->_cropViewFrameForLastModelLoad.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropViewFrameForLastModelLoad:(CGRect)a3
{
  self->_cropViewFrameForLastModelLoad = a3;
}

- (BOOL)isModelChangeLocal
{
  return self->_modelChangeLocal;
}

- (void)setModelChangeLocal:(BOOL)a3
{
  self->_modelChangeLocal = a3;
}

- (NUComposition)lastKnownComposition
{
  return self->_lastKnownComposition;
}

- (void)setLastKnownComposition:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownComposition, a3);
}

- (PLPhotoEditRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (PLImageGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_geometry, a3);
}

- (NUCropModel)cropModel
{
  return self->_cropModel;
}

- (void)setCropModel:(id)a3
{
  objc_storeStrong((id *)&self->_cropModel, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGRect)inputExtent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputExtent.origin.x;
  y = self->_inputExtent.origin.y;
  width = self->_inputExtent.size.width;
  height = self->_inputExtent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputExtent:(CGRect)a3
{
  self->_inputExtent = a3;
}

- (CGRect)viewCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewCropRect.origin.x;
  y = self->_viewCropRect.origin.y;
  width = self->_viewCropRect.size.width;
  height = self->_viewCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)straightenAngle
{
  return self->_straightenAngle;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (PUCropAspect)cropAspect
{
  return self->_cropAspect;
}

- (BOOL)gridVisible
{
  return self->_gridVisible;
}

- (CGRect)suggestedCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_suggestedCrop.origin.x;
  y = self->_suggestedCrop.origin.y;
  width = self->_suggestedCrop.size.width;
  height = self->_suggestedCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSuggestedCrop:(CGRect)a3
{
  self->_suggestedCrop = a3;
}

- (double)suggestedStraightenAngle
{
  return self->_suggestedStraightenAngle;
}

- (void)setSuggestedStraightenAngle:(double)a3
{
  self->_suggestedStraightenAngle = a3;
}

- (BOOL)hasAutoAppliedCropSuggestion
{
  return self->_hasAutoAppliedCropSuggestion;
}

- (void)setHasAutoAppliedCropSuggestion:(BOOL)a3
{
  self->_hasAutoAppliedCropSuggestion = a3;
}

- (BOOL)hasAppliedCropSuggestion
{
  return self->_hasAppliedCropSuggestion;
}

- (BOOL)hasRequestedCropSuggestion
{
  return self->_hasRequestedCropSuggestion;
}

- (void)setHasRequestedCropSuggestion:(BOOL)a3
{
  self->_hasRequestedCropSuggestion = a3;
}

- (BOOL)editValuesCalculatorDidFinishComputingGeometricValues
{
  return self->_editValuesCalculatorDidFinishComputingGeometricValues;
}

- (void)setEditValuesCalculatorDidFinishComputingGeometricValues:(BOOL)a3
{
  self->_editValuesCalculatorDidFinishComputingGeometricValues = a3;
}

- (double)suggestedPitchAngle
{
  return self->_suggestedPitchAngle;
}

- (void)setSuggestedPitchAngle:(double)a3
{
  self->_suggestedPitchAngle = a3;
}

- (double)suggestedYawAngle
{
  return self->_suggestedYawAngle;
}

- (void)setSuggestedYawAngle:(double)a3
{
  self->_suggestedYawAngle = a3;
}

- (BOOL)hasAutoAppliedPerspectiveSuggestion
{
  return self->_hasAutoAppliedPerspectiveSuggestion;
}

- (void)setHasAutoAppliedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasAutoAppliedPerspectiveSuggestion = a3;
}

- (BOOL)hasAppliedPerspectiveSuggestion
{
  return self->_hasAppliedPerspectiveSuggestion;
}

- (BOOL)hasRequestedPerspectiveSuggestion
{
  return self->_hasRequestedPerspectiveSuggestion;
}

- (void)setHasRequestedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasRequestedPerspectiveSuggestion = a3;
}

- (PUAVKitMediaTimelineView)videoScrubberView
{
  return self->_videoScrubberView;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (BOOL)isScrubbingVideo
{
  return self->_isScrubbingVideo;
}

- (void)setIsScrubbingVideo:(BOOL)a3
{
  self->_isScrubbingVideo = a3;
}

- (id)videoScrubberTimeObserver
{
  return self->_videoScrubberTimeObserver;
}

- (void)setVideoScrubberTimeObserver:(id)a3
{
  objc_storeStrong(&self->_videoScrubberTimeObserver, a3);
}

- (id)videoScrubberObservedPlayer
{
  return self->_videoScrubberObservedPlayer;
}

- (void)setVideoScrubberObservedPlayer:(id)a3
{
  objc_storeStrong(&self->_videoScrubberObservedPlayer, a3);
}

- (BOOL)wasPlayingBeforeBeginningToScrubVideo
{
  return self->_wasPlayingBeforeBeginningToScrubVideo;
}

- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3
{
  self->_wasPlayingBeforeBeginningToScrubVideo = a3;
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (OS_dispatch_queue)imageLoadingQueue
{
  return self->_imageLoadingQueue;
}

- (void)setImageLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadingQueue, a3);
}

- (NSMutableArray)imageLoadingQueueCompletionBlocks
{
  return self->_imageLoadingQueueCompletionBlocks;
}

- (void)setImageLoadingQueueCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadingQueueCompletionBlocks, a3);
}

- (UILongPressGestureRecognizer)accessibilityLongPressGestureRecognizer
{
  return self->_accessibilityLongPressGestureRecognizer;
}

- (void)setAccessibilityLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, a3);
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (NSArray)toolKeyCommands
{
  return self->_toolKeyCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolKeyCommands, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueueCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
  objc_storeStrong(&self->_videoScrubberObservedPlayer, 0);
  objc_storeStrong(&self->_videoScrubberTimeObserver, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_videoScrubberView, 0);
  objc_storeStrong((id *)&self->_cropAspect, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_lastKnownComposition, 0);
  objc_storeStrong((id *)&self->_badgeShowingExpirationTimer, 0);
  objc_storeStrong((id *)&self->_animationTargetsByKeyPath, 0);
  objc_storeStrong((id *)&self->_animationsByKeyPath, 0);
  objc_storeStrong((id *)&self->_initialLocationsInHandlesByHandle, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_aspectRatioLockButton, 0);
  objc_storeStrong((id *)&self->_cropAspectFlipperView, 0);
  objc_storeStrong((id *)&self->_cropAspectViewController, 0);
  objc_storeStrong((id *)&self->_rotateSnapshotView, 0);
  objc_storeStrong((id *)&self->_selectedCropHandleView, 0);
  objc_storeStrong((id *)&self->_cropHandleViewsByHandle, 0);
  objc_storeStrong((id *)&self->_cropOverlayView, 0);
  objc_storeStrong((id *)&self->_cropCanvasView, 0);
  objc_storeStrong((id *)&self->_cropView, 0);
  objc_storeStrong((id *)&self->_aspectButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_rotateButton, 0);
  objc_storeStrong((id *)&self->_autoButton, 0);
  objc_storeStrong((id *)&self->_adjustmentPickerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_adjustmentsViewController, 0);
}

uint64_t __42__PUCropToolController__flipButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flipHorizontally");
}

uint64_t __53__PUCropToolController__rotateByApplyingOrientation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyOrientation:", *(_QWORD *)(a1 + 32));
}

uint64_t __42__PUCropToolController_toolActionsForMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_aspectLockButtonTapped");
}

uint64_t __47__PUCropToolController_handleResigningCropTool__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

void __47__PUCropToolController_handleResigningCropTool__block_invoke_248(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "cropRect");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "integralCropRect:");
  objc_msgSend(v3, "setCropRect:");

}

void __63__PUCropToolController__installRenderedImageAndDisplayIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWantsPreviewViewHidden:", 1);
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "toolControllerDidChangeWantsDefaultPreviewView:", v3);

  objc_msgSend(WeakRetained, "_updateCropToggleButton");
  objc_msgSend(WeakRetained, "_performInitialAction");

}

void __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "rotateButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(a1[6], "aspectButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

uint64_t __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setAlpha:", *(double *)(a1 + 40));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cropHandleViewsByHandle", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8++), "setAlpha:", *(double *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maintainCropAspectLockState");

  if (v10)
  {
    v11 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "aspectRatioLockButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v11);

  }
  v13 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

  v15 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "playPauseButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v15);

}

uint64_t __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setContentViewsHiddenAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "contentViewsHiddenAnimationCount") - 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __63__PUCropToolController_cropTransformedImageViewDidEndTracking___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1432);
  v3 = a2;
  objc_msgSend(v2, "cropRect");
  objc_msgSend(v3, "setCropRect:");

}

void __57__PUCropToolController_cropTransformedImageViewDidTrack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1432);
  v3 = a2;
  objc_msgSend(v2, "cropRect");
  objc_msgSend(v3, "setCropRect:");

}

void __47__PUCropToolController_showBadgeView_animated___block_invoke(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "badgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (*(_BYTE *)(a1 + 40))
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alpha");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "playPauseButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

}

void __50__PUCropToolController__beginObservingVideoPlayer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateVideoScrubber");

}

void __43__PUCropToolController_createVideoScrubber__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playPauseButtonTapped");

}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashTransientBadgeWithText:", *(_QWORD *)(a1 + 40));

}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "aspectRatioLockButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_3(uint64_t a1)
{
  _QWORD v3[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_4;
  v3[3] = &unk_1E58ABD10;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v3, &__block_literal_global_225, 0.2, 1.5);
}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "aspectRatioLockButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __49__PUCropToolController_resetToolLabelHidingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (objc_msgSend(WeakRetained, "toolBadgeDoesHide"))
      objc_msgSend(v2, "showBadgeView:animated:", 0, 1);
    else
      objc_msgSend(v2, "showVideoScrubber:", 1);
    WeakRetained = v2;
  }

}

void __42__PUCropToolController_showVideoScrubber___block_invoke(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  unint64_t v5;
  double v6;
  id v7;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  LOBYTE(v5) = *(_BYTE *)(a1 + 40);
  v6 = (double)v5;
  objc_msgSend(*(id *)(a1 + 32), "playPauseButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

id __42__PUCropToolController_setAutoButtonMode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "px_dynamicHighlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  objc_msgSend(v3, "topToolbarToolButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);

  return v2;
}

void __48__PUCropToolController__updateCropActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_rotateButtonTapped:", v3);

}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_flipButtonTapped:", v3);

}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_aspectButtonTapped:", v3);

}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_cropToggleTapped:", v3);

}

void __58__PUCropToolController__loadPerspectiveSuggestionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setHasRequestedPerspectiveSuggestion:", 1);
  objc_msgSend(*(id *)(a1 + 32), "valuesCalculator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoPerspectiveValuesWithAccuracy:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pitch"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("yaw"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("angle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    if (fabs(v5) > 0.000001 || fabs(v8) > 0.000001 || fabs(v11) > 0.000001)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSuggestedStraightenAngle:", v11 * 3.14159265 / 180.0);
      objc_msgSend(*(id *)(a1 + 32), "setSuggestedPitchAngle:", v5 * 3.14159265 / 180.0);
      objc_msgSend(*(id *)(a1 + 32), "setSuggestedYawAngle:", v8 * 3.14159265 / 180.0);
    }
  }

}

uint64_t __52__PUCropToolController_setHasAppliedCropSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAuto:", *(unsigned __int8 *)(a1 + 32));
}

void __86__PUCropToolController__applyCropRect_straightenAngle_pitchAngle_yawAngle_isAutoCrop___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setAngleRadians:", v3);
  objc_msgSend(v4, "setPitchRadians:", *(double *)(a1 + 48));
  objc_msgSend(v4, "setYawRadians:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "cropRect");
  objc_msgSend(v4, "setCropRect:");
  objc_msgSend(v4, "setIsAuto:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v4, "setEnabled:", 1);

}

void __51__PUCropToolController__loadCropSuggestionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "setHasRequestedCropSuggestion:", 1);
  objc_msgSend(*(id *)(a1 + 32), "valuesCalculator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoCropValuesWithAccuracy:", 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("angle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("xOrigin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("yOrigin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("width"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("height"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "setSuggestedCrop:", v8, v11, v14, v17);
    objc_msgSend(*(id *)(a1 + 32), "setSuggestedStraightenAngle:", v5 * 3.14159265 / 180.0);
  }

}

void __73__PUCropToolController__resetAllValuesAnimated_skipLayerTransformUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1432);
  v4 = a2;
  objc_msgSend(v3, "cropRect");
  objc_msgSend(v4, "setCropRect:");
  objc_msgSend(v4, "setPitchRadians:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setYawRadians:", *(double *)(a1 + 48));
  objc_msgSend(v4, "setAngleRadians:", *(double *)(a1 + 56));

}

void __52__PUCropToolController__loadStateFromModelAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsEmpty;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsModelLoad:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLoadingStateFromModel:", 1);
  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PUCropToolController.m"), 1359, CFSTR("Need a compositionController to perform this operation"));

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__22877;
  v50 = __Block_byref_object_dispose__22878;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__22877;
  v44 = __Block_byref_object_dispose__22878;
  v45 = 0;
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_2;
  v39[3] = &unk_1E58A77E0;
  v39[4] = v3;
  v39[5] = &v46;
  v39[6] = &v40;
  objc_msgSend(v3, "_performLocalModelChanges:", v39);
  objc_msgSend((id)v47[5], "cropRect");
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  IsEmpty = CGRectIsEmpty(v52);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1432);
  if (IsEmpty)
  {
    objc_msgSend(v10, "masterImageRect");
    x = v11;
    y = v12;
    width = v13;
    height = v14;
  }
  else
  {
    objc_msgSend(v10, "setCropRect:", x, y, width, height);
  }
  objc_msgSend(*(id *)(a1 + 32), "geometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputOrientation");
  PLOrientationInverse();
  objc_msgSend((id)v41[5], "orientation");
  v16 = PLOrientationConcat();
  v17 = *(void **)(a1 + 32);
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_3;
  v38[3] = &__block_descriptor_40_e25_v16__0__PLImageGeometry_8l;
  v38[4] = v16;
  objc_msgSend(v17, "_performGeometryChange:animated:", v38, *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "inputExtent");
  v19 = -v18;
  v21 = -v20;
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v54 = CGRectOffset(v53, v19, v21);
  objc_msgSend(*(id *)(a1 + 32), "_suggestedCropRectForImageRect:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend((id)v47[5], "angleRadians");
  objc_msgSend(*(id *)(a1 + 32), "setStraightenAngle:");
  objc_msgSend((id)v47[5], "pitchRadians");
  objc_msgSend(*(id *)(a1 + 32), "setPitchAngle:");
  objc_msgSend((id)v47[5], "yawRadians");
  objc_msgSend(*(id *)(a1 + 32), "setYawAngle:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "setCropRect:", x, y, width, height);
  objc_msgSend(*(id *)(a1 + 32), "setViewCropRect:", v23, v25, v27, v29);
  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "cropRect");
  objc_msgSend(v30, "setModelCropRect:viewCropRect:");

  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateLayerTransformsAnimated:", *(unsigned __int8 *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setLockedCropAspectIfNeededIgnoringCurrentLock:", 0);
  v32 = objc_msgSend((id)v47[5], "constraintWidth");
  v33 = objc_msgSend((id)v47[5], "constraintHeight");
  v34 = 0;
  if (v32 >= 1 && v33 >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "bestAspectRatioForWidth:height:", (unint64_t)(double)v32, (unint64_t)(double)v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCropAspect:", v34);
      objc_msgSend(*(id *)(a1 + 32), "_updateAspectRatioControls");
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1185) = objc_msgSend((id)v47[5], "isAuto");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1189) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1185);
  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setCropViewFrameForLastModelLoad:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setNeedsUpdateConstraints");

  objc_msgSend(*(id *)(a1 + 32), "_updatePreviewViewInsets");
  objc_msgSend(*(id *)(a1 + 32), "_updateCropToggleButton");
  objc_msgSend(*(id *)(a1 + 32), "setLoadingStateFromModel:", 0);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

void __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cropAdjustmentControllerCreatingIfNecessary:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientationAdjustmentControllerCreatingIfNecessary:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserOrientation:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
}

void __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  if ((_DWORD)a2)
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

}

uint64_t __46__PUCropToolController__setYawAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setYawRadians:", *(double *)(a1 + 32));
}

uint64_t __48__PUCropToolController__setPitchAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPitchRadians:", *(double *)(a1 + 32));
}

uint64_t __53__PUCropToolController__setStraightenAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAngleRadians:", *(double *)(a1 + 32));
}

void __50__PUCropToolController__setViewCropRect_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1432);
  v3 = a2;
  objc_msgSend(v2, "cropRect");
  objc_msgSend(v3, "setCropRect:");

}

uint64_t __50__PUCropToolController__setViewCropRect_animated___block_invoke_2(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  v3 = *(double *)(a1 + 72) * a2 + (1.0 - a2) * *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 80) * a2 + (1.0 - a2) * *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 88) * a2 + (1.0 - a2) * *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 96) * a2 + (1.0 - a2) * *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "setIgnoreTrackingUpdates:", 1);
  objc_msgSend(*(id *)(a1 + 32), "cropOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);

  return objc_msgSend(*(id *)(a1 + 32), "setIgnoreTrackingUpdates:", 0);
}

uint64_t __50__PUCropToolController__setViewCropRect_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setAnimation:forKeyPath:", 0, CFSTR("_imageCropRect"));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCropViewsForInteraction");
}

void __48__PUCropToolController__setCropAspect_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "width");
  *(float *)&v4 = v4;
  v5 = vcvtas_u32_f32(*(float *)&v4);
  objc_msgSend(*(id *)(a1 + 32), "height");
  *(float *)&v6 = v6;
  v7 = vcvtas_u32_f32(*(float *)&v6);
  objc_msgSend(v8, "setConstraintWidth:", v5);
  objc_msgSend(v8, "setConstraintHeight:", v7);

}

uint64_t __44__PUCropToolController__removeSnapshotView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __44__PUCropToolController__removeSnapshotView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PIOrientationAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_2;
  v6[3] = &unk_1E58AB3E0;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v4, v6);

}

uint64_t __56__PUCropToolController__performGeometryChange_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;

  memset(&v8, 0, sizeof(v8));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = 0;
    memset(&t1, 0, sizeof(t1));
  }
  v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v6.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformConcat(&v8, &t1, &v6);
  v6 = v8;
  objc_msgSend(v3, "setTransform:", &v6);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setRotatingAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "rotatingAnimationCount") - 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "rotatingAnimationCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateCropViewsForInteraction");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_5;
    v4[3] = &unk_1E58A2CC8;
    objc_copyWeak(&v6, &location);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_setContentViewsHidden:animated:completion:", 0, 1, v4);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayerTransformsUpdateAnimated:", 0);

}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "contentViewsHiddenAnimationCount");

  if (!v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_removeSnapshotView:", *(_QWORD *)(a1 + 32));

  }
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "compositionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageOrientation");
  objc_msgSend(*(id *)(a1 + 40), "userOrientation");
  objc_msgSend(v4, "setOrientation:", PLOrientationConcat());

}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_semaphore_t v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  double v32;
  double v33;
  NSObject *v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD block[5];
  _QWORD v40[7];
  _QWORD v41[4];
  NSObject *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  _BYTE buf[24];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "cropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "scale");
  v10 = v9;
  if (v6 >= v8)
    v8 = v6;
  objc_msgSend(*v2, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isStandardVideo");

  if ((v12 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_2;
    block[3] = &unk_1E58ABD10;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__22877;
    v51[4] = __Block_byref_object_dispose__22878;
    v52 = 0;
    v45 = 0;
    v46 = (double *)&v45;
    v47 = 0x4010000000;
    v48 = &unk_1AB197D4B;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_createRendererIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "renderer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isHDREnabled"))
      {
        objc_msgSend(MEMORY[0x1E0D523E0], "maximumEDRHeadroomForScreen:", v4);
        v16 = v15;
        objc_msgSend(*(id *)(a1 + 32), "renderer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDisplayMaximumEDRHeadroom:", v16);

        objc_msgSend(MEMORY[0x1E0D523E0], "currentEDRHeadroomForScreen:", v4);
        v19 = v18;
        objc_msgSend(*(id *)(a1 + 32), "renderer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDisplayCurrentEDRHeadroom:", v19);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v22 = v21;
      PLPhotoEditGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_generate(v23);

      PLPhotoEditGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "EditCropToolRender", ", buf, 2u);
      }

      v27 = dispatch_semaphore_create(0);
      objc_msgSend(*(id *)(a1 + 32), "renderer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v14;
      v41[1] = 3221225472;
      v41[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_122;
      v41[3] = &unk_1E589DF00;
      v43 = v51;
      v44 = &v45;
      v29 = v27;
      v42 = v29;
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      objc_msgSend(v28, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", 0, 1, buf, CFSTR("PUCropTool-loadImage"), v41, v10 * v8, v10 * v8);

      v30 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v29, v30))
      {
        PLPhotoEditGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v31, OS_LOG_TYPE_ERROR, "Rendering semaphore timed out in [PUCropToolController _loadImageIfNeeded]", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v33 = v32;
      PLPhotoEditGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = v46[7];
        v36 = (uint64_t)v46[6];
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = (uint64_t)((v33 - v22) * 1000.0);
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2048;
        v54 = (uint64_t)v35;
        _os_log_impl(&dword_1AAB61000, v34, OS_LOG_TYPE_INFO, "Crop rendering took %ldms for size %ld x %ld", buf, 0x20u);
      }

      PLPhotoEditGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v38, OS_SIGNPOST_INTERVAL_END, v24, "EditCropToolRender", ", buf, 2u);
      }

    }
    v40[0] = v14;
    v40[1] = 3221225472;
    v40[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_125;
    v40[3] = &unk_1E58A77E0;
    v40[4] = *(_QWORD *)(a1 + 32);
    v40[5] = v51;
    v40[6] = &v45;
    dispatch_async(MEMORY[0x1E0C80D38], v40);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(v51, 8);

  }
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_122(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (v13)
  {
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Error rendering image in [PUCropToolController _loadImageIfNeeded]; this is likely fatal : %@",
        (uint8_t *)&v19,
        0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v18 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v18[4] = a4;
    v18[5] = a5;
    v18[6] = a6;
    v18[7] = a7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_125(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
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
  objc_msgSend(*(id *)(a1 + 32), "imageLoadingQueueCompletionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "imageLoadingQueueCompletionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setImageLoadingInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsImageLoad:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitialImageLoaded:", 1);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "_handleDidCreateEditedImage:inputExtent:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate", (_QWORD)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateProgressIndicatorAnimated:", 1);

  objc_msgSend(*(id *)(a1 + 32), "updateAspectRatioLockButton");
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imageLoadingQueueCompletionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "imageLoadingQueueCompletionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setImageLoadingInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInitialImageLoaded:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_createRendererIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsImageLoad:", 0);
    objc_msgSend(*(id *)(a1 + 32), "renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "compositionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71260], "pipelineFiltersForCropping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getGeometryForComposition:pipelineFilters:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "size");
    NUPixelSizeToCGSize();
    objc_msgSend(*(id *)(a1 + 32), "_handleDidCreateEditedImage:inputExtent:", 0, 0.0, 0.0, v11, v12);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate", (_QWORD)v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateProgressIndicatorAnimated:", 1);

  objc_msgSend(*(id *)(a1 + 32), "updateAspectRatioLockButton");
}

void __54__PUCropToolController__performLocalCropModelChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PICropAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PUCropToolController__performLocalCropModelChanges___block_invoke_2;
  v6[3] = &unk_1E589DED8;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v4, v6);

}

void __54__PUCropToolController__performLocalCropModelChanges___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v6 = a2;
  v4(v3, v6);
  objc_msgSend(*(id *)(a1 + 32), "cropModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "masterImageSize");
  LODWORD(v3) = objc_msgSend(v6, "isCropIdentityForImageSize:");

  objc_msgSend(v6, "setEnabled:", v3 ^ 1);
}

@end
