@implementation PBUIWallpaperViewController

- (PBUIWallpaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PBUIWallpaperViewController *v4;
  PBUIWallpaperViewController *v5;
  uint64_t v6;
  NSHashTable *lockscreenObservers;
  uint64_t v8;
  NSHashTable *homescreenObservers;
  uint64_t v10;
  NSHashTable *lockscreenBlurViews;
  uint64_t v12;
  NSHashTable *homescreenBlurViews;
  uint64_t v14;
  NSHashTable *suspendColorSamplingAssertions;
  uint64_t v16;
  NSHashTable *suspendWallpaperAnimationAssertions;
  uint64_t v18;
  NSHashTable *wallpaperScaleAssertions;
  uint64_t v20;
  NSHashTable *requireWallpaperAssertions;
  NSMutableSet *v22;
  NSMutableSet *hideHomescreenWallpaperReasons;
  NSMutableSet *v24;
  NSMutableSet *hideLockscreenWallpaperReasons;
  NSMutableSet *v26;
  NSMutableSet *disallowRasterizationReasonsHomeVariant;
  NSMutableSet *v28;
  NSMutableSet *disallowRasterizationReasonsLockVariant;
  PBUIWallpaperStyleInfo *v30;
  PBUIWallpaperStyleInfo *homescreenStyleInfo;
  PBUIWallpaperStyleInfo *v32;
  PBUIWallpaperStyleInfo *lockscreenStyleInfo;
  PBUIWallpaperDefaultsDomain *v34;
  PBUIWallpaperDefaultsDomain *wallpaperDefaultsStore;
  void *v36;
  PBUIWallpaperDefaultsDomain *v37;
  void *v38;
  PBUIWallpaperViewController *v39;
  uint64_t v40;
  BSDefaultObserver *wallpaperEnableDimmingObserver;
  _QWORD v43[4];
  PBUIWallpaperViewController *v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)PBUIWallpaperViewController;
  v4 = -[PBUIWallpaperViewController initWithNibName:bundle:](&v45, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_displayedVariant = -1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    lockscreenObservers = v5->_lockscreenObservers;
    v5->_lockscreenObservers = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    homescreenObservers = v5->_homescreenObservers;
    v5->_homescreenObservers = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    lockscreenBlurViews = v5->_lockscreenBlurViews;
    v5->_lockscreenBlurViews = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    homescreenBlurViews = v5->_homescreenBlurViews;
    v5->_homescreenBlurViews = (NSHashTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    suspendColorSamplingAssertions = v5->_suspendColorSamplingAssertions;
    v5->_suspendColorSamplingAssertions = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    suspendWallpaperAnimationAssertions = v5->_suspendWallpaperAnimationAssertions;
    v5->_suspendWallpaperAnimationAssertions = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    wallpaperScaleAssertions = v5->_wallpaperScaleAssertions;
    v5->_wallpaperScaleAssertions = (NSHashTable *)v18;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    requireWallpaperAssertions = v5->_requireWallpaperAssertions;
    v5->_requireWallpaperAssertions = (NSHashTable *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hideHomescreenWallpaperReasons = v5->_hideHomescreenWallpaperReasons;
    v5->_hideHomescreenWallpaperReasons = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hideLockscreenWallpaperReasons = v5->_hideLockscreenWallpaperReasons;
    v5->_hideLockscreenWallpaperReasons = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disallowRasterizationReasonsHomeVariant = v5->_disallowRasterizationReasonsHomeVariant;
    v5->_disallowRasterizationReasonsHomeVariant = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disallowRasterizationReasonsLockVariant = v5->_disallowRasterizationReasonsLockVariant;
    v5->_disallowRasterizationReasonsLockVariant = v28;

    v5->_lockscreenOnlyWallpaperAlpha = 1.0;
    v30 = objc_alloc_init(PBUIWallpaperStyleInfo);
    homescreenStyleInfo = v5->_homescreenStyleInfo;
    v5->_homescreenStyleInfo = v30;

    v32 = objc_alloc_init(PBUIWallpaperStyleInfo);
    lockscreenStyleInfo = v5->_lockscreenStyleInfo;
    v5->_lockscreenStyleInfo = v32;

    -[PBUIWallpaperConfigurationManager setDelegate:](v5->_wallpaperConfigurationManager, "setDelegate:", v5);
    v34 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
    wallpaperDefaultsStore = v5->_wallpaperDefaultsStore;
    v5->_wallpaperDefaultsStore = v34;

    -[PBUIWallpaperConfigurationManager setEnableWallpaperDimming:](v5->_wallpaperConfigurationManager, "setEnableWallpaperDimming:", -[PBUIWallpaperDefaultsDomain enableWallpaperDimming](v5->_wallpaperDefaultsStore, "enableWallpaperDimming"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v5, sel__accessibilityReduceTransparencyChanged_, *MEMORY[0x1E0CEB098], 0);
    v37 = v5->_wallpaperDefaultsStore;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableWallpaperDimming");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __54__PBUIWallpaperViewController_initWithNibName_bundle___block_invoke;
    v43[3] = &unk_1E6B94728;
    v39 = v5;
    v44 = v39;
    -[BSAbstractDefaultDomain observeDefault:onQueue:withBlock:](v37, "observeDefault:onQueue:withBlock:", v38, MEMORY[0x1E0C80D38], v43);
    v40 = objc_claimAutoreleasedReturnValue();
    wallpaperEnableDimmingObserver = v39->_wallpaperEnableDimmingObserver;
    v39->_wallpaperEnableDimmingObserver = (BSDefaultObserver *)v40;

  }
  return v5;
}

uint64_t __54__PBUIWallpaperViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperForWallpaperDimming:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "enableWallpaperDimming"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSDefaultObserver invalidate](self->_wallpaperEnableDimmingObserver, "invalidate");
  -[BSInvalidatable invalidate](self->_colorSamplingAssertion, "invalidate");
  -[PBUIWallpaperViewController _endSuspendingMotionEffectsForStyleIfNeeded](self, "_endSuspendingMotionEffectsForStyleIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperViewController;
  -[PBUIWallpaperViewController dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *wallpaperContainerView;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperViewController;
  -[PBUIWallpaperViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PBUIWallpaperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  wallpaperContainerView = self->_wallpaperContainerView;
  self->_wallpaperContainerView = v5;

  -[UIView layer](self->_wallpaperContainerView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v7, "setRasterizationScale:");

  -[UIView setClipsToBounds:](self->_wallpaperContainerView, "setClipsToBounds:", 0);
  -[UIView setAutoresizingMask:](self->_wallpaperContainerView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_wallpaperContainerView);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PBUIWallpaperViewController_viewDidLoad__block_invoke;
  v9[3] = &unk_1E6B94728;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);

}

uint64_t __42__PBUIWallpaperViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAndPrewarmWallpapers");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v5 = a4;
  -[PBUIWallpaperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "_toWindowOrientation");
  v9 = objc_msgSend(v7, "_fromWindowOrientation");
  -[PBUIWallpaperViewController noteWillAnimateToInterfaceOrientation:](self, "noteWillAnimateToInterfaceOrientation:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PBUIWallpaperViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E6B96220;
  v10[4] = self;
  v10[5] = v9;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", &__block_literal_global_17, v10);

}

uint64_t __82__PBUIWallpaperViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "noteDidRotateFromInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PBUIWallpaperViewController;
  v4 = a3;
  -[PBUIWallpaperViewController traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[PBUIWallpaperViewController traitCollection](self, "traitCollection", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");
  v8 = objc_msgSend(v4, "_backlightLuminance");

  v9 = objc_msgSend(v5, "_backlightLuminance");
  if (v6 != v7 || (v8 != 1) == (v9 == 1))
  {
    -[PBUIWallpaperViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    v12 = v11 == 1;
    if (v11 == 2)
      v12 = 2;
    if (v9 == 1)
      v13 = 3;
    else
      v13 = v12;
    if (v13)
      -[PBUIWallpaperViewController _updateWallpaperForWallpaperMode:](self, "_updateWallpaperForWallpaperMode:");
  }

}

- (BOOL)shouldAutorotate
{
  return !self->_fixedOrientation;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (self->_fixedOrientation)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperViewController;
  return -[PBUIWallpaperViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  PBUIWallpaperConfigurationManager *v5;
  PBUIWallpaperConfigurationManager **p_wallpaperConfigurationManager;
  PBUIWallpaperConfigurationManager *wallpaperConfigurationManager;
  PBUIWallpaperConfigurationManager *v8;

  v5 = (PBUIWallpaperConfigurationManager *)a3;
  p_wallpaperConfigurationManager = &self->_wallpaperConfigurationManager;
  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (wallpaperConfigurationManager != v5)
  {
    v8 = v5;
    -[PBUIWallpaperConfigurationManager setDelegate:](wallpaperConfigurationManager, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
    -[PBUIWallpaperConfigurationManager setDelegate:](*p_wallpaperConfigurationManager, "setDelegate:", self);
    -[PBUIWallpaperConfigurationManager setEnableWallpaperDimming:](*p_wallpaperConfigurationManager, "setEnableWallpaperDimming:", -[PBUIWallpaperDefaultsDomain enableWallpaperDimming](self->_wallpaperDefaultsStore, "enableWallpaperDimming"));
    v5 = v8;
  }

}

- (void)wallpaperEffectImageForStyle:(int64_t)a3 variant:(int64_t)a4 traitCollection:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  v11 = a5;
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PBUIWallpaperViewController_wallpaperEffectImageForStyle_variant_traitCollection_result___block_invoke;
  v14[3] = &unk_1E6B96248;
  v15 = v10;
  v13 = v10;
  +[PBUIFakeBlurView _imageForStyle:withSource:overrideTraitCollection:result:](PBUIFakeBlurView, "_imageForStyle:withSource:overrideTraitCollection:result:", a3, v12, v11, v14);

}

uint64_t __91__PBUIWallpaperViewController_wallpaperEffectImageForStyle_variant_traitCollection_result___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginSimulatedLiveWallpaperTouchWithReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (!-[PBUIWallpaperViewController activeVariant](self, "activeVariant"))
  {
    -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    objc_msgSend(v8, "beginSimulatedTouchWithReason:", v9);
  }

}

- (void)endSimulatedLiveWallpaperTouchWithReason:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "endSimulatedTouchWithReason:", v9);
}

- (int64_t)activeVariant
{
  return self->_displayedVariant;
}

- (void)setActiveVariant:(int64_t)a3
{
  -[PBUIWallpaperViewController setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:](self, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", a3, 0, 0, 0);
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  int *v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int *v26;
  void *v27;
  int *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  PBUIWallpaperView *sharedWallpaperView;
  double lockscreenOnlyWallpaperAlpha;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD *v52;
  __int128 *v53;
  double v54;
  _QWORD v55[4];
  id v56;
  id v57;
  PBUIWallpaperViewController *v58;
  double v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 *v65;
  _QWORD *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[3];
  char v71;
  __int128 v72;
  uint64_t v73;
  char v74;
  _QWORD v75[4];
  id v76;
  PBUIWallpaperViewController *v77;
  id v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (self->_displayedVariant == a3)
  {
    if (v12)
      (*((void (**)(id))v12 + 2))(v12);
  }
  else
  {
    self->_displayedVariant = a3;
    -[PBUIWallpaperViewController suspendColorSamplingForReason:](self, "suspendColorSamplingForReason:", CFSTR("settingVariant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperViewController _beginDisallowRasterizationBlock](self, "_beginDisallowRasterizationBlock");
    if (a3)
      v15 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenStyleInfo;
    else
      v15 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenStyleInfo;
    v16 = *(Class *)((char *)&self->super.super.super.isa + *v15);
    if (a3)
      v17 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenStyleInfo;
    else
      v17 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenStyleInfo;
    v18 = v16;
    v19 = *(id *)((char *)&self->super.super.super.isa + *v17);
    v20 = v19;
    v81 = 0uLL;
    v82 = 0;
    if (v19)
      objc_msgSend(v19, "styleTransitionState");
    v72 = v81;
    v73 = v82;
    v21 = -[PBUIWallpaperViewController _shouldSuspendMotionEffectsForState:](self, "_shouldSuspendMotionEffectsForState:", &v72);
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke;
    v75[3] = &unk_1E6B96270;
    v43 = v14;
    v76 = v43;
    v77 = self;
    v79 = v81;
    v80 = v82;
    v78 = v13;
    v48 = (void *)MEMORY[0x1BCCA5978](v75);
    v44 = v20;
    objc_msgSend(v20, "wallpaperEffectView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v18;
    objc_msgSend(v18, "wallpaperEffectView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);
    v47 = v22;
    objc_msgSend(v22, "setAlpha:", 0.0);
    if (self->_sharedWallpaperView)
    {
      -[PBUIWallpaperViewController _updateWallpaperHidden](self, "_updateWallpaperHidden");
      -[PBUIWallpaperViewController _updateWallpaperParallax](self, "_updateWallpaperParallax");
      -[PBUIWallpaperView setVariant:withAnimationFactory:](self->_sharedWallpaperView, "setVariant:withAnimationFactory:", a3, v11);
      v24 = 0;
      v25 = 0;
    }
    else
    {
      if (a3)
        v26 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
      else
        v26 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
      v27 = *(Class *)((char *)&self->super.super.super.isa + *v26);
      if (a3)
        v28 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
      else
        v28 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
      v24 = v27;
      v25 = *(id *)((char *)&self->super.super.super.isa + *v28);
      -[UIView sendSubviewToBack:](self->_wallpaperContainerView, "sendSubviewToBack:", v25);
      objc_msgSend(v24, "setHidden:", 0);
      objc_msgSend(v24, "setAlpha:", 0.0);
      if (objc_msgSend(v23, "currentTransitionStateIsOpaque"))
        objc_msgSend(v25, "setAlpha:", 0.0);
    }
    v46 = v13;
    if (!v21)
      -[PBUIWallpaperViewController _endSuspendingMotionEffectsForStyleIfNeeded](self, "_endSuspendingMotionEffectsForStyleIfNeeded");
    *(_QWORD *)&v72 = 0;
    *((_QWORD *)&v72 + 1) = &v72;
    v73 = 0x2020000000;
    v74 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v71 = 0;
    v29 = (void *)MEMORY[0x1E0D01908];
    v30 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2;
    v67[3] = &unk_1E6B94BC8;
    v68 = v23;
    v69 = v25;
    v60[0] = v30;
    v60[1] = 3221225472;
    v60[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3;
    v60[3] = &unk_1E6B96298;
    v31 = v69;
    v61 = v31;
    v32 = v68;
    v62 = v32;
    v33 = v24;
    v63 = v33;
    v65 = &v72;
    v66 = v70;
    v34 = v48;
    v64 = v34;
    objc_msgSend(v29, "animateWithFactory:actions:completion:", v10, v67, v60);
    if (a3)
    {
      sharedWallpaperView = self->_sharedWallpaperView;
      -[PBUIWallpaperViewController homescreenWallpaperScale](self, "homescreenWallpaperScale");
      lockscreenOnlyWallpaperAlpha = 1.0;
    }
    else
    {
      lockscreenOnlyWallpaperAlpha = self->_lockscreenOnlyWallpaperAlpha;
      sharedWallpaperView = self->_sharedWallpaperView;
      -[PBUIWallpaperViewController lockscreenWallpaperScale](self, "lockscreenWallpaperScale");
    }
    -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](sharedWallpaperView, "setZoomFactor:withAnimationFactory:", v11);
    v37 = (void *)MEMORY[0x1E0D01908];
    v38 = v31;
    v39 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4;
    v55[3] = &unk_1E6B962C0;
    v40 = v47;
    v56 = v40;
    v59 = lockscreenOnlyWallpaperAlpha;
    v57 = v33;
    v58 = self;
    v49[0] = v39;
    v49[1] = 3221225472;
    v49[2] = __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5;
    v49[3] = &unk_1E6B962E8;
    v41 = v57;
    v54 = lockscreenOnlyWallpaperAlpha;
    v50 = v41;
    v52 = v70;
    v53 = &v72;
    v42 = v34;
    v51 = v42;
    objc_msgSend(v37, "animateWithFactory:actions:completion:", v11, v55, v49);

    _Block_object_dispose(v70, 8);
    _Block_object_dispose(&v72, 8);

    v13 = v46;
  }

}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "_endDisallowRasterizationBlock");
  v2 = *(void **)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "_updateMotionEffectsForState:", &v4);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "prepareToDisappear");
  result = objc_msgSend(*(id *)(a1 + 48), "prepareToAppear");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  if ((objc_msgSend(*(id *)(a1 + 32), "currentTransitionStateIsOpaque") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1184), "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1176), "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1192), "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
}

uint64_t __102__PBUIWallpaperViewController_setActiveVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  int *v7;
  id v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
    goto LABEL_5;
  }
  if (!a4)
  {
    v7 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
LABEL_5:
    v8 = v6;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "addObject:", v6);
    v6 = v8;
  }

}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  int *v7;
  id v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
    goto LABEL_5;
  }
  if (!a4)
  {
    v7 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
LABEL_5:
    v8 = v6;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "removeObject:", v6);
    v6 = v8;
  }

}

- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4
{
  void *v6;
  PBUIWallpaperView **p_homescreenWallpaperView;
  void *v8;
  void *v9;

  if (a4)
  {
    if (a4 != 1)
      return;
    -[PBUIWallpaperStyleInfo wallpaperEffectView](self->_homescreenStyleInfo, "wallpaperEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", a3);

    p_homescreenWallpaperView = &self->_homescreenWallpaperView;
  }
  else
  {
    -[PBUIWallpaperStyleInfo wallpaperEffectView](self->_lockscreenStyleInfo, "wallpaperEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    p_homescreenWallpaperView = &self->_lockscreenWallpaperView;
    -[PBUIWallpaperView setHidden:](self->_lockscreenWallpaperView, "setHidden:", 0);
    -[PBUIWallpaperStyleInfo wallpaperEffectView](self->_lockscreenStyleInfo, "wallpaperEffectView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", a3);

  }
  -[PBUIWallpaperView setAlpha:](*p_homescreenWallpaperView, "setAlpha:", a3);
}

- (void)setLockscreenWallpaperContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PBUIWallpaperView hasContentOutsideVisibleBounds](self->_lockscreenWallpaperView, "hasContentOutsideVisibleBounds"))
  {
    -[PBUIWallpaperView setContentsRect:](self->_lockscreenWallpaperView, "setContentsRect:", x, y, width, height);
  }
  if (!self->_displayedVariant)
  {
    if (-[PBUIWallpaperView hasContentOutsideVisibleBounds](self->_sharedWallpaperView, "hasContentOutsideVisibleBounds"))
    {
      -[PBUIWallpaperView setContentsRect:](self->_sharedWallpaperView, "setContentsRect:", x, y, width, height);
    }
  }
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  double v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v4 = fmin(fmax(a3, 0.0), 1.0);
  self->_lockscreenOnlyWallpaperAlpha = v4;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
  {
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke;
    v6[3] = &unk_1E6B951E0;
    v6[4] = self;
    *(double *)&v6[5] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke_2;
    v5[3] = &unk_1E6B949E0;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, v5, 0.0);
  }
  else
  {
    -[PBUIWallpaperView setAlpha:](self->_lockscreenWallpaperView, "setAlpha:", v4);
  }
}

uint64_t __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_beginDisallowRasterizationBlock");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __63__PBUIWallpaperViewController_setLockscreenOnlyWallpaperAlpha___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDisallowRasterizationBlock");
}

- (double)minimumHomescreenWallpaperScale
{
  double result;

  -[PBUIWallpaperViewController minimumWallpaperScaleForVariant:](self, "minimumWallpaperScaleForVariant:", 1);
  return result;
}

- (double)homescreenWallpaperScale
{
  double result;

  -[PBUIWallpaperViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 1);
  return result;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIWallpaperViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

- (double)minimumLockscreenWallpaperScale
{
  double result;

  -[PBUIWallpaperViewController minimumWallpaperScaleForVariant:](self, "minimumWallpaperScaleForVariant:", 0);
  return result;
}

- (double)lockscreenWallpaperScale
{
  double result;

  -[PBUIWallpaperViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 0);
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIWallpaperViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  PBUIWallpaperView *homescreenWallpaperView;
  PBUIWallpaperView *lockscreenWallpaperView;
  id v6;

  v6 = a3;
  homescreenWallpaperView = self->_homescreenWallpaperView;
  -[PBUIWallpaperViewController homescreenWallpaperScale](self, "homescreenWallpaperScale");
  -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](homescreenWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  lockscreenWallpaperView = self->_lockscreenWallpaperView;
  -[PBUIWallpaperViewController lockscreenWallpaperScale](self, "lockscreenWallpaperScale");
  -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](lockscreenWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  if (self->_sharedWallpaperView)
  {
    if (self->_displayedVariant)
      -[PBUIWallpaperViewController homescreenWallpaperScale](self, "homescreenWallpaperScale");
    else
      -[PBUIWallpaperViewController lockscreenWallpaperScale](self, "lockscreenWallpaperScale");
    -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](self->_sharedWallpaperView, "setZoomFactor:withAnimationFactory:", v6);
  }

}

- (double)_wallpaperScaleForVariant:(int64_t)a3
{
  double v5;
  NSHashTable *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_wallpaperScaleAssertions;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v8 = 1.0;
    v9 = 1.0;
    if (v7)
    {
      v10 = v7;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (-[PBUIWallpaperScaleAssertion variant](v13) == a3)
          {
            v14 = -[PBUIWallpaperScaleAssertion scale](v13);
            if (v14 < v9)
              v9 = v14;
            if (v14 >= v8)
              v8 = v14;
          }
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (v8 <= 1.0)
      return v9;
    else
      return v8;
  }
  return v5;
}

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  PBUIWallpaperScaleAssertion *v7;
  void *v8;
  double *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v7 = [PBUIWallpaperScaleAssertion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper scale %f"), *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PBUIWallpaperViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v13[3] = &unk_1E6B95310;
  objc_copyWeak(&v14, &location);
  v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v13, a4);

  PBUILogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring wallpaper scale assertion %@", buf, 0xCu);

  }
  -[NSHashTable addObject:](self->_wallpaperScaleAssertions, "addObject:", v9);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

void __72__PBUIWallpaperViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PBUILogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Removing wallpaper scale assertion %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(WeakRetained[141], "removeObject:", v5);
    objc_msgSend(WeakRetained, "_updateWallpaperScaleWithAnimationFactory:", v6);
  }

}

- (double)minimumWallpaperScaleForVariant:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parallaxFactor");
  v6 = v5;

  -[PBUIWallpaperViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wallpaperSize");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v7, "parallaxDeviceType");
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v12, 1, v9, v11, v6);
  v14 = v13;
  v16 = v15;
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v12, 1, v9, v11, 0.0);
  v18 = v17 / v16;
  v20 = v19 / v14;
  if (v18 >= v20)
    v21 = v18;
  else
    v21 = v20;

  return v21;
}

- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  id v12;

  v6 = a3;
  v8 = a5;
  v12 = v8;
  if (a4 == 1)
  {
    v11 = -[PBUIWallpaperViewController _setDisallowRasterization:withReason:reasons:](self, "_setDisallowRasterization:withReason:reasons:", v6, v8, self->_disallowRasterizationReasonsHomeVariant);
    v9 = v12;
    if (!v11)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9 = v8;
  if (!a4)
  {
    v10 = -[PBUIWallpaperViewController _setDisallowRasterization:withReason:reasons:](self, "_setDisallowRasterization:withReason:reasons:", v6, v8, self->_disallowRasterizationReasonsLockVariant);
    v9 = v12;
    if (v10)
    {
LABEL_4:
      -[PBUIWallpaperViewController _updateRasterizationState](self, "_updateRasterizationState");
      v9 = v12;
    }
  }
LABEL_5:

}

- (void)setColorSamplingDisabled:(BOOL)a3
{
  BSInvalidatable *colorSamplingAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;

  if (self->_colorSamplingDisabled != a3)
  {
    self->_colorSamplingDisabled = a3;
    colorSamplingAssertion = self->_colorSamplingAssertion;
    if (a3)
    {
      if (colorSamplingAssertion)
        return;
      -[PBUIWallpaperViewController suspendColorSamplingForReason:](self, "suspendColorSamplingForReason:", CFSTR("ExplicitlyDisabled"));
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!colorSamplingAssertion)
        return;
      -[BSInvalidatable invalidate](colorSamplingAssertion, "invalidate");
      v5 = 0;
    }
    v6 = self->_colorSamplingAssertion;
    self->_colorSamplingAssertion = v5;

  }
}

