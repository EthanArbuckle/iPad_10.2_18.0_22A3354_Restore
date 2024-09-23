@implementation SBInteractiveScreenshotGestureRootViewController

- (SBInteractiveScreenshotGestureRootViewController)initWithWindowScene:(id)a3
{
  id v4;
  SBInteractiveScreenshotGestureRootViewController *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  FBScene *sourceScene;
  uint64_t v13;
  SBInteractiveScreenshotSettings *settings;
  void *v15;
  uint64_t v16;
  SBFFluidBehaviorSettings *trackingCropsAnimationSettings;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  v5 = -[SBInteractiveScreenshotGestureRootViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.SpringBoard.SBInteractiveScreenshotGestureRootViewController.accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneFromIdentityToken:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sourceScene = v5->_sourceScene;
    v5->_sourceScene = (FBScene *)v11;

    +[SBInteractiveScreenshotDomain rootSettings](SBInteractiveScreenshotDomain, "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBInteractiveScreenshotSettings *)v13;

    -[SBInteractiveScreenshotSettings cropsAnimationSettings](v5->_settings, "cropsAnimationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    trackingCropsAnimationSettings = v5->_trackingCropsAnimationSettings;
    v5->_trackingCropsAnimationSettings = (SBFFluidBehaviorSettings *)v16;

  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  -[SBInteractiveScreenshotGestureRootViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)viewDidLoad
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
  SSChromePlaceholderViewController *v13;
  SSChromePlaceholderViewController *chromePlaceholderViewController;
  _SBInteractiveScreenshotGestureBackdropView *v15;
  _SBInteractiveScreenshotGestureBackdropView *contentCapturingView;
  UIView *v17;
  UIView *materialView;
  BSUIOrientationTransformWrapperView *v19;
  BSUIOrientationTransformWrapperView *chromePlaceholderOrientationWrapperView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIStatusBar *v29;
  UIStatusBar *chromePlaceholderStatusBar;
  uint64_t v31;
  void *v32;
  UIView *v33;
  UIView *topContentContainerView;
  void *v35;
  uint64_t v36;
  _SBInteractiveScreenshotGestureReplicatorView *v37;
  _SBInteractiveScreenshotGestureReplicatorView *v38;
  _SBInteractiveScreenshotGestureReplicatorView *replicatorView;
  _SBInteractiveScreenshotGestureBackdropView *v40;
  _SBInteractiveScreenshotGestureBackdropView *v41;
  _SBInteractiveScreenshotGestureBackdropView *contentBackdropView;
  SSFlashView *v43;
  SSFlashView *flashView;
  void *v45;
  SBInteractiveScreenshotGestureCropsView *v46;
  SBInteractiveScreenshotGestureCropsView *cropsView;
  SBInteractiveScreenshotGestureCropsView *v48;
  void *v49;
  SBInteractiveScreenshotGestureCropsView *v50;
  void *v51;
  SBInteractiveScreenshotGestureCropsView *v52;
  void *v53;
  SBInteractiveScreenshotGestureCropsView *v54;
  SBInteractiveScreenshotGestureCropsView *v55;
  SBInteractiveScreenshotGestureCropsView *v56;
  UIViewFloatAnimatableProperty *v57;
  UIViewFloatAnimatableProperty *transformProgressAnimatableProperty;
  UIViewFloatAnimatableProperty *v59;
  UIViewFloatAnimatableProperty *translationXAnimatableProperty;
  UIViewFloatAnimatableProperty *v61;
  UIViewFloatAnimatableProperty *translationYAnimatableProperty;
  UIViewFloatAnimatableProperty *v63;
  UIViewFloatAnimatableProperty *cropsProgressSeparatedValuesAnimatableProperty;
  UIViewFloatAnimatableProperty *v65;
  UIViewFloatAnimatableProperty *cropsProgressPresentationValueAnimatableProperty;
  void *v67;
  UIViewFloatAnimatableProperty *v68;
  UIViewFloatAnimatableProperty *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  id location;
  objc_super v87;
  UIViewFloatAnimatableProperty *v88;
  _QWORD v89[6];

  v89[4] = *MEMORY[0x1E0C80C00];
  v87.receiver = self;
  v87.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  -[SBInteractiveScreenshotGestureRootViewController viewDidLoad](&v87, sel_viewDidLoad);
  -[SBInteractiveScreenshotGestureRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v12);

  v13 = (SSChromePlaceholderViewController *)objc_alloc_init(MEMORY[0x1E0D8C0B0]);
  chromePlaceholderViewController = self->_chromePlaceholderViewController;
  self->_chromePlaceholderViewController = v13;

  -[FBScene identifier](self->_sourceScene, "identifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBInteractiveGestureContent-%@"), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_SBInteractiveScreenshotGestureBackdropView initWithFrame:]([_SBInteractiveScreenshotGestureBackdropView alloc], "initWithFrame:", v5, v7, v9, v11);
  contentCapturingView = self->_contentCapturingView;
  self->_contentCapturingView = v15;

  -[_SBInteractiveScreenshotGestureBackdropView bs_setHitTestingDisabled:](self->_contentCapturingView, "bs_setHitTestingDisabled:", 1);
  -[_SBInteractiveScreenshotGestureBackdropView backdropLayer](self->_contentCapturingView, "backdropLayer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setGroupName:", v77);
  objc_msgSend(v79, "setCaptureOnly:", 1);
  objc_msgSend(v3, "addSubview:", self->_contentCapturingView);
  -[SBInteractiveScreenshotGestureRootViewController _createMaterialViewWithFrame:groupName:isCaptureOnly:](self, "_createMaterialViewWithFrame:groupName:isCaptureOnly:", 0, 0, v5, v7, v9, v11);
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  materialView = self->_materialView;
  self->_materialView = v17;

  -[UIView bs_setHitTestingDisabled:](self->_materialView, "bs_setHitTestingDisabled:", 1);
  objc_msgSend(v3, "addSubview:", self->_materialView);
  v19 = (BSUIOrientationTransformWrapperView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01940]), "initWithFrame:", v5, v7, v9, v11);
  chromePlaceholderOrientationWrapperView = self->_chromePlaceholderOrientationWrapperView;
  self->_chromePlaceholderOrientationWrapperView = v19;

  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_chromePlaceholderOrientationWrapperView, "setContainerOrientation:", 1);
  objc_msgSend(v3, "addSubview:", self->_chromePlaceholderOrientationWrapperView);
  -[SBInteractiveScreenshotGestureRootViewController addChildViewController:](self, "addChildViewController:", self->_chromePlaceholderViewController);
  -[SSChromePlaceholderViewController beginAppearanceTransition:animated:](self->_chromePlaceholderViewController, "beginAppearanceTransition:animated:", 1, 0);
  -[SSChromePlaceholderViewController view](self->_chromePlaceholderViewController, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[BSUIOrientationTransformWrapperView addContentView:](self->_chromePlaceholderOrientationWrapperView, "addContentView:", v78);
  -[SSChromePlaceholderViewController endAppearanceTransition](self->_chromePlaceholderViewController, "endAppearanceTransition");
  -[SSChromePlaceholderViewController didMoveToParentViewController:](self->_chromePlaceholderViewController, "didMoveToParentViewController:", self);
  if (-[SSChromePlaceholderViewController _preferredStatusBarVisibility](self->_chromePlaceholderViewController, "_preferredStatusBarVisibility") == 2)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene settings](self->_sourceScene, "settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "windowSceneForDisplayIdentity:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "statusBarManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reusePool");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInteractiveScreenshotGestureRootViewController description](self, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getReusableStatusBarWithReason:withFrame:", v28, v5, v7, v9, v11);
    v29 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
    chromePlaceholderStatusBar = self->_chromePlaceholderStatusBar;
    self->_chromePlaceholderStatusBar = v29;

    v31 = -[SSChromePlaceholderViewController preferredStatusBarStyle](self->_chromePlaceholderViewController, "preferredStatusBarStyle");
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F20]), "initWithResolvedStyle:foregroundColor:", _SBStatusBarStyleFromLegacyStyle(v31), 0);
    -[UIStatusBar setStyleRequest:animationParameters:](self->_chromePlaceholderStatusBar, "setStyleRequest:animationParameters:", v32, 0);
    -[BSUIOrientationTransformWrapperView addContentView:](self->_chromePlaceholderOrientationWrapperView, "addContentView:", self->_chromePlaceholderStatusBar);

  }
  v33 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
  topContentContainerView = self->_topContentContainerView;
  self->_topContentContainerView = v33;

  -[UIView setClipsToBounds:](self->_topContentContainerView, "setClipsToBounds:", 1);
  -[UIView layer](self->_topContentContainerView, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v35, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_msgSend(v3, "addSubview:", self->_topContentContainerView);
  v37 = [_SBInteractiveScreenshotGestureReplicatorView alloc];
  -[UIView bounds](self->_topContentContainerView, "bounds");
  v38 = -[_SBInteractiveScreenshotGestureReplicatorView initWithFrame:](v37, "initWithFrame:");
  replicatorView = self->_replicatorView;
  self->_replicatorView = v38;

  -[_SBInteractiveScreenshotGestureReplicatorView bs_setHitTestingDisabled:](self->_replicatorView, "bs_setHitTestingDisabled:", 1);
  -[_SBInteractiveScreenshotGestureReplicatorView replicatorLayer](self->_replicatorView, "replicatorLayer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setInstanceCount:", 2);
  -[UIView addSubview:](self->_topContentContainerView, "addSubview:", self->_replicatorView);
  v40 = [_SBInteractiveScreenshotGestureBackdropView alloc];
  -[_SBInteractiveScreenshotGestureReplicatorView bounds](self->_replicatorView, "bounds");
  v41 = -[_SBInteractiveScreenshotGestureBackdropView initWithFrame:](v40, "initWithFrame:");
  contentBackdropView = self->_contentBackdropView;
  self->_contentBackdropView = v41;

  -[_SBInteractiveScreenshotGestureBackdropView bs_setHitTestingDisabled:](self->_contentBackdropView, "bs_setHitTestingDisabled:", 1);
  -[_SBInteractiveScreenshotGestureBackdropView backdropLayer](self->_contentBackdropView, "backdropLayer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setGroupName:", v77);
  -[_SBInteractiveScreenshotGestureReplicatorView addSubview:](self->_replicatorView, "addSubview:", self->_contentBackdropView);
  -[SBInteractiveScreenshotGestureRootViewController _createFlashViewWithFrame:](self, "_createFlashViewWithFrame:", v5, v7, v9, v11);
  v43 = (SSFlashView *)objc_claimAutoreleasedReturnValue();
  flashView = self->_flashView;
  self->_flashView = v43;

  -[SSFlashView setHidden:](self->_flashView, "setHidden:", 1);
  -[SSFlashView layer](self->_flashView, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCornerCurve:", v36);

  objc_msgSend(v3, "addSubview:", self->_flashView);
  v46 = -[SBInteractiveScreenshotGestureCropsView initWithFrame:]([SBInteractiveScreenshotGestureCropsView alloc], "initWithFrame:", v5, v7, v9, v11);
  cropsView = self->_cropsView;
  self->_cropsView = v46;

  -[SBInteractiveScreenshotGestureCropsView bs_setHitTestingDisabled:](self->_cropsView, "bs_setHitTestingDisabled:", 1);
  v48 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerColor](self->_chromePlaceholderViewController, "cropsCornerColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInteractiveScreenshotGestureCropsView setCornerColor:](v48, "setCornerColor:", v49);

  v50 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerColor](self->_chromePlaceholderViewController, "cropsCornerColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInteractiveScreenshotGestureCropsView setLineColor:](v50, "setLineColor:", v51);

  -[SBInteractiveScreenshotGestureCropsView setLineWidth:](self->_cropsView, "setLineWidth:", 1.0);
  v52 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerColor](self->_chromePlaceholderViewController, "cropsCornerColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInteractiveScreenshotGestureCropsView setLineGrabberColor:](v52, "setLineGrabberColor:", v53);

  v54 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerLineWidth](self->_chromePlaceholderViewController, "cropsCornerLineWidth");
  -[SBInteractiveScreenshotGestureCropsView setGrabberLineWidth:](v54, "setGrabberLineWidth:");
  v55 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerEdgeLength](self->_chromePlaceholderViewController, "cropsCornerEdgeLength");
  -[SBInteractiveScreenshotGestureCropsView setCornerEdgeLength:](v55, "setCornerEdgeLength:");
  v56 = self->_cropsView;
  -[SSChromePlaceholderViewController cropsCornerEdgeLength](self->_chromePlaceholderViewController, "cropsCornerEdgeLength");
  -[SBInteractiveScreenshotGestureCropsView setLineGrabberEdgeLength:](v56, "setLineGrabberEdgeLength:");
  -[SBInteractiveScreenshotGestureCropsView setCornerAlpha:](self->_cropsView, "setCornerAlpha:", 0.0);
  objc_msgSend(v3, "addSubview:", self->_cropsView);
  v57 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  transformProgressAnimatableProperty = self->_transformProgressAnimatableProperty;
  self->_transformProgressAnimatableProperty = v57;

  -[UIViewFloatAnimatableProperty setValue:](self->_transformProgressAnimatableProperty, "setValue:", 0.0);
  v59 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  translationXAnimatableProperty = self->_translationXAnimatableProperty;
  self->_translationXAnimatableProperty = v59;

  -[UIViewFloatAnimatableProperty setValue:](self->_translationXAnimatableProperty, "setValue:", 0.0);
  v61 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  translationYAnimatableProperty = self->_translationYAnimatableProperty;
  self->_translationYAnimatableProperty = v61;

  -[UIViewFloatAnimatableProperty setValue:](self->_translationYAnimatableProperty, "setValue:", 0.0);
  v63 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  cropsProgressSeparatedValuesAnimatableProperty = self->_cropsProgressSeparatedValuesAnimatableProperty;
  self->_cropsProgressSeparatedValuesAnimatableProperty = v63;

  -[UIViewFloatAnimatableProperty setValue:](self->_cropsProgressSeparatedValuesAnimatableProperty, "setValue:", 0.0);
  v65 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  cropsProgressPresentationValueAnimatableProperty = self->_cropsProgressPresentationValueAnimatableProperty;
  self->_cropsProgressPresentationValueAnimatableProperty = v65;

  -[UIViewFloatAnimatableProperty setValue:](self->_cropsProgressPresentationValueAnimatableProperty, "setValue:", 0.0);
  objc_initWeak(&location, self);
  v67 = (void *)MEMORY[0x1E0CEABB0];
  v68 = self->_transformProgressAnimatableProperty;
  v89[0] = self->_cropsProgressSeparatedValuesAnimatableProperty;
  v89[1] = v68;
  v69 = self->_translationYAnimatableProperty;
  v89[2] = self->_translationXAnimatableProperty;
  v89[3] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = MEMORY[0x1E0C809B0];
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke;
  v84[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v85, &location);
  v82[0] = v71;
  v82[1] = 3221225472;
  v82[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_2;
  v82[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v83, &location);
  objc_msgSend(v67, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v70, v84, v82);

  v72 = (void *)MEMORY[0x1E0CEABB0];
  v88 = self->_cropsProgressPresentationValueAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v71;
  v80[1] = 3221225472;
  v80[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_3;
  v80[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v81, &location);
  objc_msgSend(v72, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v73, v80);

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&location);

}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContentTransformUsingPresentationValues:", 0);

}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContentTransformUsingPresentationValues:", 1);

}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCropLinesMultiPartAnimationForCropsProgress");

}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
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
  int64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  UIEdgeInsets result;

  if (self->_chromePlaceholderViewController == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar currentHeight](self->_chromePlaceholderStatusBar, "currentHeight");
    objc_msgSend(v14, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[BSUIOrientationTransformWrapperView contentOrientation](self->_chromePlaceholderOrientationWrapperView, "contentOrientation");
    -[SBInteractiveScreenshotGestureRootViewController traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v16, v17);
    v7 = v18;
    v9 = v19;
    v11 = v20;
    v13 = v21;

    if (a4)
      *a4 = 1;

  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
    -[SBInteractiveScreenshotGestureRootViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v26, sel__edgeInsetsForChildViewController_insetsAreAbsolute_);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  v22 = v7;
  v23 = v9;
  v24 = v11;
  v25 = v13;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  NSObject *accessQueue;
  UIScenePresenter *sourceScenePresenter;
  UIViewFloatAnimatableProperty *transformProgressAnimatableProperty;
  UIViewFloatAnimatableProperty *translationXAnimatableProperty;
  UIViewFloatAnimatableProperty *translationYAnimatableProperty;
  UIViewFloatAnimatableProperty *cropsProgressSeparatedValuesAnimatableProperty;
  UIViewFloatAnimatableProperty *cropsProgressPresentationValueAnimatableProperty;
  UIViewFloatAnimatableProperty *cancellationCommitProgressAnimatableProperty;
  void *v11;
  void *v12;
  void *v13;
  UIStatusBar *chromePlaceholderStatusBar;
  _QWORD block[5];

  self->_hasCrossedCommitThreshold = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBInteractiveScreenshotGestureRootViewController_invalidate__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  -[UIScenePresenter invalidate](self->_sourceScenePresenter, "invalidate");
  sourceScenePresenter = self->_sourceScenePresenter;
  self->_sourceScenePresenter = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_transformProgressAnimatableProperty, "invalidate");
  transformProgressAnimatableProperty = self->_transformProgressAnimatableProperty;
  self->_transformProgressAnimatableProperty = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_translationXAnimatableProperty, "invalidate");
  translationXAnimatableProperty = self->_translationXAnimatableProperty;
  self->_translationXAnimatableProperty = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_translationYAnimatableProperty, "invalidate");
  translationYAnimatableProperty = self->_translationYAnimatableProperty;
  self->_translationYAnimatableProperty = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_cropsProgressSeparatedValuesAnimatableProperty, "invalidate");
  cropsProgressSeparatedValuesAnimatableProperty = self->_cropsProgressSeparatedValuesAnimatableProperty;
  self->_cropsProgressSeparatedValuesAnimatableProperty = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_cropsProgressPresentationValueAnimatableProperty, "invalidate");
  cropsProgressPresentationValueAnimatableProperty = self->_cropsProgressPresentationValueAnimatableProperty;
  self->_cropsProgressPresentationValueAnimatableProperty = 0;

  -[UIViewFloatAnimatableProperty invalidate](self->_cancellationCommitProgressAnimatableProperty, "invalidate");
  cancellationCommitProgressAnimatableProperty = self->_cancellationCommitProgressAnimatableProperty;
  self->_cancellationCommitProgressAnimatableProperty = 0;

  if (self->_chromePlaceholderStatusBar)
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reusePool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recycleStatusBar:", self->_chromePlaceholderStatusBar);

    chromePlaceholderStatusBar = self->_chromePlaceholderStatusBar;
    self->_chromePlaceholderStatusBar = 0;

  }
}

