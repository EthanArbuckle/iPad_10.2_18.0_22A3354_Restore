@implementation SBPIPStashableWrapperViewController

- (SBPIPStashableWrapperViewController)initWithContentViewController:(id)a3 cornerRadius:(double)a4 stashVisualSettings:(id)a5 shadowSettings:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  SBPIPStashableWrapperViewController *v15;
  SBPIPStashableWrapperViewController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  SBLogPIP();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SBPIPBackdropView initWithFrame:].cold.1();

  v18.receiver = self;
  v18.super_class = (Class)SBPIPStashableWrapperViewController;
  v15 = -[SBPIPStashableWrapperViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_settings, a5);
    objc_storeStrong((id *)&v16->_shadowSettings, a6);
    v16->_cornerRadiusMetric = a4;
    objc_storeStrong((id *)&v16->_contentViewController, a3);
    v16->_stashTabHidden = 1;
    -[SBPIPStashableWrapperViewController setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("SBPIP-StashingContainerViewController"));
    -[PTSettings addKeyPathObserver:](v16->_shadowSettings, "addKeyPathObserver:", v16);
  }

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;

  SBLogPIP();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBPIPBackdropView initWithFrame:].cold.1();

  -[PTSettings removeKeyPathObserver:](self->_shadowSettings, "removeKeyPathObserver:", self);
  if (-[SBPIPStashableWrapperViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](self->_contentViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashableWrapperViewController;
  -[SBPIPStashableWrapperViewController dealloc](&v5, sel_dealloc);
}

- (void)setStashed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *stashedTapGestureRecognizer;
  void *v9;
  id WeakRetained;

  if (self->_stashed != a3)
  {
    v4 = a3;
    self->_stashed = a3;
    v6 = 0.0;
    if (a3)
      v6 = 1.0;
    -[SBPIPStashableWrapperViewController _setStashProgress:animated:](self, "_setStashProgress:animated:", a4, v6);
    if (-[SBPIPStashableWrapperViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (v4)
      {
        v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapWhileStashedGestureRecognizer_);
        stashedTapGestureRecognizer = self->_stashedTapGestureRecognizer;
        self->_stashedTapGestureRecognizer = v7;

        -[SBPIPStashableWrapperViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addGestureRecognizer:", self->_stashedTapGestureRecognizer);
      }
      else
      {
        -[SBPIPStashableWrapperViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeGestureRecognizer:", self->_stashedTapGestureRecognizer);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "stashableWrapper:didTransitionToStashed:", self, v4);

  }
}

- (void)setStashed:(BOOL)a3
{
  -[SBPIPStashableWrapperViewController setStashed:animated:](self, "setStashed:animated:", a3, 1);
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    -[SBPIPStashableWrapperViewController _resetStashTabViewsIfPossible](self, "_resetStashTabViewsIfPossible");
    -[SBPIPStashableWrapperViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[SBPIPStashableWrapperViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    if (-[SBPIPStashableWrapperViewController isViewLoaded](self, "isViewLoaded"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(WeakRetained, "setMinimumStashTabSize:", width, height);

      -[SBPIPStashView setStashedTabWidth:](self->_stashView, "setStashedTabWidth:", width);
    }
  }
}

- (void)_setStashProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v8;
  double v9;
  char IsZero;
  char v11;
  char v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  unint64_t v17;
  void (**v18)(_QWORD);
  int IsOne;
  double v20;
  void (**v21)(_QWORD);
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[4];
  void (**v32)(_QWORD);
  _QWORD v33[6];
  _QWORD v34[7];
  char v35;
  _QWORD v36[6];
  char v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  -[SBPIPStashView blurProgress](self->_stashView, "blurProgress");
  v9 = v8;
  IsZero = BSFloatIsZero();
  if (a3 < 0.2)
    v11 = IsZero;
  else
    v11 = 0;
  if (v9 != a3
    && (v11 & 1) == 0
    && -[SBPIPStashableWrapperViewController isViewLoaded](self, "isViewLoaded"))
  {
    v12 = BSFloatIsZero();
    if ((v12 & 1) == 0 && -[SBPIPStashView isHidden](self->_stashView, "isHidden"))
    {
      SBLogPIP();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v14;
        v40 = 1024;
        v41 = 145;
        v42 = 2114;
        v43 = CFSTR("not hidden");
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", buf, 0x1Cu);

      }
      -[SBPIPStashView setHidden:](self->_stashView, "setHidden:", 0);
    }
    v15 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke;
    v36[3] = &unk_1E8EA5AD8;
    v36[4] = self;
    v37 = v12;
    *(double *)&v36[5] = a3;
    v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v36);
    v17 = self->_inFlightStashProgressAnimationIdentifier + 1;
    self->_inFlightStashProgressAnimationIdentifier = v17;
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2;
    v34[3] = &unk_1E8EA49B0;
    v35 = v12;
    v34[4] = self;
    v34[5] = v17;
    v34[6] = a2;
    v18 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v34);
    IsOne = BSFloatIsOne();
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_12;
    v33[3] = &unk_1E8E9DE88;
    if (IsOne)
      v20 = 0.0;
    else
      v20 = 1.0;
    v33[4] = self;
    *(double *)&v33[5] = v20;
    v21 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v33);
    if (v4)
    {
      v22 = (void *)MEMORY[0x1E0CEABB0];
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2_14;
      v31[3] = &unk_1E8E9E8D0;
      v32 = v16;
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_3;
      v29[3] = &unk_1E8E9F1C0;
      v30 = v18;
      objc_msgSend(v22, "SBPIP_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v31, v29);
      -[UIView alpha](self->_shadowView, "alpha");
      if (v23 != v20)
      {
        v24 = (void *)MEMORY[0x1E0CEABB0];
        if (IsOne)
          v25 = 0.5;
        else
          v25 = 0.2;
        if (IsOne)
          v26 = 0.5;
        else
          v26 = 0.0;
        v27[0] = v15;
        v27[1] = 3221225472;
        v27[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_4;
        v27[3] = &unk_1E8E9E8D0;
        v28 = v21;
        objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 0, v27, 0, v25, v26);

      }
    }
    else
    {
      v16[2](v16);
      v18[2](v18);
      v21[2](v21);
    }

  }
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setBlurProgress:", *(double *)(a1 + 40));
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 56))
  {
    v1 = result;
    if (*(_QWORD *)(result + 40) == *(_QWORD *)(*(_QWORD *)(result + 32) + 1056))
    {
      SBLogPIP();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(v1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = 138543874;
        v5 = v3;
        v6 = 1024;
        v7 = 157;
        v8 = 2114;
        v9 = CFSTR("hidden");
        _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", (uint8_t *)&v4, 0x1Cu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1000), "setHidden:", 1);
      return objc_msgSend(*(id *)(v1 + 32), "_resetStashTabViewsIfPossible");
    }
  }
  return result;
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setStashProgress:(double)a3
{
  -[SBPIPStashableWrapperViewController _setStashProgress:animated:](self, "_setStashProgress:animated:", 1, a3);
}

- (BOOL)isStashTabHidden
{
  return self->_stashTabHidden;
}

- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  unint64_t v17;
  _QWORD v18[5];
  BOOL v19;
  BOOL v20;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = v11;
  if (__PAIR64__(self->_stashTabShownLeft, self->_stashTabHidden) == __PAIR64__(v7, v8))
  {
    if (v11)
      v11[2](v11);
  }
  else
  {
    self->_stashTabHidden = v8;
    self->_stashTabShownLeft = v7 & ~v8;
    v13 = self->_inFlightStashTabAnimationIdentifier + 1;
    self->_inFlightStashTabAnimationIdentifier = v13;
    v14 = (void *)MEMORY[0x1E0CEABB0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke;
    v18[3] = &unk_1E8EA1C70;
    v18[4] = self;
    v19 = v8;
    v20 = v7;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke_2;
    v15[3] = &unk_1E8E9E7F8;
    v17 = v13;
    v15[4] = self;
    v16 = v11;
    objc_msgSend(v14, "_animateUsingSpringBehavior:tracking:animations:completion:", v10, 0, v18, v15);

  }
}

uint64_t __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStashedTabHidden:left:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = a1[6];
  v3 = (_QWORD *)a1[4];
  if (v2 == v3[131])
    objc_msgSend(v3, "_resetStashTabViewsIfPossible");
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadView
{
  SBPIPHitTestExtendableView *v3;
  SBPIPHitTestExtendableView *v4;

  v3 = [SBPIPHitTestExtendableView alloc];
  v4 = -[SBPIPHitTestExtendableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBPIPStashableWrapperViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *containerView;
  UIView *v11;
  UIView *contentView;
  SBPortalView *v13;
  SBPortalView *leftSideContentPortalView;
  SBPortalView *v15;
  SBPortalView *v16;
  SBPortalView *rightSideContentPortalView;
  SBPortalView *v18;
  SBPIPStashView *v19;
  SBPIPStashView *v20;
  SBPIPStashView *stashView;
  SBPIPStashView *v22;
  void *v23;
  UIView *v24;
  UIView *shadowView;
  void *v26;
  UIView *v27;
  UIView *tabShadowView;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SBPIPStashableWrapperViewController;
  -[SBPIPStashableWrapperViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[SBPIPStashableWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  containerView = self->_containerView;
  self->_containerView = v9;

  objc_msgSend(v3, "addSubview:", self->_containerView);
  -[SBPIPStashableWrapperViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[UIViewController view](self->_contentViewController, "view");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v11;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_contentView);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  v13 = -[SBPortalView initWithFrame:]([SBPortalView alloc], "initWithFrame:", v5, v6, v7, v8);
  leftSideContentPortalView = self->_leftSideContentPortalView;
  self->_leftSideContentPortalView = v13;

  v15 = self->_leftSideContentPortalView;
  v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x1E0C9BAA8];
  v30 = *(_OWORD *)&v33.a;
  *(_OWORD *)&v33.c = v31;
  *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v29 = *(_OWORD *)&v33.tx;
  CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
  -[SBPortalView setTransform:](v15, "setTransform:", &v34);
  -[SBPortalView setUserInteractionEnabled:](self->_leftSideContentPortalView, "setUserInteractionEnabled:", 0);
  -[SBPortalView setHidden:](self->_leftSideContentPortalView, "setHidden:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_leftSideContentPortalView);
  v16 = -[SBPortalView initWithFrame:]([SBPortalView alloc], "initWithFrame:", v5, v6, v7, v8);
  rightSideContentPortalView = self->_rightSideContentPortalView;
  self->_rightSideContentPortalView = v16;

  v18 = self->_rightSideContentPortalView;
  *(_OWORD *)&v33.a = v30;
  *(_OWORD *)&v33.c = v31;
  *(_OWORD *)&v33.tx = v29;
  CGAffineTransformScale(&v32, &v33, -1.0, 1.0);
  -[SBPortalView setTransform:](v18, "setTransform:", &v32);
  -[SBPortalView setUserInteractionEnabled:](self->_rightSideContentPortalView, "setUserInteractionEnabled:", 0);
  -[SBPortalView setHidden:](self->_rightSideContentPortalView, "setHidden:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_rightSideContentPortalView);
  v19 = [SBPIPStashView alloc];
  -[UIView bounds](self->_containerView, "bounds");
  v20 = -[SBPIPStashView initWithFrame:settings:](v19, "initWithFrame:settings:", self->_settings);
  stashView = self->_stashView;
  self->_stashView = v20;

  v22 = self->_stashView;
  -[SBPIPStashableWrapperViewController _continuousCornerRadius](self, "_continuousCornerRadius");
  -[SBPIPStashView _setContinuousCornerRadius:](v22, "_setContinuousCornerRadius:");
  -[SBPIPStashView setHidden:](self->_stashView, "setHidden:", 1);
  -[SBPIPStashView setUserInteractionEnabled:](self->_stashView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_stashView);
  -[SBPIPShadowSettings bodyShadowSettings](self->_shadowSettings, "bodyShadowSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBPIPStashableWrapperViewController _newShadowViewWithSettings:](self, "_newShadowViewWithSettings:", v23);
  shadowView = self->_shadowView;
  self->_shadowView = v24;

  objc_msgSend(v3, "insertSubview:atIndex:", self->_shadowView, 0);
  -[SBPIPShadowSettings tabShadowSettings](self->_shadowSettings, "tabShadowSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[SBPIPStashableWrapperViewController _newShadowViewWithSettings:](self, "_newShadowViewWithSettings:", v26);
  tabShadowView = self->_tabShadowView;
  self->_tabShadowView = v27;

  -[UIView setHidden:](self->_tabShadowView, "setHidden:", 1);
  objc_msgSend(v3, "insertSubview:atIndex:", self->_tabShadowView, 0);
  -[SBPIPStashableWrapperViewController _addMaskViewSubviewIfNeeded](self, "_addMaskViewSubviewIfNeeded");

}

- (void)viewWillLayoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *contentView;
  double v21;
  CGFloat v22;
  __int128 v23;
  UIView *v24;
  UIView *v25;
  double MidX;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)SBPIPStashableWrapperViewController;
  -[SBPIPStashableWrapperViewController viewWillLayoutSubviews](&v30, sel_viewWillLayoutSubviews);
  -[SBPIPStashableWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  -[UIView bounds](self->_containerView, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  contentView = self->_contentView;
  if (self->_interactivelyResizing)
  {
    -[UIView bounds](contentView, "bounds");
    v22 = v17 / v21;
    memset(&v29, 0, sizeof(v29));
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v28.c = v23;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v29, &v28, v22, v22);
    v24 = self->_contentView;
    v28 = v29;
    -[UIView setTransform:](v24, "setTransform:", &v28);
    v25 = self->_contentView;
    v31.origin.x = v13;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    MidX = CGRectGetMidX(v31);
    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    -[UIView setCenter:](v25, "setCenter:", MidX, CGRectGetMidY(v32));
  }
  else
  {
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v29.c = v27;
    *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](contentView, "setTransform:", &v29);
    -[UIView setFrame:](self->_contentView, "setFrame:", v13, v15, v17, v19);
  }
  -[UIView SBPIP_setAllowsEdgeAntialiasing:](self->_contentView, "SBPIP_setAllowsEdgeAntialiasing:", self->_interactivelyResizing);
  -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
  -[UIView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
  -[SBPIPStashableWrapperViewController _layoutStashTabViewsIfNeeded](self, "_layoutStashTabViewsIfNeeded");
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_layoutStashTabViewsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  UIView *tabShadowView;
  UIView *v15;
  SBPortalView *leftSideContentPortalView;
  SBPortalView *rightSideContentPortalView;
  void *v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[UIView bounds](self->_containerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v18 = WeakRetained;
    objc_msgSend(WeakRetained, "bounds");
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    v13 = CGRectEqualToRect(v19, v24);
    v12 = v18;
    if (!v13)
    {
      objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);
      objc_msgSend(v18, "layoutIfNeeded");
      tabShadowView = self->_tabShadowView;
      objc_msgSend(v18, "tabViewBounds");
      -[UIView setBounds:](tabShadowView, "setBounds:");
      v15 = self->_tabShadowView;
      objc_msgSend(v18, "center");
      -[UIView setCenter:](v15, "setCenter:");
      -[UIView layoutIfNeeded](self->_tabShadowView, "layoutIfNeeded");
      leftSideContentPortalView = self->_leftSideContentPortalView;
      v20.origin.x = v4;
      v20.origin.y = v6;
      v20.size.width = v8;
      v20.size.height = v10;
      v21 = CGRectOffset(v20, -(v8 + -1.0), 0.0);
      -[SBPortalView setFrame:](leftSideContentPortalView, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
      rightSideContentPortalView = self->_rightSideContentPortalView;
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      v23 = CGRectOffset(v22, v8 + -1.0, 0.0);
      -[SBPortalView setFrame:](rightSideContentPortalView, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
      -[SBPortalView layoutIfNeeded](self->_leftSideContentPortalView, "layoutIfNeeded");
      -[SBPortalView layoutIfNeeded](self->_rightSideContentPortalView, "layoutIfNeeded");
      -[SBPIPStashView setFrame:](self->_stashView, "setFrame:", v4, v6, v8, v10);
      -[SBPIPStashView layoutIfNeeded](self->_stashView, "layoutIfNeeded");
      v12 = v18;
    }
  }

}

- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id WeakRetained;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[UIView setAlpha:](self->_tabShadowView, "setAlpha:", 0.0);
    -[UIView setHidden:](self->_tabShadowView, "setHidden:", 0);
    -[SBPIPStashableWrapperViewController _setPortalActive:left:](self, "_setPortalActive:left:", 1, v4);
    -[SBPIPStashableWrapperViewController _setStashMaskActive:](self, "_setStashMaskActive:", 1);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  objc_msgSend(WeakRetained, "setTabHidden:left:", v5, v4);

  -[SBPIPStashView setChevronHidden:left:](self->_stashView, "setChevronHidden:left:", v5, v4);
}

- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4
{
  _BOOL4 v4;
  SBPortalView *leftSideContentPortalView;
  _BOOL4 v7;
  _BOOL4 v8;
  UIView *contentView;
  uint64_t v10;
  UIView *v11;

  v4 = a4;
  leftSideContentPortalView = self->_leftSideContentPortalView;
  v7 = !a3;
  v8 = a3 && a4;
  if (a3 && a4)
    contentView = self->_contentView;
  else
    contentView = 0;
  -[SBPortalView setSourceView:](leftSideContentPortalView, "setSourceView:", contentView);
  -[SBPortalView setMatchesTransform:](self->_leftSideContentPortalView, "setMatchesTransform:", 1);
  v10 = v7 | v4;
  if ((v10 & 1) != 0)
    v11 = 0;
  else
    v11 = self->_contentView;
  -[SBPortalView setSourceView:](self->_rightSideContentPortalView, "setSourceView:", v11);
  -[SBPortalView setMatchesTransform:](self->_rightSideContentPortalView, "setMatchesTransform:", 1);
  -[SBPortalView setHidden:](self->_leftSideContentPortalView, "setHidden:", !v8);
  -[SBPortalView setHidden:](self->_rightSideContentPortalView, "setHidden:", v10);
}

- (void)_setStashMaskActive:(BOOL)a3
{
  _BOOL8 v3;
  SBPIPStashedMaskView **p_stashMaskView;
  void *WeakRetained;
  void *v7;
  void *v8;

  v3 = a3;
  p_stashMaskView = &self->_stashMaskView;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_stashMaskView);
    if (WeakRetained)
    {
      -[UIView maskView](self->_containerView, "maskView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(WeakRetained, "setHidden:", 0);
        -[UIView setMaskView:](self->_containerView, "setMaskView:", WeakRetained);
        -[SBPIPStashableWrapperViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHitTestExtenderView:", WeakRetained);

      }
    }
  }
  else
  {
    objc_storeWeak((id *)p_stashMaskView, 0);
    -[UIView setMaskView:](self->_containerView, "setMaskView:", 0);
    -[SBPIPStashableWrapperViewController _addMaskViewSubviewIfNeeded](self, "_addMaskViewSubviewIfNeeded");
    -[SBPIPStashableWrapperViewController view](self, "view");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setHitTestExtenderView:", 0);
  }

  -[SBPIPStashableWrapperViewController _updateContentCornerRadiusForMaskActive:](self, "_updateContentCornerRadiusForMaskActive:", v3);
}

- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__SBPIPStashableWrapperViewController__updateContentCornerRadiusForMaskActive___block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "SBPIP_performWithoutRetargetingAnimation:", v3);
}

void __79__SBPIPStashableWrapperViewController__updateContentCornerRadiusForMaskActive___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)_addMaskViewSubviewIfNeeded
{
  SBPIPStashedMaskView **p_stashMaskView;
  id WeakRetained;
  SBPIPStashedMaskView *v5;
  SBPIPStashedMaskView *obj;

  p_stashMaskView = &self->_stashMaskView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);

  if (!WeakRetained)
  {
    v5 = [SBPIPStashedMaskView alloc];
    -[UIView bounds](self->_containerView, "bounds");
    obj = -[SBPIPStashedMaskView initWithFrame:minimumStashTabSize:](v5, "initWithFrame:minimumStashTabSize:");
    -[SBPIPStashedMaskView setTabShadowView:](obj, "setTabShadowView:", self->_tabShadowView);
    -[SBPIPStashedMaskView setHidden:](obj, "setHidden:", 1);
    -[SBPIPStashableWrapperViewController _continuousCornerRadius](self, "_continuousCornerRadius");
    -[SBPIPStashedMaskView _setContinuousCornerRadius:](obj, "_setContinuousCornerRadius:");
    -[UIView addSubview:](self->_containerView, "addSubview:", obj);
    objc_storeWeak((id *)p_stashMaskView, obj);

  }
}

- (void)_resetStashTabViewsIfPossible
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (self->_stashTabHidden)
  {
    -[UIView maskView](self->_containerView, "maskView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (self->_interactivelyResizing
        || (-[SBPIPStashView blurProgress](self->_stashView, "blurProgress"), !BSFloatIsZero()))
      {
        -[SBPIPStashableWrapperViewController _updateContentCornerRadiusForMaskActive:](self, "_updateContentCornerRadiusForMaskActive:", 0);
      }
      else
      {
        SBLogPIP();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Layout] Removing Stash Tab Views", buf, 2u);
        }

        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __68__SBPIPStashableWrapperViewController__resetStashTabViewsIfPossible__block_invoke;
        v5[3] = &unk_1E8E9DED8;
        v5[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "SBPIP_performWithoutRetargetingAnimation:", v5);
      }
    }
  }
}