- (id)suspendColorSamplingForReason:(id)a3
{
  id v4;
  _PBUIWallpaperViewControllerAssertion *v5;

  v4 = a3;
  v5 = -[_PBUIWallpaperViewControllerAssertion initWithWallpaperViewController:type:reason:]([_PBUIWallpaperViewControllerAssertion alloc], "initWithWallpaperViewController:type:reason:", self, 0, v4);

  -[NSHashTable addObject:](self->_suspendColorSamplingAssertions, "addObject:", v5);
  -[PBUIWallpaperViewController _suspendOrResumeColorSampling](self, "_suspendOrResumeColorSampling");
  return v5;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v4;
  _PBUIWallpaperViewControllerAssertion *v5;
  NSObject *v6;
  NSHashTable *suspendWallpaperAnimationAssertions;
  int v9;
  _PBUIWallpaperViewControllerAssertion *v10;
  __int16 v11;
  NSHashTable *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_PBUIWallpaperViewControllerAssertion initWithWallpaperViewController:type:reason:]([_PBUIWallpaperViewControllerAssertion alloc], "initWithWallpaperViewController:type:reason:", self, 1, v4);

  -[NSHashTable addObject:](self->_suspendWallpaperAnimationAssertions, "addObject:", v5);
  -[PBUIWallpaperViewController _suspendOrResumeWallpaperAnimation](self, "_suspendOrResumeWallpaperAnimation");
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    suspendWallpaperAnimationAssertions = self->_suspendWallpaperAnimationAssertions;
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = suspendWallpaperAnimationAssertions;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_INFO, "Adding wallpaper animation (and parallax) assertion: %@ \nAll assertions: %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)cancelInProcessAnimations
{
  void *v2;
  id v3;

  -[PBUIWallpaperViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllRetargetableAnimations:", 1);

}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  void *v4;
  $1D129F7B4C980C50E70029647222EF17 *result;
  void *v6;

  -[PBUIWallpaperViewController homescreenStyleInfo](self, "homescreenStyleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "styleTransitionState");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0.0;
  }

  return result;
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10;
  _BYTE v12[24];

  v10 = a6;
  PBUIWallpaperStyleTransitionStateMake(a3, a3, (uint64_t)v12, 0.0);
  LOBYTE(a5) = -[PBUIWallpaperViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:](self, "setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:", v12, a4, a5, v10);

  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  _BYTE v19[31];
  _BYTE buf[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  if ((unint64_t)a4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 646, CFSTR("invalid wallpaper style priority (%i)"), a4);

  }
  PBUILogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    PBUIStringForWallpaperVariant(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(double *)&buf[16] = a3->var2;
    PBUIStringForStyleTransitionState((unint64_t *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v14;
    _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_INFO, "Set wallpaper style state for priority %li for variant %{public}@ to %{public}@", buf, 0x20u);

  }
  -[PBUIWallpaperViewController wallpaperStyleInfoForVariant:](self, "wallpaperStyleInfoForVariant:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v19[3] = 0;
  *(_DWORD *)v19 = 0;
  *(double *)&v19[23] = a3->var2;
  *(_OWORD *)&v19[7] = *(_OWORD *)&a3->var0;
  buf[0] = 1;
  *(_OWORD *)&buf[1] = *(_OWORD *)v19;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v19[15];
  objc_msgSend(v15, "setPriorityInfo:forPriority:", buf, a4);
  v16 = -[PBUIWallpaperViewController _updateEffectViewForVariant:withFactory:](self, "_updateEffectViewForVariant:withFactory:", a5, v11);

  return v16;
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 658, CFSTR("invalid wallpaper style priority (%i)"), a3);

  }
  PBUILogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    PBUIStringForWallpaperVariant(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v17 = a3;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_INFO, "Remove wallpaper style for priority %li for variant %{public}@", buf, 0x16u);

  }
  -[PBUIWallpaperViewController wallpaperStyleInfoForVariant:](self, "wallpaperStyleInfoForVariant:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removePriorityInfoForPriority:", a3);
  v13 = -[PBUIWallpaperViewController _updateEffectViewForVariant:withFactory:](self, "_updateEffectViewForVariant:withFactory:", a4, v9);

  return v13;
}

- (id)requireWallpaperWithReason:(id)a3
{
  id v4;
  _PBUIWallpaperViewControllerAssertion *v5;

  v4 = a3;
  v5 = -[_PBUIWallpaperViewControllerAssertion initWithWallpaperViewController:type:reason:]([_PBUIWallpaperViewControllerAssertion alloc], "initWithWallpaperViewController:type:reason:", self, 2, v4);

  -[NSHashTable addObject:](self->_requireWallpaperAssertions, "addObject:", v5);
  -[PBUIWallpaperViewController _updateWallpaperHidden](self, "_updateWallpaperHidden");
  return v5;
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  id v3;

  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preheatImageData");

}

- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3
{
  id v5;
  NSMutableSet *homescreenStyleChangeDelayReasons;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 682, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  homescreenStyleChangeDelayReasons = self->_homescreenStyleChangeDelayReasons;
  if (!homescreenStyleChangeDelayReasons)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_homescreenStyleChangeDelayReasons;
    self->_homescreenStyleChangeDelayReasons = v7;

    v5 = v10;
    homescreenStyleChangeDelayReasons = self->_homescreenStyleChangeDelayReasons;
  }
  -[NSMutableSet addObject:](homescreenStyleChangeDelayReasons, "addObject:", v5);

}

- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4
{
  id v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 691, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v8 = -[PBUIWallpaperViewController shouldDelayHomescreenStyleUpdates](self, "shouldDelayHomescreenStyleUpdates");
  -[NSMutableSet removeObject:](self->_homescreenStyleChangeDelayReasons, "removeObject:", v11);
  v9 = -[PBUIWallpaperViewController shouldDelayHomescreenStyleUpdates](self, "shouldDelayHomescreenStyleUpdates");
  if (v8 && !v9)
    -[PBUIWallpaperViewController _updateEffectViewForVariant:withFactory:](self, "_updateEffectViewForVariant:withFactory:", 1, v7);

}

- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer
{
  PBUIWallpaperView **p_lockscreenWallpaperView;
  PBUIWallpaperView *v4;

  p_lockscreenWallpaperView = &self->_lockscreenWallpaperView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (p_lockscreenWallpaperView = &self->_sharedWallpaperView, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *p_lockscreenWallpaperView;
  }
  else
  {
    v4 = 0;
  }
  return (PBUIIrisWallpaperPlaying *)v4;
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  PBUIWallpaperView *sharedWallpaperView;
  PBUIWallpaperView *v3;
  BOOL v4;

  sharedWallpaperView = self->_sharedWallpaperView;
  if (!sharedWallpaperView)
    sharedWallpaperView = self->_lockscreenWallpaperView;
  v3 = sharedWallpaperView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[PBUIWallpaperView irisPlaybackState](v3, "irisPlaybackState"))
    {
      v4 = 0;
    }
    else
    {
      v4 = 1;
      -[PBUIWallpaperView switchToIrisMode:](v3, "switchToIrisMode:", 1);
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)updateIrisWallpaperForInteractiveMode
{
  PBUIWallpaperView *sharedWallpaperView;
  PBUIWallpaperView *v3;

  sharedWallpaperView = self->_sharedWallpaperView;
  if (!sharedWallpaperView)
    sharedWallpaperView = self->_lockscreenWallpaperView;
  v3 = sharedWallpaperView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PBUIWallpaperView switchToIrisMode:](v3, "switchToIrisMode:", 0);

}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  int v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperView setRotating:](self->_sharedWallpaperView, "setRotating:", 1);
  -[PBUIWallpaperView setRotating:](self->_homescreenWallpaperView, "setRotating:", 1);
  -[PBUIWallpaperView setRotating:](self->_lockscreenWallpaperView, "setRotating:", 1);
  -[PBUIWallpaperViewController _activeWallpaperView](self, "_activeWallpaperView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "needsImmediateLayoutBeforeRotation");

  if (v6)
    -[UIView layoutIfNeeded](self->_wallpaperContainerView, "layoutIfNeeded");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_lockscreenBlurViews;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "rotateToInterfaceOrientation:", a3);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_homescreenBlurViews;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "rotateToInterfaceOrientation:", a3, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if (a3 != 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PBUIWallpaperView switchToIrisMode:](self->_sharedWallpaperView, "switchToIrisMode:", 1);
  }
}

- (void)noteDidRotateFromInterfaceOrientation:(int64_t)a3
{
  -[PBUIWallpaperView setRotating:](self->_sharedWallpaperView, "setRotating:", 0);
  -[PBUIWallpaperView setRotating:](self->_homescreenWallpaperView, "setRotating:", 0);
  -[PBUIWallpaperView setRotating:](self->_lockscreenWallpaperView, "setRotating:", 0);
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained;
  uint64_t v10;
  _BOOL4 IsReduceTransparencyEnabled;
  PBUIAccessibilityTintView *v12;
  PBUIFakeBlurView *v13;
  void *v14;
  _QWORD v16[4];
  PBUIAccessibilityTintView *v17;
  uint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  v10 = objc_msgSend(WeakRetained, "wallpaperPresenter:requestsOrientationWithRefresh:", self, 1);

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (a4 && IsReduceTransparencyEnabled)
  {
    v12 = -[PBUIAccessibilityTintView initWithVariant:wallpaperViewController:]([PBUIAccessibilityTintView alloc], "initWithVariant:wallpaperViewController:", a3, self);
    -[PBUIAccessibilityTintView setTransformOptions:](v12, "setTransformOptions:", a5);
  }
  else
  {
    v13 = -[PBUIFakeBlurView initWithVariant:wallpaperViewController:transformOptions:reachabilityCoordinator:]([PBUIFakeBlurView alloc], "initWithVariant:wallpaperViewController:transformOptions:reachabilityCoordinator:", a3, self, a5, self->_reachabilityCoordinator);
    v12 = (PBUIAccessibilityTintView *)v13;
    if (v10)
    {
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__PBUIWallpaperViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
      v16[3] = &unk_1E6B951E0;
      v12 = v13;
      v17 = v12;
      v18 = v10;
      objc_msgSend(v14, "performWithoutAnimation:", v16);

    }
  }
  return v12;
}

uint64_t __80__PBUIWallpaperViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rotateToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
  -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", a3, 0, 0, a4);
}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
  -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", a3, 0, a4, a5);
}

