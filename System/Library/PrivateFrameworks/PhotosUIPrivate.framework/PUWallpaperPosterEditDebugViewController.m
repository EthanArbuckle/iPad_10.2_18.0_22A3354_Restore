@implementation PUWallpaperPosterEditDebugViewController

- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PUWallpaperPosterEditDebugViewController *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary", v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUWallpaperPosterEditDebugViewController initWithAssets:posterType:photoLibrary:](self, "initWithAssets:posterType:photoLibrary:", v6, 1, v7);
  return v8;
}

- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3 posterType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PUWallpaperPosterEditDebugViewController *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary", v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PUWallpaperPosterEditDebugViewController initWithAssets:posterType:photoLibrary:](self, "initWithAssets:posterType:photoLibrary:", v8, a4, v9);
  return v10;
}

- (PUWallpaperPosterEditDebugViewController)initWithPosterType:(int64_t)a3 photoLibrary:(id)a4
{
  return -[PUWallpaperPosterEditDebugViewController initWithAssets:posterType:photoLibrary:](self, "initWithAssets:posterType:photoLibrary:", MEMORY[0x1E0C9AA60], a3, a4);
}

- (PUWallpaperPosterEditDebugViewController)initWithMigratorOfLegacyConfigurationType:(unint64_t)a3 photoLibrary:(id)a4
{
  id v6;
  PUWallpaperPosterEditDebugViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  _PUWallpaperPosterEditorDebugEnvironment *v11;
  _PUWallpaperPosterEditorDebugEnvironment *editEnvironment;
  void *v13;
  PUWallpaperPosterEditorController *v14;
  PUWallpaperPosterEditorController *posterEditorController;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  v7 = -[PUWallpaperPosterEditDebugViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F0]), "initWithConfigurationType:", 0);
    objc_msgSend(v8, "setOptions:", 2);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75210]), "initWithAssetUUID:", 0);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMedia:", v10);

    v11 = -[_PUWallpaperPosterEditorDebugEnvironment initWithSourcePosterConfiguration:]([_PUWallpaperPosterEditorDebugEnvironment alloc], "initWithSourcePosterConfiguration:", v8);
    editEnvironment = v7->_editEnvironment;
    v7->_editEnvironment = v11;

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/tmp/PhotosPosterMigration/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PUWallpaperPosterEditorDebugEnvironment setSourceAssetDirectory:](v7->_editEnvironment, "setSourceAssetDirectory:", v13);

    -[_PUWallpaperPosterEditorDebugEnvironment setLegacyConfigurationType:](v7->_editEnvironment, "setLegacyConfigurationType:", a3);
    v14 = -[PUWallpaperPosterEditorController initWithWallpaperEditor:photoLibrary:]([PUWallpaperPosterEditorController alloc], "initWithWallpaperEditor:photoLibrary:", v7, v6);
    posterEditorController = v7->_posterEditorController;
    v7->_posterEditorController = v14;

  }
  return v7;
}

- (PUWallpaperPosterEditDebugViewController)initWithExistingConfiguration:(id)a3 assetDirectory:(id)a4 overrideConfiguration:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  PUWallpaperPosterEditDebugViewController *v12;
  _PUWallpaperPosterEditorDebugEnvironment *v13;
  _PUWallpaperPosterEditorDebugEnvironment *editEnvironment;
  PUWallpaperPosterEditorController *v15;
  PUWallpaperPosterEditorController *posterEditorController;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  v12 = -[PUWallpaperPosterEditDebugViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  if (v12)
  {
    v13 = -[_PUWallpaperPosterEditorDebugEnvironment initWithSourcePosterConfiguration:]([_PUWallpaperPosterEditorDebugEnvironment alloc], "initWithSourcePosterConfiguration:", v9);
    editEnvironment = v12->_editEnvironment;
    v12->_editEnvironment = v13;

    -[_PUWallpaperPosterEditorDebugEnvironment setOverrideConfiguration:](v12->_editEnvironment, "setOverrideConfiguration:", v10);
    v15 = -[PUWallpaperPosterEditorController initWithWallpaperEditor:photoLibrary:]([PUWallpaperPosterEditorController alloc], "initWithWallpaperEditor:photoLibrary:", v12, v11);
    posterEditorController = v12->_posterEditorController;
    v12->_posterEditorController = v15;

  }
  return v12;
}

