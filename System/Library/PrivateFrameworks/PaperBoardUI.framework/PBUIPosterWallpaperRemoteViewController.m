@implementation PBUIPosterWallpaperRemoteViewController

uint64_t __78__PBUIPosterWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnimationSuspended");
}

- (id)requireWallpaperWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = v4;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController requireWallpaperWithReason:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71C2C78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController requireWallpaperWithReason:].cold.1();
    goto LABEL_9;
  }

  -[PBUIPosterWallpaperViewController requireWallpaperWithReason:](self->_viewController, "requireWallpaperWithReason:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v4;
  id v5;
  BSCompoundAssertion *animationSuspendedAssertion;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  void *v9;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = v4;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController suspendWallpaperAnimationForReason:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71C30D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController suspendWallpaperAnimationForReason:].cold.1();
    goto LABEL_11;
  }

  animationSuspendedAssertion = self->_animationSuspendedAssertion;
  if (!animationSuspendedAssertion)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__PBUIPosterWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke;
    v12[3] = &unk_1E6B95E78;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("AnimationSuspended"), v12);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_animationSuspendedAssertion;
    self->_animationSuspendedAssertion = v7;

    animationSuspendedAssertion = self->_animationSuspendedAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](animationSuspendedAssertion, "acquireForReason:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  PBUIWallpaperScaleAssertion *v7;
  void *v8;
  double *v9;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v7 = [PBUIWallpaperScaleAssertion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper scale %f"), *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PBUIPosterWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v11[3] = &unk_1E6B95310;
  objc_copyWeak(&v12, &location);
  v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v11, a4);

  -[NSHashTable addObject:](self->_wallpaperScaleAssertions, "addObject:", v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v9;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIPosterWallpaperRemoteViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

void __84__PBUIPosterWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[130], "removeObject:", v8);
    objc_msgSend(v7, "_updateWallpaperScaleWithAnimationFactory:", v5);
  }

}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  id v4;
  CGFloat v5;
  UIView *containerView;
  CGAffineTransform v7;
  _QWORD v8[6];

  v4 = a3;
  -[PBUIPosterWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", -[PBUIPosterWallpaperRemoteViewController activeVariant](self, "activeVariant"));
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__PBUIPosterWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke;
    v8[3] = &unk_1E6B951E0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = v5;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:", v4, v8);
  }
  else
  {
    containerView = self->_containerView;
    CGAffineTransformMakeScale(&v7, v5, v5);
    -[UIView setTransform:](containerView, "setTransform:", &v7);
  }

}