- (BOOL)homeScreenPosterMirrorsLock
{
  return self->_sharedWallpaperView != 0;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  PBUIWallpaperView *sharedWallpaperView;
  uint64_t v4;
  id v6;

  if (self->_sharedWallpaperView)
  {
    sharedWallpaperView = self->_sharedWallpaperView;
  }
  else
  {
    if (a3)
    {
      if (a3 != 1)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid wallpaper variant to legibilitySettingsForVariant:"), 0);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v6);
      }
      v4 = 1184;
    }
    else
    {
      v4 = 1176;
    }
    sharedWallpaperView = *(PBUIWallpaperView **)((char *)&self->super.super.super.isa + v4);
  }
  -[PBUIWallpaperView legibilitySettings](sharedWallpaperView, "legibilitySettings", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)averageColorForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperViewController legibilitySettingsForVariant:](self, "legibilitySettingsForVariant:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return -[PBUIWallpaperViewController averageColorInRect:forVariant:withSmudgeRadius:](self, "averageColorInRect:forVariant:withSmudgeRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_5;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (CGRectIsNull(v27))
    goto LABEL_5;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (CGRectIsEmpty(v28))
    goto LABEL_5;
  -[PBUIWallpaperViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinateSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v16, x, y, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v12, "averageColorInRect:withSmudgeRadius:", v18, v20, v22, v24, a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
LABEL_5:
    -[PBUIWallpaperViewController averageColorForVariant:](self, "averageColorForVariant:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (double)contrastForVariant:(int64_t)a3
{
  double v3;
  void *v4;
  void *v5;
  double v6;

  v3 = *(double *)&PBUIWallpaperViewUnknownContrast;
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contrast");
    v3 = v6;
  }

  return v3;
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = *(double *)&PBUIWallpaperViewUnknownContrast;
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PBUIWallpaperViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromCoordinateSpace:", v14, x, y, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(v10, "contrastInRect:", v16, v18, v20, v22);
    v9 = v23;
  }

  return v9;
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[PBUIWallpaperViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationForVariant:includingValuesForTypes:", 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  PBUIWallpaperView *v4;
  void *v5;
  void *v6;
  PBUIWallpaperView *v7;

  v4 = (PBUIWallpaperView *)a3;
  v7 = v4;
  if (self->_lockscreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    -[PBUIWallpaperView legibilitySettings](v4, "legibilitySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperViewController _handleWallpaperLegibilitySettingsChanged:forVariant:](self, "_handleWallpaperLegibilitySettingsChanged:forVariant:", v5, 0);

    v4 = v7;
  }
  if (self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    -[PBUIWallpaperView legibilitySettings](v7, "legibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperViewController _handleWallpaperLegibilitySettingsChanged:forVariant:](self, "_handleWallpaperLegibilitySettingsChanged:forVariant:", v6, 1);

    v4 = v7;
  }

}

- (void)wallpaperViewDidInvalidateBlurs:(id)a3
{
  PBUIWallpaperView *v4;
  PBUIWallpaperView *v5;

  v4 = (PBUIWallpaperView *)a3;
  v5 = v4;
  if (self->_lockscreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", 0);
    v4 = v5;
  }
  if (self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v5)
    -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 0);

}

- (void)wallpaperView:(id)a3 didChangeZoomFactor:(double)a4
{
  PBUIWallpaperView *v5;
  PBUIWallpaperView *v6;

  v5 = (PBUIWallpaperView *)a3;
  v6 = v5;
  if (self->_lockscreenWallpaperView == v5 || self->_sharedWallpaperView == v5)
  {
    -[PBUIWallpaperViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 0);
    v5 = v6;
  }
  if (self->_homescreenWallpaperView == v5 || self->_sharedWallpaperView == v5)
  {
    -[PBUIWallpaperViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 1);
    v5 = v6;
  }

}

- (void)wallpaperViewDidChangeWantsRasterization:(id)a3
{
  PBUIWallpaperView *v4;
  PBUIWallpaperView *v5;

  v4 = (PBUIWallpaperView *)a3;
  if (self->_lockscreenWallpaperView == v4 || self->_homescreenWallpaperView == v4 || self->_sharedWallpaperView == v4)
  {
    v5 = v4;
    -[PBUIWallpaperViewController _updateRasterizationState](self, "_updateRasterizationState");
    v4 = v5;
  }

}

- (id)wallpaperConfigurationManager:(id)a3 legibilitySettingsForVariant:(int64_t)a4
{
  return -[PBUIWallpaperViewController legibilitySettingsForVariant:](self, "legibilitySettingsForVariant:", a4);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", 0, a4);
  -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", 1);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  PBUIWallpaperViewController *v21;
  _QWORD v22[4];
  id v23;
  PBUIWallpaperViewController *v24;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v22[3] = &unk_1E6B94BC8;
  v8 = v6;
  v23 = v8;
  v24 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("HomeScreen"), v5, v22);
  v16 = v7;
  v17 = 3221225472;
  v18 = __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v19 = &unk_1E6B94BC8;
  v9 = v8;
  v20 = v9;
  v21 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("LockScreen"), v5, &v16);

  if (-[NSHashTable count](self->_suspendColorSamplingAssertions, "count", v16, v17, v18, v19))
    v10 = (id)objc_msgSend(v9, "appendObject:withName:", self->_suspendColorSamplingAssertions, CFSTR("suspendColorSamplingAssertions"));
  if (-[NSHashTable count](self->_suspendWallpaperAnimationAssertions, "count"))
    v11 = (id)objc_msgSend(v9, "appendObject:withName:", self->_suspendWallpaperAnimationAssertions, CFSTR("suspendWallpaperAnimationAssertions"));
  if (-[NSHashTable count](self->_requireWallpaperAssertions, "count"))
    v12 = (id)objc_msgSend(v9, "appendObject:withName:", self->_requireWallpaperAssertions, CFSTR("requireWallpaperAssertions"));
  v13 = (id)objc_msgSend(v9, "appendObject:withName:", self->_wallpaperConfigurationManager, CFSTR("wallpaperConfigurationManager"));
  v14 = v9;

  return v14;
}

void __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homescreenStyleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("StyleInfo"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("homescreenStyleChangeDelayReasons"), 1);

}

void __69__PBUIWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lockscreenStyleInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("StyleInfo"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (BOOL)_isRasterizationDisallowedForCurrentVariant
{
  int64_t displayedVariant;
  int *v3;
  id v4;
  BOOL v5;

  displayedVariant = self->_displayedVariant;
  if (displayedVariant == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperViewController__disallowRasterizationReasonsHomeVariant;
  }
  else
  {
    if (displayedVariant)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = &OBJC_IVAR___PBUIWallpaperViewController__disallowRasterizationReasonsLockVariant;
  }
  v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
LABEL_7:
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)_setDisallowRasterization:(BOOL)a3 withReason:(id)a4 reasons:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  int v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "containsObject:", v7);
  if (!v6)
  {
    if (v9)
    {
      objc_msgSend(v8, "removeObject:", v7);
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((v9 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v8, "addObject:", v7);
LABEL_6:
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)_beginDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount;

  disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  self->_disallowRasterizationBlockCount = disallowRasterizationBlockCount + 1;
  if (!disallowRasterizationBlockCount)
    -[PBUIWallpaperViewController _updateRasterizationState](self, "_updateRasterizationState");
}

- (void)_endDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount;
  int64_t v4;
  void *v6;

  disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  if (disallowRasterizationBlockCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 1016, CFSTR("unpaired disallowRastrizationBlock decrement"));

    disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  }
  v4 = disallowRasterizationBlockCount - 1;
  self->_disallowRasterizationBlockCount = v4;
  if (!v4)
    -[PBUIWallpaperViewController _updateRasterizationState](self, "_updateRasterizationState");
}

- (void)_updateRasterizationState
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  if (self->_disallowRasterizationBlockCount > 0
    || -[PBUIWallpaperViewController _isRasterizationDisallowedForCurrentVariant](self, "_isRasterizationDisallowedForCurrentVariant"))
  {
    v3 = 0;
  }
  else
  {
    -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", self->_displayedVariant);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "wantsRasterization");

  }
  -[UIView layer](self->_wallpaperContainerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRasterize");

  if ((_DWORD)v3 != v6)
  {
    -[UIView layer](self->_wallpaperContainerView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldRasterize:", v3);

  }
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return 0;
}

- (id)wallpaperViewForVariant:(int64_t)a3
{
  PBUIWallpaperView *sharedWallpaperView;
  int *v4;

  sharedWallpaperView = self->_sharedWallpaperView;
  if (!sharedWallpaperView)
  {
    if (a3 == 1)
    {
      v4 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenWallpaperView;
    }
    else
    {
      if (a3)
        return 0;
      v4 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenWallpaperView;
    }
    sharedWallpaperView = *(PBUIWallpaperView **)((char *)&self->super.super.super.isa + *v4);
  }
  return sharedWallpaperView;
}

- (id)_activeWallpaperView
{
  return -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", -[PBUIWallpaperViewController activeVariant](self, "activeVariant"));
}

- (void)_suspendOrResumeColorSampling
{
  _BOOL8 v3;

  v3 = -[NSHashTable count](self->_suspendColorSamplingAssertions, "count") == 0;
  -[PBUIWallpaperView setContinuousColorSamplingEnabled:](self->_lockscreenWallpaperView, "setContinuousColorSamplingEnabled:", v3);
  -[PBUIWallpaperView setContinuousColorSamplingEnabled:](self->_homescreenWallpaperView, "setContinuousColorSamplingEnabled:", v3);
  -[PBUIWallpaperView setContinuousColorSamplingEnabled:](self->_sharedWallpaperView, "setContinuousColorSamplingEnabled:", v3);
}

- (void)_suspendOrResumeWallpaperAnimation
{
  _BOOL8 v3;

  v3 = -[NSHashTable count](self->_suspendWallpaperAnimationAssertions, "count") == 0;
  -[PBUIWallpaperView setWallpaperAnimationEnabled:](self->_lockscreenWallpaperView, "setWallpaperAnimationEnabled:", v3);
  -[PBUIWallpaperView setWallpaperAnimationEnabled:](self->_homescreenWallpaperView, "setWallpaperAnimationEnabled:", v3);
  -[PBUIWallpaperView setWallpaperAnimationEnabled:](self->_sharedWallpaperView, "setWallpaperAnimationEnabled:", v3);
}

- (void)_invalidateWallpaperAssertion:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "type");
  if (v4 == 2)
  {
    -[PBUIWallpaperViewController removeWallpaperRequiredAssertion:](self, "removeWallpaperRequiredAssertion:", v6);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    -[PBUIWallpaperViewController _removeWallpaperAnimationAssertion:](self, "_removeWallpaperAnimationAssertion:", v6);
    goto LABEL_7;
  }
  v5 = v6;
  if (!v4)
  {
    -[PBUIWallpaperViewController _removeColorSamplingAssertion:](self, "_removeColorSamplingAssertion:", v6);
LABEL_7:
    v5 = v6;
  }

}

- (void)_removeColorSamplingAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_suspendColorSamplingAssertions, "removeObject:", a3);
  -[PBUIWallpaperViewController _suspendOrResumeColorSampling](self, "_suspendOrResumeColorSampling");
}

- (void)_removeWallpaperAnimationAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *suspendWallpaperAnimationAssertions;
  int v7;
  id v8;
  __int16 v9;
  NSHashTable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable removeObject:](self->_suspendWallpaperAnimationAssertions, "removeObject:", v4);
  -[PBUIWallpaperViewController _suspendOrResumeWallpaperAnimation](self, "_suspendOrResumeWallpaperAnimation");
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    suspendWallpaperAnimationAssertions = self->_suspendWallpaperAnimationAssertions;
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = suspendWallpaperAnimationAssertions;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_INFO, "Removing wallpaper animation (and parallax) assertion: %@ \nAll assertions: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)wallpaperStyleInfoForVariant:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[PBUIWallpaperViewController homescreenStyleInfo](self, "homescreenStyleInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PBUIWallpaperViewController lockscreenStyleInfo](self, "lockscreenStyleInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  int *v6;
  void *v7;

  v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideHomescreenWallpaperReasons;
  if (!a4)
    v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideLockscreenWallpaperReasons;
  v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  if (a3)
    objc_msgSend(v7, "addObject:", a5);
  else
    objc_msgSend(v7, "removeObject:", a5);
  -[PBUIWallpaperViewController _updateWallpaperHidden](self, "_updateWallpaperHidden");
}

- (BOOL)_isWallpaperHiddenForVariant:(int64_t)a3
{
  int *v6;

  if (-[NSHashTable count](self->_requireWallpaperAssertions, "count"))
    return 0;
  v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideHomescreenWallpaperReasons;
  if (!a3)
    v6 = &OBJC_IVAR___PBUIWallpaperViewController__hideLockscreenWallpaperReasons;
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "count") != 0;
}

- (void)_updateWallpaperHidden
{
  _BOOL4 v3;
  PBUIWallpaperView *sharedWallpaperView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[PBUIWallpaperViewController _isWallpaperHiddenForVariant:](self, "_isWallpaperHiddenForVariant:", self->_displayedVariant);
  sharedWallpaperView = self->_sharedWallpaperView;
  if (v3)
  {
    -[PBUIWallpaperView setHidden:](sharedWallpaperView, "setHidden:", 1);
    -[PBUIWallpaperView setHidden:](self->_lockscreenWallpaperView, "setHidden:", 1);
    -[PBUIWallpaperView setHidden:](self->_homescreenWallpaperView, "setHidden:", 1);
    -[PBUIWallpaperViewController lockscreenStyleInfo](self, "lockscreenStyleInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wallpaperEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PBUIWallpaperViewController homescreenStyleInfo](self, "homescreenStyleInfo");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaperEffectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
  else
  {
    -[PBUIWallpaperView setHidden:](sharedWallpaperView, "setHidden:", 0);
    -[PBUIWallpaperView setHidden:](self->_lockscreenWallpaperView, "setHidden:", self->_displayedVariant != 0);
    -[PBUIWallpaperView setHidden:](self->_homescreenWallpaperView, "setHidden:", self->_displayedVariant != 1);
    -[PBUIWallpaperViewController lockscreenStyleInfo](self, "lockscreenStyleInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wallpaperEffectView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", self->_displayedVariant != 0);

    -[PBUIWallpaperViewController homescreenStyleInfo](self, "homescreenStyleInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wallpaperEffectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", self->_displayedVariant != 1);

    -[PBUIWallpaperViewController _updateEffectViewForVariant:withFactory:](self, "_updateEffectViewForVariant:withFactory:", self->_displayedVariant, 0);
  }
}

- (void)removeWallpaperRequiredAssertion:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_requireWallpaperAssertions, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_requireWallpaperAssertions, "removeObject:", v4);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PBUIWallpaperViewController_removeWallpaperRequiredAssertion___block_invoke;
    v5[3] = &unk_1E6B94CB8;
    v5[4] = self;
    PBUIWallpaperEnumerateVariantsForLocations(3, v5);
    -[PBUIWallpaperViewController _updateWallpaperHidden](self, "_updateWallpaperHidden");
  }

}