- (PUWallpaperPosterEditDebugViewController)initWithAssets:(id)a3 posterType:(int64_t)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  PUWallpaperPosterEditDebugViewController *v10;
  void *v11;
  void *v12;
  _PUWallpaperPosterEditorDebugEnvironment *v13;
  _PUWallpaperPosterEditorDebugEnvironment *editEnvironment;
  PUWallpaperPosterEditorController *v15;
  PUWallpaperPosterEditorController *posterEditorController;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  v10 = -[PUWallpaperPosterEditDebugViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    PXMap();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F8]), "initWithDescriptorType:media:", a4, v11);
    v13 = -[_PUWallpaperPosterEditorDebugEnvironment initWithPosterDescriptor:]([_PUWallpaperPosterEditorDebugEnvironment alloc], "initWithPosterDescriptor:", v12);
    editEnvironment = v10->_editEnvironment;
    v10->_editEnvironment = v13;

    v15 = -[PUWallpaperPosterEditorController initWithWallpaperEditor:photoLibrary:]([PUWallpaperPosterEditorController alloc], "initWithWallpaperEditor:photoLibrary:", v10, v9);
    posterEditorController = v10->_posterEditorController;
    v10->_posterEditorController = v15;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  -[PUWallpaperPosterEditDebugViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PUWallpaperPosterEditDebugViewController _setupEditorViews](self, "_setupEditorViews");
  -[PUWallpaperPosterEditDebugViewController _setupSimulatedControls](self, "_setupSimulatedControls");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PUWallpaperPosterEditDebugViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  -[PUWallpaperPosterEditDebugViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editorDidInvalidate:", self);
  -[PUWallpaperPosterEditDebugViewController setPosterEditorController:](self, "setPosterEditorController:", 0);

}

- (void)_setupPosterEditorController
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController editEnvironment](self, "editEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editor:didInitializeWithEnvironment:", self, v3);

  -[PUWallpaperPosterEditDebugViewController _updateLooks](self, "_updateLooks");
}

- (void)_updateLookProperties
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "looksForEditor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController setAvailableLooks:](self, "setAvailableLooks:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "initialLookIdentifierForEditor:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PUWallpaperPosterEditDebugViewController__updateLookProperties__block_invoke;
    v10[3] = &unk_1E58ABD38;
    v6 = v5;
    v11 = v6;
    v7 = objc_msgSend(v4, "indexOfObjectPassingTest:", v10);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditDebugViewController.m"), 291, CFSTR("Initial look is not found among available looks."));

    }
    -[PUWallpaperPosterEditDebugViewController setCurrentLookIndex:](self, "setCurrentLookIndex:", v7);

  }
  -[PUWallpaperPosterEditDebugViewController _updateLookControls](self, "_updateLookControls");

}

- (void)_updateLooks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[PUWallpaperPosterEditDebugViewController _updateLookProperties](self, "_updateLookProperties");
  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController availableLooks](self, "availableLooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editor:populateViews:forLook:", self, self, v5);

  -[PUWallpaperPosterEditDebugViewController availableLooks](self, "availableLooks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[PUWallpaperPosterEditDebugViewController looksScrollView](self, "looksScrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  PXRectWithOriginAndSize();
  v9 = v8;
  v11 = v10 * (double)v7;
  -[PUWallpaperPosterEditDebugViewController looksScrollView](self, "looksScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentSize:", v11, v9);

}

