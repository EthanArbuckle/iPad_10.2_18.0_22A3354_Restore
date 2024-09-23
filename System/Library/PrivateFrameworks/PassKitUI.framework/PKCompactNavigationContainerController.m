@implementation PKCompactNavigationContainerController

+ (id)dimmingColor
{
  void *v2;
  int IsAvailable;
  double v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  IsAvailable = PKUserIntentIsAvailable();
  v4 = 0.75;
  if (!IsAvailable)
    v4 = 0.4;
  return (id)objc_msgSend(v2, "colorWithWhite:alpha:", 0.0, v4);
}

- (PKCompactNavigationContainerController)init
{
  return -[PKCompactNavigationContainerController initWithNavigationController:](self, "initWithNavigationController:", 0);
}

- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3
{
  id v4;
  PKCompactNavigationContainerController *v5;

  v4 = a3;
  v5 = -[PKCompactNavigationContainerController initWithNavigationController:style:](self, "initWithNavigationController:style:", v4, objc_msgSend(v4, "style"));

  return v5;
}

- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3 style:(unint64_t)a4
{
  PKCompactNavigationContainedNavigationController *v6;
  PKCompactNavigationContainerController *v7;
  PKCompactNavigationContainerController *v8;
  uint64_t v9;
  BOOL v10;
  PKCompactNavigationContainedNavigationController *v11;
  id *p_containedNavigationController;
  PKCompactNavigationContainedNavigationWrapperViewController *v13;
  PKCompactNavigationContainedNavigationWrapperViewController *presentationContextVC;
  CGPoint v15;
  CGSize v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = (PKCompactNavigationContainedNavigationController *)a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCompactNavigationContainerController;
  v7 = -[PKCompactNavigationContainerController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_style = a4;
    v9 = -[PKCompactNavigationContainerController preferredUserInterfaceStyle](v7, "preferredUserInterfaceStyle");
    -[PKCompactNavigationContainerController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 4);
    -[PKCompactNavigationContainerController setTransitioningDelegate:](v8, "setTransitioningDelegate:", v8);
    if (v8->_style)
      v10 = 0;
    else
      v10 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v8, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v8->_centeredCard = v10;
    v11 = v6;
    if (!v6)
      v11 = -[PKCompactNavigationContainedNavigationController initWithStyle:]([PKCompactNavigationContainedNavigationController alloc], "initWithStyle:", a4);
    p_containedNavigationController = (id *)&v8->_containedNavigationController;
    objc_storeStrong((id *)&v8->_containedNavigationController, v11);
    if (!v6)

    objc_msgSend(*p_containedNavigationController, "addContentContainerObserver:", v8);
    objc_msgSend(*p_containedNavigationController, "setDelegate:", v8);
    v13 = -[PKCompactNavigationContainedNavigationWrapperViewController initWithWrappedViewController:parentViewController:]([PKCompactNavigationContainedNavigationWrapperViewController alloc], "initWithWrappedViewController:parentViewController:", *p_containedNavigationController, v8);
    presentationContextVC = v8->_presentationContextVC;
    v8->_presentationContextVC = v13;

    -[PKCompactNavigationContainedNavigationWrapperViewController setUseParentSafeAreaInsets:](v8->_presentationContextVC, "setUseParentSafeAreaInsets:", !v8->_centeredCard);
    -[PKCompactNavigationContainedNavigationWrapperViewController setDefinesPresentationContext:](v8->_presentationContextVC, "setDefinesPresentationContext:", objc_msgSend(*p_containedNavigationController, "definesPresentationContext"));
    objc_msgSend(*p_containedNavigationController, "setDefinesPresentationContext:", 0);
    -[PKCompactNavigationContainerController addChildViewController:](v8, "addChildViewController:", v8->_presentationContextVC);
    -[PKCompactNavigationContainedNavigationWrapperViewController didMoveToParentViewController:](v8->_presentationContextVC, "didMoveToParentViewController:", v8);
    -[PKCompactNavigationContainerController setNeedsStatusBarAppearanceUpdate](v8, "setNeedsStatusBarAppearanceUpdate");
    if (v9 != -[PKCompactNavigationContainerController preferredUserInterfaceStyle](v8, "preferredUserInterfaceStyle"))
      -[PKCompactNavigationContainerController setNeedsUserInterfaceAppearanceUpdate](v8, "setNeedsUserInterfaceAppearanceUpdate");
    -[PKCompactNavigationContainerController setNeedsUpdateOfHomeIndicatorAutoHidden](v8, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    -[PKCompactNavigationContainerController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](v8, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
    -[PKCompactNavigationContainerController setNeedsWhitePointAdaptivityStyleUpdate](v8, "setNeedsWhitePointAdaptivityStyleUpdate");
    v15 = (CGPoint)*MEMORY[0x1E0C9D628];
    v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v8->_exclusionRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v8->_exclusionRect.size = v16;
    v8->_lastKeyboardFrame.origin = v15;
    v8->_lastKeyboardFrame.size = v16;
    v8->_keyboardFrame.origin = v15;
    v8->_keyboardFrame.size = v16;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v8->_centeredCard)
    {
      objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FB8], 0);
      objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FA8], 0);
      objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FB0], 0);
    }

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeWindowObserver:", self);

  -[PKCompactNavigationContainedNavigationController removeContentContainerObserver:](self->_containedNavigationController, "removeContentContainerObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  unint64_t v3;
  double *v4;
  double *v5;
  PKView *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  UIView *v10;
  UIView *maskingContainerView;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __n128 v16;
  void (**v17)(_QWORD, _QWORD, __n128);
  unint64_t style;
  double v19;
  BOOL v20;
  __n128 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, double);
  void *v28;
  id v29;
  PKCompactNavigationContainerController *v30;

  v3 = PKUIGetMinScreenType();
  v4 = (double *)((char *)&unk_19DF173E0 + 8 * v3);
  v5 = (double *)((char *)&unk_19DF17470 + 8 * v3);
  if (v3 >= 0x12)
  {
    v5 = (double *)(MEMORY[0x1E0C9D820] + 8);
    v4 = (double *)MEMORY[0x1E0C9D820];
  }
  v6 = -[PKView initWithFrame:]([PKView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *v4, *v5);
  -[PKCompactNavigationContainerController setView:](self, "setView:", v6);
  -[PKView setAutoresizesSubviews:](v6, "setAutoresizesSubviews:", 0);
  -[PKView setOpaque:](v6, "setOpaque:", 0);
  -[PKCompactNavigationContainerController _backgroundColor](self, "_backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[PKView addWindowObserver:](v6, "addWindowObserver:", self);
  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapGestureRecognized_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[PKView addGestureRecognizer:](v6, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  maskingContainerView = self->_maskingContainerView;
  self->_maskingContainerView = v10;

  -[UIView setAutoresizesSubviews:](self->_maskingContainerView, "setAutoresizesSubviews:", 0);
  -[PKView addSubview:](v6, "addSubview:", self->_maskingContainerView);
  -[PKCompactNavigationContainedNavigationWrapperViewController view](self->_presentationContextVC, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoresizesSubviews:", 0);
  -[UIView addSubview:](self->_maskingContainerView, "addSubview:", v12);
  -[UIView layer](self->_maskingContainerView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __50__PKCompactNavigationContainerController_loadView__block_invoke;
  v28 = &unk_1E3E75208;
  v29 = v13;
  v30 = self;
  v14 = v13;
  v15 = _Block_copy(&v25);
  v17 = (void (**)(_QWORD, _QWORD, __n128))v15;
  style = self->_style;
  v19 = 0.0;
  if (style == 2)
  {
    v16.n128_u64[0] = 10.0;
    (*((void (**)(void *, uint64_t, __n128))v15 + 2))(v15, 3, v16);
  }
  else if (style == 1)
  {
    MGGetFloat32Answer();
    v20 = v21.n128_f32[0] <= 0.0;
    v21.n128_u64[0] = 12.0;
    if (!v20)
      v21.n128_f64[0] = 30.0;
    v17[2](v17, 15, v21);
  }
  else if (!style
         && -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts", v25, v26, v27, v28, v29, v30))
  {
    ((void (*)(void (**)(_QWORD, _QWORD, __n128), uint64_t, double))v17[2])(v17, 15, 12.0);
    v19 = 0.5;
  }
  -[PKCompactNavigationContainedNavigationController view](self->_containedNavigationController, "view", v25, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAutoresizingMask:", 0);
  objc_msgSend(v12, "addSubview:", v22);
  objc_msgSend(v14, "setAnchorPoint:", 0.5, v19);
  objc_msgSend(v12, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAnchorPoint:", 0.5, v19);

  objc_msgSend(v22, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAnchorPoint:", 0.5, v19);

}

uint64_t __50__PKCompactNavigationContainerController_loadView__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMasksToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", a3);
  result = objc_msgSend(*(id *)(a1 + 32), "setMaskedCorners:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 984) = 1;
  return result;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKCompactNavigationContainerController _updateStatusBarFrame](self, "_updateStatusBarFrame");
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCGRect(self->_statusBarFrame);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "compact navigation container loaded with status bar frame %@", buf, 0xCu);

  }
  -[PKCompactNavigationContainerController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompactNavigationContainerController _backgroundColor](self, "_backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  if (!self->_topVC && !self->_pendingTopVC)
  {
    -[PKCompactNavigationContainedNavigationController topViewController](self->_containedNavigationController, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PKCompactNavigationContainerController _updateTopViewController:animated:](self, "_updateTopViewController:animated:", v7, 0);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PKCompactNavigationContainerController _updateStatusBarFrame](self, "_updateStatusBarFrame");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  -[PKCompactNavigationContainerController _updateForKeyboardIfNecessary](self, "_updateForKeyboardIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_visibility = 2;
  -[PKCompactNavigationContainerController _updateForKeyboardIfNecessary](self, "_updateForKeyboardIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
  -[PKCompactNavigationContainerController _updateForKeyboardIfNecessary](self, "_updateForKeyboardIfNecessary");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_visibility = 0;
  -[PKCompactNavigationContainerController _updateForKeyboardIfNecessary](self, "_updateForKeyboardIfNecessary");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGSize size;
  void *v28;
  __int128 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  CGFloat v57;
  _QWORD v58[4];
  id v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _QWORD v68[5];
  _OWORD v69[2];
  CGRect slice;
  CGRect remainder;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v72.receiver = self;
  v72.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillLayoutSubviews](&v72, sel_viewWillLayoutSubviews);
  -[PKCompactNavigationContainerController _beginLayoutGroup](self, "_beginLayoutGroup");
  ++self->_contentSizeUpdateDeferralCounter;
  -[PKCompactNavigationContainerController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v57 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v12 = v11;
  if (PKViewVisibilityStateIsVisible())
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      objc_msgSend(v3, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        x = v19;
        y = v20;
        width = v21;
        height = v22;
      }

    }
  }
  else
  {
    x = self->_lastKeyboardFrame.origin.x;
    y = self->_lastKeyboardFrame.origin.y;
    width = self->_lastKeyboardFrame.size.width;
    height = self->_lastKeyboardFrame.size.height;
  }
  self->_lastKeyboardFrame.origin.x = x;
  self->_lastKeyboardFrame.origin.y = y;
  self->_lastKeyboardFrame.size.width = width;
  self->_lastKeyboardFrame.size.height = height;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v57;
  if (self->_centeredCard)
  {
    objc_msgSend(MEMORY[0x1E0DC3A40], "defaultFormSheetSize");
    PKSizeAlignedInRect();
    self->_maximumModalPresentationFrame.origin.x = v23;
    self->_maximumModalPresentationFrame.origin.y = v24;
    self->_maximumModalPresentationFrame.size.width = v25;
    self->_maximumModalPresentationFrame.size.height = v26;
  }
  else
  {
    v73.origin.x = v5;
    v73.origin.y = v7;
    v73.size.width = v9;
    v73.size.height = v57;
    CGRectDivide(v73, &slice, &remainder, fmax(v12, self->_statusBarFrame.size.height), CGRectMinYEdge);
    size = remainder.size;
    self->_maximumModalPresentationFrame.origin = remainder.origin;
    self->_maximumModalPresentationFrame.size = size;
  }
  -[PKCompactNavigationContainedNavigationWrapperViewController view](self->_presentationContextVC, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  v69[0] = self->_topVCInfo.preferredContentSize;
  v69[1] = v29;
  -[PKCompactNavigationContainerController _targetNavigationControllerFrameForInfo:](self, "_targetNavigationControllerFrameForInfo:", v69);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[UIView setFrame:](self->_maskingContainerView, "setFrame:");
  -[UIView bounds](self->_maskingContainerView, "bounds");
  objc_msgSend(v28, "setFrame:");
  objc_msgSend(v28, "convertRect:fromView:", v3, v31, v33, v35, v37);
  if (self->_topVCIsExpectedClass)
  {
    -[UIViewController setTargetNavigationHeight:](self->_topVC, "setTargetNavigationHeight:", v37);
    if (self->_topVCIsInInitialLayout)
    {
      self->_topVCIsInInitialLayout = 1;
    }
    else
    {
      v38 = -[UIViewController needsInitialLayout](self->_topVC, "needsInitialLayout");
      self->_topVCIsInInitialLayout = v38;
      if ((v38 & 1) == 0)
        goto LABEL_15;
    }
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke;
    v68[3] = &unk_1E3E612E8;
    v68[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v68);
  }
LABEL_15:
  -[PKCompactNavigationContainedNavigationController view](self->_containedNavigationController, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  PKSizeAlignedInRect();
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v74.origin.x = v41;
  v74.origin.y = v43;
  v74.size.width = v45;
  v74.size.height = v47;
  v75.origin.x = v49;
  v75.origin.y = v51;
  v75.size.width = v53;
  v75.size.height = v55;
  if (!CGRectEqualToRect(v74, v75))
  {
    if (!self->_presentingNavigationController
      || v45 == *MEMORY[0x1E0C9D820] && v47 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v56 = (void *)MEMORY[0x1E0DC3F10];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke_2;
      v58[3] = &unk_1E3E75230;
      v59 = v39;
      v60 = v41;
      v61 = v43;
      v62 = v45;
      v63 = v47;
      v64 = v49;
      v65 = v51;
      v66 = v53;
      v67 = v55;
      objc_msgSend(v56, "performWithoutAnimation:", v58);

    }
    objc_msgSend(v39, "setFrame:", v49, v51, v53, v55);
  }

}

void __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  unsigned __int16 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  v3 = self->_contentSizeUpdateDeferralCounter - 1;
  self->_contentSizeUpdateDeferralCounter = v3;
  if (!v3 && self->_deferredContentSizeUpdate)
    -[PKCompactNavigationContainerController updateChildViewControllerSizeAnimated:forceUpdate:](self, "updateChildViewControllerSizeAnimated:forceUpdate:", self->_deferredContentSizeUpdateIsAnimated, self->_deferredContentSizeUpdateIsForced);
  -[PKCompactNavigationContainerController _endLayoutGroup](self, "_endLayoutGroup");
}

- (CGRect)_targetNavigationControllerFrameForInfo:(id *)a3
{
  CGSize v4;
  CGSize v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGSize size;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect *p_lastKeyboardFrame;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect slice;
  CGRect remainder;
  CGRect v45;
  CGRect v46;
  CGRect result;

  v4 = *(CGSize *)&a3->var1;
  remainder.origin = (CGPoint)a3->var0;
  remainder.size = v4;
  v5 = *(CGSize *)&self->_topVCInfo.minimumNavigationHeight;
  slice.origin = (CGPoint)self->_topVCInfo.preferredContentSize;
  slice.size = v5;
  -[PKCompactNavigationContainerController _navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:](self, "_navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:", &remainder, &slice);
  v7 = v6;
  v9 = v8;
  -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "safeAreaInsets");
    v42 = v20;
    size = self->_maximumModalPresentationFrame.size;
    remainder.origin = self->_maximumModalPresentationFrame.origin;
    remainder.size = size;
    memset(&slice, 0, sizeof(slice));
    if (self->_centeredCard)
    {
      PKSizeAlignedInRect();
      slice.origin.x = v22;
      slice.origin.y = v23;
      slice.size.width = v24;
      slice.size.height = v25;
    }
    else
    {
      CGRectDivide(remainder, &slice, &remainder, v9, CGRectMaxYEdge);
    }
    PKSizeAlignedInRect();
    v27 = v29;
    v7 = v30;
    v9 = v31;
    if (self->_presentingNavigationController)
    {
      MaxY = v28;
      if (self->_centeredCard)
      {
        p_lastKeyboardFrame = &self->_lastKeyboardFrame;
        if (!CGRectIsNull(*p_lastKeyboardFrame))
        {
          remainder.origin.x = v13;
          remainder.origin.y = v15;
          remainder.size.width = v17;
          remainder.size.height = v19;
          v45.origin.x = v13;
          v45.origin.y = v15;
          v45.size.width = v17;
          v45.size.height = v19;
          v33 = fmax(CGRectGetMaxY(v45) - p_lastKeyboardFrame->origin.y, 0.0);
          CGRectDivide(remainder, &remainder, &slice, v33, CGRectMaxYEdge);
          PKSizeAlignedInRect();
          v27 = v34;
          MaxY = v35;
          v7 = v36;
          v9 = v37;
        }
        MaxY = fmax(v15 + v42, MaxY);
      }
    }
    else
    {
      v46.origin.x = v13;
      v46.origin.y = v15;
      v46.size.width = v17;
      v46.size.height = v19;
      MaxY = CGRectGetMaxY(v46);
    }
  }
  else
  {
    v27 = *MEMORY[0x1E0C9D538];
    MaxY = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v38 = v27;
  v39 = MaxY;
  v40 = v7;
  v41 = v9;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)_beginLayoutGroup
{
  ++self->_layoutGroupCounter;
}

- (void)_endLayoutGroup
{
  unsigned __int16 v2;

  v2 = self->_layoutGroupCounter - 1;
  self->_layoutGroupCounter = v2;
  if (!v2)
    self->_topVCIsInInitialLayout = 0;
}

- (void)insertBackgroundLevelView:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PKCompactNavigationContainerController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:belowSubview:", v4, self->_maskingContainerView);

  }
}

- (CGSize)childViewControllerPreferredContentSizeForSize:(CGSize)a3 isRoot:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  PKSizeRoundToPixel();
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)navigationControllerSizeForChildViewControllerPreferredContentSize:(CGSize)a3 isRoot:(BOOL)a4
{
  __int128 v4;
  double v5;
  double v6;
  _OWORD v7[2];
  CGSize v8;
  uint64_t v9;
  BOOL v10;
  CGSize result;

  v8 = a3;
  v9 = 0;
  v10 = a4;
  v4 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  v7[0] = self->_topVCInfo.preferredContentSize;
  v7[1] = v4;
  -[PKCompactNavigationContainerController _navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:](self, "_navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:", &v8, v7);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)childViewControllerSizeForNavigationControllerSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((-[PKCompactNavigationContainedNavigationController isNavigationBarHidden](self->_containedNavigationController, "isNavigationBarHidden") & 1) == 0)
  {
    -[PKCompactNavigationContainedNavigationController navigationBar](self->_containedNavigationController, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    height = height - v7;

  }
  if (!self->_centeredCard)
  {
    -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    height = height - v9;

  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)modalPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumModalPresentationFrame.size.width;
  height = self->_maximumModalPresentationFrame.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (self->_hasExplicitlyDefinedSupportedInterfaceOrientations)
    return self->_explicitlyDefinedSupportedInterfaceOrientations;
  if (self->_containedNavigationController)
    return -[PKCompactNavigationContainedNavigationController supportedInterfaceOrientations](self->_containedNavigationController, "supportedInterfaceOrientations");
  v3.receiver = self;
  v3.super_class = (Class)PKCompactNavigationContainerController;
  return -[PKCompactNavigationContainerController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
  self->_explicitlyDefinedSupportedInterfaceOrientations = a3;
}

- (void)setExclusionRect:(CGRect)a3 withCoordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  int v10;
  void *v11;
  id v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  self->_exclusionRect.origin.x = x;
  self->_exclusionRect.origin.y = y;
  self->_exclusionRect.size.width = width;
  self->_exclusionRect.size.height = height;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectIsNull(v13))
  {
    v10 = 0;
    v11 = 0;
  }
  else if (v12)
  {
    v10 = 0;
    v11 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fixedCoordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  objc_storeStrong((id *)&self->_exclusionCoordinateSpace, v11);
  if (v10)
  {

  }
  -[PKCompactNavigationContainerController updateChildViewControllerSizeAnimated:](self, "updateChildViewControllerSizeAnimated:", 1);

}

- (void)setPresentingNavigationController:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_presentingNavigationController != a3)
  {
    self->_presentingNavigationController = a3;
    -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKCompactNavigationContainerController _backgroundColor](self, "_backgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v4);

      objc_msgSend(v5, "setNeedsLayout");
    }

  }
}