uint64_t __64__PBUIWallpaperViewController_removeWallpaperRequiredAssertion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEffectViewForVariant:withFactory:", a2, 0);
}

- (void)_updateWallpaperParallax
{
  void *v3;
  PBUIWallpaperView *sharedWallpaperView;
  void *v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  -[PBUIWallpaperViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sharedWallpaperView = self->_sharedWallpaperView;
  v13 = v3;
  objc_msgSend(v3, "lockScreenWallpaperConfigurationIncludingValuesForTypes:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parallaxFactor");
  v8 = fabs(v7) >= 2.22044605e-16;
  if (sharedWallpaperView)
  {
    -[PBUIWallpaperView setParallaxFactor:](self->_sharedWallpaperView, "setParallaxFactor:");
    -[PBUIWallpaperView setParallaxEnabled:](self->_sharedWallpaperView, "setParallaxEnabled:", v8);
  }
  else
  {
    -[PBUIWallpaperView setParallaxFactor:](self->_lockscreenWallpaperView, "setParallaxFactor:");
    -[PBUIWallpaperView setParallaxEnabled:](self->_lockscreenWallpaperView, "setParallaxEnabled:", v8);
    objc_msgSend(v13, "homeScreenWallpaperConfigurationIncludingValuesForTypes:", 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "parallaxFactor");
    v12 = v11;
    -[PBUIWallpaperView setParallaxFactor:](self->_homescreenWallpaperView, "setParallaxFactor:");
    -[PBUIWallpaperView setParallaxEnabled:](self->_homescreenWallpaperView, "setParallaxEnabled:", fabs(v12) >= 2.22044605e-16);

  }
}

+ (id)substitutionFlatColorForWallpaperName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR(".Solid_Black")) & 1) != 0
    || objc_msgSend(v3, "hasSuffix:", CFSTR(".Solid Black")))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)substitutionWallpaperConfigurationForWallpaperConfiguration:(id)a3
{
  PBUIWallpaperConfiguration *v3;
  PBUIWallpaperConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (PBUIWallpaperConfiguration *)a3;
  v4 = v3;
  if (-[PBUIWallpaperConfiguration wallpaperType](v3, "wallpaperType") == 1)
  {
    -[PBUIWallpaperConfiguration wallpaperOptions](v3, "wallpaperOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "substitutionFlatColorForWallpaperName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v7)
      {
        v8 = (void *)v7;
        PBUILogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11 = 138412546;
          v12 = v8;
          v13 = 2112;
          v14 = v6;
          _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_INFO, "Substituting flat color '%@' for wallpaper with name '%@'", (uint8_t *)&v11, 0x16u);
        }

        v4 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", -[PBUIWallpaperConfiguration variant](v3, "variant"), 4);
        -[PBUIWallpaperConfiguration setWallpaperColor:](v4, "setWallpaperColor:", v8);
        -[PBUIWallpaperConfiguration setWallpaperOptions:](v4, "setWallpaperOptions:", v5);

      }
    }

  }
  return v4;
}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6
{
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a6;
  if (-[PBUIWallpaperViewController variantsShareWallpaper](self, "variantsShareWallpaper"))
    -[PBUIWallpaperViewController _updateSharedWallpaperWithOptions:wallpaperMode:](self, "_updateSharedWallpaperWithOptions:wallpaperMode:", a4, a5);
  else
    -[PBUIWallpaperViewController _updateSeparateWallpaperForVariants:options:wallpaperMode:](self, "_updateSeparateWallpaperForVariants:options:wallpaperMode:", a3, a4, a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__PBUIWallpaperViewController__updateWallpaperForLocations_options_wallpaperMode_withCompletion___block_invoke;
  v12[3] = &unk_1E6B94728;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

uint64_t __97__PBUIWallpaperViewController__updateWallpaperForLocations_options_wallpaperMode_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperScaleWithAnimationFactory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLockscreenOnlyWallpaperAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 1056));
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperParallax");
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperHidden");
  objc_msgSend(*(id *)(a1 + 32), "_updateBlurGeneration");
  objc_msgSend(*(id *)(a1 + 32), "_suspendOrResumeColorSampling");
  return objc_msgSend(*(id *)(a1 + 32), "_suspendOrResumeWallpaperAnimation");
}

- (BOOL)_isWallpaperView:(id)a3 displayingWallpaperWithConfiguration:(id)a4 forVariant:(int64_t)a5
{
  return objc_msgSend(a3, "isDisplayingWallpaperWithConfiguration:forVariant:", a4, a5);
}

- (void)_updateSharedWallpaperWithOptions:(unint64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  PBUIWallpaperView *sharedWallpaperView;
  PBUIWallpaperView *v9;
  PBUIWallpaperView *v10;
  int v11;
  int v12;
  PBUIWallpaperView *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  PBUIWallpaperView *v26;
  BOOL v27;
  PBUIWallpaperView *v28;
  int64_t displayedVariant;
  PBUIWallpaperView *v30;
  PBUIWallpaperView *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PBUIWallpaperView *v40;
  void *v41;
  void *v42;
  PBUIWallpaperView *v43;
  int v44;
  PBUIWallpaperView *v45;
  int v46;
  PBUIWallpaperView *v47;
  _QWORD v48[5];
  PBUIWallpaperView *v49;
  PBUIWallpaperView *v50;
  PBUIWallpaperView *v51;
  _QWORD v52[4];
  PBUIWallpaperView *v53;
  PBUIWallpaperView *v54;
  PBUIWallpaperView *v55;
  PBUIWallpaperViewController *v56;
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sharedWallpaperView = self->_sharedWallpaperView;
  if (sharedWallpaperView)
  {
    if (-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", sharedWallpaperView, v7, 0))
    {
      v46 = 0;
      v9 = 0;
      v47 = 0;
      v10 = 0;
      v11 = 0;
    }
    else
    {
      v9 = self->_sharedWallpaperView;
      -[UIView subviews](self->_wallpaperContainerView, "subviews");
      v21 = a3;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "indexOfObject:", self->_sharedWallpaperView);

      v24 = MEMORY[0x1BCCA57C8]();
      -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_sharedWallpaperView);
      -[PBUIWallpaperViewController setSharedWallpaperView:](self, "setSharedWallpaperView:", 0);
      v25 = (void *)v24;
      a3 = v21;
      objc_autoreleasePoolPop(v25);
      -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v9, v23);
      v47 = 0;
      v10 = 0;
      v46 = 1;
      v11 = 1;
    }
  }
  else
  {
    v12 = !-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_lockscreenWallpaperView, v7, 0);
    v13 = self->_lockscreenWallpaperView;
    -[UIView subviews](self->_wallpaperContainerView, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", self->_lockscreenWallpaperView);

    v16 = (void *)MEMORY[0x1BCCA57C8]();
    -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_lockscreenWallpaperView);
    -[PBUIWallpaperViewController setLockscreenWallpaperView:](self, "setLockscreenWallpaperView:", 0);
    objc_autoreleasePoolPop(v16);
    v47 = v13;
    v17 = v15;
    v11 = v12;
    -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v13, v17);
    v46 = !-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_homescreenWallpaperView, v7, 1);
    v10 = self->_homescreenWallpaperView;
    -[UIView subviews](self->_wallpaperContainerView, "subviews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "indexOfObject:", self->_homescreenWallpaperView);

    v20 = (void *)MEMORY[0x1BCCA57C8]();
    -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_homescreenWallpaperView);
    -[PBUIWallpaperViewController setHomescreenWallpaperView:](self, "setHomescreenWallpaperView:", 0);
    objc_autoreleasePoolPop(v20);
    -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v10, v19);
    v9 = 0;
  }
  v26 = self->_sharedWallpaperView;
  if (v26)
    v27 = v9 == 0;
  else
    v27 = 0;
  if (!v27)
  {
    v28 = v10;
    v44 = v11;
    if (self->_displayedVariant == -1)
      displayedVariant = 0;
    else
      displayedVariant = self->_displayedVariant;
    -[PBUIWallpaperViewController _makeWallpaperViewWithConfiguration:forVariant:shared:options:](self, "_makeWallpaperViewWithConfiguration:forVariant:shared:options:", v7, displayedVariant, 1, a3);
    v30 = (PBUIWallpaperView *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperView setAlpha:](v30, "setAlpha:", 0.0);
    if (v30)
      -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v30, 0);
    v31 = self->_sharedWallpaperView;
    self->_sharedWallpaperView = v30;
    v43 = v30;

    v32 = (void *)MEMORY[0x1E0CEABB0];
    v33 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke;
    v52[3] = &unk_1E6B94ED8;
    v53 = v9;
    v54 = v47;
    v55 = v28;
    v56 = self;
    v48[0] = v33;
    v48[1] = 3221225472;
    v48[2] = __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke_2;
    v48[3] = &unk_1E6B96310;
    v48[4] = self;
    v49 = v53;
    v50 = v54;
    v51 = v55;
    objc_msgSend(v32, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v52, v48, 1.0, 0.0, 0.99, 0.0);

    v10 = v28;
    v26 = self->_sharedWallpaperView;
    v11 = v44;
  }
  -[PBUIWallpaperView prepareToAppear](v26, "prepareToAppear", v43);
  if ((unint64_t)a4 < 2)
  {
    v34 = (void *)MEMORY[0x1E0CEAB40];
    v35 = 1;
    goto LABEL_21;
  }
  if (a4 == 3)
  {
    v37 = (void *)MEMORY[0x1E0CEAB40];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v45 = v10;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v38;
    objc_msgSend(MEMORY[0x1E0CEAB40], "_traitCollectionWithBacklightLuminance:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v40 = v9;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "traitCollectionWithTraitsFromCollections:", v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v40;
    v10 = v45;
  }
  else
  {
    if (a4 == 2)
    {
      v34 = (void *)MEMORY[0x1E0CEAB40];
      v35 = 2;
LABEL_21:
      objc_msgSend(v34, "traitCollectionWithUserInterfaceStyle:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v36 = 0;
  }
LABEL_24:
  -[PBUIWallpaperViewController setFakeBlurViewOverrideTraitCollection:](self, "setFakeBlurViewOverrideTraitCollection:", v36);
  -[PBUIWallpaperViewController _precacheStyles:usingTraitCollection:](self, "_precacheStyles:usingTraitCollection:", self->_sharedWallpaperView, v36);
  if (v11)
    -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 0);
  if (v46)
    -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 1);
  -[PBUIWallpaperViewController setFakeBlurViewOverrideTraitCollection:](self, "setFakeBlurViewOverrideTraitCollection:", 0);
  -[PBUIWallpaperViewController wallpaperPresentingDelegate](self, "wallpaperPresentingDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "wallpaperPresenter:didChangeWallpaperForLocations:withConfiguration:", self, 3, v7);

}

uint64_t __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
    v2 = *(void **)(a1 + 48);
  }
  objc_msgSend(v2, "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1192), "setAlpha:", 1.0);
}

uint64_t __79__PBUIWallpaperViewController__updateSharedWallpaperWithOptions_wallpaperMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupOldSharedWallpaper:lockSreenWallpaper:homeScreenWallpaper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_precacheStyles:(id)a3 usingTraitCollection:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  if ((soft_PUIFeatureEnabled(2) & 1) == 0)
  {
    v8 = 29;
    v7 = +[PBUIFakeBlurView _imageForStyle:withSource:overrideTraitCollection:](PBUIFakeBlurView, "_imageForStyle:withSource:overrideTraitCollection:", &v8, v5, v6);
  }

}

