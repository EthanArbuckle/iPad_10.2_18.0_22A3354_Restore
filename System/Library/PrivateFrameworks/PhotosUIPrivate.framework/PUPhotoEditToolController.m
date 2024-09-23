@implementation PUPhotoEditToolController

- (PUPhotoEditToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUPhotoEditToolController *v4;
  PUPhotoEditToolControllerSpec *v5;
  PUPhotoEditToolControllerSpec *toolControllerSpec;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditToolController;
  v4 = -[PUPhotoEditToolController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    v5 = objc_alloc_init(PUPhotoEditToolControllerSpec);
    toolControllerSpec = v4->_toolControllerSpec;
    v4->_toolControllerSpec = v5;

    v4->_enabled = 1;
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    v11[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[PUPhotoEditToolController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController dealloc](&v4, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  _PUPhotoEditToolGradientView *v3;
  _PUPhotoEditToolGradientView *gradientView;
  void *v5;
  id v6;
  CEKEdgeGradientView *v7;
  CEKEdgeGradientView *gradientMask;
  _PUPhotoEditToolContainerView *v9;
  UIView *toolContainerView;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new();
  -[PUPhotoEditToolController setView:](self, "setView:", v12);
  v3 = objc_alloc_init(_PUPhotoEditToolGradientView);
  gradientView = self->_gradientView;
  self->_gradientView = v3;

  -[PUPhotoEditToolController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_gradientView);

  v6 = objc_alloc(MEMORY[0x1E0D0D050]);
  v7 = (CEKEdgeGradientView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  gradientMask = self->_gradientMask;
  self->_gradientMask = v7;

  -[CEKEdgeGradientView setEdgeGradientStyleMask](self->_gradientMask, "setEdgeGradientStyleMask");
  -[_PUPhotoEditToolGradientView setMaskView:](self->_gradientView, "setMaskView:", self->_gradientMask);
  v9 = objc_alloc_init(_PUPhotoEditToolContainerView);
  toolContainerView = self->_toolContainerView;
  self->_toolContainerView = &v9->super;

  -[UIView layer](self->_toolContainerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 0);

  -[_PUPhotoEditToolGradientView addSubview:](self->_gradientView, "addSubview:", self->_toolContainerView);
  self->_toolGradientDistance = 141.0;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PUPhotoEditToolController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", self->_gradientView);

  -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize](self, "_updateTraitCollectionAndLayoutReferenceSize");
  -[PUViewControllerSpec registerChangeObserver:](self->_toolControllerSpec, "registerChangeObserver:", self);
  if (-[PUPhotoEditToolController wantsZoomAndPanEnabled](self, "wantsZoomAndPanEnabled"))
  {
    -[PUPhotoEditToolController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolController:", self);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUPhotoEditToolController becomeFirstResponder](self, "becomeFirstResponder");
  if (!-[PUPhotoEditToolController hasMediaScrubber](self, "hasMediaScrubber"))
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolController:showVideoScrubber:animated:", self, 1, 1);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PUViewControllerSpec unregisterChangeObserver:](self->_toolControllerSpec, "unregisterChangeObserver:", self);
}

- (void)viewDidLayoutSubviews
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
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  if (self->_gradientView)
  {
    -[PUPhotoEditToolController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[_PUPhotoEditToolGradientView setFrame:](self->_gradientView, "setFrame:", v5, v7, v9, v11);
    v12 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    v13 = v5;
    v14 = v7;
    v15 = v9;
    v16 = v11;
    if (v12 == 1)
    {
      v17 = CGRectGetMaxY(*(CGRect *)&v13) + -141.0;
      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = 141.0;
      v21 = 0.0;
      v22 = v17;
      v23 = v9;
    }
    else
    {
      v24 = CGRectGetMaxX(*(CGRect *)&v13) + -141.0;
      -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v23 = 141.0;
      v22 = 0.0;
      v21 = v24;
      v20 = v11;
    }
    objc_msgSend(v18, "setFrame:", v21, v22, v23, v20);

    -[PUPhotoEditToolController _layoutToolGradient](self, "_layoutToolGradient");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", width, height);
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  PUEditableAsset *v11;
  PICompositionController *v12;
  PLEditSource *v13;
  PEValuesCalculator *v14;
  PICompositionController *compositionController;
  BOOL v16;
  PLEditSource *editSource;
  BOOL v18;
  PEValuesCalculator *valuesCalculator;
  BOOL v20;
  PUEditableAsset *asset;
  PICompositionController *v22;
  PICompositionController *v23;
  PLEditSource *v24;
  PLEditSource *v25;
  PEValuesCalculator *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PUEditableAsset *v31;

  v11 = (PUEditableAsset *)a3;
  v12 = (PICompositionController *)a4;
  v13 = (PLEditSource *)a5;
  v14 = (PEValuesCalculator *)a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolController.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

  }
  compositionController = self->_compositionController;
  if (compositionController)
    v16 = compositionController == v12;
  else
    v16 = 1;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolController.m"), 245, CFSTR("Can only set up the composition once"));

  }
  editSource = self->_editSource;
  if (editSource)
    v18 = editSource == v13;
  else
    v18 = 1;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolController.m"), 246, CFSTR("Can only set up the edit source once"));

  }
  valuesCalculator = self->_valuesCalculator;
  if (valuesCalculator)
    v20 = valuesCalculator == v14;
  else
    v20 = 1;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolController.m"), 247, CFSTR("Can only set up the values calculator once"));

  }
  asset = self->_asset;
  self->_asset = v11;
  v31 = v11;

  v22 = self->_compositionController;
  self->_compositionController = v12;
  v23 = v12;

  v24 = self->_editSource;
  self->_editSource = v13;
  v25 = v13;

  v26 = self->_valuesCalculator;
  self->_valuesCalculator = v14;

}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (NSString)localizedResetToolActionTitle
{
  return 0;
}

- (UIEdgeInsets)preferredPreviewViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)additionalPreviewViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)wantsDefaultPreviewView
{
  return 1;
}

