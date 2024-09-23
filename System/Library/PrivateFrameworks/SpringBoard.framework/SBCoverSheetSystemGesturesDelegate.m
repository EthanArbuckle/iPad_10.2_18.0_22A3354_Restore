@implementation SBCoverSheetSystemGesturesDelegate

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer **p_dismissAddendumGestureRecognizer;
  id v6;
  id WeakRetained;

  p_dismissAddendumGestureRecognizer = &self->_dismissAddendumGestureRecognizer;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dismissAddendumGestureRecognizer);

  if (WeakRetained == v6)
    return -[CSCoverSheetDismissGestureSettings extendSwipeUpRegion](self->_dismissGestureSettings, "extendSwipeUpRegion");
  else
    return 1;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;

  -[SBCoverSheetSystemGesturesDelegate viewController](self, "viewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  BOOL v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[SBCoverSheetSystemGesturesDelegate dismissGestureRecognizer](self, "dismissGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);

  if (WeakRetained == v6 && v8 == v7)
  {
    v10 = 1;
  }
  else if (v8 == v6)
  {
    v11 = objc_loadWeakRetained((id *)&self->_preemptingGestureRecognizer);
    v10 = v11 == v7;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIGestureRecognizer)dismissGestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
}

- (UIPanGestureRecognizer)presentGestureRecognizer
{
  return self->_presentGestureRecognizer;
}

- (SBCoverSheetSystemGesturesDelegate)initWithViewController:(id)a3 dismissGestureRecognizer:(id)a4 dismissAddendumGestureRecognizer:(id)a5 dismissalPreemptingGestureRecognizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBCoverSheetSystemGesturesDelegate *v14;
  SBCoverSheetSystemGesturesDelegate *v15;
  void *v16;
  uint64_t v17;
  CSCoverSheetDismissGestureSettings *dismissGestureSettings;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBCoverSheetSystemGesturesDelegate;
  v14 = -[SBCoverSheetSystemGesturesDelegate init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SBCoverSheetSystemGesturesDelegate setViewController:](v14, "setViewController:", v10);
    -[SBCoverSheetSystemGesturesDelegate setDismissGestureRecognizer:](v15, "setDismissGestureRecognizer:", v11);
    -[SBCoverSheetSystemGesturesDelegate setDismissAddendumGestureRecognizer:](v15, "setDismissAddendumGestureRecognizer:", v12);
    -[SBCoverSheetSystemGesturesDelegate setPreemptingGestureRecognizer:](v15, "setPreemptingGestureRecognizer:", v13);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coverSheetDismissGestureSettings");
    v17 = objc_claimAutoreleasedReturnValue();
    dismissGestureSettings = v15->_dismissGestureSettings;
    v15->_dismissGestureSettings = (CSCoverSheetDismissGestureSettings *)v17;

  }
  return v15;
}

- (BOOL)isPresentGestureActive
{
  SBCoverSheetSystemGesturesDelegate *v2;
  BOOL v3;
  void *v4;

  v2 = self;
  v3 = -[SBCoverSheetSystemGesturesDelegate _canPresentGestureBegin](self, "_canPresentGestureBegin");
  -[SBCoverSheetSystemGesturesDelegate presentGestures](v2, "presentGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SBCoverSheetSystemGesturesDelegate _areAnyGesturesRecognizedInSet:](v2, "_areAnyGesturesRecognizedInSet:", v4);

  return v3 | v2;
}

- (BOOL)isPresentGestureAllowedToBegin
{
  return -[SBCoverSheetSystemGesturesDelegate gestureRecognizerShouldBegin:](self, "gestureRecognizerShouldBegin:", self->_presentGestureRecognizer);
}

- (id)presentGestures
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeAddObject:", self->_presentGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_indirectPresentGestureRecognizer);
  return v3;
}