- (int64_t)activeVariant
{
  return self->_activeVariant;
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

- (void)cancelInProcessAnimations
{
  void *v2;
  id v3;

  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllRetargetableAnimations:", 1);

}

- (void)_updateFallbackView
{
  void *v3;
  unint64_t v4;
  BOOL IsHidden;
  char v6;
  int IsZero;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PBUIPosterWallpaperRemoteViewController activeVariant](self, "activeVariant");
  IsHidden = PBUIWallpaperStyleIsHidden(-[PBUIPosterWallpaperViewController activeStyleForVariant:](self->_viewController, "activeStyleForVariant:", v4));
  v6 = IsHidden;
  IsZero = 1;
  if (v4 <= 1 && !IsHidden)
  {
    -[PBUIPosterWallpaperRemoteViewController averageColorForVariant:](self, "averageColorForVariant:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v22 = 0;
      v23 = 0.0;
      v20 = 0;
      v21 = 0;
      if (objc_msgSend(v10, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v23))
      {
        if (BSFloatIsZero() && BSFloatIsZero())
          IsZero = BSFloatIsZero();
        else
          IsZero = 0;
      }
      v3 = v10;
    }

  }
  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  v23 = 0.0;
  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "getRed:green:blue:alpha:", 0, 0, 0, &v23);

  if (v16)
    v13 = v23 < 1.0 || v12 == 0;
  if (v4 < 2)
    v18 = 1;
  else
    v18 = v6;
  if ((v18 & 1) != 0 || ((IsZero ^ 1) & 1) != 0 || v13)
  {
    -[PBUIPosterWallpaperRemoteViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v3);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  __int128 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *containerView;
  _OWORD v15[3];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  if (soft_PUIDynamicRotationIsActive())
  {
    -[PBUIPosterWallpaperRemoteViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v15[0] = *MEMORY[0x1E0C9BAA8];
    v15[1] = v4;
    v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v3, "setTransform:", v15);

  }
  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UIView setBounds:](self->_containerView, "setBounds:", v7, v9, v11, v13);
  containerView = self->_containerView;
  UIRectGetCenter();
  -[UIView setCenter:](containerView, "setCenter:");
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return -[PBUIPosterWallpaperViewController requireWallpaperRasterizationWithReason:](self->_viewController, "requireWallpaperRasterizationWithReason:", a3);
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained;
  uint64_t v9;
  PBUIPosterWallpaperRemoteViewController *v10;
  PBUIPosterWallpaperRemoteViewController *v11;
  PBUIPosterPortalImageProvider *v12;
  PBUIPosterActiveVariantImageProvider *v13;
  PBUIFakeBlurView *v14;
  PBUIFakeBlurView *v15;
  void *v16;
  _QWORD v18[4];
  PBUIFakeBlurView *v19;
  uint64_t v20;

  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  v9 = objc_msgSend(WeakRetained, "wallpaperPresenter:requestsOrientationWithRefresh:", self, 1);

  v10 = self;
  v11 = v10;
  v12 = (PBUIPosterPortalImageProvider *)v10;
  if ((a5 & 0x10) != 0)
  {
    v12 = v10->_portalImageProvider;

  }
  if ((a5 & 0x20) != 0)
  {
    v13 = v11->_activeVariantProvider;

    v12 = (PBUIPosterPortalImageProvider *)v13;
  }
  v14 = -[PBUIFakeBlurView initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:]([PBUIFakeBlurView alloc], "initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:", a3, v12, v11, 0, a5, v11->_reachabilityCoordinator);
  v15 = v14;
  if (v9)
  {
    v16 = (void *)MEMORY[0x1E0CEABB0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __92__PBUIPosterWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
    v18[3] = &unk_1E6B951E0;
    v19 = v14;
    v20 = v9;
    objc_msgSend(v16, "performWithoutAnimation:", v18);

  }
  return v15;
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (PBUIWallpaperVariantIsValid(a4))
  {
    -[PBUIPosterWallpaperRemoteViewController addObserver:](self, "addObserver:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid variant %ld"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController addObserver:forVariant:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10;
  _BYTE v12[24];

  v10 = a6;
  PBUIWallpaperStyleTransitionStateMake(a3, a3, (uint64_t)v12, 0.0);
  LOBYTE(a5) = -[PBUIPosterWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:](self, "setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:", v12, a4, a5, v10);

  -[PBUIPosterWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView");
  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10;
  void *v12;

  v10 = a6;
  if (!PBUIWallpaperVariantIsValid(a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PBUIWallpaperVariantIsValid(variant)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71C77CCLL);
  }
  if (!PBUIWallpaperStylePriorityIsValid(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PBUIWallpaperStylePriorityIsValid(priority)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:].cold.1();
    goto LABEL_9;
  }
  -[PBUIPosterWallpaperViewController setWallpaperStyle:forPriority:forVariant:](self->_viewController, "setWallpaperStyle:forPriority:forVariant:", a3->var1, a4, a5);
  -[PBUIPosterWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView");

  return 1;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return -[PBUIPosterWallpaperViewController legibilitySettingsForVariant:](self->_viewController, "legibilitySettingsForVariant:", a3);
}

- (void)_registerFakeBlurView:(id)a3
{
  -[NSHashTable addObject:](self->_effectViews, "addObject:", a3);
}

uint64_t __92__PBUIPosterWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rotateToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (PBUIPosterWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PBUIPosterWallpaperRemoteViewController *v4;
  PBUIPosterWallpaperRemoteViewController *v5;
  uint64_t v6;
  NSMutableSet *stateCaptureHandles;
  uint64_t v8;
  NSHashTable *effectViews;
  uint64_t v10;
  NSHashTable *wallpaperScaleAssertions;
  uint64_t v12;
  NSHashTable *observers;
  PBUIPosterWallpaperViewController *v14;
  PBUIPosterWallpaperViewController *viewController;
  PBUIPosterPortalImageProvider *v16;
  PBUIPosterPortalImageProvider *portalImageProvider;
  PBUIPosterActiveVariantImageProvider *v18;
  PBUIPosterActiveVariantImageProvider *activeVariantProvider;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  v4 = -[PBUIPosterWallpaperRemoteViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_activeVariant = -1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandles = v5->_stateCaptureHandles;
    v5->_stateCaptureHandles = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    effectViews = v5->_effectViews;
    v5->_effectViews = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    wallpaperScaleAssertions = v5->_wallpaperScaleAssertions;
    v5->_wallpaperScaleAssertions = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    v5->_observerLock._os_unfair_lock_opaque = 0;
    v14 = objc_alloc_init(PBUIPosterWallpaperViewController);
    viewController = v5->_viewController;
    v5->_viewController = v14;

    -[PBUIPosterWallpaperViewController setDelegate:](v5->_viewController, "setDelegate:", v5);
    v16 = -[PBUIPosterPortalImageProvider initWithRootObject:]([PBUIPosterPortalImageProvider alloc], "initWithRootObject:", v5->_viewController);
    portalImageProvider = v5->_portalImageProvider;
    v5->_portalImageProvider = v16;

    v18 = -[PBUIPosterActiveVariantImageProvider initWithRootObject:]([PBUIPosterActiveVariantImageProvider alloc], "initWithRootObject:", v5->_viewController);
    activeVariantProvider = v5->_activeVariantProvider;
    v5->_activeVariantProvider = v18;

    -[PBUIPosterWallpaperRemoteViewController _addStateCaptureHandlers](v5, "_addStateCaptureHandlers");
  }
  return v5;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_stateCaptureHandles;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[BSCompoundAssertion invalidate](self->_animationSuspendedAssertion, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController dealloc](&v8, sel_dealloc);
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  PBUIWallpaperConfigurationManager **p_wallpaperConfigurationManager;
  id v6;

  p_wallpaperConfigurationManager = &self->_wallpaperConfigurationManager;
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
  v6 = a3;
  -[PBUIWallpaperConfigurationManager setDelegate:](*p_wallpaperConfigurationManager, "setDelegate:", self);

}

- (void)fetchWallpaperProminentColor:(id)a3
{
  -[PBUIPosterWallpaperViewController fetchWallpaperProminentColor:](self->_viewController, "fetchWallpaperProminentColor:", a3);
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  return -[PBUIPosterWallpaperViewController acquireDuckHomeScreenWallpaperDimAssertionWithReason:](self->_viewController, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", a3);
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  return -[PBUIPosterWallpaperViewController currentHomeVariantStyleState](self->_viewController, "currentHomeVariantStyleState");
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  -[PBUIPosterWallpaperViewController noteHomeVariantStyleStateMayHaveUpdated](self->_viewController, "noteHomeVariantStyleStateMayHaveUpdated");
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  return -[PBUIPosterWallpaperViewController updateCurrentPosterWithUpdates:error:](self->_viewController, "updateCurrentPosterWithUpdates:error:", a3, a4);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *containerView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_containerView);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v7);

  -[PBUIPosterWallpaperRemoteViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_viewController, self->_containerView);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[PBUIPosterWallpaperRemoteViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_viewController, 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PBUIPosterWallpaperRemoteViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_viewController, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[PBUIPosterWallpaperRemoteViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_viewController, 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperRemoteViewController;
  -[PBUIPosterWallpaperRemoteViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PBUIPosterWallpaperRemoteViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_viewController, 0);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  id v6;
  uint64_t v7;
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
  v6 = a4;
  v7 = objc_msgSend(a3, "variant");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v13, "wallpaperLegibilitySettingsDidChange:forVariant:", v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
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

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "hideDimmingLayerDidChange:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "wallpaperDidUpdatePreferredProminentColor:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  return self->_externalDisplayConfiguration;
}

- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4
{
  char v4;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperLocations(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Legacy wallpaper changed for %@", (uint8_t *)&v8, 0xCu);

  }
  -[PBUIPosterWallpaperViewController updateLegacyPoster](self->_viewController, "updateLegacyPoster");
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v8;
  void *v10;

  v8 = a5;
  if (!PBUIWallpaperVariantIsValid(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PBUIWallpaperVariantIsValid(variant)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController removeWallpaperStyleForPriority:forVariant:withAnimationFactory:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B7216FD8);
  }
  if (!PBUIWallpaperStylePriorityIsValid(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PBUIWallpaperStylePriorityIsValid(priority)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController removeWallpaperStyleForPriority:forVariant:withAnimationFactory:].cold.1();
    goto LABEL_9;
  }
  -[PBUIPosterWallpaperViewController removeWallpaperStyleForPriority:forVariant:](self->_viewController, "removeWallpaperStyleForPriority:forVariant:", a3, a4);
  -[PBUIPosterWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView");

  return 1;
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (PBUIWallpaperVariantIsValid(a4))
  {
    -[PBUIPosterWallpaperRemoteViewController removeObserver:](self, "removeObserver:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid variant %ld"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController removeObserver:forVariant:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  return ($1D129F7B4C980C50E70029647222EF17 *)PBUIWallpaperStyleTransitionStateMake(0, 0, (uint64_t)retstr, 0.0);
}

- (void)setActiveVariant:(int64_t)a3
{
  -[PBUIPosterWallpaperRemoteViewController setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:](self, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", a3, 0, 0, 0);
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void (**v28)(_QWORD);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (self->_activeVariant == a3)
  {
    if (v12)
      (*((void (**)(id))v12 + 2))(v12);
  }
  else
  {
    v28 = (void (**)(_QWORD))v12;
    v29 = v10;
    -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v19, "wallpaperWillChangeForVariant:", 0);
            objc_msgSend(v19, "wallpaperWillChangeForVariant:", 1);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v16);
    }
    PBUILogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_log_impl(&dword_1B71C0000, v20, OS_LOG_TYPE_DEFAULT, "Setting wallpaper variant to: %{public}@", buf, 0xCu);

    }
    self->_activeVariant = a3;
    -[PBUIPosterWallpaperViewController setActiveVariant:](self->_viewController, "setActiveVariant:", a3);
    -[PBUIPosterWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView");
    -[PBUIPosterWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v27, "wallpaperDidChangeForVariant:", 0);
            objc_msgSend(v27, "wallpaperDidChangeForVariant:", 1);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    v13 = v28;
    if (v28)
      v28[2](v28);

    v10 = v29;
  }

}

- (double)minimumHomescreenWallpaperScale
{
  return 1.0;
}

- (double)homescreenWallpaperScale
{
  double result;

  -[PBUIPosterWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 1);
  return result;
}

- (double)minimumLockscreenWallpaperScale
{
  return 1.0;
}

- (double)lockscreenWallpaperScale
{
  double result;

  -[PBUIPosterWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 0);
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIPosterWallpaperRemoteViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PBUIPosterFloatingLayerReplica *v7;
  PBUIPosterFloatingLayerReplica *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = [PBUIPosterFloatingLayerReplica alloc];
  v8 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PBUIPosterFloatingLayerReplica setFloatingLayerStandin:](v8, "setFloatingLayerStandin:", !v4);
  -[PBUIPosterWallpaperViewController portalProviderForFloatingLayer](self->_viewController, "portalProviderForFloatingLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPortalReplicaView setProvider:](v8, "setProvider:", v9);

  -[PBUIPortalReplicaView setReason:](v8, "setReason:", v6);
  return v8;
}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  PBUIPosterFloatingLayerReplica *v11;
  PBUIPosterFloatingLayerReplica *v12;
  void *v13;
  PBUIWallpaperFloatingLayerAssertion *v14;
  PBUIPosterFloatingLayerReplica *v15;
  id *v16;
  void *v18;
  _QWORD v19[4];
  PBUIPosterFloatingLayerReplica *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B721771CLL);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("containerView != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:].cold.2();
    goto LABEL_9;
  }
  v11 = [PBUIPosterFloatingLayerReplica alloc];
  objc_msgSend(v8, "bounds");
  v12 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v11, "initWithFrame:");
  -[PBUIPosterWallpaperViewController portalProviderForFloatingLayer](self->_viewController, "portalProviderForFloatingLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPortalReplicaView setProvider:](v12, "setProvider:", v13);

  -[PBUIPortalReplicaView setReason:](v12, "setReason:", v9);
  objc_msgSend(v8, "addSubview:", v12);
  v14 = [PBUIWallpaperFloatingLayerAssertion alloc];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__PBUIPosterWallpaperRemoteViewController_setWallpaperFloatingLayerContainerView_forReason_withAnimationFactory___block_invoke;
  v19[3] = &unk_1E6B96490;
  v20 = v12;
  v15 = v12;
  v16 = -[PBUIWallpaperFloatingLayerAssertion initWithContainerView:forReason:invalidationBlock:](v14, v8, v9, v19);

  return v16;
}

uint64_t __113__PBUIPosterWallpaperRemoteViewController_setWallpaperFloatingLayerContainerView_forReason_withAnimationFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)scenesForBacklightSession
{
  return -[PBUIPosterWallpaperViewController scenesForBacklightSession](self->_viewController, "scenesForBacklightSession");
}

- (void)updateWallpaperAnimationWithProgress:(double)a3
{
  -[PBUIPosterWallpaperViewController setUnlockProgress:](self->_viewController, "setUnlockProgress:", fmin(fmax(a3, 0.0), 1.0));
}

- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4
{
  -[PBUIPosterWallpaperViewController finishUnlockWithAnimationParameters:](self->_viewController, "finishUnlockWithAnimationParameters:", a3, a4);
}

- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  -[PBUIPosterWallpaperViewController setWakeSourceIsSwipeToUnlock:](self->_viewController, "setWakeSourceIsSwipeToUnlock:", a3);
}

- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  v8 = v6;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setConfiguration:withAnimationSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B7217B28);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperRemoteViewController setConfiguration:withAnimationSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B7217B8CLL);
  }

  -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "wallpaperWillChangeForVariant:", 0);
          objc_msgSend(v14, "wallpaperWillChangeForVariant:", 1);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v11);
  }
  -[PBUIPosterWallpaperViewController updateConfiguration:withAnimationSettings:](self->_viewController, "updateConfiguration:withAnimationSettings:", v8, v7);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_effectViews;
  v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v20, "updateImageFromProviderForWallpaperMode:", 0);
        objc_msgSend(v20, "reconfigureFromProvider");
      }
      v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v26, "wallpaperDidChangeForVariant:", 0);
          objc_msgSend(v26, "wallpaperDidChangeForVariant:", 1);
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v23);
  }

}