uint64_t __62__SBInteractiveScreenshotGestureRootViewController_invalidate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1264) = 0;
  return result;
}

- (unsigned)flashViewLayerContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[SSFlashView layer](self->_flashView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contextId");

  return v4;
}

- (unint64_t)flashViewLayerRenderID
{
  void *v2;
  unint64_t RenderId;

  -[SSFlashView layer](self->_flashView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  RenderId = CALayerGetRenderId();

  return RenderId;
}

- (int64_t)gestureStyle
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SBInteractiveScreenshotGestureRootViewController_gestureStyle__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__SBInteractiveScreenshotGestureRootViewController_gestureStyle__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1248);
  return result;
}

- (void)setGestureStyle:(int64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBInteractiveScreenshotGestureRootViewController_setGestureStyle___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __68__SBInteractiveScreenshotGestureRootViewController_setGestureStyle___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1248) = *(_QWORD *)(result + 40);
  return result;
}

- (void)cancelInteractionWithStyle:(int64_t)a3 settlingCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *accessQueue;
  uint64_t v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  -[SBInteractiveScreenshotSettings contentAnimationSettings](self->_settings, "contentAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[SBInteractiveScreenshotSettings disabledGestureContentAnimationSettings](self->_settings, "disabledGestureContentAnimationSettings");
    v8 = objc_claimAutoreleasedReturnValue();

    -[SBInteractiveScreenshotGestureRootViewController _currentCommitProgressVelocity](self, "_currentCommitProgressVelocity");
    v10 = v9;
    -[SBInteractiveScreenshotSettings disabledGestureVelocityScale](self->_settings, "disabledGestureVelocityScale");
    -[SBInteractiveScreenshotGestureRootViewController _injectCommitProgressVelocity:](self, "_injectCommitProgressVelocity:", v10 * v11);
    v7 = (void *)v8;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  accessQueue = self->_accessQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__SBInteractiveScreenshotGestureRootViewController_cancelInteractionWithStyle_settlingCompletionHandler___block_invoke;
  v14[3] = &unk_1E8E9DFA0;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(accessQueue, v14);
  if (-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleReducedMotion:](self, "_isGestureStyleReducedMotion:", v16[3]))
  {
    v13 = 4;
  }
  else
  {
    v13 = 3;
  }
  -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:", v13, v7, v6, 0.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  _Block_object_dispose(&v15, 8);

}

