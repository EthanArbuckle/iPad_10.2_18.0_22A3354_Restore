@implementation PUAdjustmentsToolController

- (PUAdjustmentsToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUAdjustmentsToolController *v4;
  PUAdjustmentsDataSource *v5;
  PUAdjustmentsDataSource *dataSource;
  PUAdjustmentsViewController *v7;
  PUAdjustmentsViewController *adjustmentsViewController;
  PEAutoAdjustmentController *v9;
  PEAutoAdjustmentController *autoAdjustmentController;
  PUAdjustmentsToolControllerSpec *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUAdjustmentsToolController;
  v4 = -[PUPhotoEditToolController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PUAdjustmentsDataSource);
    dataSource = v4->_dataSource;
    v4->_dataSource = v5;

    -[PUAdjustmentsDataSource setDelegate:](v4->_dataSource, "setDelegate:", v4);
    v7 = objc_alloc_init(PUAdjustmentsViewController);
    adjustmentsViewController = v4->_adjustmentsViewController;
    v4->_adjustmentsViewController = v7;

    -[PUAdjustmentsViewController setDelegate:](v4->_adjustmentsViewController, "setDelegate:", v4);
    -[PUAdjustmentsViewController setDataSource:](v4->_adjustmentsViewController, "setDataSource:", v4->_dataSource);
    v9 = (PEAutoAdjustmentController *)objc_alloc_init(MEMORY[0x1E0D7CAC0]);
    autoAdjustmentController = v4->_autoAdjustmentController;
    v4->_autoAdjustmentController = v9;

    v11 = objc_alloc_init(PUAdjustmentsToolControllerSpec);
    -[PUPhotoEditToolController setToolControllerSpec:](v4, "setToolControllerSpec:", v11);

  }
  return v4;
}