- (void)setAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PBUIPosterWallpaperRemoteViewController _observers](self, "_observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "wallpaperWillChangeForVariant:", 1);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }
  -[PBUIPosterWallpaperViewController updateAssociatedPosterConfiguration:withAnimationSettings:](self->_viewController, "updateAssociatedPosterConfiguration:withAnimationSettings:", v6, v7);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = self->_effectViews;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v19, "updateImageFromProviderForWallpaperMode:", 0);
        objc_msgSend(v19, "reconfigureFromProvider");
      }
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v16);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v25, "wallpaperDidChangeForVariant:", 1, (_QWORD)v26);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v22);
  }

}

- (void)triggerSceneUpdate
{
  -[PBUIPosterWallpaperViewController triggerSceneUpdate](self->_viewController, "triggerSceneUpdate");
}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  int IsActive;
  void *v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  IsActive = soft_PUIDynamicRotationIsActive();
  -[PBUIPosterWallpaperRemoteViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (IsActive)
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23 = *MEMORY[0x1E0C9BAA8];
    v17 = v23;
    v24 = v18;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v16 = v25;
    objc_msgSend(v8, "setTransform:", &v23);

    -[PBUIPosterWallpaperRemoteViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    -[PBUIPosterWallpaperRemoteViewController view](self, "view");
    v11 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    v24 = v18;
    v25 = v16;
    -[NSHashTable setTransform:](v11, "setTransform:", &v23);
  }
  else
  {
    objc_msgSend(v8, "layoutIfNeeded");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_effectViews;
    v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "rotateToInterfaceOrientation:", a3);
        }
        while (v13 != v15);
        v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      }
      while (v13);
    }
  }

  -[PBUIPosterWallpaperViewController rotateToInterfaceOrientation:duration:](self->_viewController, "rotateToInterfaceOrientation:duration:", a3, a4);
}