- (void)_updateLookControls
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUWallpaperPosterEditDebugViewController availableLooks](self, "availableLooks");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PUWallpaperPosterEditDebugViewController currentLookIndex](self, "currentLookIndex");
  objc_msgSend(v13, "objectAtIndexedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfPages:", objc_msgSend(v13, "count"));
  objc_msgSend(v5, "setCurrentPage:", v3);
  -[PUWallpaperPosterEditDebugViewController lookLabelButton](self, "lookLabelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  -[PUWallpaperPosterEditDebugViewController dateView](self, "dateView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_timeFontIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PUPosterSimulatedTimeFontForIdentifier(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeFont:", v10);

  objc_msgSend(v4, "pu_timeFontColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeColor:", v12);

  objc_msgSend(v8, "setUseVibrantAppearance:", objc_msgSend(v4, "pu_timeAppearance") == 1);
}

- (void)_setupEditorViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *backgroundView;
  UIView *v13;
  UIView *v14;
  UIView *foregroundView;
  UIView *v16;
  PUWallpaperPosterDateView *v17;
  UIView *v18;
  UIView *floatingView;
  UIView *v20;
  UIScrollView *v21;
  UIScrollView *looksScrollView;
  UIScrollView *v23;
  UIView *v24;
  UIView *contentOverlayView;
  id v26;
  CGRect v27;
  CGRect v28;

  -[PUWallpaperPosterEditDebugViewController view](self, "view");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v3, v5, v7, v9);
  -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  objc_msgSend(v26, "addSubview:", v11);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;
  v13 = v11;

  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
  objc_msgSend(v26, "addSubview:", v14);
  foregroundView = self->_foregroundView;
  self->_foregroundView = v14;
  v16 = v14;

  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v28 = CGRectOffset(v27, 0.0, 100.0);
  v17 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  objc_msgSend(v26, "addSubview:", v17);
  -[PUWallpaperPosterEditDebugViewController setDateView:](self, "setDateView:", v17);
  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
  objc_msgSend(v26, "addSubview:", v18);
  floatingView = self->_floatingView;
  self->_floatingView = v18;
  v20 = v18;

  v21 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v4, v6, v8, v10);
  -[UIScrollView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
  -[UIScrollView setPagingEnabled:](v21, "setPagingEnabled:", 1);
  -[UIScrollView setScrollsToTop:](v21, "setScrollsToTop:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v21, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setDelegate:](v21, "setDelegate:", self);
  objc_msgSend(v26, "addSubview:", v21);
  looksScrollView = self->_looksScrollView;
  self->_looksScrollView = v21;
  v23 = v21;

  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v24, "setAutoresizingMask:", 18);
  -[UIScrollView addSubview:](v23, "addSubview:", v24);
  contentOverlayView = self->_contentOverlayView;
  self->_contentOverlayView = v24;

}