uint64_t __105__SBInteractiveScreenshotGestureRootViewController_cancelInteractionWithStyle_settlingCompletionHandler___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1248);
  return result;
}

- (void)captureScreenshotWithInterfaceOrientation:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  UIScenePresentation *sourceScenePresentationView;
  void *v8;
  int v9;
  void *ImageFromInterfaceOrientedView;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, void *);
  int64_t v14;

  v6 = (void (**)(id, void *))a4;
  -[SBInteractiveScreenshotGestureRootViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  sourceScenePresentationView = self->_sourceScenePresentationView;
  if (sourceScenePresentationView)
  {
    -[UIScenePresentation layer](sourceScenePresentationView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasBeenCommitted");

    if (v9)
    {
      ImageFromInterfaceOrientedView = (void *)SBInteractiveScreenshotCreateImageFromInterfaceOrientedView(self->_sourceScenePresentationView, a3);
      v6[2](v6, ImageFromInterfaceOrientedView);

    }
    else
    {
      v11 = (void *)*MEMORY[0x1E0CEB258];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __105__SBInteractiveScreenshotGestureRootViewController_captureScreenshotWithInterfaceOrientation_completion___block_invoke;
      v12[3] = &unk_1E8EAFC38;
      v12[4] = self;
      v13 = v6;
      v14 = a3;
      objc_msgSend(v11, "sb_performBlockAfterCATransactionSynchronizedCommit:", v12);

    }
  }
  else
  {
    v6[2](v6, 0);
  }

}

void __105__SBInteractiveScreenshotGestureRootViewController_captureScreenshotWithInterfaceOrientation_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id ImageFromInterfaceOrientedView;

  v1 = a1[5];
  ImageFromInterfaceOrientedView = (id)SBInteractiveScreenshotCreateImageFromInterfaceOrientedView(*(void **)(a1[4] + 1160), a1[6]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, ImageFromInterfaceOrientedView);

}

- (void)commitInteractionWithScreenshotImage:(id)a3 screenshotInterfaceOrientation:(int64_t)a4 settlingCompletionHandler:(id)a5 flashCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *accessQueue;
  uint64_t v14;
  double queue_displayScale;
  double v16;
  UIImageView *screenshotImageView;
  void *v18;
  void *v19;
  SBCAAnimationBlockDelegate *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  SBInteractiveScreenshotGestureMultiPartAnimation *v26;
  SBInteractiveScreenshotGestureMultiPartAnimation *v27;
  SBInteractiveScreenshotGestureMultiPartAnimation *v28;
  SBInteractiveScreenshotGestureMultiPartAnimation *v29;
  SBInteractiveScreenshotGestureMultiPartAnimation *v30;
  NSMutableArray *cropLinesAlphaMultiPartAnimations;
  NSMutableArray *v32;
  NSMutableArray *v33;
  SBInteractiveScreenshotGestureMultiPartAnimation *v34;
  SBInteractiveScreenshotGestureMultiPartAnimation *v35;
  SSFlashView *flashView;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  SBInteractiveScreenshotGestureMultiPartAnimation *v42;
  SBInteractiveScreenshotGestureMultiPartAnimation *v43;
  _QWORD v44[4];
  SBInteractiveScreenshotGestureMultiPartAnimation *v45;
  id v46;
  id location;
  _QWORD v48[4];
  id v49;
  CATransform3D v50;
  _QWORD block[7];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  accessQueue = self->_accessQueue;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke;
  block[3] = &unk_1E8EAFC60;
  block[4] = self;
  block[5] = &v56;
  block[6] = &v52;
  dispatch_sync(accessQueue, block);
  if (!*((_BYTE *)v57 + 24))
    -[SBInteractiveScreenshotGestureRootViewController _prepareViewHierarchyForCommittedScreenshot:gestureStyle:](self, "_prepareViewHierarchyForCommittedScreenshot:gestureStyle:", 1, v53[3]);
  -[UIImageView setImage:](self->_screenshotImageView, "setImage:", v10);
  queue_displayScale = self->_queue_displayScale;
  -[UIImageView sizeThatFits:](self->_screenshotImageView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[UIView bounds](self->_screenshotContainerView, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIImageView sb_setBoundsAndPositionFromFrame:](self->_screenshotImageView, "sb_setBoundsAndPositionFromFrame:", *(_QWORD *)&queue_displayScale);
  switch(a4)
  {
    case 1:
      v16 = 0.0;
      break;
    case 3:
      v16 = 1.57079633;
      break;
    case 4:
      v16 = -1.57079633;
      break;
    default:
      v16 = 3.14159265;
      if (a4 != 2)
        v16 = 0.0;
      break;
  }
  screenshotImageView = self->_screenshotImageView;
  CATransform3DMakeRotation(&v50, v16, 0.0, 0.0, 1.0);
  -[UIImageView setTransform3D:](screenshotImageView, "setTransform3D:", &v50);
  if (-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleReducedMotion:](self, "_isGestureStyleReducedMotion:", v53[3]))
  {
    if (v12)
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimingFunction:", v19);

    objc_msgSend(v18, "setType:", *MEMORY[0x1E0CD3170]);
    objc_msgSend(v18, "setDuration:", 0.3);
    v20 = objc_alloc_init(SBCAAnimationBlockDelegate);
    v37[0] = v14;
    v37[1] = 3221225472;
    v37[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_8;
    v37[3] = &unk_1E8EAFCD8;
    v38 = v11;
    -[SBCAAnimationBlockDelegate setAnimationDidStopHandler:](v20, "setAnimationDidStopHandler:", v37);
    objc_msgSend(v18, "setDelegate:", v20);
    -[SBInteractiveScreenshotGestureRootViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAnimation:forKey:", v18, CFSTR("crossFade"));

    -[SBInteractiveScreenshotGestureCropsView setLineAlpha:](self->_cropsView, "setLineAlpha:", 1.0);
    -[SBInteractiveScreenshotGestureCropsView setLineGrabberAlpha:](self->_cropsView, "setLineGrabberAlpha:", 1.0);
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 4, 0, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
  else
  {
    if (-[SBInteractiveScreenshotSettings shouldInjectVelocity](self->_settings, "shouldInjectVelocity"))
    {
      -[SBInteractiveScreenshotGestureRootViewController _gestureCommitProgressUpdateVelocityOverTimeInterval:](self, "_gestureCommitProgressUpdateVelocityOverTimeInterval:", 0.0416666667);
      v24 = v23;
      -[SBInteractiveScreenshotSettings maximumInjectedVelocity](self->_settings, "maximumInjectedVelocity");
      if (v24 < v25)
        v25 = v24;
      -[SBInteractiveScreenshotGestureRootViewController _injectCommitProgressVelocity:](self, "_injectCommitProgressVelocity:", v25);
    }
    v26 = [SBInteractiveScreenshotGestureMultiPartAnimation alloc];
    v48[0] = v14;
    v48[1] = 3221225472;
    v48[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_2;
    v48[3] = &unk_1E8EAFC88;
    v49 = v11;
    v27 = -[SBInteractiveScreenshotGestureMultiPartAnimation initWithCompletionHandler:](v26, "initWithCompletionHandler:", v48);
    -[SBInteractiveScreenshotGestureMultiPartAnimation beginAnimationWithIdentifier:](v27, "beginAnimationWithIdentifier:", CFSTR("cropLinesMultiPartAnimation"));
    -[SBInteractiveScreenshotGestureMultiPartAnimation beginAnimationWithIdentifier:](v27, "beginAnimationWithIdentifier:", CFSTR("mainUpdate"));
    objc_initWeak(&location, self);
    v28 = [SBInteractiveScreenshotGestureMultiPartAnimation alloc];
    v44[0] = v14;
    v44[1] = 3221225472;
    v44[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_3;
    v44[3] = &unk_1E8EAFCB0;
    objc_copyWeak(&v46, &location);
    v29 = v27;
    v45 = v29;
    v30 = -[SBInteractiveScreenshotGestureMultiPartAnimation initWithCompletionHandler:](v28, "initWithCompletionHandler:", v44);
    -[SBInteractiveScreenshotGestureMultiPartAnimation beginAnimationWithIdentifier:](v30, "beginAnimationWithIdentifier:", CFSTR("cropsProgressThreshold"));
    cropLinesAlphaMultiPartAnimations = self->_cropLinesAlphaMultiPartAnimations;
    if (!cropLinesAlphaMultiPartAnimations)
    {
      v32 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v33 = self->_cropLinesAlphaMultiPartAnimations;
      self->_cropLinesAlphaMultiPartAnimations = v32;

      cropLinesAlphaMultiPartAnimations = self->_cropLinesAlphaMultiPartAnimations;
    }
    -[NSMutableArray addObject:](cropLinesAlphaMultiPartAnimations, "addObject:", v30);
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_6;
    v41[3] = &unk_1E8EA46C0;
    v34 = v29;
    v42 = v34;
    v35 = v30;
    v43 = v35;
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 3, v41, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[SBInteractiveScreenshotGestureRootViewController _updateCropLinesMultiPartAnimationForCropsProgress](self, "_updateCropLinesMultiPartAnimationForCropsProgress");
    flashView = self->_flashView;
    v39[0] = v14;
    v39[1] = 3221225472;
    v39[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_7;
    v39[3] = &unk_1E8E9E8D0;
    v40 = v12;
    -[SSFlashView flashWithCompletion:](flashView, "flashWithCompletion:", v39);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

    v18 = v49;
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

}

_QWORD *__169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[4] + 1264);
  *(_BYTE *)(result[4] + 1264) = 1;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 1248);
  return result;
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

void __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id *WeakRetained;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id *v17;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_4;
  objc_msgSend(WeakRetained[133], "removeObject:", v7);
  if (!objc_msgSend(v9[133], "count"))
  {
    v10 = v9[133];
    v9[133] = 0;

    if ((a4 & 1) != 0)
      goto LABEL_4;
LABEL_6:
    v11 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v9[143], "cropLinesAlphaAnimationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_4;
    v16[3] = &unk_1E8E9DED8;
    v17 = v9;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_5;
    v14[3] = &unk_1E8EA46E8;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v12, 3, v16, v14);

    goto LABEL_7;
  }
  if ((a4 & 1) == 0)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(*(id *)(a1 + 32), "completeAnimationWithIdentifier:finished:retargeted:", CFSTR("cropLinesMultiPartAnimation"), a3, a4);
LABEL_7:

}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setLineAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setLineGrabberAlpha:", 1.0);
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeAnimationWithIdentifier:finished:retargeted:", CFSTR("cropLinesMultiPartAnimation"), a2, a3);
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "completeAnimationWithIdentifier:finished:retargeted:", CFSTR("mainUpdate"), a2, a3);
  return objc_msgSend(*(id *)(a1 + 40), "completeAnimationWithIdentifier:finished:retargeted:", CFSTR("cropsProgressThreshold"), a2, a3);
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a3, a3 ^ 1);
  return result;
}