uint64_t __68__SBPIPStashableWrapperViewController__resetStashTabViewsIfPossible__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setPortalActive:left:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setStashMaskActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "resetChevronState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "layoutIfNeeded");
}

- (UIView)contentContainerView
{
  return self->_containerView;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  objc_super v4;

  if (!-[SBPIPStashableWrapperViewController shouldAutorotate](self, "shouldAutorotate"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBPIPStashableWrapperViewController;
  return (int64_t)-[SBPIPStashableWrapperViewController interfaceOrientation](&v4, sel_interfaceOrientation);
}

- (void)_handleTapWhileStashedGestureRecognizer:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "stashableWrapper:didReceivedTapGesture:", self, v5);

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  void *v5;
  int *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("bodyShadowSettings")))
  {
    -[SBPIPShadowSettings bodyShadowSettings](self->_shadowSettings, "bodyShadowSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &OBJC_IVAR___SBPIPStashableWrapperViewController__shadowView;
LABEL_5:
    -[SBPIPStashableWrapperViewController _applyDropShadowSettings:toView:](self, "_applyDropShadowSettings:toView:", v5, *(Class *)((char *)&self->super.super.super.isa + *v6));

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("tabShadowSettings")))
  {
    -[SBPIPShadowSettings tabShadowSettings](self->_shadowSettings, "tabShadowSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &OBJC_IVAR___SBPIPStashableWrapperViewController__tabShadowView;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_newShadowViewWithSettings:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0CEABB0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowPathIsBounds:", 1);

  -[SBPIPStashableWrapperViewController _applyDropShadowSettings:toView:](self, "_applyDropShadowSettings:toView:", v5, v7);
  return v7;
}