- (void)viewDidLoad
{
  PUAdjustmentsToolControllerSpec *v3;
  void *v4;
  _UIBackdropView *v5;
  _UIBackdropView *backdropBackgroundView;
  void *v7;
  NSString *v8;
  NSString *backdropViewGroupName;
  void *v10;
  UIView *v11;
  UIView *solidBackgroundView;
  void *v13;
  UIView *v14;
  UIView *adjustmentPickerView;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PUAdjustmentsToolController;
  -[PUAdjustmentsToolController viewDidLoad](&v35, sel_viewDidLoad);
  v3 = objc_alloc_init(PUAdjustmentsToolControllerSpec);
  -[PUPhotoEditToolController setToolControllerSpec:](self, "setToolControllerSpec:", v3);
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
  backdropBackgroundView = self->_backdropBackgroundView;
  self->_backdropBackgroundView = v5;

  -[_UIBackdropView setHidden:](self->_backdropBackgroundView, "setHidden:", 1);
  -[_UIBackdropView layer](self->_backdropBackgroundView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  -[_UIBackdropView groupName](self->_backdropBackgroundView, "groupName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  backdropViewGroupName = self->super._backdropViewGroupName;
  self->super._backdropViewGroupName = v8;

  objc_msgSend(v4, "addSubview:", self->_backdropBackgroundView);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  solidBackgroundView = self->_solidBackgroundView;
  self->_solidBackgroundView = v11;

  objc_msgSend(v10, "photoEditingSolidBackgroundViewColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_solidBackgroundView, "setBackgroundColor:", v13);

  -[UIView setAlpha:](self->_solidBackgroundView, "setAlpha:", 0.0);
  objc_msgSend(v4, "addSubview:", self->_solidBackgroundView);
  -[PUAdjustmentsToolController addChildViewController:](self, "addChildViewController:", self->_adjustmentsViewController);
  -[PUAdjustmentsViewController view](self->_adjustmentsViewController, "view");
  v14 = (UIView *)objc_claimAutoreleasedReturnValue();
  adjustmentPickerView = self->_adjustmentPickerView;
  self->_adjustmentPickerView = v14;

  objc_msgSend(v4, "addSubview:", self->_adjustmentPickerView);
  -[PUAdjustmentsViewController didMoveToParentViewController:](self->_adjustmentsViewController, "didMoveToParentViewController:", self);
  v16 = objc_alloc(MEMORY[0x1E0D0D028]);
  v17 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUAdjustmentsToolController setBadgeView:](self, "setBadgeView:", v17);

  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", 0);

  objc_msgSend(v10, "photoEditingBadgeViewFillColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setFillColor:", v19);

  objc_msgSend(v10, "photoEditingBadgeViewContentColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setContentColor:", v21);

  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setFillCornerRadius:", 4.0);

  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  v25 = v24 + 3.0;
  v27 = v26 + 3.0;
  v29 = v28 + 1.0;
  v31 = v30 + 1.0;
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_setTextInsets:", v31, v25, v29, v27);

  -[PUAdjustmentsToolController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_viewLoadingStartTime = mach_absolute_time();
  -[PUAdjustmentsToolController updateAdjustmentControls](self, "updateAdjustmentControls");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  double v5;
  objc_super v6;
  uint8_t buf[4];
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_viewLoadingStartTime >= 1)
  {
    PLPhotoEditGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (double)(mach_absolute_time() - self->_viewLoadingStartTime) / 1000000.0;
      *(_DWORD *)buf = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "PUAdjustmentsToolController loading took: %.3fms", buf, 0xCu);
    }

    self->_viewLoadingStartTime = 0;
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController traitEnvironment:didChangeTraitCollection:](&v6, sel_traitEnvironment_didChangeTraitCollection_, a3, a4);
  -[PUAdjustmentsViewController selectedAdjustmentInfo](self->_adjustmentsViewController, "selectedAdjustmentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController _updateBadgeTextWithInfo:](self, "_updateBadgeTextWithInfo:", v5);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  -[PUAdjustmentsToolController willTransitionToTraitCollection:withTransitionCoordinator:](&v4, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (void)viewDidLayoutSubviews
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
  void *v15;
  void *v16;
  double MinX;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  UIView *adjustmentPickerView;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  double MinY;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double MaxY;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  _OWORD v62[3];
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63.receiver = self;
  v63.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController viewDidLayoutSubviews](&v63, sel_viewDidLayoutSubviews);
  v3 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentLayoutStyle");

  -[PUAdjustmentsToolController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (v5 == 4)
  {
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 1);
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    MinX = CGRectGetMinX(v64);

    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "center");
    v20 = v19;

    -[PUAdjustmentsToolController badgeView](self, "badgeView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = MinX + v22 * -0.5 + -6.0;
LABEL_5:

    -[PUAdjustmentsToolController badgeView](self, "badgeView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCenter:", v23, v20);
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 0);
    adjustmentPickerView = self->_adjustmentPickerView;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v62[0] = *MEMORY[0x1E0C9BAA8];
    v62[1] = v25;
    v62[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](adjustmentPickerView, "setTransform:", v62);
    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    UIRectGetCenter();
    -[UIView setCenter:](self->_adjustmentPickerView, "setCenter:");

    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    MinY = CGRectGetMinY(v65);

    UIRectGetCenter();
    v23 = v30;
    -[PUAdjustmentsToolController badgeView](self, "badgeView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v20 = MinY + v31 * -0.5 + -6.0;
    goto LABEL_5;
  }
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

  -[PUAdjustmentsViewController setLayoutDirection:](self->_adjustmentsViewController, "setLayoutDirection:", 1);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "toolControllerMainContainerView:", self);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    -[PUAdjustmentsToolController view](self, "view");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v37;

  objc_msgSend(v32, "bounds");
  UIRectGetCenter();
  v39 = v38;
  -[PUAdjustmentsToolController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaInsets");
  v42 = v8 + v41;
  v44 = v10 + v43;
  v46 = v12 - (v41 + v45);
  v48 = v14 - (v43 + v47);

  v66.origin.x = v42;
  v66.origin.y = v44;
  v66.size.width = v46;
  v66.size.height = v48;
  MaxY = CGRectGetMaxY(v66);
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  v52 = MaxY + v51 * -0.5;

  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setCenter:", v39, v52);

LABEL_10:
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "frame");
  v56 = v55;
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "frame");
  -[_UIBackdropView setFrame:](self->_backdropBackgroundView, "setFrame:", 0.0, 0.0, v56);

  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v60 = v59;
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "frame");
  -[UIView setFrame:](self->_solidBackgroundView, "setFrame:", 0.0, 0.0, v60);

}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController setupWithAsset:compositionController:editSource:valuesCalculator:](&v13, sel_setupWithAsset_compositionController_editSource_valuesCalculator_, a3, a4, a5, a6);
  -[PUPhotoEditToolController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "toolControllerSourceAssetType:", self);

  -[PUAdjustmentsToolController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController valuesCalculator](self, "valuesCalculator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController autoAdjustmentController](self, "autoAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupWithCompositionController:valuesCalculator:autoAdjustmentController:assetType:", v10, v11, v12, v8);

}