- (UIColor)preferredPreviewBackgroundColor
{
  return 0;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 0;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  return 1;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 0;
}

- (BOOL)suppressesEditUpdates
{
  return 0;
}

- (BOOL)handlesVideoPlaying
{
  return 0;
}

- (BOOL)handlesMediaViewInsets
{
  return 0;
}

- (NURenderPipelineFilter)filter
{
  return 0;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](self, "setLayoutOrientation:withTransitionCoordinator:", a3, 0);
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v5;

  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PUPhotoEditToolControllerSpec setLayoutOrientation:](self->_toolControllerSpec, "setLayoutOrientation:");
    -[PUPhotoEditToolController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (PICompositionController)uneditedCompositionController
{
  void *v3;
  void *v4;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolControllerUneditedCompositionController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PICompositionController *)v4;
}

- (void)setToolGradientDistance:(double)a3
{
  if (self->_toolGradientDistance != a3)
  {
    self->_toolGradientDistance = a3;
    -[PUPhotoEditToolController _layoutToolGradient](self, "_layoutToolGradient");
  }
}

- (void)_layoutToolGradient
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  CEKEdgeGradientView *gradientMask;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if (self->_gradientView)
  {
    -[PUPhotoEditToolController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    v8 = 0.0;
    -[CEKEdgeGradientView setFrame:](self->_gradientMask, "setFrame:", 0.0, 0.0, v5, v7);
    v9 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    gradientMask = self->_gradientMask;
    if (v9 == 1)
    {
      -[CEKEdgeGradientView setGradientDirection:](gradientMask, "setGradientDirection:", 0);
      -[PUPhotoEditToolController toolGradientDistance](self, "toolGradientDistance");
      v8 = v7 - v11;
      v12 = 0.0;
    }
    else
    {
      -[CEKEdgeGradientView setGradientDirection:](gradientMask, "setGradientDirection:", 1);
      -[PUPhotoEditToolController toolGradientDistance](self, "toolGradientDistance");
      v12 = v5 - v13;
    }
    -[CEKEdgeGradientView setContentInsets:](self->_gradientMask, "setContentInsets:", v8, v12, 0.0, 0.0);
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "currentLayoutStyle");

    if (v15 == 4)
    {
      if (v7 <= 650.0)
        v16 = v7;
      else
        v16 = 650.0;
      v17 = (v7 - v16) * 0.5;
      v18 = v16 * 0.1;
      v19 = v17;
    }
    else
    {
      if (v5 >= v7)
        v20 = v7;
      else
        v20 = v5;
      v19 = v20 * 0.03;
      v18 = v20 * 0.07;
      v21 = 44.0;
      if (v9 == 1)
        v21 = 0.0;
      v17 = v19 + v21;
    }
    -[CEKEdgeGradientView setGradientDimensions:](self->_gradientMask, "setGradientDimensions:", v17, v18, v18, v19);
  }
}