- (void)_updateSeparateWallpaperForVariants:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6;
  void *v8;
  PBUIWallpaperView *sharedWallpaperView;
  int v10;
  PBUIWallpaperView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PBUIWallpaperView *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PBUIWallpaperView *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PBUIWallpaperView **p_lockscreenWallpaperView;
  BOOL v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  PBUIWallpaperView **p_homescreenWallpaperView;
  BOOL v33;
  void *v34;
  void *v35;
  PBUIWallpaperView *v36;
  id v37;
  void *v38;
  void *v39;
  int64_t displayedVariant;
  BOOL v41;
  PBUIWallpaperView **v42;
  PBUIWallpaperView *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PBUIWallpaperView *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  int v58;
  uint64_t v59;
  int v60;
  PBUIWallpaperView *v61;
  _QWORD v62[5];
  PBUIWallpaperView *v63;
  PBUIWallpaperView *v64;
  PBUIWallpaperView *v65;
  _QWORD v66[5];
  _QWORD v67[5];
  PBUIWallpaperView *v68;
  PBUIWallpaperView *v69;
  PBUIWallpaperView *v70;
  _QWORD v71[5];
  _QWORD v72[4];

  v55 = a4;
  v6 = a3;
  v72[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0 || self->_sharedWallpaperView)
  {
    -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 0, a5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v56 = a5;
  if ((v6 & 2) != 0 || self->_sharedWallpaperView)
  {
    -[PBUIWallpaperViewController wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:](self, "wallpaperConfigurationForUpdatingWallpaperViewsForVariant:wallpaperMode:", 1, a5, v55);
    v59 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
  }
  sharedWallpaperView = self->_sharedWallpaperView;
  if (sharedWallpaperView)
  {
    v10 = !-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", sharedWallpaperView, v8, 0);
    v60 = !-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_sharedWallpaperView, v59, 1);
    v11 = self->_sharedWallpaperView;
    -[UIView subviews](self->_wallpaperContainerView, "subviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    v14 = objc_msgSend(v12, "indexOfObject:", self->_sharedWallpaperView);

    v15 = (void *)MEMORY[0x1BCCA57C8]();
    v16 = (void *)v59;
    -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_sharedWallpaperView);
    -[PBUIWallpaperViewController setSharedWallpaperView:](self, "setSharedWallpaperView:", 0);
    objc_autoreleasePoolPop(v15);
    v17 = v14;
    v8 = v13;
    -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v11, v17);
    v18 = 0;
    v61 = 0;
  }
  else
  {
    if ((v6 & 1) != 0)
    {
      if (-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_lockscreenWallpaperView))
      {
        v18 = 0;
        v10 = 0;
      }
      else
      {
        v18 = self->_lockscreenWallpaperView;
        -[UIView subviews](self->_wallpaperContainerView, "subviews");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "indexOfObject:", self->_lockscreenWallpaperView);

        v21 = (void *)MEMORY[0x1BCCA57C8]();
        -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_lockscreenWallpaperView);
        -[PBUIWallpaperViewController setLockscreenWallpaperView:](self, "setLockscreenWallpaperView:", 0);
        objc_autoreleasePoolPop(v21);
        -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v18, v20);
        v10 = 1;
      }
    }
    else
    {
      v18 = 0;
      v10 = 0;
    }
    v16 = (void *)v59;
    if ((v6 & 2) != 0)
    {
      if (-[PBUIWallpaperViewController _isWallpaperView:displayingWallpaperWithConfiguration:forVariant:](self, "_isWallpaperView:displayingWallpaperWithConfiguration:forVariant:", self->_homescreenWallpaperView, v59, 1))
      {
        v11 = 0;
        v61 = 0;
        v60 = 0;
      }
      else
      {
        v22 = self->_homescreenWallpaperView;
        -[UIView subviews](self->_wallpaperContainerView, "subviews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "indexOfObject:", self->_homescreenWallpaperView);

        v25 = (void *)MEMORY[0x1BCCA57C8]();
        -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", self->_homescreenWallpaperView);
        -[PBUIWallpaperViewController setHomescreenWallpaperView:](self, "setHomescreenWallpaperView:", 0);
        objc_autoreleasePoolPop(v25);
        v61 = v22;
        -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", v22, v24);
        v11 = 0;
        v60 = 1;
      }
    }
    else
    {
      v11 = 0;
      v61 = 0;
      v60 = 0;
    }
  }
  p_lockscreenWallpaperView = &self->_lockscreenWallpaperView;
  if (v18)
    v27 = 1;
  else
    v27 = self->_lockscreenWallpaperView == 0;
  if (v27 && v8)
  {
    -[PBUIWallpaperViewController _makeWallpaperViewWithConfiguration:forVariant:shared:options:](self, "_makeWallpaperViewWithConfiguration:forVariant:shared:options:", v8, 0, 0, v55);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_lockscreenWallpaperView, v28);
    if (v11)
      v29 = v11;
    else
      v29 = v18;
    if ((unint64_t)v11 | (unint64_t)v18)
    {
      v30 = v29;
      if (*p_lockscreenWallpaperView)
        -[UIView insertSubview:above:](self->_wallpaperContainerView, "insertSubview:above:", *p_lockscreenWallpaperView, v30);
    }
    else
    {
      if (*p_lockscreenWallpaperView)
        -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", *p_lockscreenWallpaperView, 0);
      v30 = 0;
    }
    -[PBUIWallpaperView setAlpha:](*p_lockscreenWallpaperView, "setAlpha:", 0.0, v55);
    v31 = (void *)MEMORY[0x1E0CEABB0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke;
    v71[3] = &unk_1E6B94728;
    v71[4] = self;
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_2;
    v67[3] = &unk_1E6B96310;
    v67[4] = self;
    v68 = v11;
    v69 = v18;
    v70 = v61;
    objc_msgSend(v31, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v71, v67, 1.0, 0.0, 0.99, 0.0);

  }
  v58 = v10;
  p_homescreenWallpaperView = &self->_homescreenWallpaperView;
  if (v61)
    v33 = 1;
  else
    v33 = self->_homescreenWallpaperView == 0;
  if (v33 && v16)
  {
    -[PBUIWallpaperViewController _makeWallpaperViewWithConfiguration:forVariant:shared:options:](self, "_makeWallpaperViewWithConfiguration:forVariant:shared:options:", v16, 1, 0, v55);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_homescreenWallpaperView, v34);
    if (v11)
      v35 = v11;
    else
      v35 = v61;
    v36 = v18;
    if ((unint64_t)v11 | (unint64_t)v61)
    {
      v37 = v35;
      if (*p_homescreenWallpaperView)
        -[UIView insertSubview:above:](self->_wallpaperContainerView, "insertSubview:above:", *p_homescreenWallpaperView, v37);
    }
    else
    {
      if (*p_homescreenWallpaperView)
        -[UIView insertSubview:atIndex:](self->_wallpaperContainerView, "insertSubview:atIndex:", *p_homescreenWallpaperView, 0);
      v37 = 0;
    }
    -[PBUIWallpaperView setAlpha:](*p_homescreenWallpaperView, "setAlpha:", 0.0, v55);
    v38 = (void *)MEMORY[0x1E0CEABB0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_3;
    v66[3] = &unk_1E6B94728;
    v66[4] = self;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_4;
    v62[3] = &unk_1E6B96310;
    v62[4] = self;
    v63 = v11;
    v64 = v36;
    v65 = v61;
    v39 = v38;
    v18 = v36;
    objc_msgSend(v39, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v66, v62, 1.0, 0.0, 0.99, 0.0);

  }
  displayedVariant = self->_displayedVariant;
  v41 = displayedVariant == 1;
  if (displayedVariant == 1)
    v42 = &self->_lockscreenWallpaperView;
  else
    v42 = &self->_homescreenWallpaperView;
  v43 = v18;
  if (!v41)
    v18 = v61;
  -[UIView sendSubviewToBack:](self->_wallpaperContainerView, "sendSubviewToBack:", *v42, v55);
  -[UIView sendSubviewToBack:](self->_wallpaperContainerView, "sendSubviewToBack:", v18);
  v44 = v58;
  if (v58 && !self->_displayedVariant)
    -[PBUIWallpaperView prepareToAppear](*p_lockscreenWallpaperView, "prepareToAppear");
  if (v60 && self->_displayedVariant == 1)
    -[PBUIWallpaperView prepareToAppear](*p_homescreenWallpaperView, "prepareToAppear");
  if (v56 < 2)
  {
    v45 = (void *)MEMORY[0x1E0CEAB40];
    v46 = 1;
    goto LABEL_69;
  }
  if (v56 == 3)
  {
    v48 = (void *)MEMORY[0x1E0CEAB40];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v57;
    objc_msgSend(MEMORY[0x1E0CEAB40], "_traitCollectionWithBacklightLuminance:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v50 = v8;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "traitCollectionWithTraitsFromCollections:", v51);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v50;
    v16 = (void *)v59;

    v44 = v58;
  }
  else
  {
    if (v56 == 2)
    {
      v45 = (void *)MEMORY[0x1E0CEAB40];
      v46 = 2;
LABEL_69:
      objc_msgSend(v45, "traitCollectionWithUserInterfaceStyle:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_72;
    }
    v47 = 0;
  }
LABEL_72:
  v52 = v43;
  -[PBUIWallpaperViewController setFakeBlurViewOverrideTraitCollection:](self, "setFakeBlurViewOverrideTraitCollection:", v47);
  if (v44)
  {
    -[PBUIWallpaperViewController _precacheStyles:usingTraitCollection:](self, "_precacheStyles:usingTraitCollection:", *p_lockscreenWallpaperView, v47);
    -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 0);
  }
  if (v60)
  {
    -[PBUIWallpaperViewController _precacheStyles:usingTraitCollection:](self, "_precacheStyles:usingTraitCollection:", *p_homescreenWallpaperView, v47);
    -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 1);
  }
  -[PBUIWallpaperViewController setFakeBlurViewOverrideTraitCollection:](self, "setFakeBlurViewOverrideTraitCollection:", 0);
  -[PBUIWallpaperViewController wallpaperPresentingDelegate](self, "wallpaperPresentingDelegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v8)
    objc_msgSend(v53, "wallpaperPresenter:didChangeWallpaperForLocations:withConfiguration:", self, 1, v8);
  if (v16)
    objc_msgSend(v54, "wallpaperPresenter:didChangeWallpaperForLocations:withConfiguration:", self, 2, v16);

}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", 1.0);
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupOldSharedWallpaper:lockSreenWallpaper:homeScreenWallpaper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 1.0);
}

uint64_t __89__PBUIWallpaperViewController__updateSeparateWallpaperForVariants_options_wallpaperMode___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupOldSharedWallpaper:lockSreenWallpaper:homeScreenWallpaper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)shouldDelayHomescreenStyleUpdates
{
  return -[NSMutableSet count](self->_homescreenStyleChangeDelayReasons, "count") != 0;
}

- (void)_beginSuspendingMotionEffectsForStyleIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PBUIWallpaperViewController wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PBUILogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax because of requested wallpaper style", v6, 2u);
    }

    -[PBUIWallpaperViewController suspendWallpaperAnimationForReason:](self, "suspendWallpaperAnimationForReason:", CFSTR("PBUIWallpaperViewIsDarkOrHiddenReason"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperViewController setWallpaperStyleAnimationAssertion:](self, "setWallpaperStyleAnimationAssertion:", v5);

  }
}

- (void)_endSuspendingMotionEffectsForStyleIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PBUIWallpaperViewController wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PBUILogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_INFO, "Enabling dynamic wallpapers and parallax because of requested wallpaper style", v6, 2u);
    }

    -[PBUIWallpaperViewController wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[PBUIWallpaperViewController setWallpaperStyleAnimationAssertion:](self, "setWallpaperStyleAnimationAssertion:", 0);
  }
}

- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3
{
  BOOL result;

  result = _WallpaperStyleHasDarkBlur(a3);
  if ((unint64_t)(a3 - 1) < 2)
    return 1;
  return result;
}

- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3
{
  BOOL v5;
  BOOL v6;
  double var2;
  char v9;

  v5 = -[PBUIWallpaperViewController _shouldSuspendMotionEffectsForStyle:](self, "_shouldSuspendMotionEffectsForStyle:", a3->var0);
  v6 = -[PBUIWallpaperViewController _shouldSuspendMotionEffectsForStyle:](self, "_shouldSuspendMotionEffectsForStyle:", a3->var1);
  var2 = a3->var2;
  if (fabs(var2 + -1.0) < 2.22044605e-16 && v6)
    return 1;
  v9 = fabs(var2) < 2.22044605e-16 || v6;
  return v5 & v9;
}