- (void)_applyDropShadowSettings:(id)a3 toView:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v20 = a4;
  v5 = a3;
  objc_msgSend(v5, "opacity");
  v7 = v6;
  objc_msgSend(v5, "offsetX");
  v9 = v8;
  objc_msgSend(v5, "offsetY");
  v11 = v10;
  objc_msgSend(v5, "radius");
  v13 = v12;
  objc_msgSend(v5, "continuousCornerRadius");
  v15 = v14;

  objc_msgSend(v20, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowOffset:", v9, v11);

  objc_msgSend(v20, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = v7;
  objc_msgSend(v17, "setShadowOpacity:", v18);

  objc_msgSend(v20, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowRadius:", v13);

  objc_msgSend(v20, "_setContinuousCornerRadius:", v15);
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadiusMetric;
}

- (SBPIPStashableWrapperViewControllerDelegate)delegate
{
  return (SBPIPStashableWrapperViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (CGSize)minimumStashTabSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumStashTabSize.width;
  height = self->_minimumStashTabSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_stashedTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSideContentPortalView, 0);
  objc_storeStrong((id *)&self->_leftSideContentPortalView, 0);
  objc_destroyWeak((id *)&self->_stashMaskView);
  objc_storeStrong((id *)&self->_tabShadowView, 0);
  objc_storeStrong((id *)&self->_stashView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