- (void)triggerPosterSignificantEvent
{
  -[PBUIPosterWallpaperViewController noteUserTapOccurred](self->_viewController, "noteUserTapOccurred");
}

- (void)triggerPosterTapEvent:(id)a3
{
  PBUIPosterWallpaperViewController *viewController;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  viewController = self->_viewController;
  v5 = a3;
  -[PBUIPosterWallpaperViewController view](viewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PBUIPosterWallpaperViewController noteUserTapOccurredWithLocation:](self->_viewController, "noteUserTapOccurredWithLocation:", v8, v10);
}

- (BOOL)userTapEventsRequested
{
  return -[PBUIPosterWallpaperViewController userTapEventsRequested](self->_viewController, "userTapEventsRequested");
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return -[PBUIPosterWallpaperViewController significantEventsCounterForPosterWithIdentifier:](self->_viewController, "significantEventsCounterForPosterWithIdentifier:", a3);
}

- (unint64_t)posterSignificantEventsCounter
{
  return -[PBUIPosterWallpaperViewController posterSignificantEventsCounter](self->_viewController, "posterSignificantEventsCounter");
}

- (BOOL)homeScreenPosterMirrorsLock
{
  return -[PBUIPosterWallpaperViewController homeScreenReflectsLockScreen](self->_viewController, "homeScreenReflectsLockScreen");
}