- (void)handlePanGestureRecognizerAction:(id)a3
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *accessQueue;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
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
  uint64_t v49;
  id WeakRetained;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __double2 v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
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
  BOOL v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  double v98;
  _QWORD v99[6];
  _QWORD v100[18];
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD block[6];
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;

  v4 = a3;
  -[SBInteractiveScreenshotGestureRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBInteractiveScreenshotGestureRootViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;
  if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v16 = v18;

  }
  v19 = objc_msgSend(v4, "state");
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  accessQueue = self->_accessQueue;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v106;
  dispatch_sync(accessQueue, block);
  if (v19 == 1)
  {
    -[SBInteractiveScreenshotGestureRootViewController _prepareViewHierarchyForCommittedScreenshot:gestureStyle:](self, "_prepareViewHierarchyForCommittedScreenshot:gestureStyle:", 0, v107[3]);
    -[SBInteractiveScreenshotGestureCropsView sb_setBoundsAndPositionFromFrame:](self->_cropsView, "sb_setBoundsAndPositionFromFrame:", v7, v9, v11, v13);
  }
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  objc_msgSend(v4, "locationInView:", v5);
  v23 = v22;
  v25 = v24;
  if (v19 == 1)
  {
    v26 = objc_msgSend(v4, "_touchInterfaceOrientation");
    v27 = v102;
    v102[3] = v26;
    self->_gesturePortraitAnchorPoint.x = v23;
    self->_gesturePortraitAnchorPoint.y = v25;
    -[UIStatusBar setOrientation:](self->_chromePlaceholderStatusBar, "setOrientation:", v27[3]);
    -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_chromePlaceholderOrientationWrapperView, "setContentOrientation:", v102[3]);
    -[SSChromePlaceholderViewController _updateContentOverlayInsetsFromParentIfNecessary](self->_chromePlaceholderViewController, "_updateContentOverlayInsetsFromParentIfNecessary");
    objc_msgSend(v14, "displayCornerRadius");
    v94 = v28;
    v92 = v16;
    -[SSChromePlaceholderViewController screenshotContentFrame](self->_chromePlaceholderViewController, "screenshotContentFrame");
    v90 = v30;
    v91 = v29;
    v88 = v32;
    v89 = v31;
    -[SSChromePlaceholderViewController cropsCornerLineWidth](self->_chromePlaceholderViewController, "cropsCornerLineWidth");
    v34 = v33;
    -[SSChromePlaceholderViewController cropsCornerContentPadding](self->_chromePlaceholderViewController, "cropsCornerContentPadding");
    v35 = self->_accessQueue;
    v100[0] = v21;
    v100[1] = 3221225472;
    v100[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_2;
    v100[3] = &unk_1E8EAFD00;
    *(double *)&v100[6] = v7;
    *(double *)&v100[7] = v9;
    *(double *)&v100[8] = v11;
    *(double *)&v100[9] = v13;
    v100[10] = v91;
    v100[11] = v90;
    v100[12] = v89;
    v100[13] = v88;
    v100[14] = v92;
    v100[15] = v94;
    v100[16] = v34;
    v100[17] = v36;
    v100[4] = self;
    v100[5] = &v101;
    dispatch_sync(v35, v100);
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 1, 0, 0.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  else
  {
    v37 = self->_accessQueue;
    v99[0] = v21;
    v99[1] = 3221225472;
    v99[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_3;
    v99[3] = &unk_1E8E9DFA0;
    v99[4] = self;
    v99[5] = &v101;
    dispatch_sync(v37, v99);
  }
  _UIWindowConvertPointFromOrientationToOrientation();
  v39 = v38;
  v41 = v40;
  _UIWindowConvertRectFromOrientationToOrientation();
  v95 = v42;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = objc_msgSend(v4, "edges");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  _UIWindowConvertPointFromOrientationToOrientation();
  if (v19 == 4)
  {
    v60 = 0;
LABEL_18:
    objc_msgSend(WeakRetained, "interactiveScreenshotGestureRootViewController:gestureDidCompleteWithIntent:", self, v60);
    goto LABEL_53;
  }
  v53 = v51;
  v54 = v52;
  if (v19 == 3)
  {
    if (-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", v107[3]))
    {
      v60 = 1;
      goto LABEL_18;
    }
    objc_msgSend(v4, "velocityInView:", v5);
    v63 = v61;
    v64 = v102[3];
    v93 = v48;
    if (v64 == 4)
    {
      v65 = v61;
      v63 = -v62;
    }
    else if (v64 == 3)
    {
      v65 = -v61;
      v63 = v62;
    }
    else
    {
      v65 = v62;
      if (v64 == 2)
      {
        v63 = -v61;
        v65 = -v62;
      }
    }
    -[SBInteractiveScreenshotSettings projectionDecelerationRate](self->_settings, "projectionDecelerationRate");
    v80 = v39 + v63 / 1000.0 * v79 / (1.0 - v79);
    v81 = v41 + v65 / 1000.0 * v79 / (1.0 - v79);
    if (v49 == 12)
    {
      v83 = v80 - v53;
      v84 = v81 - v54;
      v87 = v83 < 0.00000011920929 && v84 < 0.00000011920929;
      v82 = v93;
      if (!v87)
        goto LABEL_43;
    }
    else
    {
      v82 = v93;
      if (v49 != 6
        || ((v83 = v80 - v53, v84 = v81 - v54, v83 > 0.00000011920929) ? (v85 = v84 < 0.00000011920929) : (v85 = 0), !v85))
      {
LABEL_43:
        v86 = 1;
LABEL_52:
        objc_msgSend(WeakRetained, "interactiveScreenshotGestureRootViewController:gestureDidCompleteWithIntent:", self, v86);
        goto LABEL_53;
      }
    }
    v98 = 0.0;
    -[SBInteractiveScreenshotGestureRootViewController _getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:](self, "_getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:", 0, 0, &v98, fabs(v83), fabs(v84), v44, v46, v82, v95);
    if (BSFloatGreaterThanOrEqualToFloat())
      v86 = 2;
    else
      v86 = 1;
    goto LABEL_52;
  }
  if (v19 == 2)
  {
    v55 = vabdd_f64(v39, v51);
    v97 = 0;
    v98 = 0.0;
    v56 = vabdd_f64(v41, v52);
    v96 = 0.0;
    -[SBInteractiveScreenshotGestureRootViewController _getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:](self, "_getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:", &v98, &v97, &v96, v55, v56, v44, v46, v48, v95);
    -[SBInteractiveScreenshotGestureRootViewController _addGestureUpdateWithCommitProgress:timestamp:](self, "_addGestureUpdateWithCommitProgress:timestamp:", v96, CACurrentMediaTime());
    -[SBInteractiveScreenshotSettings baseCornerTranslationDegrees](self->_settings, "baseCornerTranslationDegrees");
    BSDegreesToRadians();
    v58 = __sincos_stret(v57);
    v59 = v98;
    if (-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleReducedMotion:](self, "_isGestureStyleReducedMotion:", v107[3]))
    {
      if (!-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", v107[3])&& BSFloatGreaterThanOrEqualToFloat())
      {
        objc_msgSend(WeakRetained, "interactiveScreenshotGestureRootViewController:gestureDidCompleteWithIntent:", self, 2);
      }
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      v67 = v66;
      -[SBInteractiveScreenshotSettings horizontalTranslationFactor](self->_settings, "horizontalTranslationFactor");
      v69 = v68;
      -[SBInteractiveScreenshotSettings verticalTranslationFactor](self->_settings, "verticalTranslationFactor");
      v70 = (v58.__cosval * v59 - v55) * (1.0 - v67) * v69;
      v72 = (v58.__sinval * v59 - v56) * (1.0 - v67) * v71;
      v73 = v102[3];
      v74 = -v70;
      v75 = -v72;
      if (v73 == 2)
        v76 = -v72;
      else
        v76 = v72;
      if (v73 == 2)
        v77 = -v70;
      else
        v77 = (v58.__cosval * v59 - v55) * (1.0 - v67) * v69;
      if (v73 != 3)
      {
        v70 = v76;
        v75 = v77;
      }
      if (v73 == 4)
      {
        v78 = v72;
      }
      else
      {
        v74 = v70;
        v78 = v75;
      }
      -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 5, 0, v96, v78, v74, v75);
    }
  }
LABEL_53:

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v106, 8);

}

uint64_t __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1248);
  return result;
}

double __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_2(uint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  _OWORD *v3;
  __int128 v4;
  double result;

  v1 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1272);
  v2 = *(_OWORD *)(a1 + 64);
  *v1 = *(_OWORD *)(a1 + 48);
  v1[1] = v2;
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1304);
  v4 = *(_OWORD *)(a1 + 96);
  *v3 = *(_OWORD *)(a1 + 80);
  v3[1] = v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1240) = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232) = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224) = *(_QWORD *)(a1 + 128);
  result = *(double *)(a1 + 136);
  *(double *)(*(_QWORD *)(a1 + 32) + 1216) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_3(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1256);
  return result;
}

- (void)removePlaceholderChrome
{
  -[_SBInteractiveScreenshotGestureBackdropView setHidden:](self->_contentCapturingView, "setHidden:", 1);
  -[_SBInteractiveScreenshotGestureBackdropView setHidden:](self->_contentBackdropView, "setHidden:", 1);
  -[UIView setHidden:](self->_topContentContainerView, "setHidden:", 1);
  -[SBInteractiveScreenshotGestureCropsView setHidden:](self->_cropsView, "setHidden:", 1);
  -[UIView setHidden:](self->_materialView, "setHidden:", 1);
  -[_SBInteractiveScreenshotGestureReplicatorView setHidden:](self->_replicatorView, "setHidden:", 1);
  -[UIScenePresentation setHidden:](self->_sourceScenePresentationView, "setHidden:", 1);
  -[UIView setHidden:](self->_screenshotContainerView, "setHidden:", 1);
  -[BSUIOrientationTransformWrapperView setHidden:](self->_chromePlaceholderOrientationWrapperView, "setHidden:", 1);
}