- (void)_setupSimulatedControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUWallpaperPosterEditDebugViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PUWallpaperPosterEditDebugViewController *v15;
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
  PUWallpaperPosterEditToolBar *v26;
  void *v27;
  PUWallpaperPosterEditDebugViewController *v28;
  PUWallpaperPosterEditToolBar *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  PUWallpaperPosterEditDebugViewController *v42;
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
  PUWallpaperPosterEditToolBar *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  PUWallpaperPosterEditDebugViewController *v95;
  _QWORD v96[2];
  _QWORD v97[3];
  _QWORD v98[4];
  _QWORD v99[6];

  v99[4] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditDebugViewController setModalPresentationCapturesStatusBarAppearance:](self, "setModalPresentationCapturesStatusBarAppearance:", 1);
  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 1);
  v94 = v3;
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v5);

  objc_msgSend(v3, "setTitle:", CFSTR("Done"));
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfiguration:", v3);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = v6;
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__dismissAndSave_, 0x2000);
  v8 = self;
  -[PUWallpaperPosterEditDebugViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setButtonSize:", 1);
  objc_msgSend(v10, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaseForegroundColor:", v11);

  v93 = v10;
  objc_msgSend(v10, "setTitle:", CFSTR("Cancel"));
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:", v10);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = v12;
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v8, sel__dismissAndCancel_, 0x2000);
  -[PUWallpaperPosterEditDebugViewController view](v8, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

  v69 = (void *)MEMORY[0x1E0CB3718];
  v92 = v7;
  objc_msgSend(v7, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v8, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v82, 20.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v78;
  objc_msgSend(v7, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  -[PUWallpaperPosterEditDebugViewController view](v8, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71, -20.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v67;
  v16 = v13;
  v91 = v13;
  objc_msgSend(v13, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v8, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 20.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v20;
  objc_msgSend(v16, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v8, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v25);

  v26 = objc_alloc_init(PUWallpaperPosterEditToolBar);
  -[PUWallpaperPosterEditToolBar setAutoresizingMask:](v26, "setAutoresizingMask:", 18);
  -[PUWallpaperPosterEditDebugViewController view](v15, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v26);

  v28 = v15;
  -[PUWallpaperPosterEditToolBar setDelegate:](v26, "setDelegate:", v15);
  -[PUWallpaperPosterEditToolBar setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v70 = (void *)MEMORY[0x1E0CB3718];
  v29 = v26;
  -[PUWallpaperPosterEditToolBar bottomAnchor](v26, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v28, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v79, -20.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v76;
  -[PUWallpaperPosterEditToolBar leadingAnchor](v26, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v28, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v68);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v30;
  -[PUWallpaperPosterEditToolBar trailingAnchor](v26, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v28, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v34;
  v90 = v26;
  -[PUWallpaperPosterEditToolBar heightAnchor](v26, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 44.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "activateConstraints:", v37);

  -[PUWallpaperPosterEditDebugViewController setEditToolBar:](v28, "setEditToolBar:", v29);
  v38 = objc_alloc(MEMORY[0x1E0DC3A88]);
  v39 = (void *)objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v39, "addTarget:action:forControlEvents:", v28, sel__handlePageControlSelectedPage_, 0x2000);
  -[PUWallpaperPosterEditDebugViewController view](v28, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", v39);

  v77 = (void *)MEMORY[0x1E0CB3718];
  v41 = v39;
  objc_msgSend(v39, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v28;
  v95 = v28;
  -[PUWallpaperPosterEditDebugViewController view](v28, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v44;
  objc_msgSend(v41, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController editToolBar](v42, "editToolBar");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v48;
  v49 = v41;
  v88 = v41;
  objc_msgSend(v41, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", 50.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "activateConstraints:", v52);

  -[PUWallpaperPosterEditDebugViewController setPageControl:](v95, "setPageControl:", v49);
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setButtonSize:", 1);
  objc_msgSend(v53, "setCornerStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBaseForegroundColor:", v54);

  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "colorWithAlphaComponent:", 0.7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBaseBackgroundColor:", v56);

  objc_msgSend(v53, "setTitle:", &stru_1E58AD278);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setConfiguration:", v53);
  objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v57, "setUserInteractionEnabled:", 0);
  -[PUWallpaperPosterEditDebugViewController view](v95, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addSubview:", v57);

  v81 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v57, "centerXAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController view](v95, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v61;
  objc_msgSend(v57, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController pageControl](v95, "pageControl");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, 10.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "activateConstraints:", v66);

  -[PUWallpaperPosterEditDebugViewController setLookLabelButton:](v95, "setLookLabelButton:", v57);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  -[PUWallpaperPosterEditDebugViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentLayerStackViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayerStackViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v7)
  {
    v19.origin.x = v10;
    v19.origin.y = v12;
    v19.size.width = v14;
    v19.size.height = v16;
    if (!CGRectIsEmpty(v19))
    {
      -[PUWallpaperPosterEditDebugViewController dateView](self, "dateView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layoutWithLayout:inContainerFrame:", v7, v10, v12, v14, v16);

    }
  }

}

- (void)_dismissAndSave:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v5[4] = self;
  objc_msgSend(v4, "editor:finalizeWithCompletion:", self, v5);

}

- (void)_dismissAndCancel:(id)a3
{
  id v3;

  -[PUWallpaperPosterEditDebugViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_handlePageControlSelectedPage:(id)a3
{
  id v4;
  _BOOL8 v5;
  double Width;
  uint64_t v7;
  id v8;
  CGRect v9;

  v4 = a3;
  -[PUWallpaperPosterEditDebugViewController looksScrollView](self, "looksScrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interactionState") == 1;
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v9);
  v7 = objc_msgSend(v4, "currentPage");

  objc_msgSend(v8, "setContentOffset:animated:", v5, Width * (double)v7, 0.0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  double __y;
  CGRect v34;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  __y = 0.0;
  v17 = v6 / CGRectGetWidth(v34);
  v18 = modf(v17, &__y);
  v19 = __y;
  v20 = (uint64_t)__y;
  -[PUWallpaperPosterEditDebugViewController pageControl](self, "pageControl");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurrentPage:", v20);

  -[PUWallpaperPosterEditDebugViewController pu_currentLook](self, "pu_currentLook");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController availableLooks](self, "availableLooks");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController contentOverlayView](self, "contentOverlayView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  objc_msgSend(v23, "setFrame:", v6, v8);
  if (objc_msgSend(v22, "count") > (unint64_t)v19)
  {
    objc_msgSend(v22, "objectAtIndex:", vcvtmd_u64_f64(v17));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "count");
    v26 = vcvtpd_u64_f64(v17);
    if (v25 - 1 >= v26)
      v27 = v26;
    else
      v27 = v25 - 1;
    objc_msgSend(v22, "objectAtIndex:", v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v24 != v28)
    {
      if (v24 == v32)
        v29 = v28;
      else
        v29 = v24;
      if (v24 != v32)
        v18 = 1.0 - v18;
      v30 = v29;
      -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "editor:didTransitionToLook:progress:", self, v30, v18);

    }
    -[PUWallpaperPosterEditDebugViewController setCurrentLookIndex:](self, "setCurrentLookIndex:", v20);
    -[PUWallpaperPosterEditDebugViewController _updateLookControls](self, "_updateLookControls");

  }
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[PUWallpaperPosterEditDebugViewController colorPickerChangeHandler](self, "colorPickerChangeHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUWallpaperPosterEditDebugViewController colorPickerChangeHandler](self, "colorPickerChangeHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  -[PUWallpaperPosterEditDebugViewController setColorPickerChangeHandler:](self, "setColorPickerChangeHandler:", 0);
}

- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0DC3668];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "prompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTitle:", v10);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setModalPresentationStyle:", 1);
  objc_msgSend(v9, "sheetPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDetents:", v13);

  -[PUWallpaperPosterEditDebugViewController setColorPickerChangeHandler:](self, "setColorPickerChangeHandler:", v7);
  -[PUWallpaperPosterEditDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (BOOL)pu_canApplyParallaxToViews
{
  return 0;
}

- (void)px_updatePreferences:(id)a3
{
  void (**v4)(id, void *, _PUWallpaperDebugTransition *);
  void *v5;
  _PUWallpaperDebugTransition *v6;

  v4 = (void (**)(id, void *, _PUWallpaperDebugTransition *))a3;
  v6 = objc_alloc_init(_PUWallpaperDebugTransition);
  -[PUWallpaperPosterEditDebugViewController editPreferences](self, "editPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, v6);

}

- (PUPosterEditingLook)pu_currentLook
{
  void *v3;
  void *v4;

  -[PUWallpaperPosterEditDebugViewController availableLooks](self, "availableLooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[PUWallpaperPosterEditDebugViewController currentLookIndex](self, "currentLookIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUPosterEditingLook *)v4;
}

- (void)updateActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUWallpaperPosterEditDebugViewController posterEditorController](self, "posterEditorController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingMenuElementsForEditor:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingMenuElementsForEditor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditDebugViewController editToolBar](self, "editToolBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeadingMenuElements:", v3);
  objc_msgSend(v5, "setTrailingMenuElements:", v4);

}

- (void)pu_requestDismissalWithAction:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
      -[PUWallpaperPosterEditDebugViewController _dismissAndSave:](self, "_dismissAndSave:", self);
  }
  else
  {
    -[PUWallpaperPosterEditDebugViewController _dismissAndCancel:](self, "_dismissAndCancel:", self);
  }
}

- (BOOL)pu_isDepthEffectDisallowed
{
  return 0;
}

- (BOOL)pu_idleTimerDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIdleTimerDisabled");

  return v3;
}

- (id)pu_disableIdleTimer
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:", 1);

  return objc_alloc_init(_PUWallpaperPosterDebugIdleTimerAssertion);
}

- (UIAction)pu_placeholderAction
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("slowmo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", CFSTR("Loading"), v3, CFSTR("Loading"), &__block_literal_global_423);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAction *)v4;
}

- (id)pu_viewForMenuElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUWallpaperPosterEditDebugViewController editToolBar](self, "editToolBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForMenuElementIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIEdgeInsets)pu_editingChromeDodgingInsets
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

- (BOOL)isPerspectiveZoomEnabled
{
  return self->_perspectiveZoomEnabled;
}

- (void)setPerspectiveZoomEnabled:(BOOL)a3
{
  self->_perspectiveZoomEnabled = a3;
}

- (PUWallpaperPosterEditorController)posterEditorController
{
  return self->_posterEditorController;
}

- (void)setPosterEditorController:(id)a3
{
  objc_storeStrong((id *)&self->_posterEditorController, a3);
}

- (NSArray)availableLooks
{
  return self->_availableLooks;
}

- (void)setAvailableLooks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (int64_t)currentLookIndex
{
  return self->_currentLookIndex;
}

- (void)setCurrentLookIndex:(int64_t)a3
{
  self->_currentLookIndex = a3;
}

- (UIScrollView)looksScrollView
{
  return self->_looksScrollView;
}

- (void)setLooksScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_looksScrollView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)setForegroundView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundView, a3);
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingView, a3);
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (void)setContentOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_contentOverlayView, a3);
}