- (BOOL)posterHandlesWakeAnimation
{
  return -[PBUIPosterWallpaperViewController posterHandlesWakeAnimation](self->_viewController, "posterHandlesWakeAnimation");
}

- (BOOL)posterHidesDimmingLayer
{
  return -[PBUIPosterWallpaperViewController posterHidesDimmingLayer](self->_viewController, "posterHidesDimmingLayer");
}

- (void)setExternalDisplayConfiguration:(id)a3
{
  PBUIExternalDisplayConfiguration **p_externalDisplayConfiguration;
  id v5;

  p_externalDisplayConfiguration = &self->_externalDisplayConfiguration;
  v5 = a3;
  if (!-[PBUIExternalDisplayConfiguration isEqual:](*p_externalDisplayConfiguration, "isEqual:"))
    objc_storeStrong((id *)p_externalDisplayConfiguration, a3);

}

- (void)setWallpaperObscured:(BOOL)a3
{
  -[PBUIPosterWallpaperViewController setWallpaperObscured:](self->_viewController, "setWallpaperObscured:", a3);
}

- (BOOL)isHomeScreenWallpaperDimmed
{
  void *v2;
  char v3;

  -[PBUIPosterWallpaperRemoteViewController currentHomeVariantStyleState](self, "currentHomeVariantStyleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomeScreenDimmed");

  return v3;
}