- (void)reactivate
{
  void *v3;
  void (**v4)(void);

  -[PUPhotoEditToolController ppt_didBecomeActiveToolBlock](self, "ppt_didBecomeActiveToolBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolController ppt_didBecomeActiveToolBlock](self, "ppt_didBecomeActiveToolBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_useTranslucentBackground = a3;
    -[PUAdjustmentsToolController _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropViewGroupName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->super._backdropViewGroupName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    backdropViewGroupName = self->super._backdropViewGroupName;
    self->super._backdropViewGroupName = v4;

    -[_UIBackdropView setGroupName:](self->_backdropBackgroundView, "setGroupName:", self->super._backdropViewGroupName);
  }

}

- (void)_updateBadgeTextWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedUppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setText:", v7);

  -[PUAdjustmentsToolController badgeView](self, "badgeView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (id)localizedName
{
  return PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_TOOL_BUTTON"));
}

- (id)toolbarIconGlyphName
{
  return CFSTR("dial.min");
}

- (id)selectedToolbarIconGlyphName
{
  return CFSTR("dial.min.fill");
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(CFSTR("PHOTOEDIT_ADJUST_TOOLBAR_BUTTON_AX_LABEL"));
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
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_TOP_LABEL"));
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

- (BOOL)canResetToDefaultValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolControllerUneditedCompositionController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAdjustmentsToolController.m"), 394, CFSTR("Cannot continue without a base composition."));

  }
  return 0;
}

- (id)localizedResetToolActionTitle
{
  return PULocalizedString(CFSTR("PHOTOEDIT_RESET_LIGHT_AND_COLOR"));
}

- (void)resetToDefaultValueAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController resetToDefaultValueAnimated:](&v3, sel_resetToDefaultValueAnimated_, a3);
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)increaseSliderValue:(BOOL)a3
{
  -[PUAdjustmentsViewController increaseAdjustmentValue:](self->_adjustmentsViewController, "increaseAdjustmentValue:", a3);
}

- (void)decreaseSliderValue:(BOOL)a3
{
  -[PUAdjustmentsViewController decreaseAdjustmentValue:](self->_adjustmentsViewController, "decreaseAdjustmentValue:", a3);
}

- (void)willBecomeActiveTool
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController willBecomeActiveTool](&v5, sel_willBecomeActiveTool);
  -[PUAdjustmentsToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  -[PUAdjustmentsToolController updateAdjustmentControls](self, "updateAdjustmentControls");
}

- (void)_performInitialAction
{
  if (-[PUAdjustmentsToolController initialAction](self, "initialAction") == 1)
    -[PUAdjustmentsViewController toggleAutoEnhance](self->_adjustmentsViewController, "toggleAutoEnhance");
  -[PUAdjustmentsToolController setInitialAction:](self, "setInitialAction:", 0);
}

- (void)didBecomeActiveTool
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PUAdjustmentsToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController didBecomeActiveTool](&v5, sel_didBecomeActiveTool);
}

- (int64_t)toolControllerTag
{
  return 1002;
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
  -[PUAdjustmentsViewController hideUnselectedAdjustments:](self->_adjustmentsViewController, "hideUnselectedAdjustments:", a3);
}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PUAdjustmentsToolController _indexPathForAdjustmentCategory:](self, "_indexPathForAdjustmentCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PUAdjustmentsViewController selectAdjustmentInfoAtIndexPath:](self->_adjustmentsViewController, "selectAdjustmentInfoAtIndexPath:", v4);
    v4 = v5;
  }

}

- (id)_indexPathForAdjustmentCategory:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v25;

  -[PUAdjustmentsToolController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  if (v6)
  {
    v7 = 0;
    v25 = *MEMORY[0x1E0D712F0];
    do
    {
      -[PUAdjustmentsToolController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfItemsInSection:", v7);

      if (v9)
      {
        v10 = 0;
        while (2)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAdjustmentsToolController dataSource](self, "dataSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "infoForItemAtIndexPath:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          switch(a3)
          {
            case 0:
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", v25);

              if (!v15)
                goto LABEL_12;
              goto LABEL_15;
            case 1:
              objc_msgSend(v13, "settingKey");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D712C0], "offsetExposureKey");
              v17 = objc_claimAutoreleasedReturnValue();
              goto LABEL_11;
            case 2:
              objc_msgSend(v13, "settingKey");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D712B8], "offsetSaturationKey");
              v17 = objc_claimAutoreleasedReturnValue();
              goto LABEL_11;
            case 3:
              objc_msgSend(v13, "settingKey");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D712E0], "warmTempKey");
              v17 = objc_claimAutoreleasedReturnValue();
LABEL_11:
              v18 = (void *)v17;
              v19 = objc_msgSend(v16, "isEqualToString:", v17);

              if ((v19 & 1) == 0)
                goto LABEL_12;
LABEL_15:

              return v11;
            default:
LABEL_12:

              ++v10;
              -[PUAdjustmentsToolController dataSource](self, "dataSource");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "numberOfItemsInSection:", v7);

              if (v10 >= v21)
                break;
              continue;
          }
          break;
        }
      }
      ++v7;
      -[PUAdjustmentsToolController dataSource](self, "dataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "numberOfSections");

    }
    while (v7 < v23);
  }
  v11 = 0;
  return v11;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v5, sel_setLayoutOrientation_withTransitionCoordinator_, a3, a4);
  -[PUAdjustmentsToolController updateAdjustmentControls](self, "updateAdjustmentControls");
}