- (void)addEditActionActivity:(id)a3
{
  id v4;
  NSMutableArray *mutableEditActionActivites;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mutableEditActionActivites = self->_mutableEditActionActivites;
  v8 = v4;
  if (!mutableEditActionActivites)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mutableEditActionActivites;
    self->_mutableEditActionActivites = v6;

    v4 = v8;
    mutableEditActionActivites = self->_mutableEditActionActivites;
  }
  if ((-[NSMutableArray containsObject:](mutableEditActionActivites, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_mutableEditActionActivites, "addObject:", v8);

}

- (void)removeEditActionActivity:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableEditActionActivites, "containsObject:"))
    -[NSMutableArray removeObject:](self->_mutableEditActionActivites, "removeObject:", v4);

}

- (NSArray)editActionActivities
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableEditActionActivites, "copy");
}

- (void)setEnabled:(BOOL)a3
{
  if (!self->_enabled && a3)
    -[PUPhotoEditToolController willBecomeEnabled](self, "willBecomeEnabled");
  self->_enabled = a3;
}

- (NSArray)leadingToolbarViews
{
  return 0;
}

- (UIView)centerToolbarView
{
  return 0;
}

- (NSArray)trailingToolbarViews
{
  return 0;
}

- (void)prepareForToolTransitionWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (int64_t)toolControllerTag
{
  return 0;
}

- (BOOL)isActiveTool
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  PUPhotoEditToolController *v8;
  BOOL v9;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTool");
  v8 = (PUPhotoEditToolController *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == self;

  return v9;
}

- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable
{
  return 0;
}

- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay
{
  return 1;
}

- (id)disabledToolAlertTitle
{
  return (id)PELocalizedString();
}

- (id)disabledToolAlertMessage
{
  return (id)PELocalizedString();
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "layoutStyleChanged", a3))
    -[PUPhotoEditToolController specDidChange](self, "specDidChange");
}

- (id)_registerActionWithSourceComposition:(id)a3 localizedName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  -[PUPhotoEditToolController undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "isUndoing") & 1) != 0 || (objc_msgSend(v9, "isRedoing") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToComposition:", v6);

    if ((v14 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B358]), "initWithCompositionController:sourceComposition:", v12, v6);
      objc_msgSend(v10, "setLocalizedActionName:", v7);
      objc_msgSend(v10, "registerWithUndoManager:", v9);
    }

  }
  return v10;
}

- (void)willModifyAdjustment
{
  void *v3;
  void *v4;
  id v5;

  -[PUPhotoEditToolController setStoredCompositionCount:](self, "setStoredCompositionCount:", -[PUPhotoEditToolController storedCompositionCount](self, "storedCompositionCount") + 1);
  -[PUPhotoEditToolController storedComposition](self, "storedComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController setStoredComposition:](self, "setStoredComposition:", v4);

  }
}