- (PUWallpaperPosterEditToolBar)editToolBar
{
  return self->_editToolBar;
}

- (void)setEditToolBar:(id)a3
{
  objc_storeStrong((id *)&self->_editToolBar, a3);
}

- (UIAction)tapToRadarAction
{
  return self->_tapToRadarAction;
}

- (void)setTapToRadarAction:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarAction, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UIButton)lookLabelButton
{
  return self->_lookLabelButton;
}

- (void)setLookLabelButton:(id)a3
{
  objc_storeStrong((id *)&self->_lookLabelButton, a3);
}

- (PUWallpaperPosterDateView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (_PUWallpaperPosterEditorDebugEnvironment)editEnvironment
{
  return self->_editEnvironment;
}

- (void)setEditEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_editEnvironment, a3);
}

- (_PUWallpaperPosterEditorDebugPreferences)editPreferences
{
  return self->_editPreferences;
}

- (void)setEditPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_editPreferences, a3);
}

- (id)colorPickerChangeHandler
{
  return self->_colorPickerChangeHandler;
}

- (void)setColorPickerChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorPickerChangeHandler, 0);
  objc_storeStrong((id *)&self->_editPreferences, 0);
  objc_storeStrong((id *)&self->_editEnvironment, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_lookLabelButton, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_tapToRadarAction, 0);
  objc_storeStrong((id *)&self->_editToolBar, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_looksScrollView, 0);
  objc_storeStrong((id *)&self->_availableLooks, 0);
  objc_storeStrong((id *)&self->_posterEditorController, 0);
}

void __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __65__PUWallpaperPosterEditDebugViewController__updateLookProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __55__PUWallpaperPosterEditDebugViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupPosterEditorController");
}

id __83__PUWallpaperPosterEditDebugViewController_initWithAssets_posterType_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D75210];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithAssetUUID:", v5);
  return v6;
}

@end
