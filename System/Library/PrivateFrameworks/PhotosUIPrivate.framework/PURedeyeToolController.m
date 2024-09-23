@implementation PURedeyeToolController

- (PURedeyeToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  PURedeyeToolController *v4;
  uint64_t v5;
  NSMutableArray *knownCorrections;
  PURedeyeToolControllerSpec *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PURedeyeToolController;
  v4 = -[PUPhotoEditToolController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    knownCorrections = v4->_knownCorrections;
    v4->_knownCorrections = (NSMutableArray *)v5;

    v7 = objc_alloc_init(PURedeyeToolControllerSpec);
    -[PUPhotoEditToolController setToolControllerSpec:](v4, "setToolControllerSpec:", v7);

  }
  return v4;
}

- (void)didBecomeActiveTool
{
  objc_super v3;

  -[PURedeyeToolController _loadCorrectionsFromModelAnimated:](self, "_loadCorrectionsFromModelAnimated:", 1);
  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController didBecomeActiveTool](&v3, sel_didBecomeActiveTool);
}

- (void)viewDidLoad
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CEKBadgeTextView *v8;
  CEKBadgeTextView *instructionLabel;
  CEKBadgeTextView *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CEKBadgeTextView *v23;
  CEKBadgeTextView *failureLabel;
  CEKBadgeTextView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PURedeyeToolController;
  -[PURedeyeToolController viewDidLoad](&v30, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D0D028]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (CEKBadgeTextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v8;

  v10 = self->_instructionLabel;
  PULocalizedString(CFSTR("PHOTOEDIT_REDEYE_INSTRUCTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setText:](v10, "_setText:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setContentColor:](self->_instructionLabel, "_setContentColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setFillColor:](self->_instructionLabel, "_setFillColor:", v13);

  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  v15 = v14 + 3.0;
  v17 = v16 + 3.0;
  v19 = v18 + 1.0;
  v21 = v20 + 1.0;
  -[CEKBadgeTextView _setTextInsets:](self->_instructionLabel, "_setTextInsets:", v20 + 1.0, v14 + 3.0, v18 + 1.0, v16 + 3.0);
  -[PURedeyeToolController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_instructionLabel);

  v23 = (CEKBadgeTextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D028]), "initWithFrame:", v4, v5, v6, v7);
  failureLabel = self->_failureLabel;
  self->_failureLabel = v23;

  v25 = self->_failureLabel;
  PULocalizedString(CFSTR("PHOTOEDIT_REDEYE_FAILURE"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setText:](v25, "_setText:", v26);

  -[CEKBadgeTextView setHidden:](self->_failureLabel, "setHidden:", 1);
  -[CEKBadgeTextView setAlpha:](self->_failureLabel, "setAlpha:", 0.0);
  -[CEKBadgeTextView _setTextInsets:](self->_failureLabel, "_setTextInsets:", v21, v15, v19, v17);
  -[CEKBadgeTextView _contentColor](self->_instructionLabel, "_contentColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setContentColor:](self->_failureLabel, "_setContentColor:", v27);

  -[CEKBadgeTextView _fillColor](self->_instructionLabel, "_fillColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setFillColor:](self->_failureLabel, "_setFillColor:", v28);

  -[PURedeyeToolController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->_failureLabel);

  self->_failureAnimationIsInProgress = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerHitEventForwardView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGesture_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v6;

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[PURedeyeToolController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsUpdateConstraints");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PURedeyeToolController;
  -[PURedeyeToolController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[UITapGestureRecognizer view](self->_tapGestureRecognizer, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_tapGestureRecognizer);

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSArray *instructionLabelConstraints;
  NSArray *failureLabelConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_instructionLabelConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_failureLabelConstraints);
  instructionLabelConstraints = self->_instructionLabelConstraints;
  self->_instructionLabelConstraints = 0;

  failureLabelConstraints = self->_failureLabelConstraints;
  self->_failureLabelConstraints = 0;

}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController dealloc](&v3, sel_dealloc);
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *instructionLabelConstraints;
  NSArray *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CEKBadgeTextView *failureLabel;
  void *v36;
  CEKBadgeTextView *v37;
  void *v38;
  NSArray *failureLabelConstraints;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSArray *v44;
  objc_super v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolControllerMainContainerView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PURedeyeToolController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!self->_instructionLabelConstraints)
  {
    v41 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v10, "currentLayoutStyle");

    -[CEKBadgeTextView widthAnchor](self->_instructionLabel, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PURedeyeToolController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v9;
    -[NSArray addObject:](v9, "addObject:", v14);

    -[CEKBadgeTextView centerXAnchor](self->_instructionLabel, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v42 == 4)
    {
      v46[0] = v17;
      -[CEKBadgeTextView bottomAnchor](self->_instructionLabel, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v19, -27.0);
      v43 = v4;
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v9, "addObjectsFromArray:", v22);

      v6 = v20;
      v4 = v43;

    }
    else
    {
      -[NSArray addObject:](v9, "addObject:", v17);

      v23 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      if (v23 != 2)
      {
        v8 = v41;
        if (v23 == 1)
        {
          -[CEKBadgeTextView centerYAnchor](self->_instructionLabel, "centerYAnchor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "bottomAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -33.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v9, "addObject:", v26);

        }
        goto LABEL_12;
      }
      -[CEKBadgeTextView bottomAnchor](self->_instructionLabel, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PURedeyeToolController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "safeAreaLayoutGuide");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v27, -6.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v44, "addObject:", v28);

      v9 = v44;
    }

    v8 = v41;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
    instructionLabelConstraints = self->_instructionLabelConstraints;
    self->_instructionLabelConstraints = v9;

  }
  if (!self->_failureLabelConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v31 = v6;
    -[CEKBadgeTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_failureLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_failureLabel, 9, 0, self->_instructionLabel, 9, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v30, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_failureLabel, 10, 0, self->_instructionLabel, 10, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v30, "addObject:", v33);

    v34 = (void *)MEMORY[0x1E0CB3718];
    failureLabel = self->_failureLabel;
    -[PURedeyeToolController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = failureLabel;
    v6 = v31;
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 7, -1, v36, 7, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v30, "addObject:", v38);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v30);
    failureLabelConstraints = self->_failureLabelConstraints;
    self->_failureLabelConstraints = v30;

  }
  v45.receiver = self;
  v45.super_class = (Class)PURedeyeToolController;
  -[PURedeyeToolController updateViewConstraints](&v45, sel_updateViewConstraints);

}