- (id)didModifyAdjustmentWithLocalizedName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPhotoEditToolController setStoredCompositionCount:](self, "setStoredCompositionCount:", -[PUPhotoEditToolController storedCompositionCount](self, "storedCompositionCount") - 1);
  if (-[PUPhotoEditToolController storedCompositionCount](self, "storedCompositionCount"))
  {
    v5 = 0;
  }
  else
  {
    -[PUPhotoEditToolController storedComposition](self, "storedComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolController _registerActionWithSourceComposition:localizedName:](self, "_registerActionWithSourceComposition:localizedName:", v6, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditToolController setStoredComposition:](self, "setStoredComposition:", 0);
  }

  return v5;
}

- (id)internalToolActionsForMenu
{
  return 0;
}

- (id)toolActionsForMenu
{
  return 0;
}

- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  PUPhotoEditToolControllerSpec *toolControllerSpec;
  id v8;
  _QWORD v9[5];
  id v10;
  CGFloat v11;
  CGFloat v12;

  height = a3.height;
  width = a3.width;
  -[PUPhotoEditToolController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  toolControllerSpec = self->_toolControllerSpec;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PUPhotoEditToolController__updateTraitCollectionAndLayoutReferenceSize___block_invoke;
  v9[3] = &unk_1E58AB348;
  v9[4] = self;
  v10 = v6;
  v11 = width;
  v12 = height;
  v8 = v6;
  -[PUViewControllerSpec performChanges:](toolControllerSpec, "performChanges:", v9);

}

- (void)_updateTraitCollectionAndLayoutReferenceSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PUPhotoEditToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
}

- (void)setToolControllerSpec:(id)a3
{
  PUPhotoEditToolControllerSpec *v5;
  PUPhotoEditToolControllerSpec **p_toolControllerSpec;
  PUPhotoEditToolControllerSpec *toolControllerSpec;
  void *v8;
  PUPhotoEditToolControllerSpec *v9;

  v5 = (PUPhotoEditToolControllerSpec *)a3;
  p_toolControllerSpec = &self->_toolControllerSpec;
  toolControllerSpec = self->_toolControllerSpec;
  if (toolControllerSpec != v5)
  {
    v9 = v5;
    -[PUViewControllerSpec unregisterChangeObserver:](toolControllerSpec, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_toolControllerSpec, a3);
    -[PUPhotoEditToolControllerSpec setLayoutOrientation:](*p_toolControllerSpec, "setLayoutOrientation:", -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation"));
    if (-[PUPhotoEditToolController px_isVisible](self, "px_isVisible"))
      -[PUViewControllerSpec registerChangeObserver:](*p_toolControllerSpec, "registerChangeObserver:", self);
    -[PUPhotoEditToolController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "horizontalSizeClass"))
      -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize](self, "_updateTraitCollectionAndLayoutReferenceSize");

    v5 = v9;
  }

}

- (void)setActivelyAdjusting:(BOOL)a3
{
  id WeakRetained;

  if (self->_activelyAdjusting != a3)
  {
    self->_activelyAdjusting = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "toolControllerDidChangeIsActivelyAdjusting:", self);

  }
}

- (void)setPerformingLiveInteraction:(BOOL)a3
{
  id WeakRetained;

  if (self->_performingLiveInteraction != a3)
  {
    self->_performingLiveInteraction = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "toolControllerDidChangeIsPerformingLiveInteraction:", self);

  }
}

- (void)setAggregateSession:(id)a3
{
  PUPhotoEditAggregateSession *v5;
  PUPhotoEditAggregateSession *v6;

  v5 = (PUPhotoEditAggregateSession *)a3;
  if (self->_aggregateSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_aggregateSession, a3);
    v5 = v6;
  }

}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return 1;
}

- (BOOL)supportsPreviewingOriginal
{
  return 1;
}

- (BOOL)canBecomeActiveTool
{
  return 1;
}