- (BOOL)isDismissGestureActive
{
  SBCoverSheetSystemGesturesDelegate *v2;
  BOOL v3;
  void *v4;

  v2 = self;
  v3 = -[SBCoverSheetSystemGesturesDelegate _canDismissGestureBegin](self, "_canDismissGestureBegin");
  -[SBCoverSheetSystemGesturesDelegate dismissGestures](v2, "dismissGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SBCoverSheetSystemGesturesDelegate _areAnyGesturesRecognizedInSet:](v2, "_areAnyGesturesRecognizedInSet:", v4);

  return v3 | v2;
}

- (BOOL)isDismissGestureAllowedToBegin
{
  SBCoverSheetSystemGesturesDelegate *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
  LOBYTE(v2) = -[SBCoverSheetSystemGesturesDelegate gestureRecognizerShouldBegin:](v2, "gestureRecognizerShouldBegin:", WeakRetained);

  return (char)v2;
}

- (id)dismissGestures
{
  id v3;
  id WeakRetained;
  id v5;
  SBIndirectPanGestureRecognizer *indirectDismissGestureRecognizer;
  SBFluidScrunchGestureRecognizer *scrunchDismissGestureRecognizer;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
  v11[0] = WeakRetained;
  v5 = objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
  indirectDismissGestureRecognizer = self->_indirectDismissGestureRecognizer;
  scrunchDismissGestureRecognizer = self->_scrunchDismissGestureRecognizer;
  v11[1] = v5;
  v11[2] = indirectDismissGestureRecognizer;
  v11[3] = scrunchDismissGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithArray:", v8);

  return v9;
}

- (void)setPresentGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer **p_presentGestureRecognizer;
  id v5;

  p_presentGestureRecognizer = &self->_presentGestureRecognizer;
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_presentGestureRecognizer, a3);

}

- (BOOL)_areAnyGesturesRecognizedInSet:(id)a3
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SBCoverSheetSystemGesturesDelegate__areAnyGesturesRecognizedInSet___block_invoke;
  v6[3] = &unk_1E8EB8E20;
  v6[4] = self;
  objc_msgSend(a3, "bs_filter:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __69__SBCoverSheetSystemGesturesDelegate__areAnyGesturesRecognizedInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isGestureActivelyRecognized:", a2);
}

- (int64_t)indirectPanEffectiveInterfaceOrientation
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  int v11;
  char v12;
  NSObject *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  char v22;
  int v23;
  SBIndirectPanGestureRecognizer *WeakRetained;
  _BOOL4 v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v33;
  uint64_t v34;
  BOOL v35;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  SBIndirectPanGestureRecognizer *indirectDismissGestureRecognizer;
  BOOL v44;
  char v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  void *v51;
  int v52;
  int v53;
  int v54;
  id v55;
  id v56;
  _QWORD v57[5];
  uint8_t v58[4];
  uint64_t v59;
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = (SBIndirectPanGestureRecognizer *)a3;
  SBLogSystemGestureCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[UIGestureRecognizer sb_briefDescription](v4, "sb_briefDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBCoverSheetSystemGesturesDelegate gestureRecognizerShouldBegin - %{public}@", (uint8_t *)&buf, 0xCu);

  }
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "policyAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__89;
  v63 = __Block_byref_object_dispose__89;
  v64 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __67__SBCoverSheetSystemGesturesDelegate_gestureRecognizerShouldBegin___block_invoke;
  v57[3] = &unk_1E8EB8E48;
  v57[4] = &buf;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v57);
  -[SBCoverSheetSystemGesturesDelegate presentGestures](self, "presentGestures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v4);

  if (v11)
  {
    v56 = 0;
    v12 = objc_msgSend(v8, "allowsCapability:explanation:", 12, &v56);
    v13 = v56;
    if ((v12 & 1) != 0)
    {
      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isGestureWithTypeAllowed:", 1);

      v16 = -[SBCoverSheetSystemGesturesDelegate _canPresentGestureBegin](self, "_canPresentGestureBegin");
      v17 = -[SBCoverSheetSystemGesturesDelegate _isGestureAllowedByTransientOverlaysOrTopmostApp](self, "_isGestureAllowedByTransientOverlaysOrTopmostApp");
      +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "allowGestureForContentBelow");

      if ((v16 & v15 & v17 & v19 & 1) == 0)
      {
        if ((v15 & 1) == 0)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("gesture with type SBSystemGestureTypeShowCoverSheet is not allowed by SBSystemGestureManager"));
        if (!v16)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("_canPresentGestureBegin is NO"));
        if (!v17)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("Not allowed by transient overlays or topmost app"));
        if ((v19 & 1) == 0)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("Not allowed by control center"));
        goto LABEL_22;
      }