- (void)didResignActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController didResignActiveTool](&v3, sel_didResignActiveTool);
  -[NSMutableArray removeAllObjects](self->_knownCorrections, "removeAllObjects");
}

- (id)localizedName
{
  return PULocalizedString(CFSTR("PHOTOEDIT_REDEYE_TOOL_BUTTON"));
}

- (id)centerToolbarView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("PHOTOEDIT_REDEYE_TOP_LABEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "photoEditingTopToolbarToolLabelButtonColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setText:", v4);
  objc_msgSend(v6, "setTextColor:", v5);
  objc_msgSend(v2, "topToolbarToolLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  return v6;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController compositionControllerDidChangeForAdjustments:](&v4, sel_compositionControllerDidChangeForAdjustments_, a3);
  -[PURedeyeToolController _loadCorrectionsFromModelAnimated:](self, "_loadCorrectionsFromModelAnimated:", self->_isModelChangeLocal);
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (id)toolbarIconGlyphName
{
  return CFSTR("eye.slash");
}

- (id)selectedToolbarIconGlyphName
{
  return CFSTR("eye.slash");
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  NSArray *instructionLabelConstraints;
  NSArray *failureLabelConstraints;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PURedeyeToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v8, sel_setLayoutOrientation_withTransitionCoordinator_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_instructionLabelConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_failureLabelConstraints);
  instructionLabelConstraints = self->_instructionLabelConstraints;
  self->_instructionLabelConstraints = 0;

  failureLabelConstraints = self->_failureLabelConstraints;
  self->_failureLabelConstraints = 0;

  -[PURedeyeToolController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdateConstraints");

}

- (int64_t)toolControllerTag
{
  return 1005;
}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  -[PURedeyeToolController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURedeyeToolController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolController:originalPointFromViewPoint:view:", self, v11, v7, v9);
  v13 = v12;
  v15 = v14;

  if (!-[PURedeyeToolController _removeCorrectionAtPoint:](self, "_removeCorrectionAtPoint:", v13, v15))
    -[PURedeyeToolController _correctRedEyeAtPoint:](self, "_correctRedEyeAtPoint:", v13, v15);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPoint v14;
  CGRect v15;

  v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toolControllerPreviewView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      objc_msgSend(v7, "frame");
      v14.x = v10;
      v14.y = v12;
      v5 = CGRectContainsPoint(v15, v14);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (CGPoint)_extractRedEyePointFromCorrectionDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  uint8_t v28[16];
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("repairRectangleMinimumX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("repairRectangleMinimumX"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    objc_msgSend(v3, "objectForKey:", CFSTR("repairRectangleMaximumX"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = (v7 + v9) * 0.5;

    objc_msgSend(v3, "objectForKey:", CFSTR("repairRectangleMinimumY"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject doubleValue](v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v3, "objectForKey:", CFSTR("repairRectangleMaximumY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = (v13 + v15) * 0.5;

    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pointX"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("pointX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v10 = v19;

    objc_msgSend(v3, "objectForKey:", CFSTR("pointY"));
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v20;
    -[NSObject doubleValue](v20, "doubleValue");
    v16 = v24;
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("px"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("px"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v10 = v23;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("py"));
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v27 = (double *)MEMORY[0x1E0C9D538];
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Red-eye repair dictionary is of unknown type", v28, 2u);
  }
  v10 = *v27;
  v16 = v27[1];
LABEL_8:

  v25 = v10;
  v26 = v16;
  result.y = v26;
  result.x = v25;
  return result;
}

- (void)flashAutoRedEyeCorrections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redEyeAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputCorrectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PURedeyeToolController _extractRedEyePointFromCorrectionDictionary:](self, "_extractRedEyePointFromCorrectionDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 0);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_loadCorrectionsFromModelAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSMutableArray *knownCorrections;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  _BOOL4 v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v29 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PURedeyeToolController.m"), 325, CFSTR("Need a composition to perform this operation"));

  }
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "redEyeAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputCorrectionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = self->_knownCorrections;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v11);
  }

  knownCorrections = self->_knownCorrections;
  objc_msgSend(v8, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](knownCorrections, "removeObjectsInArray:", v16);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        if ((-[NSMutableArray containsObject:](self->_knownCorrections, "containsObject:", v22) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_knownCorrections, "addObject:", v22);
          objc_msgSend(v8, "addObject:", v22);
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v19);
  }

  if (v29)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v8;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          -[PURedeyeToolController _extractRedEyePointFromCorrectionDictionary:](self, "_extractRedEyePointFromCorrectionDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
          -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 0);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v25);
    }

  }
}

- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  double v21;
  PURedEyeIndicatorView *v22;
  PURedEyeIndicatorView *v23;
  _QWORD v24[4];
  PURedEyeIndicatorView *v25;
  CGPoint v26;
  CGRect v27;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolControllerPreviewView:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditToolController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolControllerOriginalImageSize:", self);
  v12 = v11;
  v14 = v13;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toolController:viewPointFromOriginalPoint:view:", self, v9, x * v12, y * v14);
  v17 = v16;
  v19 = v18;

  objc_msgSend(v9, "bounds");
  v26.x = v17;
  v26.y = v19;
  if (CGRectContainsPoint(v27, v26))
  {
    v20 = v4;
    if (v4)
      v21 = 0.0;
    else
      v21 = 0.5;
    v22 = objc_alloc_init(PURedEyeIndicatorView);
    -[PURedEyeIndicatorView setAnimationType:](v22, "setAnimationType:", v20);
    -[PURedEyeIndicatorView setCenter:](v22, "setCenter:", v17, v19);
    objc_msgSend(v9, "addSubview:", v22);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__PURedeyeToolController__showChangeIndicatorAtPoint_isFailure___block_invoke;
    v24[3] = &unk_1E58ABD10;
    v25 = v22;
    v23 = v22;
    -[PURedEyeIndicatorView animateWithDelay:completion:](v23, "animateWithDelay:completion:", v24, v21);

  }
}

- (void)_animateFailureAppearance
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (!self->_failureAnimationIsInProgress)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__animateInstructionAppearance, 0);
    self->_failureAnimationIsInProgress = 1;
    -[CEKBadgeTextView setHidden:](self->_failureLabel, "setHidden:", 0);
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__PURedeyeToolController__animateFailureAppearance__block_invoke;
    v4[3] = &unk_1E58ABD10;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__PURedeyeToolController__animateFailureAppearance__block_invoke_2;
    v3[3] = &unk_1E58A9910;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.1);
  }
}

- (void)_animateInstructionAppearance
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (!self->_failureAnimationIsInProgress)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__animateInstructionAppearance, 0);
    self->_failureAnimationIsInProgress = 1;
    -[CEKBadgeTextView setHidden:](self->_instructionLabel, "setHidden:", 0);
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__PURedeyeToolController__animateInstructionAppearance__block_invoke;
    v4[3] = &unk_1E58ABD10;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PURedeyeToolController__animateInstructionAppearance__block_invoke_2;
    v3[3] = &unk_1E58A9910;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 196608, v4, v3, 0.3, 0.0);
  }
}