- (void)willBecomeActiveTool
{
  void *v3;

  if (-[PUPhotoEditToolController hasMediaScrubber](self, "hasMediaScrubber"))
  {
    -[PUPhotoEditToolController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toolController:showVideoScrubber:animated:", self, 0, 0);

  }
  -[PUPhotoEditToolController setSlowMotionTimeMapper:](self, "setSlowMotionTimeMapper:", 0);
}

- (void)didBecomeActiveTool
{
  void (**ppt_didBecomeActiveToolBlock)(void);

  ppt_didBecomeActiveToolBlock = (void (**)(void))self->_ppt_didBecomeActiveToolBlock;
  if (ppt_didBecomeActiveToolBlock)
    ppt_didBecomeActiveToolBlock[2]();
}

- (BOOL)wantsFullscreen
{
  return 0;
}

- (BOOL)shouldHideMediaView
{
  return 0;
}

- (BOOL)wantsShadowViews
{
  return 1;
}

- (CGRect)contentRectInCoordinateSpace:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[PUPhotoEditToolController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalAssetTimeForDisplayedTime:(SEL)a3
{
  void *v7;
  int v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  PFSlowMotionTimeRangeMapper *slowMotionTimeMapper;
  PFSlowMotionTimeRangeMapper *v11;
  PFSlowMotionTimeRangeMapper *v12;
  Float64 Seconds;
  float v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHighframeRateVideo");

  if (v8)
  {
    slowMotionTimeMapper = self->_slowMotionTimeMapper;
    if (slowMotionTimeMapper
      || (v11 = -[PUPhotoEditToolController _newTimeMapper](self, "_newTimeMapper"),
          v12 = self->_slowMotionTimeMapper,
          self->_slowMotionTimeMapper = v11,
          v12,
          (slowMotionTimeMapper = self->_slowMotionTimeMapper) != 0))
    {
      v15 = *a4;
      Seconds = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Seconds = Seconds;
      -[PFSlowMotionTimeRangeMapper originalTimeForScaledTime:](slowMotionTimeMapper, "originalTimeForScaledTime:", Seconds);
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)&v15, v14, a4->var1);
      *a4 = v15;
    }
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->var3 = a4->var3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)displayedTimeForOriginalAssetTime:(SEL)a3
{
  void *v7;
  int v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  PFSlowMotionTimeRangeMapper *slowMotionTimeMapper;
  PFSlowMotionTimeRangeMapper *v11;
  PFSlowMotionTimeRangeMapper *v12;
  Float64 Seconds;
  float v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHighframeRateVideo");

  if (v8)
  {
    slowMotionTimeMapper = self->_slowMotionTimeMapper;
    if (slowMotionTimeMapper
      || (v11 = -[PUPhotoEditToolController _newTimeMapper](self, "_newTimeMapper"),
          v12 = self->_slowMotionTimeMapper,
          self->_slowMotionTimeMapper = v11,
          v12,
          (slowMotionTimeMapper = self->_slowMotionTimeMapper) != 0))
    {
      v15 = *a4;
      Seconds = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Seconds = Seconds;
      -[PFSlowMotionTimeRangeMapper scaledTimeForOriginalTime:](slowMotionTimeMapper, "scaledTimeForOriginalTime:", Seconds);
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)&v15, v14, a4->var1);
      *a4 = v15;
    }
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->var3 = a4->var3;
  return result;
}