- (void)_updateMotionEffectsForState:(id *)a3
{
  $1D129F7B4C980C50E70029647222EF17 v4;

  v4 = *a3;
  if (-[PBUIWallpaperViewController _shouldSuspendMotionEffectsForState:](self, "_shouldSuspendMotionEffectsForState:", &v4))
  {
    -[PBUIWallpaperViewController _beginSuspendingMotionEffectsForStyleIfNeeded](self, "_beginSuspendingMotionEffectsForStyleIfNeeded");
  }
  else
  {
    -[PBUIWallpaperViewController _endSuspendingMotionEffectsForStyleIfNeeded](self, "_endSuspendingMotionEffectsForStyleIfNeeded");
  }
}

- (BOOL)_updateEffectViewForVariant:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 oldEffectView:(id *)a6 newEffectView:(id *)a7
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  id v25;
  id v26;
  BOOL v27;
  __int128 v29;
  double v30;
  _OWORD v31[2];
  __int128 v32;
  double v33;
  __int128 v34;
  double v35;

  if (a3 == 1)
    -[PBUIWallpaperViewController homescreenStyleInfo](self, "homescreenStyleInfo");
  else
    -[PBUIWallpaperViewController lockscreenStyleInfo](self, "lockscreenStyleInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "highestValidPriority");
  v15 = v14;
  v34 = 0uLL;
  v35 = 0.0;
  if (v13)
  {
    objc_msgSend(v13, "styleTransitionState");
    v32 = 0uLL;
    v33 = 0.0;
    if ((v15 & 0x8000000000000000) == 0)
    {
      objc_msgSend(v13, "priorityInfoForPriority:", v15);
LABEL_9:
      v32 = *(_OWORD *)((char *)v31 + 8);
      v33 = *((double *)&v31[1] + 1);
      goto LABEL_11;
    }
  }
  else if ((v14 & 0x8000000000000000) == 0)
  {
    memset(v31, 0, sizeof(v31));
    goto LABEL_9;
  }
  v32 = 0uLL;
  v33 = 0.0;
LABEL_11:
  if (-[NSHashTable count](self->_requireWallpaperAssertions, "count"))
  {
    if ((_QWORD)v32 == 1 || *((_QWORD *)&v32 + 1) == 1)
      PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)&v32, 0.0);
    if ((_QWORD)v34 == 1 || *((_QWORD *)&v34 + 1) == 1)
    {
      PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)&v29, 0.0);
      v34 = v29;
      v35 = v30;
    }
  }
  v29 = v32;
  v30 = v33;
  objc_msgSend(v13, "setStyleTransitionState:", &v29);
  objc_msgSend(v13, "wallpaperEffectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (self->_displayedVariant == a3)
  {
    if (a4)
    {
      *(_OWORD *)&a4->var0 = v34;
      a4->var2 = v35;
    }
    if (a5)
    {
      *(_OWORD *)&a5->var0 = v32;
      a5->var2 = v33;
    }
    v18 = 1;
    if ((_QWORD)v34 != 1 && *((_QWORD *)&v34 + 1) != 1)
      v18 = -[PBUIWallpaperViewController _isWallpaperHiddenForVariant:](self, "_isWallpaperHiddenForVariant:", a3);
    v19 = v32;
    if ((_QWORD)v32 == 1)
    {
      -[PBUIWallpaperViewController _setWallpaperHidden:variant:reason:](self, "_setWallpaperHidden:variant:reason:", 1, a3, CFSTR("WallpaperStyleHidden"));
      -[PBUIWallpaperViewController _clearWallpaperEffectView:](self, "_clearWallpaperEffectView:", v17);
      v20 = 0;
      goto LABEL_43;
    }
    v23 = *((_QWORD *)&v32 + 1);
    v24 = *((_QWORD *)&v32 + 1) == 1 || v18;
    if (v24 == 1)
    {
      -[PBUIWallpaperViewController _setWallpaperHidden:variant:reason:](self, "_setWallpaperHidden:variant:reason:", *((_QWORD *)&v32 + 1) == 1, a3, CFSTR("WallpaperStyleHidden"));
      -[PBUIWallpaperViewController _clearWallpaperEffectView:](self, "_clearWallpaperEffectView:", v17);
      objc_msgSend(v13, "setWallpaperEffectView:", 0);
      if (v23 == 1)
      {
LABEL_44:
        if (a6)
          *a6 = 0;
        if (a7)
          *a7 = 0;
        v29 = v32;
        v30 = v33;
        -[PBUIWallpaperViewController _updateMotionEffectsForState:](self, "_updateMotionEffectsForState:", &v29);
LABEL_68:
        v27 = 1;
        goto LABEL_69;
      }
      v29 = v32;
      v30 = v33;
      v20 = -[PBUIWallpaperViewController _newWallpaperEffectViewForVariant:transitionState:](self, "_newWallpaperEffectViewForVariant:transitionState:", a3, &v29);

      v17 = v20;
LABEL_43:
      objc_msgSend(v13, "setWallpaperEffectView:", v20);
      goto LABEL_44;
    }
    if (v34 != v32 || (BSFloatEqualToFloat() & 1) == 0)
    {
      v25 = v17;
      v17 = v25;
      if (v19 | v23)
      {
        if (objc_msgSend(v25, "prepareToAnimateToTransitionState:", &v32))
        {
          v26 = v17;
          if (a5)
          {
            *(_OWORD *)&a5->var0 = v32;
            a5->var2 = v33;
          }
        }
        else
        {
          v29 = v32;
          v30 = v33;
          v26 = -[PBUIWallpaperViewController _newWallpaperEffectViewForVariant:transitionState:](self, "_newWallpaperEffectViewForVariant:transitionState:", a3, &v29);
          objc_msgSend(v26, "setAlpha:", 0.0);
        }
      }
      else
      {
        v26 = 0;
      }
      objc_msgSend(v13, "setWallpaperEffectView:", v26);
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      if (a7)
        *a7 = objc_retainAutorelease(v26);

      goto LABEL_68;
    }
  }
  else
  {
    v21 = (_QWORD)v32 == 1 || *((_QWORD *)&v32 + 1) == 1;
    v22 = v21;
    if (v21)
    {
      -[PBUIWallpaperViewController _clearWallpaperEffectView:](self, "_clearWallpaperEffectView:", v16);
      objc_msgSend(v13, "setWallpaperEffectView:", 0);
    }
    else
    {
      v29 = v32;
      v30 = v33;
      if (v16)
      {
        objc_msgSend(v16, "setTransitionState:", &v29);
      }
      else
      {
        v17 = -[PBUIWallpaperViewController _newWallpaperEffectViewForVariant:transitionState:](self, "_newWallpaperEffectViewForVariant:transitionState:", a3, &v29);
        objc_msgSend(v13, "setWallpaperEffectView:", v17);
      }
      objc_msgSend(v17, "setHidden:", 1);
    }
    -[PBUIWallpaperViewController _setWallpaperHidden:variant:reason:](self, "_setWallpaperHidden:variant:reason:", v22, a3, CFSTR("WallpaperStyleHidden"));
  }
  v27 = 0;
LABEL_69:

  return v27;
}

- (BOOL)_updateEffectViewForVariant:(int64_t)a3 withFactory:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  _QWORD v10[8];
  _QWORD v11[8];
  _QWORD v12[11];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[7];
  _QWORD v22[7];

  v6 = a4;
  if (a3 == 1
    && -[PBUIWallpaperViewController shouldDelayHomescreenStyleUpdates](self, "shouldDelayHomescreenStyleUpdates"))
  {
    v7 = 1;
  }
  else
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3810000000;
    v22[3] = &unk_1B724EB99;
    memset(&v22[4], 0, 24);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3810000000;
    v21[3] = &unk_1B724EB99;
    memset(&v21[4], 0, 24);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    v20 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    v18 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke;
    v12[3] = &unk_1E6B96338;
    v12[4] = self;
    v12[5] = &v13;
    v12[9] = v17;
    v12[10] = a3;
    v12[6] = v22;
    v12[7] = v21;
    v12[8] = v19;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:", 0, v12);
    v7 = *((_BYTE *)v14 + 24) != 0;
    if (*((_BYTE *)v14 + 24))
    {
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_2;
      v11[3] = &unk_1E6B96360;
      v11[4] = self;
      v11[5] = v21;
      v11[6] = v17;
      v11[7] = v19;
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_3;
      v10[3] = &unk_1E6B96388;
      v10[4] = self;
      v10[5] = v19;
      v10[6] = v17;
      v10[7] = v21;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:completion:", v6, v11, v10);
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);
  }

  return v7;
}

void __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[10];
  v4 = *(_QWORD *)(a1[6] + 8) + 32;
  v5 = *(_QWORD *)(a1[8] + 8);
  v6 = *(void **)(v5 + 40);
  v7 = *(_QWORD *)(a1[7] + 8) + 32;
  v8 = *(_QWORD *)(a1[9] + 8);
  v10 = *(id *)(v8 + 40);
  obj = v6;
  v9 = objc_msgSend(v2, "_updateEffectViewForVariant:oldState:newState:oldEffectView:newEffectView:", v3, v4, v7, &obj, &v10);
  objc_storeStrong((id *)(v5 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v10);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
}

void __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_OWORD *)(v3 + 32);
  v9 = *(_QWORD *)(v3 + 48);
  if ((objc_msgSend(v2, "_shouldSuspendMotionEffectsForState:", &v8) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_endSuspendingMotionEffectsForStyleIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_beginDisallowRasterizationBlock");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 1.0);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_OWORD *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 48);
  objc_msgSend(v4, "setTransitionState:", &v8);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v6
    || v6 != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && (objc_msgSend(v6, "currentTransitionStateIsOpaque") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAlpha:", 0.0);
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_activeWallpaperView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

    }
  }
}

uint64_t __71__PBUIWallpaperViewController__updateEffectViewForVariant_withFactory___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3 != *(void **)(*(_QWORD *)(v2 + 8) + 40))
    objc_msgSend(v3, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "_endDisallowRasterizationBlock");
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(_OWORD *)(v5 + 32);
  v8 = *(_QWORD *)(v5 + 48);
  return objc_msgSend(v4, "_updateMotionEffectsForState:", &v7);
}

- (void)_handleWallpaperChangedForVariant:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperViewController _observersForVariant:](self, "_observersForVariant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "wallpaperWillChangeForVariant:", a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
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
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "wallpaperDidChangeForVariant:", a3, (_QWORD)v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  -[PBUIWallpaperViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", a3);
  -[PBUIWallpaperViewController _updateBlurImagesForVariant:](self, "_updateBlurImagesForVariant:", a3);

}

- (BOOL)variantsShareWallpaper
{
  void *v2;
  char v3;

  -[PBUIWallpaperViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "variantsShareWallpaperConfigurationForTypes:", 54);

  return v3;
}

- (unint64_t)wallpaperDataTypesToRequestForUpdatingWallpaperViews
{
  return 49;
}

- (id)wallpaperConfigurationForUpdatingWallpaperViewsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return -[PBUIWallpaperViewController wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a3, -[PBUIWallpaperViewController wallpaperDataTypesToRequestForUpdatingWallpaperViews](self, "wallpaperDataTypesToRequestForUpdatingWallpaperViews"), a4);
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4 | 0x10;
  -[PBUIWallpaperViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a3, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUIWallpaperViewController substitutionWallpaperConfigurationForWallpaperConfiguration:](self, "substitutionWallpaperConfigurationForWallpaperConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerFakeBlurView:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "variant");
  v6 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenBlurViews;
  if (!v5)
    v6 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenBlurViews;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "addObject:", v4);

  -[PBUIWallpaperViewController _updateBlurGeneration](self, "_updateBlurGeneration");
}

- (void)_unregisterFakeBlurView:(id)a3
{
  NSHashTable *lockscreenBlurViews;
  id v5;

  lockscreenBlurViews = self->_lockscreenBlurViews;
  v5 = a3;
  -[NSHashTable removeObject:](lockscreenBlurViews, "removeObject:", v5);
  -[NSHashTable removeObject:](self->_homescreenBlurViews, "removeObject:", v5);

  -[PBUIWallpaperViewController _updateBlurGeneration](self, "_updateBlurGeneration");
}

- (id)_sourceForFakeBlurView:(id)a3
{
  return -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", objc_msgSend(a3, "variant"));
}