LABEL_41:
      v35 = 1;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoverSheet capability disallowed by policy aggregator: %@"), v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v33);
    goto LABEL_21;
  }
  -[SBCoverSheetSystemGesturesDelegate dismissGestures](self, "dismissGestures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v4);

  if (v21)
  {
    v55 = 0;
    v22 = objc_msgSend(v8, "allowsCapability:explanation:", 13, &v55);
    v13 = v55;
    if ((v22 & 1) != 0)
    {
      v23 = -[CSCoverSheetDismissGestureSettings extendSwipeUpRegion](self->_dismissGestureSettings, "extendSwipeUpRegion");
      WeakRetained = (SBIndirectPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
      v25 = WeakRetained == v4;

      if ((v25 & v23) == 1)
      {
        -[CSCoverSheetDismissGestureSettings extendedRegionInsetX](self->_dismissGestureSettings, "extendedRegionInsetX");
        v27 = v26;
        -[SBCoverSheetSystemGesturesDelegate viewForSystemGestureRecognizer:](self, "viewForSystemGestureRecognizer:", v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bounds");
        v67 = CGRectInset(v66, v27, 0.0);
        x = v67.origin.x;
        y = v67.origin.y;
        width = v67.size.width;
        height = v67.size.height;
        _UISystemGestureLocationInView();
        v68.origin.x = x;
        v68.origin.y = y;
        v68.size.width = width;
        v68.size.height = height;
        CGRectGetMinX(v68);
        if (BSFloatGreaterThanOrEqualToFloat())
        {
          v69.origin.x = x;
          v69.origin.y = y;
          v69.size.width = width;
          v69.size.height = height;
          CGRectGetMaxX(v69);
          v54 = BSFloatLessThanOrEqualToFloat();
        }
        else
        {
          v54 = 0;
        }

      }
      else
      {
        v54 = 1;
      }
      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v37, "isGestureWithTypeAllowed:", 2);

      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "transientOverlayPresentationManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "hasActivePresentation");

      +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isPresented");

      indirectDismissGestureRecognizer = self->_indirectDismissGestureRecognizer;
      v44 = indirectDismissGestureRecognizer == v4;
      if (indirectDismissGestureRecognizer == v4)
        v45 = v42;
      else
        v45 = 1;
      if (v44)
        v42 = 1;
      if ((v45 & 1) == 0)
      {
        +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v46, "isVisible");

      }
      +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "hasBeenDismissedSinceKeybagLock");

      v49 = SBHomeGestureEnabled();
      v50 = -[SBCoverSheetSystemGesturesDelegate _canDismissGestureBegin](self, "_canDismissGestureBegin");
      if (((v50 ^ 1 | v49) & 1) == 0)
      {
        objc_msgSend((id)SBApp, "authenticationController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isAuthenticated");

        v50 = v52 & v48;
      }
      if ((v50 & v53 & ~v40 & ~v42 & v54 & 1) == 0)
      {
        if (((v50 | v49 ^ 1) & 1) == 0)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("either _canDismissGestureBegin is NO or can't pull up when not authenticated and not in notification center mode"));
        if ((v53 & 1) == 0)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("gesture with type SBSystemGestureTypeDismissCoverSheet is not allowed by SBSystemGestureManager"));
        if (v40)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("transient overlay is visible"));
        if (v42)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("control center is visible"));
        if ((v54 & 1) == 0)
          ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("isn't within X margin"));
        goto LABEL_22;
      }
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dismiss CoverSheet capability disallowed by policy aggregator: %@"), v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v33);
LABEL_21:

LABEL_22:
  }
  SBLogSystemGestureCoverSheet();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v34 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v58 = 138543362;
    v59 = v34;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "should not begin for reason: %{public}@", v58, 0xCu);
  }
  v35 = 0;