- (CATransform3D)_anchoredTransformForAnchorPoint:(SEL)a3 bounds:(CGPoint)a4 center:(CGRect)a5 transform:(CGPoint)a6
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CATransform3D *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CATransform3D v17;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  v8 = *(_OWORD *)&a7->m33;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&a7->m31;
  *(_OWORD *)&v17.m33 = v8;
  v9 = *(_OWORD *)&a7->m43;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&a7->m41;
  *(_OWORD *)&v17.m43 = v9;
  v10 = *(_OWORD *)&a7->m13;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&a7->m11;
  *(_OWORD *)&v17.m13 = v10;
  v11 = *(_OWORD *)&a7->m23;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&a7->m21;
  *(_OWORD *)&v17.m23 = v11;
  CATransform3DTranslate(retstr, &v17, -(a4.x * a5.size.width), -(a4.y * a5.size.height), 0.0);
  result = (CATransform3D *)CATransform3DTranslateRight();
  v13 = *(_OWORD *)&v17.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
  *(_OWORD *)&retstr->m33 = v13;
  v14 = *(_OWORD *)&v17.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
  *(_OWORD *)&retstr->m43 = v14;
  v15 = *(_OWORD *)&v17.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
  *(_OWORD *)&retstr->m13 = v15;
  v16 = *(_OWORD *)&v17.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
  *(_OWORD *)&retstr->m23 = v16;
  return result;
}

- (void)_cancellationCommitProgressAnimatablePropertyPresentationValueDidChange
{
  __int128 v3;
  NSObject *accessQueue;
  id WeakRetained;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;

  -[UIViewFloatAnimatableProperty presentationValue](self->_cancellationCommitProgressAnimatableProperty, "presentationValue");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4010000000;
  v11[3] = &unk_1D0FA064E;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = v3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__SBInteractiveScreenshotGestureRootViewController__cancellationCommitProgressAnimatablePropertyPresentationValueDidChange__block_invoke;
  block[3] = &unk_1E8EAFC60;
  block[4] = self;
  block[5] = &v7;
  block[6] = v11;
  dispatch_sync(accessQueue, block);
  if (-[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", v8[3]))
  {
    -[SBInteractiveScreenshotSettings normalizedDistanceForCommitThreshold](self->_settings, "normalizedDistanceForCommitThreshold");
    -[SBInteractiveScreenshotSettings disabledGestureCancellationDistance](self->_settings, "disabledGestureCancellationDistance");
    if ((BSFloatGreaterThanOrEqualToFloat() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "interactiveScreenshotGestureRootViewControllerRequestsGestureRecognizerCancellation:", self);

    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
}

__n128 __123__SBInteractiveScreenshotGestureRootViewController__cancellationCommitProgressAnimatablePropertyPresentationValueDidChange__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  __n128 result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 1248);
  v1 = *(_QWORD *)(a1[6] + 8);
  result = *(__n128 *)(a1[4] + 1288);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(a1[4] + 1272);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (CATransform3D)_contentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5
{
  double y;
  double x;
  double right;
  double bottom;
  double left;
  double top;
  __int128 v15;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CATransform3D *result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D v31;
  __int128 v32;
  __int128 v33;

  y = a6.y;
  x = a6.x;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v15 = *MEMORY[0x1E0C9D538];
  __asm { FMOV            V0.2D, #1.0 }
  v32 = _Q0;
  v33 = v15;
  -[SBInteractiveScreenshotGestureRootViewController _getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:](self, "_getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:", &v33, &v32, a4, top, left, bottom, right, x, y);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeTranslation(retstr, *(CGFloat *)&v33, *((CGFloat *)&v33 + 1), 0.0);
  v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v30.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v30.m33 = v21;
  v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v30.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v30.m43 = v22;
  v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v30.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v30.m13 = v23;
  v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v30.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v30.m23 = v24;
  result = CATransform3DScale(&v31, &v30, *(CGFloat *)&v32, *((CGFloat *)&v32 + 1), 1.0);
  v26 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&retstr->m33 = v26;
  v27 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&retstr->m43 = v27;
  v28 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&retstr->m13 = v28;
  v29 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&retstr->m23 = v29;
  return result;
}

- (CATransform3D)_inverseContentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5
{
  double y;
  double x;
  double right;
  double bottom;
  double left;
  double top;
  __int128 v15;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CATransform3D *result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D v31;
  __int128 v32;
  __int128 v33;

  y = a6.y;
  x = a6.x;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v15 = *MEMORY[0x1E0C9D538];
  __asm { FMOV            V0.2D, #1.0 }
  v32 = _Q0;
  v33 = v15;
  -[SBInteractiveScreenshotGestureRootViewController _getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:](self, "_getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:", &v33, &v32, a4, top, left, bottom, right, x, y);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeScale(retstr, 1.0 / *(double *)&v32, 1.0 / *((double *)&v32 + 1), 0.0);
  v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v30.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v30.m33 = v21;
  v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v30.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v30.m43 = v22;
  v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v30.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v30.m13 = v23;
  v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v30.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v30.m23 = v24;
  result = CATransform3DTranslate(&v31, &v30, -*(double *)&v33, -*((double *)&v33 + 1), 1.0);
  v26 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&retstr->m33 = v26;
  v27 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&retstr->m43 = v27;
  v28 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&retstr->m13 = v28;
  v29 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&retstr->m23 = v29;
  return result;
}

- (id)_createFlashViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 2;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0D8C0B8], "flashViewForStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setHitTestingDisabled:", 1);
  objc_msgSend(v8, "setClipsToBounds:", 1);
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  return v8;
}

- (id)_createMaterialViewWithFrame:(CGRect)a3 groupName:(id)a4 isCaptureOnly:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  SSChromePlaceholderViewController *chromePlaceholderViewController;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  chromePlaceholderViewController = self->_chromePlaceholderViewController;
  v11 = a4;
  if (-[SSChromePlaceholderViewController backgroundBlurEffectStyle](chromePlaceholderViewController, "backgroundBlurEffectStyle") == 2)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2030);
    objc_msgSend(v12, "setGroupName:", v11);

    if (v5)
    {
      v13 = objc_opt_class();
      objc_msgSend(v12, "effectView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setCaptureOnly:", 1);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D47498];
    _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "materialViewWithRecipeNamed:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setGroupName:", v11);
    if (v5)
      objc_msgSend(v12, "setCaptureOnly:", 1);
  }
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  return v12;
}

- (id)_createScreenshotImageViewWithFrame:(CGRect)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v3, "setContentMode:", 4);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinificationFilter:", *MEMORY[0x1E0CD2EF8]);

  return v3;
}

- (double)_currentCommitProgressVelocity
{
  double result;

  -[UIViewFloatAnimatableProperty velocity](self->_transformProgressAnimatableProperty, "velocity");
  return result;
}

- (void)_addGestureUpdateWithCommitProgress:(double)a3 timestamp:(double)a4
{
  NSMutableArray *gestureCommitProgressUpdates;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *gestureCommitProgressUpdateTimestamps;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  id v16;

  gestureCommitProgressUpdates = self->_gestureCommitProgressUpdates;
  if (gestureCommitProgressUpdates)
  {
    if (-[NSMutableArray count](gestureCommitProgressUpdates, "count") == 32)
      -[NSMutableArray removeObjectAtIndex:](self->_gestureCommitProgressUpdates, "removeObjectAtIndex:", -[NSMutableArray count](self->_gestureCommitProgressUpdates, "count") - 1);
  }
  else
  {
    v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v9 = self->_gestureCommitProgressUpdates;
    self->_gestureCommitProgressUpdates = v8;

  }
  gestureCommitProgressUpdateTimestamps = self->_gestureCommitProgressUpdateTimestamps;
  if (gestureCommitProgressUpdateTimestamps)
  {
    if (-[NSMutableArray count](gestureCommitProgressUpdateTimestamps, "count") == 32)
      -[NSMutableArray removeObjectAtIndex:](self->_gestureCommitProgressUpdateTimestamps, "removeObjectAtIndex:", -[NSMutableArray count](self->_gestureCommitProgressUpdateTimestamps, "count") - 1);
  }
  else
  {
    v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v12 = self->_gestureCommitProgressUpdateTimestamps;
    self->_gestureCommitProgressUpdateTimestamps = v11;

  }
  v13 = self->_gestureCommitProgressUpdates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v14, 0);

  v15 = self->_gestureCommitProgressUpdateTimestamps;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](v15, "insertObject:atIndex:", v16, 0);

}