- (void)_updateBlurGeneration
{
  NSUInteger v3;
  NSUInteger v4;
  _BOOL8 v5;

  v3 = -[NSHashTable count](self->_homescreenBlurViews, "count");
  v4 = -[NSHashTable count](self->_lockscreenBlurViews, "count");
  v5 = v4 != 0;
  -[PBUIWallpaperView setGeneratesBlurredImages:](self->_sharedWallpaperView, "setGeneratesBlurredImages:", (v3 | v4) != 0);
  -[PBUIWallpaperView setGeneratesBlurredImages:](self->_homescreenWallpaperView, "setGeneratesBlurredImages:", v3 != 0);
  -[PBUIWallpaperView setGeneratesBlurredImages:](self->_lockscreenWallpaperView, "setGeneratesBlurredImages:", v5);
}

- (unint64_t)_bestWallpaperViewInitializationOptionsForVariant:(int64_t)a3 shared:(BOOL)a4 wallpaperOptions:(id)a5 options:(unint64_t)a6
{
  unint64_t v6;

  if (a4)
    v6 = 11;
  else
    v6 = 10;
  if (objc_msgSend(a5, "supportsCropping", a3))
    return v6;
  else
    return v6 | 0x10;
}

- (Class)_wallpaperViewClassForType:(int64_t)a3
{
  return +[PBUIWallpaperView wallpaperViewClassForWallpaperType:](PBUIWallpaperView, "wallpaperViewClassForWallpaperType:", a3);
}

- (id)_vendWallpaperViewForConfiguration:(id)a3 forVariant:(int64_t)a4 shared:(BOOL)a5 options:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  PBUIWallpaperViewController *v32;
  uint64_t *v33;
  objc_class *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v7 = a5;
  v10 = a3;
  -[UIView bounds](self->_wallpaperContainerView, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "wallpaperOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v10, "wallpaperType");
  v21 = -[PBUIWallpaperViewController _bestWallpaperViewInitializationOptionsForVariant:shared:wallpaperOptions:options:](self, "_bestWallpaperViewInitializationOptionsForVariant:shared:wallpaperOptions:options:", a4, v7, v19, a6);
  -[PBUIWallpaperViewController cachingIdentifier](self, "cachingIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PBUIWallpaperViewController _wallpaperViewClassForType:](self, "_wallpaperViewClassForType:", v20);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5;
  v45 = __Block_byref_object_dispose__5;
  v46 = 0;
  v24 = (void *)MEMORY[0x1E0CEABB0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92__PBUIWallpaperViewController__vendWallpaperViewForConfiguration_forVariant_shared_options___block_invoke;
  v29[3] = &unk_1E6B963B0;
  v33 = &v41;
  v34 = v23;
  v35 = v12;
  v36 = v14;
  v37 = v16;
  v38 = v18;
  v25 = v10;
  v30 = v25;
  v39 = a4;
  v26 = v22;
  v31 = v26;
  v32 = self;
  v40 = v21;
  objc_msgSend(v24, "performWithoutAnimation:", v29);
  v27 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v27;
}

uint64_t __92__PBUIWallpaperViewController__vendWallpaperViewForConfiguration_forVariant_shared_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithFrame:configuration:variant:cacheGroup:delegate:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 112), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInternalObserver:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "layoutIfNeeded");
}

- (void)cleanupOldSharedWallpaper:(id)a3 lockSreenWallpaper:(id)a4 homeScreenWallpaper:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1BCCA57C8]();
  -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", v11);
  -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", v8);
  -[PBUIWallpaperViewController _clearWallpaperView:](self, "_clearWallpaperView:", v9);
  objc_autoreleasePoolPop(v10);

}

- (void)_clearWallpaperView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "invalidate");
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setInternalObserver:", 0);
  objc_msgSend(v3, "setGeneratesBlurredImages:", 0);
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)_clearWallpaperEffectView:(id)a3
{
  objc_msgSend(a3, "removeFromSuperview");
}

- (id)_newWallpaperEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4
{
  PBUIWallpaperEffectViewBase *v6;
  $1D129F7B4C980C50E70029647222EF17 v8;

  v6 = -[PBUIWallpaperEffectViewBase initWithWallpaperPresenter:variant:transformOptions:]([PBUIWallpaperEffectViewBase alloc], "initWithWallpaperPresenter:variant:transformOptions:", self, a3, 0);
  v8 = *a4;
  -[PBUIWallpaperEffectViewBase setTransitionState:](v6, "setTransitionState:", &v8);
  -[UIView bounds](self->_wallpaperContainerView, "bounds");
  -[PBUIWallpaperEffectViewBase setFrame:](v6, "setFrame:");
  -[PBUIWallpaperEffectViewBase setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_wallpaperContainerView, "addSubview:", v6);
  return v6;
}

- (id)_observersForVariant:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenObservers;
  if (!a3)
    v3 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenObservers;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_blurViewsForVariant:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PBUIWallpaperViewController__homescreenBlurViews;
  if (!a3)
    v3 = &OBJC_IVAR___PBUIWallpaperViewController__lockscreenBlurViews;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_handleWallpaperLegibilitySettingsChanged:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PBUIWallpaperViewController _observersForVariant:](self, "_observersForVariant:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "wallpaperLegibilitySettingsDidChange:forVariant:", v6, a4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[PBUIWallpaperViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", a4);
}

- (void)_reconfigureBlurViewsForVariant:(int64_t)a3
{
  void *v5;
  void *v6;
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
  -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PBUIWallpaperViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "reconfigureWithSource:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_updateBlurImagesForVariant:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperViewController _blurViewsForVariant:](self, "_blurViewsForVariant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[PBUIWallpaperViewController wallpaperViewForVariant:](self, "wallpaperViewForVariant:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateImageWithSource:", v7, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)_accessibilityReduceTransparencyChanged:(id)a3
{
  -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 0);
  -[PBUIWallpaperViewController _handleWallpaperChangedForVariant:](self, "_handleWallpaperChangedForVariant:", 1);
}

- (void)_updateWallpaperForWallpaperMode:(int64_t)a3
{
  void *v5;
  int64_t v6;
  _BOOL4 v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  void *v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)os_transaction_create();
  v6 = -[PBUIWallpaperConfigurationManager wallpaperMode](self->_wallpaperConfigurationManager, "wallpaperMode");
  v8 = a3 == 3 || v6 == 3;
  -[PBUIWallpaperConfigurationManager setWallpaperMode:](self->_wallpaperConfigurationManager, "setWallpaperMode:", a3);
  v9 = -[PBUIWallpaperDefaultsDomain enableWallpaperDimming](self->_wallpaperDefaultsStore, "enableWallpaperDimming");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self->_wallpaperConfigurationManager, "dataStores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    v14 = v9 | v8;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 0, a3) & 1) != 0
          || (objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 1, a3) | v14) == 1)
        {
          -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 3, 0, a3, &__block_literal_global_95);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PBUIWallpaperViewController__updateWallpaperForWallpaperMode___block_invoke_2;
  v17[3] = &unk_1E6B951E0;
  v17[4] = self;
  v17[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v17, 0, 0.8, 0.0);
}

void __64__PBUIWallpaperViewController__updateWallpaperForWallpaperMode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  double v5;
  id v6;
  id v7;
  void *v8;
  id obj;
  id obja;

  obj = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40) == 3
    && (objc_msgSend(*(id *)(a1 + 32), "_activeWallpaperView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "handlesInactiveAppearanceTreatment"),
        v3,
        (v4 & 1) == 0))
  {
    v6 = obj;
    if (!obj)
    {
      v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
      objc_msgSend(v2, "bounds");
      obja = (id)objc_msgSend(v7, "initWithFrame:");
      objc_msgSend(obja, "setAutoresizingMask:", 18);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "setBackgroundColor:", v8);

      objc_msgSend(v2, "addSubview:", obja);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 976), obja);
      v6 = obja;
    }
    obj = v6;
    objc_msgSend(v2, "bringSubviewToFront:", v6);
    v5 = 1.0;
  }
  else
  {
    v5 = 0.0;
  }
  objc_msgSend(obj, "setAlpha:", v5);

}

- (void)_updateWallpaperForWallpaperDimming:(BOOL)a3
{
  uint64_t v4;
  id v5;

  -[PBUIWallpaperConfigurationManager setEnableWallpaperDimming:](self->_wallpaperConfigurationManager, "setEnableWallpaperDimming:", a3);
  -[PBUIWallpaperViewController traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "userInterfaceStyle");
  if (objc_msgSend(v5, "_backlightLuminance") != 1 && v4 == 2)
    -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 3, 0, 2, &__block_literal_global_96);

}

- (void)_updateAndPrewarmWallpapers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  -[PBUIWallpaperViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1)
    v5 = 2;
  else
    v5 = 1;
  -[PBUIWallpaperViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = MGGetBoolAnswer();
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke;
    v13[3] = &unk_1E6B94728;
    v13[4] = self;
    -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 3, 1, 3, v13);
  }
  if ((soft_PUIFeatureEnabled(3) & 1) == 0)
  {
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_2;
    v12[3] = &unk_1E6B94728;
    v12[4] = self;
    -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 3, 1, v5, v12);
  }
  if (v7 == 1)
    v10 = 1;
  else
    v10 = 2;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_3;
  v11[3] = &unk_1E6B94728;
  v11[4] = self;
  -[PBUIWallpaperViewController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 3, 1, v10, v11);
}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperPresentingDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperPresenterDidCompleteWallpaperChange:", *(_QWORD *)(a1 + 32));

}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperPresentingDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperPresenterDidCompleteWallpaperChange:", *(_QWORD *)(a1 + 32));

}

void __58__PBUIWallpaperViewController__updateAndPrewarmWallpapers__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperPresentingDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperPresenterDidCompleteWallpaperChange:", *(_QWORD *)(a1 + 32));

}

- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager
{
  return self->_wallpaperConfigurationManager;
}

- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate
{
  return (PBUIWallpaperPresentingDelegate *)objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
}

- (void)setWallpaperPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperPresentingDelegate, a3);
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (void)setCachingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, a3);
}

- (BOOL)fixedOrientation
{
  return self->_fixedOrientation;
}

- (void)setFixedOrientation:(BOOL)a3
{
  self->_fixedOrientation = a3;
}

- (BOOL)colorSamplingDisabled
{
  return self->_colorSamplingDisabled;
}

- (PBUIWallpaperView)lockscreenWallpaperView
{
  return self->_lockscreenWallpaperView;
}

- (void)setLockscreenWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenWallpaperView, a3);
}

- (PBUIWallpaperView)homescreenWallpaperView
{
  return self->_homescreenWallpaperView;
}

- (void)setHomescreenWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenWallpaperView, a3);
}

- (PBUIWallpaperView)sharedWallpaperView
{
  return self->_sharedWallpaperView;
}

- (void)setSharedWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWallpaperView, a3);
}

- (PBUIWallpaperStyleInfo)homescreenStyleInfo
{
  return self->_homescreenStyleInfo;
}

- (PBUIWallpaperStyleInfo)lockscreenStyleInfo
{
  return self->_lockscreenStyleInfo;
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, a3);
}

- (UITraitCollection)fakeBlurViewOverrideTraitCollection
{
  return self->_fakeBlurViewOverrideTraitCollection;
}

- (void)setFakeBlurViewOverrideTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_lockscreenStyleInfo, 0);
  objc_storeStrong((id *)&self->_homescreenStyleInfo, 0);
  objc_storeStrong((id *)&self->_sharedWallpaperView, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperView, 0);
  objc_storeStrong((id *)&self->_lockscreenWallpaperView, 0);
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperEnableDimmingObserver, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsStore, 0);
  objc_storeStrong((id *)&self->_homescreenStyleChangeDelayReasons, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_homescreenBlurViews, 0);
  objc_storeStrong((id *)&self->_lockscreenBlurViews, 0);
  objc_storeStrong((id *)&self->_hideLockscreenWallpaperReasons, 0);
  objc_storeStrong((id *)&self->_hideHomescreenWallpaperReasons, 0);
  objc_storeStrong((id *)&self->_requireWallpaperAssertions, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_suspendColorSamplingAssertions, 0);
  objc_storeStrong((id *)&self->_colorSamplingAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenObservers, 0);
  objc_storeStrong((id *)&self->_lockscreenObservers, 0);
  objc_storeStrong((id *)&self->_inactiveAppearanceDimmingView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end