- (id)newImageProviderView
{
  return objc_alloc_init(PBUISnapshotReplicaView);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  objc_msgSend(a3, "setProvider:", a4);
  return 0;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  return -[PBUIPosterWallpaperViewController snapshotSourceProviderForVariant:](self->_viewController, "snapshotSourceProviderForVariant:", a4);
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  return 0.0;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  return 0;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  return 1.0;
}

- (void)_unregisterFakeBlurView:(id)a3
{
  -[NSHashTable removeObject:](self->_effectViews, "removeObject:", a3);
}

- (id)averageColorForVariant:(int64_t)a3
{
  return -[PBUIPosterWallpaperViewController averageColorForVariant:](self->_viewController, "averageColorForVariant:", a3);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return -[PBUIPosterWallpaperViewController averageColorForVariant:](self->_viewController, "averageColorForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  return -[PBUIPosterWallpaperViewController averageColorForVariant:](self->_viewController, "averageColorForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (double)contrastForVariant:(int64_t)a3
{
  double result;

  -[PBUIPosterWallpaperViewController averageContrastForVariant:](self->_viewController, "averageContrastForVariant:", a3);
  return result;
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  double result;

  -[PBUIPosterWallpaperViewController averageContrastForVariant:](self->_viewController, "averageContrastForVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (NSString)description
{
  return (NSString *)-[PBUIPosterWallpaperRemoteViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIPosterWallpaperRemoteViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIPosterWallpaperRemoteViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PBUIPosterWallpaperRemoteViewController *v11;

  v4 = a3;
  -[PBUIPosterWallpaperRemoteViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PBUIPosterWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B94BC8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __81__PBUIPosterWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  PBUIStringForWallpaperVariant(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1080));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("activeVariant"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("scaleAssertions"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("viewController"));
}

- (id)_observers
{
  os_unfair_lock_s *p_observerLock;
  void *v4;

  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observerLock);
  return v4;
}

uint64_t __85__PBUIPosterWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (void)_addStateCaptureHandlers
{
  id v3;
  NSMutableSet *stateCaptureHandles;
  void *v5;
  void *v6;
  id v7;
  id location;

  v3 = MEMORY[0x1E0C80D38];
  objc_initWeak(&location, self);
  stateCaptureHandles = self->_stateCaptureHandles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIPosterWallpaperRemoteViewController - %p"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v7, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](stateCaptureHandles, "addObject:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

__CFString *__67__PBUIPosterWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E6B97EB0;
  v4 = v2;

  return v4;
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, a3);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_effectViews, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_animationSuspendedAssertion, 0);
  objc_storeStrong((id *)&self->_activeVariantProvider, 0);
  objc_storeStrong((id *)&self->_portalImageProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandles, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)removeWallpaperStyleForPriority:forVariant:withAnimationFactory:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)removeWallpaperStyleForPriority:forVariant:withAnimationFactory:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)suspendWallpaperAnimationForReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)addObserver:forVariant:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)removeObserver:forVariant:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)setConfiguration:withAnimationSettings:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)requireWallpaperWithReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