- (double)_gestureCommitProgressUpdateVelocityOverTimeInterval:(double)a3
{
  unint64_t v5;
  unint64_t v6;
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
  void *v18;
  double v19;
  double v20;

  if (!-[NSMutableArray count](self->_gestureCommitProgressUpdates, "count"))
    return 0.0;
  v5 = 0;
  v6 = 0;
  v7 = 0.0;
  v8 = 0.0;
  do
  {
    if (v6 >= -[NSMutableArray count](self->_gestureCommitProgressUpdates, "count") - 1)
      break;
    -[NSMutableArray objectAtIndex:](self->_gestureCommitProgressUpdates, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    -[NSMutableArray objectAtIndex:](self->_gestureCommitProgressUpdateTimestamps, "objectAtIndex:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (!v6)
      v8 = v14;
    -[NSMutableArray objectAtIndex:](self->_gestureCommitProgressUpdates, "objectAtIndex:", ++v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    -[NSMutableArray objectAtIndex:](self->_gestureCommitProgressUpdateTimestamps, "objectAtIndex:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    if (v14 - v20 > 0.00000011920929)
    {
      v7 = v7 + (v11 - v17) / (v14 - v20);
      ++v5;
    }
  }
  while (v8 - v20 <= a3);
  if (v5)
    return v7 / (double)v5;
  else
    return 0.0;
}

- (void)_getContentTranslation:(CGPoint *)a3 scale:(CGPoint *)a4 forCommitProgress:(double)a5 contentInsets:(UIEdgeInsets)a6 additionalContentTranslation:(CGPoint)a7
{
  double right;
  double bottom;
  double left;
  double top;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  width = self->_queue_portraitBounds.size.width;
  height = self->_queue_portraitBounds.size.height;
  _UIWindowConvertRectFromOrientationToOrientation();
  v18 = v17 - (left + right);
  v20 = v19 - (top + bottom);
  UIRectGetCenter();
  v22 = v21;
  v24 = v23;
  UIRectGetCenter();
  if (a3)
  {
    a3->x = a7.x + (v22 - v25) * a5 + 0.0;
    a3->y = a7.y + (v24 - v26) * a5 + 0.0;
  }
  if (a4)
  {
    a4->x = (v18 / width + -1.0) * a5 + 1.0;
    a4->y = (v20 / height + -1.0) * a5 + 1.0;
  }
}

- (void)_getDistanceTraveled:(double *)a3 fullDistance:(double *)a4 commitProgress:(double *)a5 forTranslationFromCorner:(CGPoint)a6 bounds:(CGRect)a7
{
  double v11;
  double v12;
  uint64_t v13;

  v11 = sqrt(a6.y * a6.y + a6.x * a6.x);
  v12 = sqrt(a7.size.height * a7.size.height + a7.size.width * a7.size.width);
  -[SBInteractiveScreenshotSettings normalizedDistanceForCommitThreshold](self->_settings, "normalizedDistanceForCommitThreshold");
  -[SBInteractiveScreenshotSettings rubberbandingRange](self->_settings, "rubberbandingRange");
  BSUIConstrainValueToIntervalWithRubberBand();
  if (a3)
    *a3 = v11;
  if (a4)
    *a4 = v12;
  if (a5)
    *(_QWORD *)a5 = v13;
}

- (void)_prepareViewHierarchyForCommittedScreenshot:(BOOL)a3 gestureStyle:(int64_t)a4
{
  _BOOL4 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  UIViewFloatAnimatableProperty *cancellationCommitProgressAnimatableProperty;
  UIViewFloatAnimatableProperty *v18;
  UIViewFloatAnimatableProperty *v19;
  void *v20;
  void *v21;
  UIViewFloatAnimatableProperty *v22;
  UIScenePresentation *sourceScenePresentationView;
  UIScenePresenter *sourceScenePresenter;
  UIView *screenshotContainerView;
  void *v26;
  UIScenePresenter *v27;
  UIScenePresenter *v28;
  UIScenePresentation *v29;
  UIScenePresentation *v30;
  UIScenePresentation *v31;
  UIScenePresentation *v32;
  UIView *v33;
  UIView *v34;
  UIImageView *v35;
  UIImageView *screenshotImageView;
  SSFlashView **p_flashView;
  _SBInteractiveScreenshotGestureBackdropView *contentBackdropView;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id location;
  _QWORD v45[2];

  v5 = a3;
  v45[1] = *MEMORY[0x1E0C80C00];
  -[SBInteractiveScreenshotGestureRootViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", a4);
  cancellationCommitProgressAnimatableProperty = self->_cancellationCommitProgressAnimatableProperty;
  if (v16)
  {
    if (!cancellationCommitProgressAnimatableProperty)
    {
      v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
      v19 = self->_cancellationCommitProgressAnimatableProperty;
      self->_cancellationCommitProgressAnimatableProperty = v18;

      -[UIViewFloatAnimatableProperty setValue:](self->_cancellationCommitProgressAnimatableProperty, "setValue:", 0.0);
      objc_initWeak(&location, self);
      v20 = (void *)MEMORY[0x1E0CEABB0];
      v45[0] = self->_cancellationCommitProgressAnimatableProperty;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __109__SBInteractiveScreenshotGestureRootViewController__prepareViewHierarchyForCommittedScreenshot_gestureStyle___block_invoke;
      v42 = &unk_1E8E9DF28;
      objc_copyWeak(&v43, &location);
      objc_msgSend(v20, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v21, &v39);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[UIViewFloatAnimatableProperty invalidate](cancellationCommitProgressAnimatableProperty, "invalidate");
    v22 = self->_cancellationCommitProgressAnimatableProperty;
    self->_cancellationCommitProgressAnimatableProperty = 0;

  }
  if (v5)
  {
    -[UIScenePresentation removeFromSuperview](self->_sourceScenePresentationView, "removeFromSuperview");
    sourceScenePresentationView = self->_sourceScenePresentationView;
    self->_sourceScenePresentationView = 0;

    -[UIScenePresenter invalidate](self->_sourceScenePresenter, "invalidate");
    sourceScenePresenter = self->_sourceScenePresenter;
    self->_sourceScenePresenter = 0;

    screenshotContainerView = self->_screenshotContainerView;
    if (screenshotContainerView)
    {
      -[UIView sb_setBoundsAndPositionFromFrame:](screenshotContainerView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
    }
    else
    {
      v33 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v11, v13, v15);
      v34 = self->_screenshotContainerView;
      self->_screenshotContainerView = v33;

      -[UIView bounds](self->_screenshotContainerView, "bounds");
      -[SBInteractiveScreenshotGestureRootViewController _createScreenshotImageViewWithFrame:](self, "_createScreenshotImageViewWithFrame:");
      v35 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      screenshotImageView = self->_screenshotImageView;
      self->_screenshotImageView = v35;

      -[UIView addSubview:](self->_screenshotContainerView, "addSubview:", self->_screenshotImageView);
      objc_msgSend(v7, "insertSubview:atIndex:", self->_screenshotContainerView, 0);
    }
    -[UIView setHidden:](self->_screenshotContainerView, "setHidden:", 0, v39, v40, v41, v42);
    p_flashView = &self->_flashView;
    -[SSFlashView sb_setBoundsAndPositionFromFrame:](self->_flashView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  }
  else
  {
    if (!self->_sourceScenePresenter)
    {
      -[FBScene uiPresentationManager](self->_sourceScene, "uiPresentationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "createPresenterWithIdentifier:priority:", CFSTR("SBInteractiveScreenshotGestureRootViewController"), 5000);
      v27 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v28 = self->_sourceScenePresenter;
      self->_sourceScenePresenter = v27;

      -[UIScenePresenter activate](self->_sourceScenePresenter, "activate");
    }
    v29 = self->_sourceScenePresentationView;
    if (!v29)
    {
      -[UIScenePresenter presentationView](self->_sourceScenePresenter, "presentationView");
      v30 = (UIScenePresentation *)objc_claimAutoreleasedReturnValue();
      v31 = self->_sourceScenePresentationView;
      self->_sourceScenePresentationView = v30;

      v32 = self->_sourceScenePresentationView;
      if (v32)
      {
        objc_msgSend(v7, "insertSubview:atIndex:", v32, 0);
        v29 = self->_sourceScenePresentationView;
      }
      else
      {
        v29 = 0;
      }
    }
    -[UIScenePresentation bs_setHitTestingDisabled:](v29, "bs_setHitTestingDisabled:", -[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", a4, v39, v40, v41, v42) ^ 1);
    -[UIScenePresentation sb_setBoundsAndPositionFromFrame:](self->_sourceScenePresentationView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
    -[UIScenePresentation setHidden:](self->_sourceScenePresentationView, "setHidden:", 0);
    -[UIView setHidden:](self->_screenshotContainerView, "setHidden:", 1);
    -[SBInteractiveScreenshotGestureCropsView setLineGrabberAlpha:](self->_cropsView, "setLineGrabberAlpha:", 0.0);
    -[SBInteractiveScreenshotGestureCropsView setLineAlpha:](self->_cropsView, "setLineAlpha:", 0.0);
    p_flashView = &self->_flashView;
  }
  -[SSFlashView setHidden:](*p_flashView, "setHidden:", !v5);
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_materialView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  -[UIView setHidden:](self->_materialView, "setHidden:", 0);
  -[_SBInteractiveScreenshotGestureBackdropView sb_setBoundsAndPositionFromFrame:](self->_contentCapturingView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  -[_SBInteractiveScreenshotGestureBackdropView setHidden:](self->_contentCapturingView, "setHidden:", 0);
  -[BSUIOrientationTransformWrapperView sb_setBoundsAndPositionFromFrame:](self->_chromePlaceholderOrientationWrapperView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  -[BSUIOrientationTransformWrapperView setHidden:](self->_chromePlaceholderOrientationWrapperView, "setHidden:", -[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", a4));
  -[_SBInteractiveScreenshotGestureReplicatorView sb_setBoundsAndPositionFromFrame:](self->_replicatorView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  -[_SBInteractiveScreenshotGestureReplicatorView setHidden:](self->_replicatorView, "setHidden:", 0);
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_topContentContainerView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  -[UIView setHidden:](self->_topContentContainerView, "setHidden:", 0);
  contentBackdropView = self->_contentBackdropView;
  -[_SBInteractiveScreenshotGestureReplicatorView bounds](self->_replicatorView, "bounds");
  -[_SBInteractiveScreenshotGestureBackdropView sb_setBoundsAndPositionFromFrame:](contentBackdropView, "sb_setBoundsAndPositionFromFrame:");
  -[_SBInteractiveScreenshotGestureBackdropView setHidden:](self->_contentBackdropView, "setHidden:", 0);
  -[SBInteractiveScreenshotGestureCropsView setHidden:](self->_cropsView, "setHidden:", 0);

}

void __109__SBInteractiveScreenshotGestureRootViewController__prepareViewHierarchyForCommittedScreenshot_gestureStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancellationCommitProgressAnimatablePropertyPresentationValueDidChange");

}

- (void)_updateContentTransformUsingPresentationValues:(BOOL)a3
{
  _BOOL4 v3;
  UIViewFloatAnimatableProperty *transformProgressAnimatableProperty;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  NSObject *accessQueue;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  SBInteractiveScreenshotGestureCropsView *cropsView;
  void *v47;
  SBInteractiveScreenshotGestureCropsView *v48;
  void *v49;
  SBInteractiveScreenshotGestureCropsView *v50;
  void *v51;
  SSFlashView *flashView;
  void *v53;
  UIView *topContentContainerView;
  void *v55;
  UIImageView *screenshotImageView;
  void *v57;
  UIView *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  SSFlashView *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _SBInteractiveScreenshotGestureReplicatorView *replicatorView;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  float64x2_t v82;
  double v83;
  double v84;
  float64x2_t v85;
  _QWORD v86[4];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD block[17];
  _QWORD v96[4];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  double *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  double *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  float64x2_t *v138;
  uint64_t v139;
  void *v140;
  __int128 v141;
  __int128 v142;

  v3 = a3;
  transformProgressAnimatableProperty = self->_transformProgressAnimatableProperty;
  if (a3)
  {
    -[UIViewFloatAnimatableProperty presentationValue](transformProgressAnimatableProperty, "presentationValue");
    v7 = v6;
    -[UIViewFloatAnimatableProperty presentationValue](self->_translationXAnimatableProperty, "presentationValue");
    v9 = v8;
    -[UIViewFloatAnimatableProperty presentationValue](self->_translationYAnimatableProperty, "presentationValue");
    v11 = v10;
    -[UIViewFloatAnimatableProperty presentationValue](self->_cropsProgressSeparatedValuesAnimatableProperty, "presentationValue");
  }
  else
  {
    -[UIViewFloatAnimatableProperty value](transformProgressAnimatableProperty, "value");
    v7 = v13;
    -[UIViewFloatAnimatableProperty value](self->_translationXAnimatableProperty, "value");
    v9 = v14;
    -[UIViewFloatAnimatableProperty value](self->_translationYAnimatableProperty, "value");
    v11 = v15;
    -[UIViewFloatAnimatableProperty value](self->_cropsProgressSeparatedValuesAnimatableProperty, "value");
  }
  v137 = 0;
  v138 = (float64x2_t *)&v137;
  v139 = 0x4010000000;
  v140 = &unk_1D0FA064E;
  v16 = (double *)MEMORY[0x1E0C9D648];
  v17 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v141 = *MEMORY[0x1E0C9D648];
  v142 = v17;
  v133 = 0;
  v134 = (double *)&v133;
  v135 = 0x2020000000;
  v136 = 0;
  v129 = 0;
  v130 = (double *)&v129;
  v131 = 0x2020000000;
  v132 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0xA010000000;
  v120 = &unk_1D0FA064E;
  v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v125 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v126 = v18;
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v127 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v128 = v19;
  v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v121 = *MEMORY[0x1E0CD2610];
  v122 = v20;
  v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v123 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v124 = v21;
  v105 = 0;
  v106 = &v105;
  v107 = 0xA010000000;
  v108 = &unk_1D0FA064E;
  v113 = v125;
  v114 = v18;
  v115 = v127;
  v116 = v19;
  v109 = v121;
  v110 = v20;
  v111 = v123;
  v112 = v21;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0xA010000000;
  v96[3] = &unk_1D0FA064E;
  v101 = v125;
  v102 = v18;
  v103 = v127;
  v104 = v19;
  v97 = v121;
  v98 = v20;
  accessQueue = self->_accessQueue;
  v99 = v123;
  v100 = v21;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__SBInteractiveScreenshotGestureRootViewController__updateContentTransformUsingPresentationValues___block_invoke;
  block[3] = &unk_1E8EAFD28;
  block[4] = self;
  block[5] = &v117;
  block[11] = v7;
  *(double *)&block[12] = v9;
  block[6] = &v105;
  block[7] = v96;
  *(double *)&block[13] = v11;
  *(double *)&block[14] = v12;
  *(double *)&block[15] = v9 * v12;
  *(double *)&block[16] = v11 * v12;
  block[8] = &v137;
  block[9] = &v129;
  block[10] = &v133;
  dispatch_sync(accessQueue, block);
  BSRectWithSize();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  __asm { FMOV            V1.2D, #0.5 }
  v82 = vmlaq_f64(v138[2], _Q1, v138[3]);
  if (v3)
  {
    v36 = *((_OWORD *)v118 + 7);
    v91 = *((_OWORD *)v118 + 6);
    v92 = v36;
    v37 = *((_OWORD *)v118 + 9);
    v93 = *((_OWORD *)v118 + 8);
    v94 = v37;
    v38 = *((_OWORD *)v118 + 3);
    v87 = *((_OWORD *)v118 + 2);
    v88 = v38;
    v39 = *((_OWORD *)v118 + 5);
    v89 = *((_OWORD *)v118 + 4);
    v90 = v39;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v87);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setPresentationValue:forKey:](self->_topContentContainerView, "_setPresentationValue:forKey:", v40, CFSTR("transform"));
    -[_SBInteractiveScreenshotGestureReplicatorView _setPresentationValue:forKey:](self->_replicatorView, "_setPresentationValue:forKey:", v40, CFSTR("instanceTransform"));
    -[SSFlashView _setPresentationValue:forKey:](self->_flashView, "_setPresentationValue:forKey:", v40, CFSTR("transform"));
    v41 = *((_OWORD *)v106 + 7);
    v91 = *((_OWORD *)v106 + 6);
    v92 = v41;
    v42 = *((_OWORD *)v106 + 9);
    v93 = *((_OWORD *)v106 + 8);
    v94 = v42;
    v43 = *((_OWORD *)v106 + 3);
    v87 = *((_OWORD *)v106 + 2);
    v88 = v43;
    v44 = *((_OWORD *)v106 + 5);
    v89 = *((_OWORD *)v106 + 4);
    v90 = v44;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v87);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBInteractiveScreenshotGestureReplicatorView _setPresentationValue:forKey:](self->_replicatorView, "_setPresentationValue:forKey:", v45, CFSTR("transform"));
    cropsView = self->_cropsView;
    *(double *)v86 = v24;
    *(double *)&v86[1] = v26;
    *(double *)&v86[2] = v28;
    *(double *)&v86[3] = v30;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v86, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInteractiveScreenshotGestureCropsView _setPresentationValue:forKey:](cropsView, "_setPresentationValue:forKey:", v47, CFSTR("bounds"));

    v48 = self->_cropsView;
    v85 = v82;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v85, "{CGPoint=dd}");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInteractiveScreenshotGestureCropsView _setPresentationValue:forKey:](v48, "_setPresentationValue:forKey:", v49, CFSTR("position"));

    v50 = self->_cropsView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v130[3]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInteractiveScreenshotGestureCropsView _setPresentationValue:forKey:](v50, "_setPresentationValue:forKey:", v51, CFSTR("cornerAlpha"));

    flashView = self->_flashView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v134[3]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFlashView _setPresentationValue:forKey:](flashView, "_setPresentationValue:forKey:", v53, CFSTR("cornerRadius"));

    topContentContainerView = self->_topContentContainerView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v134[3]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setPresentationValue:forKey:](topContentContainerView, "_setPresentationValue:forKey:", v55, CFSTR("cornerRadius"));

    screenshotImageView = self->_screenshotImageView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v134[3]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView _setPresentationValue:forKey:](screenshotImageView, "_setPresentationValue:forKey:", v57, CFSTR("cornerRadius"));

  }
  else
  {
    v58 = self->_topContentContainerView;
    v59 = *((_OWORD *)v118 + 7);
    v91 = *((_OWORD *)v118 + 6);
    v92 = v59;
    v60 = *((_OWORD *)v118 + 9);
    v93 = *((_OWORD *)v118 + 8);
    v94 = v60;
    v61 = *((_OWORD *)v118 + 3);
    v87 = *((_OWORD *)v118 + 2);
    v88 = v61;
    v62 = *((_OWORD *)v118 + 5);
    v89 = *((_OWORD *)v118 + 4);
    v90 = v62;
    -[UIView setTransform3D:](v58, "setTransform3D:", &v87);
    -[_SBInteractiveScreenshotGestureReplicatorView replicatorLayer](self->_replicatorView, "replicatorLayer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *((_OWORD *)v118 + 7);
    v91 = *((_OWORD *)v118 + 6);
    v92 = v64;
    v65 = *((_OWORD *)v118 + 9);
    v93 = *((_OWORD *)v118 + 8);
    v94 = v65;
    v66 = *((_OWORD *)v118 + 3);
    v87 = *((_OWORD *)v118 + 2);
    v88 = v66;
    v67 = *((_OWORD *)v118 + 5);
    v89 = *((_OWORD *)v118 + 4);
    v90 = v67;
    objc_msgSend(v63, "setInstanceTransform:", &v87);

    v68 = self->_flashView;
    v69 = *((_OWORD *)v118 + 7);
    v91 = *((_OWORD *)v118 + 6);
    v92 = v69;
    v70 = *((_OWORD *)v118 + 9);
    v93 = *((_OWORD *)v118 + 8);
    v94 = v70;
    v71 = *((_OWORD *)v118 + 3);
    v87 = *((_OWORD *)v118 + 2);
    v88 = v71;
    v72 = *((_OWORD *)v118 + 5);
    v89 = *((_OWORD *)v118 + 4);
    v90 = v72;
    -[SSFlashView setTransform3D:](v68, "setTransform3D:", &v87);
    replicatorView = self->_replicatorView;
    v74 = *((_OWORD *)v106 + 7);
    v91 = *((_OWORD *)v106 + 6);
    v92 = v74;
    v75 = *((_OWORD *)v106 + 9);
    v93 = *((_OWORD *)v106 + 8);
    v94 = v75;
    v76 = *((_OWORD *)v106 + 3);
    v87 = *((_OWORD *)v106 + 2);
    v88 = v76;
    v77 = *((_OWORD *)v106 + 5);
    v89 = *((_OWORD *)v106 + 4);
    v90 = v77;
    -[_SBInteractiveScreenshotGestureReplicatorView setTransform3D:](replicatorView, "setTransform3D:", &v87);
    -[SSFlashView layer](self->_flashView, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setCornerRadius:", v134[3]);

    -[UIView layer](self->_topContentContainerView, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setCornerRadius:", v134[3]);

    -[UIImageView layer](self->_screenshotImageView, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setCornerRadius:", v134[3]);

    -[SBInteractiveScreenshotGestureCropsView bounds](self->_cropsView, "bounds");
    if (BSRectEqualToRect())
      -[SBInteractiveScreenshotGestureCropsView setBounds:](self->_cropsView, "setBounds:", *v16, v16[1], v16[2], v16[3]);
    -[SBInteractiveScreenshotGestureCropsView setBounds:](self->_cropsView, "setBounds:", v24, v26, v28, v30, *(_OWORD *)&v82);
    -[SBInteractiveScreenshotGestureCropsView center](self->_cropsView, "center");
    if (BSPointEqualToPoint())
      -[SBInteractiveScreenshotGestureCropsView setCenter:](self->_cropsView, "setCenter:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[SBInteractiveScreenshotGestureCropsView setCenter:](self->_cropsView, "setCenter:", v83, v84);
    -[SBInteractiveScreenshotGestureCropsView cornerAlpha](self->_cropsView, "cornerAlpha");
    if (BSFloatEqualToFloat())
    {
      v81 = v130[3] + -0.1;
      if (v81 < -0.00000011920929)
        v81 = v81 + 1.0;
      -[SBInteractiveScreenshotGestureCropsView setCornerAlpha:](self->_cropsView, "setCornerAlpha:", v81);
    }
    -[SBInteractiveScreenshotGestureCropsView setCornerAlpha:](self->_cropsView, "setCornerAlpha:", v130[3]);
  }
  _Block_object_dispose(v96, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v137, 8);
}

double __99__SBInteractiveScreenshotGestureRootViewController__updateContentTransformUsingPresentationValues___block_invoke(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  _OWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double result;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _OWORD v55[40];
  CGRect v56;

  v2 = *(double **)(a1 + 32);
  v3 = v2[160];
  v4 = v2[162];
  v50 = v2[161];
  v51 = v2[159];
  v53 = v2[152];
  v54 = v2[154];
  v52 = v2[153];
  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  objc_msgSend(v2, "_contentTransformForCommitProgress:contentInsets:additionalContentTranslation:", *(double *)(a1 + 88), *MEMORY[0x1E0CEB4B0], v6, v7, v8, *(double *)(a1 + 96), *(double *)(a1 + 104));
  v9 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v11 = v55[34];
  v10 = v55[35];
  v12 = v55[33];
  v9[2] = v55[32];
  v9[3] = v12;
  v14 = v55[38];
  v13 = v55[39];
  v15 = v55[37];
  v9[6] = v55[36];
  v9[7] = v15;
  v9[8] = v14;
  v9[9] = v13;
  v9[4] = v11;
  v9[5] = v10;
  v16 = *(void **)(a1 + 32);
  v17 = *(double *)(a1 + 88);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v16, "_inverseContentTransformForCommitProgress:contentInsets:additionalContentTranslation:", v17, v18, v19, v20, v21, *(double *)(a1 + 96), *(double *)(a1 + 104));
  v22 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v24 = v55[26];
  v23 = v55[27];
  v25 = v55[25];
  v22[2] = v55[24];
  v22[3] = v25;
  v27 = v55[30];
  v26 = v55[31];
  v28 = v55[29];
  v22[6] = v55[28];
  v22[7] = v28;
  v22[8] = v27;
  v22[9] = v26;
  v22[4] = v24;
  v22[5] = v23;
  objc_msgSend(*(id *)(a1 + 32), "_contentTransformForCommitProgress:contentInsets:additionalContentTranslation:", *(double *)(a1 + 112) * *(double *)(a1 + 88), v5, v6, v7, v8, *(double *)(a1 + 120), *(double *)(a1 + 128));
  v29 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v31 = v55[18];
  v30 = v55[19];
  v32 = v55[17];
  v29[2] = v55[16];
  v29[3] = v32;
  v34 = v55[22];
  v33 = v55[23];
  v35 = v55[21];
  v29[6] = v55[20];
  v29[7] = v35;
  v29[8] = v34;
  v29[9] = v33;
  v29[4] = v31;
  v29[5] = v30;
  v36 = *(void **)(a1 + 32);
  UIRectGetCenter();
  if (v36)
  {
    v39 = v38;
    v40 = *(_OWORD **)(*(_QWORD *)(a1 + 56) + 8);
    v41 = v40[7];
    v55[4] = v40[6];
    v55[5] = v41;
    v42 = v40[9];
    v55[6] = v40[8];
    v55[7] = v42;
    v43 = v40[3];
    v55[0] = v40[2];
    v55[1] = v43;
    v44 = v40[5];
    v55[2] = v40[4];
    v55[3] = v44;
    objc_msgSend(v36, "_anchoredTransformForAnchorPoint:bounds:center:transform:", v55, 0.5, 0.5, v51, v3, v50, v4, v37, v39);
  }
  else
  {
    memset(&v55[8], 0, 128);
  }
  CA_CGRectApplyTransform();
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = CGRectInset(v56, -(v53 + v52), -(v53 + v52));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "cropCornersVisibleProgressThreshold");
  v46 = *(double *)(a1 + 112);
  if (v45 >= v46)
    v46 = v45;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (fmin(v46, 1.0) - v45) / (1.0 - v45) + 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "cornerRadiusVisibleProgressThreshold");
  v48 = *(double *)(a1 + 112);
  if (v47 >= v48)
    v48 = v47;
  result = v54 + (0.0 - v54) * (fmin(v48, 1.0) - v47) / (1.0 - v47);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (void)_injectCommitProgressVelocity:(double)a3
{
  -[UIViewFloatAnimatableProperty setVelocity:](self->_transformProgressAnimatableProperty, "setVelocity:", a3);
}

- (BOOL)_isGestureStyleDisabled:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)_isGestureStyleReducedMotion:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_updateCropLinesMultiPartAnimationForCropsProgress
{
  double v3;
  double v4;
  double v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIViewFloatAnimatableProperty presentationValue](self->_cropsProgressPresentationValueAnimatableProperty, "presentationValue");
  v4 = v3;
  -[SBInteractiveScreenshotSettings cropLinesVisibleProgressThreshold](self->_settings, "cropLinesVisibleProgressThreshold");
  if (v4 >= v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_cropLinesAlphaMultiPartAnimations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "completeAnimationWithIdentifier:finished:retargeted:", CFSTR("cropsProgressThreshold"), 1, 0, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateWithUpdateMode:(int64_t)a3 commitProgress:(double)a4 additionalContentTranslation:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  SBInteractiveScreenshotSettings *settings;
  id v12;
  id v13;

  y = a5.y;
  x = a5.x;
  settings = self->_settings;
  v12 = a6;
  -[SBInteractiveScreenshotSettings contentAnimationSettings](settings, "contentAnimationSettings");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:", a3, v13, v12, a4, x, y);

}

- (void)_updateWithUpdateMode:(int64_t)a3 contentAnimationSettings:(id)a4 commitProgress:(double)a5 additionalContentTranslation:(CGPoint)a6 completion:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  UIViewFloatAnimatableProperty *v18;
  UIViewFloatAnimatableProperty *cropsTrackingDiscreteAnimationProgressAnimatableProperty;
  UIViewFloatAnimatableProperty *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  SBInteractiveScreenshotGestureRootViewController *v27;
  int64_t v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[5];
  id from;
  id location[2];

  y = a6.y;
  x = a6.x;
  v13 = a4;
  v14 = a7;
  v15 = BSFloatGreaterThanOrEqualToFloat();
  v16 = v15;
  v17 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    if (!self->_hasCrossedCommitThreshold && !self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty)
    {
      v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
      cropsTrackingDiscreteAnimationProgressAnimatableProperty = self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty;
      self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty = v18;

      -[UIViewFloatAnimatableProperty setValue:](self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty, "setValue:", 0.0);
      objc_initWeak(location, self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty);
      objc_initWeak(&from, self);
      v23 = (void *)MEMORY[0x1E0CEABB0];
      -[SBInteractiveScreenshotSettings cropsAnimationSettings](self->_settings, "cropsAnimationSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v17;
      v35[1] = 3221225472;
      v35[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke;
      v35[3] = &unk_1E8E9DED8;
      v35[4] = self;
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_2;
      v32[3] = &unk_1E8EAFD50;
      objc_copyWeak(&v33, &from);
      objc_copyWeak(&v34, location);
      objc_msgSend(v23, "sb_animateWithSettings:mode:animations:completion:", v24, 3, v35, v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
  }
  else if (self->_hasCrossedCommitThreshold)
  {
    -[UIViewFloatAnimatableProperty invalidate](self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty, "invalidate");
    v20 = self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty;
    self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty = 0;

  }
  self->_hasCrossedCommitThreshold = v16;
  v21 = (void *)MEMORY[0x1E0DA9D48];
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_3;
  v25[3] = &unk_1E8EAFD78;
  v27 = self;
  v28 = a3;
  v26 = v13;
  v29 = a5;
  v30 = x;
  v31 = y;
  v22 = v13;
  objc_msgSend(v21, "perform:finalCompletion:", v25, v14);

}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setValue:", 1.0);
}

void __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (id)WeakRetained[134] == v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = (void *)WeakRetained[134];
    WeakRetained[134] = 0;

  }
}

void __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  _QWORD *v9;
  void *v10;
  id v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[6];
  __int128 v32;

  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_4;
  v31[3] = &unk_1E8EAD3C0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v31[4] = *(_QWORD *)(a1 + 40);
  v31[5] = *(_QWORD *)(a1 + 56);
  v32 = *(_OWORD *)(a1 + 64);
  v8 = (void (*)(void))a2[2];
  v9 = a2;
  v8();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v6, v7, v31, v10);

  v11 = *(id *)(*(_QWORD *)(a1 + 40) + 1184);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "cropsAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  v14 = 0.0;
  if (v13)
  {
    objc_msgSend(v13, "presentationValue");
    v14 = fmin(fmax(v15, 0.0), 1.0);
  }
  objc_msgSend(*(id *)(a1 + 32), "trackingResponse");
  v17 = v16;
  objc_msgSend(v12, "response");
  v19 = v14 * (v17 - v18);
  objc_msgSend(v12, "response");
  objc_msgSend(v11, "setTrackingResponse:", v20 + v19);
  objc_msgSend(*(id *)(a1 + 32), "trackingDampingRatio");
  v22 = v21;
  objc_msgSend(v12, "dampingRatio");
  v24 = v14 * (v22 - v23);
  objc_msgSend(v12, "dampingRatio");
  objc_msgSend(v11, "setTrackingDampingRatio:", v25 + v24);
  if (BSFloatGreaterThanOrEqualToFloat())
    v26 = 1.0;
  else
    v26 = 0.0;
  v27 = (void *)MEMORY[0x1E0CEABB0];
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_5;
  v30[3] = &unk_1E8E9DE88;
  v28 = *(_QWORD *)(a1 + 48);
  v30[4] = *(_QWORD *)(a1 + 40);
  *(double *)&v30[5] = v26;
  ((void (*)(id, const __CFString *))a2[2])(v9, CFSTR("crops"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "sb_animateWithSettings:mode:animations:completion:", v11, v28, v30, v29);
}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setValue:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setValue:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "setValue:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setValue:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setContentAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setValue:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setValue:", *(double *)(a1 + 40));
}

- (SBInteractiveScreenshotGestureRootViewControllerDelegate)delegate
{
  return (SBInteractiveScreenshotGestureRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_gestureCommitProgressUpdateTimestamps, 0);
  objc_storeStrong((id *)&self->_gestureCommitProgressUpdates, 0);
  objc_storeStrong((id *)&self->_trackingCropsAnimationSettings, 0);
  objc_storeStrong((id *)&self->_topContentContainerView, 0);
  objc_storeStrong((id *)&self->_sourceScenePresenter, 0);
  objc_storeStrong((id *)&self->_sourceScenePresentationView, 0);
  objc_storeStrong((id *)&self->_sourceScene, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_screenshotContainerView, 0);
  objc_storeStrong((id *)&self->_screenshotImageView, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_translationYAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_translationXAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_transformProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsProgressSeparatedValuesAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsProgressPresentationValueAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropLinesAlphaMultiPartAnimations, 0);
  objc_storeStrong((id *)&self->_cancellationCommitProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_cropsView, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderStatusBar, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderOrientationWrapperView, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_contentCapturingView, 0);
}

@end