- (id)_newTimeMapper
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double Seconds;
  void *v13;
  double v14;
  double v15;
  CMTimeRange v17;
  CMTime time;
  CMTime end;
  CMTime start;
  CMTimeRange v21;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighframeRateVideo");

  if (!v4)
    return 0;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slomoAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v21, 0, sizeof(v21));
  if (v6)
  {
    objc_msgSend(v6, "startTime");
    objc_msgSend(v6, "endTime");
  }
  else
  {
    memset(&start, 0, sizeof(start));
    memset(&end, 0, sizeof(end));
  }
  CMTimeRangeFromTimeToTime(&v21, &start, &end);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "mediaDuration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  v13 = (void *)MEMORY[0x1E0D75298];
  objc_msgSend(v6, "rate");
  *(float *)&v15 = v14;
  v17 = v21;
  objc_msgSend(v13, "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v17, 1, Seconds, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackdropViewGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (PUPhotoEditToolControllerSpec)toolControllerSpec
{
  return self->_toolControllerSpec;
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (void)setPhotoEditSpec:(id)a3
{
  objc_storeStrong((id *)&self->_photoEditSpec, a3);
}

- (PUPhotoEditToolControllerDelegate)delegate
{
  return (PUPhotoEditToolControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (PUPhotoEditAggregateSession)aggregateSession
{
  return self->_aggregateSession;
}

- (UIView)toolContainerView
{
  return self->_toolContainerView;
}

- (double)toolGradientDistance
{
  return self->_toolGradientDistance;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)toolbarIconGlyphName
{
  return self->_toolbarIconGlyphName;
}

- (NSString)selectedToolbarIconGlyphName
{
  return self->_selectedToolbarIconGlyphName;
}

- (BOOL)toolbarGlyphUsesHierarchicalColor
{
  return self->_toolbarGlyphUsesHierarchicalColor;
}

- (NSString)toolbarIconAccessibilityLabel
{
  return self->_toolbarIconAccessibilityLabel;
}

- (BOOL)isActivelyAdjusting
{
  return self->_activelyAdjusting;
}

- (BOOL)isPerformingLiveInteraction
{
  return self->_performingLiveInteraction;
}

- (BOOL)hasMediaScrubber
{
  return self->_hasMediaScrubber;
}

- (void)setHasMediaScrubber:(BOOL)a3
{
  self->_hasMediaScrubber = a3;
}

- (UIView)leftToolbarView
{
  return self->_leftToolbarView;
}

- (NSMutableArray)mutableEditActionActivites
{
  return self->_mutableEditActionActivites;
}

- (void)setMutableEditActionActivites:(id)a3
{
  objc_storeStrong((id *)&self->_mutableEditActionActivites, a3);
}

- (PFSlowMotionTimeRangeMapper)slowMotionTimeMapper
{
  return self->_slowMotionTimeMapper;
}

- (void)setSlowMotionTimeMapper:(id)a3
{
  objc_storeStrong((id *)&self->_slowMotionTimeMapper, a3);
}

- (NUComposition)storedComposition
{
  return self->_storedComposition;
}

- (void)setStoredComposition:(id)a3
{
  objc_storeStrong((id *)&self->_storedComposition, a3);
}

- (int64_t)storedCompositionCount
{
  return self->_storedCompositionCount;
}

- (void)setStoredCompositionCount:(int64_t)a3
{
  self->_storedCompositionCount = a3;
}

- (BOOL)wantsScrubberKeyControl
{
  return self->_wantsScrubberKeyControl;
}

- (BOOL)wantsSliderKeyControl
{
  return self->_wantsSliderKeyControl;
}

- (id)ppt_didBecomeActiveToolBlock
{
  return self->_ppt_didBecomeActiveToolBlock;
}

- (void)setPpt_didBecomeActiveToolBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ppt_didBecomeActiveToolBlock, 0);
  objc_storeStrong((id *)&self->_storedComposition, 0);
  objc_storeStrong((id *)&self->_slowMotionTimeMapper, 0);
  objc_storeStrong((id *)&self->_mutableEditActionActivites, 0);
  objc_storeStrong((id *)&self->_leftToolbarView, 0);
  objc_storeStrong((id *)&self->_toolbarIconAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_selectedToolbarIconGlyphName, 0);
  objc_storeStrong((id *)&self->_toolbarIconGlyphName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_toolContainerView, 0);
  objc_storeStrong((id *)&self->_aggregateSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_toolControllerSpec, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gradientMask, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
}

uint64_t __74__PUPhotoEditToolController__updateTraitCollectionAndLayoutReferenceSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setTraitCollection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setLayoutReferenceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