LABEL_26:

  _Block_object_dispose(&buf, 8);
  return v35;
}

void __67__SBCoverSheetSystemGesturesDelegate_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  if (v3)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" | "));
  }
  else
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", a2);

}

- (BOOL)_isGestureAllowedByTransientOverlaysOrTopmostApp
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "shouldDisableCoverSheetGesture"))
  {
    SBLogSystemGestureCoverSheet();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Not allowing transition because transient overlays suppress CoverSheet.", buf, 2u);
    }
LABEL_18:
    v7 = 0;
LABEL_19:

    goto LABEL_20;
  }
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAnySwitcherVisible");

  if ((v6 & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "application", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "suppressesCoverSheetGesture");

          if (v13)
          {
            SBLogSystemGestureCoverSheet();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing transition because the top app suppresses CoverSheet.", buf, 2u);
            }

            goto LABEL_18;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        v7 = 1;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v7 = 1;
    }
    goto LABEL_19;
  }
  v7 = 1;
LABEL_20:

  return v7;
}

- (BOOL)_canDismissGestureBegin
{
  if (-[SBCoverSheetSystemGesturesDelegate syntheticAppearState](self, "syntheticAppearState") - 1 > 1)
    return 0;
  else
    return !-[SBCoverSheetSystemGesturesDelegate isAnyGestureActivelyRecognized](self, "isAnyGestureActivelyRecognized");
}

- (BOOL)_canPresentGestureBegin
{
  int v3;

  v3 = -[SBCoverSheetSystemGesturesDelegate syntheticAppearState](self, "syntheticAppearState");
  if (v3 != 3 && v3)
    return 0;
  else
    return !-[SBCoverSheetSystemGesturesDelegate isAnyGestureActivelyRecognized](self, "isAnyGestureActivelyRecognized");
}

- (BOOL)_isGestureActivelyRecognized:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "state") == 1 || objc_msgSend(v3, "state") == 2;

  return v4;
}

- (BOOL)isAnyGestureActivelyRecognized
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SBCoverSheetSystemGesturesDelegate presentGestures](self, "presentGestures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBCoverSheetSystemGesturesDelegate _areAnyGesturesRecognizedInSet:](self, "_areAnyGesturesRecognizedInSet:", v3))
  {
    v4 = 1;
  }
  else
  {
    -[SBCoverSheetSystemGesturesDelegate dismissGestures](self, "dismissGestures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBCoverSheetSystemGesturesDelegate _areAnyGesturesRecognizedInSet:](self, "_areAnyGesturesRecognizedInSet:", v5);

  }
  return v4;
}

- (SBCoverSheetSystemGestureDelegatePositionProviding)positionProvider
{
  return (SBCoverSheetSystemGestureDelegatePositionProviding *)objc_loadWeakRetained((id *)&self->_positionProvider);
}

- (void)setPositionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_positionProvider, a3);
}

- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer
{
  return self->_indirectPresentGestureRecognizer;
}

- (void)setIndirectPresentGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer
{
  return self->_indirectDismissGestureRecognizer;
}

- (void)setIndirectDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, a3);
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, a3);
}

- (int)syntheticAppearState
{
  return self->_syntheticAppearState;
}

- (void)setSyntheticAppearState:(int)a3
{
  self->_syntheticAppearState = a3;
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_dismissGestureRecognizer, a3);
}

- (UIGestureRecognizer)dismissAddendumGestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
}

- (void)setDismissAddendumGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_dismissAddendumGestureRecognizer, a3);
}

- (UIGestureRecognizer)preemptingGestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_preemptingGestureRecognizer);
}

- (void)setPreemptingGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_preemptingGestureRecognizer, a3);
}

- (CSCoverSheetDismissGestureSettings)dismissGestureSettings
{
  return self->_dismissGestureSettings;
}

- (void)setDismissGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissGestureSettings, 0);
  objc_destroyWeak((id *)&self->_preemptingGestureRecognizer);
  objc_destroyWeak((id *)&self->_dismissAddendumGestureRecognizer);
  objc_destroyWeak((id *)&self->_dismissGestureRecognizer);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_positionProvider);
}

@end