- (id)_backgroundColor
{
  if (self->_presentingNavigationController)
    objc_msgSend((id)objc_opt_class(), "dimmingColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateChildViewControllerSizeAnimated:(BOOL)a3
{
  -[PKCompactNavigationContainerController updateChildViewControllerSizeAnimated:forceUpdate:](self, "updateChildViewControllerSizeAnimated:forceUpdate:", a3, 0);
}

- (void)updateChildViewControllerSizeAnimated:(BOOL)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v5;
  _BOOL4 deferredContentSizeUpdate;
  BOOL v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  __int128 v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CGSize v16;
  __int128 v17;

  v5 = a3;
  if (self->_contentSizeUpdateDeferralCounter)
  {
    deferredContentSizeUpdate = self->_deferredContentSizeUpdate;
    self->_deferredContentSizeUpdate = 1;
    if (deferredContentSizeUpdate)
    {
      v8 = self->_deferredContentSizeUpdateIsAnimated && a3;
      self->_deferredContentSizeUpdateIsAnimated = v8;
      if (self->_deferredContentSizeUpdateIsForced)
        a4 = 1;
    }
    else
    {
      self->_deferredContentSizeUpdateIsAnimated = a3;
    }
    self->_deferredContentSizeUpdateIsForced = a4;
  }
  else
  {
    self->_deferredContentSizeUpdate = 0;
    v16 = (CGSize)0;
    v17 = 0u;
    -[PKCompactNavigationContainerController _infoForViewController:](self, "_infoForViewController:", self->_topVC);
    v9 = self->_updateChildViewControllerSizeCounter + 1;
    self->_updateChildViewControllerSizeCounter = v9;
    if (a4
      || (self->_topVCInfo.preferredContentSize.width == v16.width
        ? (v10 = self->_topVCInfo.preferredContentSize.height == v16.height)
        : (v10 = 0),
          !v10 || self->_topVCInfo.minimumNavigationHeight != *(double *)&v17 || self->_topVCInfo.isRoot != BYTE8(v17)))
    {
      -[PKCompactNavigationContainerController _beginLayoutGroup](self, "_beginLayoutGroup");
      -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");
      if (v9 == self->_updateChildViewControllerSizeCounter)
      {
        v12 = v17;
        self->_topVCInfo.preferredContentSize = v16;
        *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight = v12;
        objc_msgSend(v11, "setNeedsLayout");
        if (v11)
        {
          if (v5)
          {
            v13 = (void *)MEMORY[0x1E0DC3F10];
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = __92__PKCompactNavigationContainerController_updateChildViewControllerSizeAnimated_forceUpdate___block_invoke;
            v14[3] = &unk_1E3E612E8;
            v15 = v11;
            objc_msgSend(v13, "pkui_animateUsingOptions:delay:animations:completion:", 134, v14, 0, 0.0);

          }
        }
      }
      -[PKCompactNavigationContainerController _endLayoutGroup](self, "_endLayoutGroup");

    }
  }
}

uint64_t __92__PKCompactNavigationContainerController_updateChildViewControllerSizeAnimated_forceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateTopViewControllerAsync:(id)a3 animated:(BOOL)a4
{
  id v7;
  unint64_t v8;
  _QWORD block[6];
  BOOL v10;

  v7 = a3;
  if (v7)
  {
    v8 = self->_pendingTopVCIdentifier + 1;
    self->_pendingTopVCIdentifier = v8;
    objc_storeStrong((id *)&self->_pendingTopVC, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PKCompactNavigationContainerController__updateTopViewControllerAsync_animated___block_invoke;
    block[3] = &unk_1E3E75258;
    block[4] = self;
    block[5] = v8;
    v10 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __81__PKCompactNavigationContainerController__updateTopViewControllerAsync_animated___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 1136) == *(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_updateTopViewController:animated:", *(_QWORD *)(v1 + 1128), *(unsigned __int8 *)(result + 48));
  return result;
}

- (void)_updateTopViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIViewController *v7;
  UIViewController *pendingTopVC;
  UIViewController *topVC;
  BOOL v10;
  UIViewController *v11;

  v4 = a4;
  v7 = (UIViewController *)a3;
  if (v7)
  {
    ++self->_pendingTopVCIdentifier;
    pendingTopVC = self->_pendingTopVC;
    self->_pendingTopVC = 0;
    v11 = v7;

    topVC = self->_topVC;
    objc_storeStrong((id *)&self->_topVC, a3);
    objc_opt_class();
    self->_topVCIsExpectedClass = objc_opt_isKindOfClass() & 1;
    v10 = topVC == v11 && self->_topVCIsInInitialLayout;
    self->_topVCIsInInitialLayout = v10;
    -[PKCompactNavigationContainerController updateChildViewControllerSizeAnimated:forceUpdate:](self, "updateChildViewControllerSizeAnimated:forceUpdate:", v4, topVC != v11);
    v7 = v11;
  }

}

- ($D4AEFF3115FB778485575F64CCFDAF47)_infoForViewController:(SEL)a3
{
  PKCompactNavigationContainedNavigationController *containedNavigationController;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  CGSize preferredContentSize;
  __int128 v21;
  double v22;
  $D4AEFF3115FB778485575F64CCFDAF47 *result;
  _OWORD v24[2];
  CGSize var0;
  __int128 v26;

  containedNavigationController = self->_containedNavigationController;
  v7 = a4;
  -[PKCompactNavigationContainedNavigationController viewControllers](containedNavigationController, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9 == v7;
  else
    v10 = 1;
  v11 = v10;
  objc_msgSend(v7, "preferredContentSize");
  v13 = v12;
  v15 = v14;

  -[PKCompactNavigationContainerController childViewControllerPreferredContentSizeForSize:isRoot:](self, "childViewControllerPreferredContentSizeForSize:isRoot:", v11, v13, v15);
  retstr->var0.width = v16;
  retstr->var0.height = v17;
  retstr->var1 = 0.0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var2 = v11;
  if (v11)
  {
    v18 = *(_OWORD *)&retstr->var1;
    var0 = retstr->var0;
    v26 = v18;
    preferredContentSize = retstr->var0;
    v19 = *(_OWORD *)&retstr->var1;
  }
  else
  {
    v21 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
    var0 = self->_topVCInfo.preferredContentSize;
    v26 = v21;
    preferredContentSize = self->_topVCInfo.preferredContentSize;
    v19 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  }
  v24[0] = preferredContentSize;
  v24[1] = v19;
  -[PKCompactNavigationContainerController _navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:](self, "_navigationControllerSizeForChildViewControllerInfo:withCurrentInfo:", &var0, v24);
  retstr->var1 = v22;

  return result;
}

- (CGSize)_navigationControllerSizeForChildViewControllerInfo:(id *)a3 withCurrentInfo:(id *)a4
{
  void *v7;
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
  void *v20;
  double v21;
  _BOOL4 centeredCard;
  double v23;
  unint64_t style;
  double height;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;
  CGRect v35;

  -[PKCompactNavigationContainerController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "safeAreaInsets");
  v15 = v14;
  v17 = v16;
  v18 = 0.0;
  v19 = 0.0;
  if ((-[PKCompactNavigationContainedNavigationController isNavigationBarHidden](self->_containedNavigationController, "isNavigationBarHidden") & 1) == 0)
  {
    -[PKCompactNavigationContainedNavigationController navigationBar](self->_containedNavigationController, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v19 = v21;

  }
  centeredCard = self->_centeredCard;
  v23 = 60.0;
  if (v11 > v13)
    v23 = 20.0;
  if (!self->_centeredCard)
    v18 = v23;
  style = self->_style;
  height = a3->var0.height;
  -[PKCompactNavigationContainerController modalPresentationSize](self, "modalPresentationSize");
  if (height == v26)
  {
    if (self->_centeredCard || !a3->var2)
      goto LABEL_21;
LABEL_18:
    if (!CGRectIsNull(self->_exclusionRect) && self->_exclusionCoordinateSpace)
    {
      objc_msgSend(v7, "convertRect:fromCoordinateSpace:", self->_exclusionRect.origin.x, self->_exclusionRect.origin.y, self->_exclusionRect.size.width, self->_exclusionRect.size.height);
      v18 = fmax(v18, CGRectGetMaxY(v35) - v9);
    }
    goto LABEL_21;
  }
  v27 = -0.0;
  if (!self->_centeredCard)
    v27 = v17;
  height = v19 + height + v27;
  if (a3->var2)
  {
    if (self->_centeredCard)
      goto LABEL_21;
  }
  else
  {
    height = fmax(a4->var1, height);
    if (self->_centeredCard)
      goto LABEL_21;
  }
  v18 = fmax(v18, fmax(self->_statusBarFrame.size.height, v15));
  if (a3->var2)
    goto LABEL_18;
LABEL_21:
  v28 = v11 > v13 && !centeredCard;
  v29 = 146.0;
  if (!v28)
    v29 = 0.0;
  if (style == 1)
    v29 = 12.0;
  v30 = fmin(fmax(v11 + v29 * -2.0, 0.0), self->_maximumModalPresentationFrame.size.width);
  v31 = fmin(fmax(fmin(v13 - v18, height), v19), self->_maximumModalPresentationFrame.size.height);

  v32 = v30;
  v33 = v31;
  result.height = v33;
  result.width = v32;
  return result;
}

- (void)contentContainer:(id)a3 preferredContentSizeDidChangeForChildContentContainer:(id)a4
{
  UIViewController *v6;
  PKCompactNavigationContainedNavigationController *v7;

  v7 = (PKCompactNavigationContainedNavigationController *)a3;
  v6 = (UIViewController *)a4;
  if (self->_containedNavigationController == v7 && self->_topVC == v6)
    -[PKCompactNavigationContainerController updateChildViewControllerSizeAnimated:](self, "updateChildViewControllerSizeAnimated:", 1);

}

- (void)observedView:(id)a3 didMoveToWindow:(id)a4
{
  void *v5;

  if (self->_didMoveToWindowDirtiesLayout)
  {
    -[PKCompactNavigationContainerController view](self, "view", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  -[PKCompactNavigationContainerController _updateStatusBarFrame](self, "_updateStatusBarFrame", a3, a4);
}

- (void)_updateStatusBarFrame
{
  void *v3;
  void *v4;
  void *v5;
  CGRect *p_statusBarFrame;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGSize v12;
  id v13;

  if (!self->_centeredCard)
  {
    -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v13 = v3;
      objc_msgSend(v3, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      p_statusBarFrame = &self->_statusBarFrame;
      if (v5)
      {
        objc_msgSend(v5, "statusBarManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "statusBarFrame");
        p_statusBarFrame->origin.x = v8;
        p_statusBarFrame->origin.y = v9;
        p_statusBarFrame->size.width = v10;
        p_statusBarFrame->size.height = v11;

      }
      else
      {
        v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        p_statusBarFrame->origin = (CGPoint)*MEMORY[0x1E0C9D648];
        self->_statusBarFrame.size = v12;
      }
      objc_msgSend(v13, "setNeedsLayout");

      v3 = v13;
    }

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PKCompactNavigationContainerController transitionCoordinator](self, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "transitionCoordinator");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    -[PKCompactNavigationContainerController _updateTopViewControllerAsync:animated:](self, "_updateTopViewControllerAsync:animated:", v9, v5);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__PKCompactNavigationContainerController_navigationController_willShowViewController_animated___block_invoke;
    v19[3] = &unk_1E3E68818;
    objc_copyWeak(&v21, &location);
    v20 = v15;
    objc_msgSend(v13, "notifyWhenInteractionChangesUsingBlock:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKCompactNavigationContainedNavigationController interactivePopGestureRecognizer](self->_containedNavigationController, "interactivePopGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "state");

    if (v17 <= 5 && ((1 << v17) & 0x31) != 0)
      -[PKCompactNavigationContainerController _updateTopViewControllerAsync:animated:](self, "_updateTopViewControllerAsync:animated:", v9, v5);
  }

}

void __95__PKCompactNavigationContainerController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend(v4, "isCancelled"))
    objc_msgSend(WeakRetained, "_updateTopViewControllerAsync:animated:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "isAnimated"));

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[PKCompactNavigationContainerController _updateTopViewControllerAsync:animated:](self, "_updateTopViewControllerAsync:animated:", a4, a5);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  PKCompactNavigationContainerControllerPresentationController *v5;
  id v7;
  id v8;

  if (a3 == self)
  {
    v7 = a4;
    v8 = a3;
    v5 = -[PKCompactNavigationContainerControllerPresentationController initWithPresentedViewController:presentingViewController:]([PKCompactNavigationContainerControllerPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[PKCompactNavigationContainerControllerPresentationAnimator initWithPresenting:]([PKCompactNavigationContainerControllerPresentationAnimator alloc], "initWithPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[PKCompactNavigationContainerControllerPresentationAnimator initWithPresenting:]([PKCompactNavigationContainerControllerPresentationAnimator alloc], "initWithPresenting:", 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  BOOL v4;

  if (!self->_presentingNavigationController)
    return 0;
  -[PKCompactNavigationContainedNavigationWrapperViewController presentedViewController](self->_presentationContextVC, "presentedViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  UIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  CGPoint v22;
  CGPoint v23;
  CGRect v24;
  CGRect v25;

  v5 = a4;
  -[PKCompactNavigationContainerController view](self, "view");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[UIView bounds](v6, "bounds");
  v22.x = v8;
  v22.y = v10;
  if (!CGRectContainsPoint(v24, v22))
    goto LABEL_3;
  -[PKCompactNavigationContainedNavigationController view](self->_containedNavigationController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[UIView convertRect:fromView:](v6, "convertRect:fromView:", v11, v12 + -44.0, v13 + -44.0, v14 + 88.0, v15 + 88.0);
  v23.x = v8;
  v23.y = v10;
  v16 = CGRectContainsPoint(v25, v23);

  if (!v16)
  {
    -[UIView hitTest:withEvent:](v6, "hitTest:withEvent:", 0, v8, v10);
    v18 = (UIView *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (v18 == v6 || v18 == self->_maskingContainerView)
      {
        v17 = 1;
      }
      else
      {
        -[PKCompactNavigationContainedNavigationWrapperViewController view](self->_presentationContextVC, "view");
        v20 = (UIView *)objc_claimAutoreleasedReturnValue();
        v17 = v19 == v20;

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
LABEL_3:
    v17 = 0;
  }

  return v17;
}

- (void)tapGestureRecognized:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "compactNavigationContainerControllerReceivedExternalTap:", self);

}

- (void)_updateForKeyboardIfNecessary
{
  id v2;

  if (self->_centeredCard)
  {
    -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKCompactNavigationContainerController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKCompactNavigationContainerController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __59__PKCompactNavigationContainerController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1168);
  v4 = *(double *)(v2 + 1176);
  v5 = *(double *)(v2 + 1184);
  v6 = *(double *)(v2 + 1192);
  *(_BYTE *)(v2 + 1161) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1168);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1184) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1168), v16);
}

- (void)keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __61__PKCompactNavigationContainerController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKCompactNavigationContainerController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __61__PKCompactNavigationContainerController_keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 146;
  v4 = *((double *)v2 + 146);
  v5 = *((double *)v2 + 147);
  v6 = *((double *)v2 + 148);
  v7 = *((double *)v2 + 149);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1168), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PKCompactNavigationContainerController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKCompactNavigationContainerController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __59__PKCompactNavigationContainerController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1168);
  *(_BYTE *)(v1 + 1161) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1168);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1192);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  int IsVisible;
  int v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (v4)
  {
    -[PKCompactNavigationContainerController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsVisible = PKViewVisibilityStateIsVisible();
    v7 = IsVisible;
    if (v5 && IsVisible)
      objc_msgSend(v5, "layoutIfNeeded");
    v8 = v4[2](v4);
    if (v5 && v8)
    {
      objc_msgSend(v5, "setNeedsLayout");
      if (v7)
      {
        v9 = (void *)MEMORY[0x1E0DC3F10];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __73__PKCompactNavigationContainerController__updateLayoutForKeyboardAction___block_invoke;
        v10[3] = &unk_1E3E612E8;
        v11 = v5;
        objc_msgSend(v9, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v10, 0);

      }
      else
      {
        objc_msgSend(v5, "layoutIfNeeded");
      }
    }

  }
}

uint64_t __73__PKCompactNavigationContainerController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_presentationContextVC;
}

- (int64_t)preferredUserInterfaceStyle
{
  objc_super v3;

  if (self->_presentationContextVC)
    return -[PKWrapperViewController preferredUserInterfaceStyle](self->_presentationContextVC, "preferredUserInterfaceStyle");
  v3.receiver = self;
  v3.super_class = (Class)PKCompactNavigationContainerController;
  return -[PKCompactNavigationContainerController preferredUserInterfaceStyle](&v3, sel_preferredUserInterfaceStyle);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_presentationContextVC;
}

- (BOOL)didMoveToWindowDirtiesLayout
{
  return self->_didMoveToWindowDirtiesLayout;
}

- (void)setDidMoveToWindowDirtiesLayout:(BOOL)a3
{
  self->_didMoveToWindowDirtiesLayout = a3;
}

- (PKCompactNavigationContainedNavigationController)containedNavigationController
{
  return self->_containedNavigationController;
}

- (unint64_t)style
{
  return self->_style;
}

- (CGRect)exclusionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_exclusionRect.origin.x;
  y = self->_exclusionRect.origin.y;
  width = self->_exclusionRect.size.width;
  height = self->_exclusionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UICoordinateSpace)exclusionCoordinateSpace
{
  return self->_exclusionCoordinateSpace;
}

- (PKCompactNavigationContainerControllerDelegate)delegate
{
  return (PKCompactNavigationContainerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exclusionCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_containedNavigationController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pendingTopVC, 0);
  objc_storeStrong((id *)&self->_topVC, 0);
  objc_storeStrong((id *)&self->_presentationContextVC, 0);
  objc_storeStrong((id *)&self->_maskingContainerView, 0);
}

@end