- (void)_handleRedeyeButton:(id)a3
{
  id v4;

  -[PUPhotoEditToolController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerDidFinish:", self);

}

- (BOOL)_removeCorrectionAtPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerOriginalImageSize:", self);
  v6 = v5;

  v7 = self->_knownCorrections;
  v8 = -[NSMutableArray count](v7, "count");
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    v11 = 2.0;
    v12 = v8;
    do
    {
      -[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("repairRectangleMinimumX"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("repairRectangleMinimumX"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");

        objc_msgSend(v13, "objectForKey:", CFSTR("repairRectangleMaximumX"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");

        objc_msgSend(v13, "objectForKey:", CFSTR("repairRectangleMaximumY"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");

        objc_msgSend(v13, "objectForKey:", CFSTR("repairRectangleMinimumY"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");

        UIDistanceBetweenPointAndRect();
      }
      else
      {
        -[PURedeyeToolController _extractRedEyePointFromCorrectionDictionary:](self, "_extractRedEyePointFromCorrectionDictionary:", v13);
        UIDistanceBetweenPoints();
      }
      if (v19 < 15.0 / v6 && v19 < v11)
      {
        v11 = v19;
        v12 = v10;
      }

      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    v12 = 0;
  }
  if (v12 != v9)
  {
    self->_isModelChangeLocal = 1;
    -[NSMutableArray subarrayWithRange:](v7, "subarrayWithRange:", v12, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "adjustmentConstants");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "PIRedEyeAdjustmentKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __51__PURedeyeToolController__removeCorrectionAtPoint___block_invoke;
    v27[3] = &unk_1E58A7008;
    v28 = v20;
    v25 = v20;
    objc_msgSend(v21, "modifyAdjustmentWithKey:modificationBlock:", v24, v27);

    self->_isModelChangeLocal = 0;
  }

  return v12 != v9;
}

- (void)_correctRedEyeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  dispatch_semaphore_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  y = a3.y;
  x = a3.x;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__76980;
  v33 = __Block_byref_object_dispose__76981;
  v34 = 0;
  v6 = dispatch_semaphore_create(0);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolControllerOriginalImageSize:", self);
  v9 = v8;
  v11 = v10;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toolControllerMainRenderer:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, CFSTR("orientation"));
  PLPhysicalScreenScale();
  v15 = x / v9;
  v17 = y / v11;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D711E8]), "initWithComposition:location:touchDiameter:", v14, v15, v17, v16 * 42.0);
  objc_msgSend(v18, "setName:", CFSTR("PU-PIManualRedEyeAutoCalculator"));
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke;
  v26[3] = &unk_1E58A7030;
  v28 = &v29;
  v20 = v6;
  v27 = v20;
  objc_msgSend(v18, "submit:", v26);
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend((id)v30[5], "count"))
  {
    self->_isModelChangeLocal = 1;
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "adjustmentConstants");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "PIRedEyeAdjustmentKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke_2;
    v25[3] = &unk_1E58A7058;
    v25[4] = &v29;
    objc_msgSend(v21, "modifyAdjustmentWithKey:modificationBlock:", v24, v25);

    self->_isModelChangeLocal = 0;
  }
  else
  {
    -[PURedeyeToolController _showChangeIndicatorAtPoint:isFailure:](self, "_showChangeIndicatorAtPoint:isFailure:", 1, v15, v17);
    -[PURedeyeToolController _animateFailureAppearance](self, "_animateFailureAppearance");
  }

  _Block_object_dispose(&v29, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownCorrections, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_failureLabelConstraints, 0);
  objc_storeStrong((id *)&self->_failureLabel, 0);
  objc_storeStrong((id *)&self->_instructionLabelConstraints, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
}

void __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_msgSend(v3, "valueForKey:", CFSTR("inputCorrectionInfo"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__PURedeyeToolController__correctRedEyeAtPoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "setEnabled:", 1);
  objc_msgSend(v8, "inputCorrectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInputCorrectionInfo:", v7);

}

void __51__PURedeyeToolController__removeCorrectionAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "inputCorrectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setInputCorrectionInfo:", v5);

}

uint64_t __55__PURedeyeToolController__animateInstructionAppearance__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 0.0);
}

uint64_t __55__PURedeyeToolController__animateInstructionAppearance__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setHidden:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1216) = 0;
  return result;
}

uint64_t __51__PURedeyeToolController__animateFailureAppearance__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 1.0);
}

uint64_t __51__PURedeyeToolController__animateFailureAppearance__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setHidden:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__animateInstructionAppearance, 0, 3.0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1216) = 0;
  return result;
}

uint64_t __64__PURedeyeToolController__showChangeIndicatorAtPoint_isFailure___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