- (void)specDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController specDidChange](&v2, sel_specDidChange);
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController compositionControllerDidChangeForAdjustments:](&v4, sel_compositionControllerDidChangeForAdjustments_, a3);
  -[PUAdjustmentsDataSource compositionControllerDidChange](self->_dataSource, "compositionControllerDidChange");
}

- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3
{
  id v4;

  objc_msgSend(a3, "selectedAdjustmentInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsToolController _updateBadgeTextWithInfo:](self, "_updateBadgeTextWithInfo:", v4);

}

- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
}

- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
}

- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
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

- (void)autoEnhanceActionStateChanged
{
  id v2;

  -[PUPhotoEditToolController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateProgressIndicatorAnimated:", 1);

}

- (double)_sliderLength
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditToolController toolControllerSpec](self, "toolControllerSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sliderLength");
  v4 = v3;

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  int v4;
  void *v5;
  objc_super v7;

  if (sel_autoEnhanceAssets_ == a3)
  {
    -[PUAdjustmentsToolController autoAdjustmentController](self, "autoAdjustmentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isBusy") ^ 1;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUAdjustmentsToolController;
    LOBYTE(v4) = -[PUAdjustmentsToolController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)validateCommand:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((char *)objc_msgSend(v8, "action") == sel_autoEnhanceAssets_)
  {
    v4 = (void *)MEMORY[0x1E0D7CAC0];
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isAutoEnhanceEnabledForCompositionController:", v5);

    if ((_DWORD)v4)
      v6 = CFSTR("MENU_ITEM_TITLE_REMOVE_AUTO_ENHANCEMENTS");
    else
      v6 = CFSTR("MENU_ITEM_TITLE_AUTO_ENHANCE");
    PULocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDiscoverabilityTitle:", v7);

  }
}

- (void)autoEnhanceAssets:(id)a3
{
  -[PUAdjustmentsViewController toggleAutoEnhance](self->_adjustmentsViewController, "toggleAutoEnhance", a3);
}

- (void)ppt_selectSliderNamed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  dispatch_time_t v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[PUAdjustmentsToolController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PUAdjustmentsToolController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfItemsInAllSections");

    if ((v11 & 0x8000000000000000) == 0)
    {
      v12 = v11 + 1;
      goto LABEL_5;
    }
  }
  else
  {
    v12 = 21;
LABEL_5:
    while (1)
    {
      -[PUAdjustmentsViewController selectedAdjustmentInfo](self->_adjustmentsViewController, "selectedAdjustmentInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "caseInsensitiveCompare:", v6);

      if (!v15)
        break;
      -[PUAdjustmentsViewController ppt_selectNextAdjustment](self->_adjustmentsViewController, "ppt_selectNextAdjustment");
      if (!--v12)
        goto LABEL_10;
    }
    if (v7)
    {
      v16 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PUAdjustmentsToolController_ppt_selectSliderNamed_completion___block_invoke;
      block[3] = &unk_1E58ABAC8;
      v18 = v7;
      dispatch_after(v16, MEMORY[0x1E0C80D38], block);

    }
  }
LABEL_10:

}

- (double)ppt_visibleScaleValueForSelectedSlider
{
  double result;

  -[PUAdjustmentsViewController ppt_sliderVisibleScaleValue](self->_adjustmentsViewController, "ppt_sliderVisibleScaleValue");
  return result;
}

- (double)ppt_valueIncrementForSelectedSlider
{
  double result;

  -[PUAdjustmentsViewController ppt_sliderValueIncrement](self->_adjustmentsViewController, "ppt_sliderValueIncrement");
  return result;
}

- (void)_ppt_scrollAfterDelay:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PUAdjustmentsToolController__ppt_scrollAfterDelay___block_invoke;
  block[3] = &unk_1E58ABAC8;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

}

- (PEAutoAdjustmentController)autoAdjustmentController
{
  return self->_autoAdjustmentController;
}

- (void)setAutoAdjustmentController:(id)a3
{
  objc_storeStrong((id *)&self->_autoAdjustmentController, a3);
}

- (int64_t)initialAction
{
  return self->_initialAction;
}

- (void)setInitialAction:(int64_t)a3
{
  self->_initialAction = a3;
}

- (PUAdjustmentsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_autoAdjustmentController, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_adjustmentPickerView, 0);
  objc_storeStrong((id *)&self->_adjustmentsViewController, 0);
}

uint64_t __53__PUAdjustmentsToolController__ppt_scrollAfterDelay___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PUAdjustmentsToolController_ppt_selectSliderNamed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
