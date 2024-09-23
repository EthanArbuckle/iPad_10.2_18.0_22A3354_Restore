@implementation SBExternalDisplayCoverSheetController

- (SBExternalDisplayCoverSheetController)initWithWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SBExternalDisplayCoverSheetController *v9;

  v4 = a3;
  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetPresentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBExternalDisplayCoverSheetViewController _initWithWindowScene:wallpaperEffectViewFactory:]([SBExternalDisplayCoverSheetViewController alloc], "_initWithWindowScene:wallpaperEffectViewFactory:", v4, 0);
  v9 = -[SBExternalDisplayCoverSheetController _initWithWindowScene:lockStateProvider:backlightController:presentationManager:windowFactory:externalDisplayCoverSheetViewController:](self, "_initWithWindowScene:lockStateProvider:backlightController:presentationManager:windowFactory:externalDisplayCoverSheetViewController:", v4, v5, v6, v7, 0, v8);

  return v9;
}

- (id)_initWithWindowScene:(id)a3 lockStateProvider:(id)a4 backlightController:(id)a5 presentationManager:(id)a6 windowFactory:(id)a7 externalDisplayCoverSheetViewController:(id)a8
{
  id v15;
  id v16;
  id v17;
  SBExternalDisplayCoverSheetController *v18;
  SBExternalDisplayCoverSheetController *v19;
  void *v20;
  uint64_t v21;
  NSString *externalDisplayUUID;
  void *v23;
  id v24;
  uint64_t v25;
  SBSDisplayLayoutElement *displayLayoutElement;
  double v27;
  void *windowFactory;
  uint64_t v29;
  UIWindow *coversheetWindow;
  UIWindow *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  SBFMouseButtonDownGestureRecognizer *mouseButtonDownGesture;
  void *v37;
  SBFluidScrunchGestureRecognizer *v38;
  SBFluidScrunchGestureRecognizer *scrunchDismissGestureRecognizer;
  void *v40;
  void *v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v15 = a3;
  v45 = a4;
  v44 = a5;
  v43 = a6;
  v16 = a7;
  v17 = a8;
  v46.receiver = self;
  v46.super_class = (Class)SBExternalDisplayCoverSheetController;
  v18 = -[SBExternalDisplayCoverSheetController init](&v46, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_sbWindowScene, v15);
    objc_storeStrong((id *)&v19->_lockStateProvider, a4);
    objc_storeStrong((id *)&v19->_backlightController, a5);
    objc_storeStrong((id *)&v19->_presentationManager, a6);
    objc_storeStrong((id *)&v19->_windowFactory, a7);
    objc_msgSend(v15, "_sbDisplayConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hardwareIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    externalDisplayUUID = v19->_externalDisplayUUID;
    v19->_externalDisplayUUID = (NSString *)v21;

    if (!v19->_externalDisplayUUID)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBExternalDisplayCoverSheetController.m"), 217, CFSTR("Trying to setup external display cover sheet with a nil external displayUUID"));

    }
    -[SBBacklightController addObserver:](v19->_backlightController, "addObserver:", v19);
    -[SBExternalDisplayCoverSheetController _setScreenOn:](v19, "_setScreenOn:", -[SBBacklightController screenIsOn](v19->_backlightController, "screenIsOn"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v19, sel__embeddedLockStateDidChange_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
    v24 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v25 = objc_msgSend(v24, "initWithIdentifier:", *MEMORY[0x1E0D22C78]);
    displayLayoutElement = v19->_displayLayoutElement;
    v19->_displayLayoutElement = (SBSDisplayLayoutElement *)v25;

    v27 = *MEMORY[0x1E0CEBBD0];
    -[SBSDisplayLayoutElement setLevel:](v19->_displayLayoutElement, "setLevel:", (uint64_t)*MEMORY[0x1E0CEBBD0]);
    -[SBSDisplayLayoutElement setFillsDisplayBounds:](v19->_displayLayoutElement, "setFillsDisplayBounds:", 1);
    -[SBSDisplayLayoutElement setLayoutRole:](v19->_displayLayoutElement, "setLayoutRole:", 3);
    if (v19->_windowFactory)
      windowFactory = v19->_windowFactory;
    else
      windowFactory = v19;
    v29 = objc_msgSend(windowFactory, "newCoverSheetWindowForScene:", v15);
    coversheetWindow = v19->_coversheetWindow;
    v19->_coversheetWindow = (UIWindow *)v29;

    -[UIWindow setWindowLevel:](v19->_coversheetWindow, "setWindowLevel:", v27 + -15.0);
    v31 = v19->_coversheetWindow;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[UIWindow setAlpha:](v19->_coversheetWindow, "setAlpha:", 0.0);
    -[UIWindow setHidden:](v19->_coversheetWindow, "setHidden:", 0);
    -[UIWindow setUserInteractionEnabled:](v19->_coversheetWindow, "setUserInteractionEnabled:", 0);
    -[UIWindow setRootViewController:](v19->_coversheetWindow, "setRootViewController:", v17);
    objc_storeStrong((id *)&v19->_rootViewController, a8);
    objc_msgSend(v15, "statusBarManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setOrientationWindow:forStatusBarLayoutLayer:", v19->_coversheetWindow, 1);

    -[SBExternalDisplayCoverSheetController _updateExternalDisplayCoverSheetExistence](v19, "_updateExternalDisplayCoverSheetExistence");
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E98]), "initWithTarget:action:", v19, sel__wakeScreenForMouseButtonDown_);
    mouseButtonDownGesture = v19->_mouseButtonDownGesture;
    v19->_mouseButtonDownGesture = (SBFMouseButtonDownGestureRecognizer *)v35;

    objc_msgSend(v15, "systemGestureManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addGestureRecognizer:withType:", v19->_mouseButtonDownGesture, 68);

    -[SBFMouseButtonDownGestureRecognizer setEnabled:](v19->_mouseButtonDownGesture, "setEnabled:", !v19->_screenOn);
    v38 = -[SBFluidScrunchGestureRecognizer initWithTarget:action:]([SBFluidScrunchGestureRecognizer alloc], "initWithTarget:action:", v19, sel__handleScrunchGesture_);
    scrunchDismissGestureRecognizer = v19->_scrunchDismissGestureRecognizer;
    v19->_scrunchDismissGestureRecognizer = v38;

    -[SBFluidScrunchGestureRecognizer setAllowedTouchTypes:](v19->_scrunchDismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEBF0);
    -[SBFluidScrunchGestureRecognizer setDelegate:](v19->_scrunchDismissGestureRecognizer, "setDelegate:", v19);
    objc_msgSend(v15, "systemGestureManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addGestureRecognizer:withType:", v19->_scrunchDismissGestureRecognizer, 12);

  }
  return v19;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBExternalDisplayCoverSheetController.m");
  v16 = 1024;
  v17 = 276;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BOOL)isUILocked
{
  return self->_coversheetPresented;
}

- (void)addLockStateObserver:(id)a3
{
  id v5;
  NSHashTable *lockStateObservers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  lockStateObservers = self->_lockStateObservers;
  if (!lockStateObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lockStateObservers;
    self->_lockStateObservers = v7;

    v5 = v10;
    lockStateObservers = self->_lockStateObservers;
  }
  -[NSHashTable addObject:](lockStateObservers, "addObject:", v5);
  -[SBExternalDisplayCoverSheetController _updateLockStateObservers](self, "_updateLockStateObservers");

}

- (void)removeLockStateObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_lockStateObservers, "removeObject:", v5);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  BSInvalidatable *displayLayoutElementAssertion;
  id WeakRetained;
  void *v7;
  int v8;
  SBExternalDisplayCoverSheetController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %p", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SBBacklightController removeObserver:](self->_backlightController, "removeObserver:", self);
  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeGestureRecognizer:", self->_mouseButtonDownGesture);
  objc_msgSend(v7, "removeGestureRecognizer:", self->_scrunchDismissGestureRecognizer);
  self->_isInvalidated = 1;

}

- (id)newCoverSheetWindowForScene:(id)a3
{
  id v3;
  SBWindow *v4;

  v3 = a3;
  v4 = -[SBWindow initWithWindowScene:role:debugName:]([SBWindow alloc], "initWithWindowScene:role:debugName:", v3, CFSTR("SBTraitsParticipantRoleCoverSheet"), CFSTR("External Display Cover Sheet Window"));

  return v4;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  SBSDisplayLayoutElement *displayLayoutElement;
  SBSDisplayLayoutElement *v7;
  void (**v8)(id, id);
  void *v9;
  objc_class *v10;
  void *v11;
  SBSDisplayLayoutElement *v12;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v14;
  BSInvalidatable *v15;
  void (*v16)(void);
  void *v17;
  void *v18;
  id v19;

  displayLayoutElement = self->_displayLayoutElement;
  if (self->_displayLayoutElementAssertion)
  {
    v7 = displayLayoutElement;
    v8 = (void (**)(id, id))a3;
    -[SBExternalDisplayCoverSheetController _sbWindowScene](self, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 336, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(v9, "displayLayoutPublisher");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 336, CFSTR("No publisher for window scene: %@; self: %@"),
        v9,
        self);

    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transitionAssertionWithReason:", v11);
    v12 = (SBSDisplayLayoutElement *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v8[2](v8, v7);
    objc_msgSend(v19, "addElement:", v7);
    v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v15 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v14;

    -[SBSDisplayLayoutElement invalidate](v12, "invalidate");
  }
  else
  {
    v16 = (void (*)(void))*((_QWORD *)a3 + 2);
    v12 = displayLayoutElement;
    v19 = a3;
    v16();
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  SBSDisplayLayoutElement *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;
  void *v12;
  void *v13;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      v6 = self->_displayLayoutElement;
      -[SBExternalDisplayCoverSheetController _sbWindowScene](self, "_sbWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 356, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(v7, "displayLayoutPublisher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 356, CFSTR("No publisher for window scene: %@; self: %@"),
          v7,
          self);

      }
      objc_msgSend(v13, "addElement:", v6);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v8;

    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v10 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (BOOL)_shouldIgnoreEmbeddedBacklightChangingSource:(int64_t)a3
{
  return ((unint64_t)a3 < 0x17) & (0x401003u >> a3);
}

- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  float v12;
  float v13;
  int v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (-[SBExternalDisplayCoverSheetController _shouldIgnoreEmbeddedBacklightChangingSource:](self, "_shouldIgnoreEmbeddedBacklightChangingSource:", a5))
  {
    SBLogCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = a5;
      v9 = "[EXTERNAL] ignoring backlight change source: %ld";
      v10 = v8;
      v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_isInvalidated)
  {
    SBLogCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "[EXTERNAL] ignoring backlight change because I'm invalidated";
      v10 = v8;
      v11 = 2;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v12 = fabsf(a4);
  v13 = fabsf(a4 + -1.0);
  if (v12 < 2.2204e-16 || v13 < 2.2204e-16)
    -[SBExternalDisplayCoverSheetController _setScreenOn:](self, "_setScreenOn:", v12 >= 2.2204e-16);
}

- (void)_embeddedLockStateDidChange:(id)a3
{
  _BOOL4 isInvalidated;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  isInvalidated = self->_isInvalidated;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] ignoring embedded lock state change because I'm invalidated", (uint8_t *)&v9, 2u);
    }

  }
  else
  {
    if (v6)
    {
      v7 = -[SBLockStateProvider hasAnyLockState](self->_lockStateProvider, "hasAnyLockState");
      v8 = CFSTR("NO");
      if (v7)
        v8 = CFSTR("YES");
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] lock state change - has any state: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[SBExternalDisplayCoverSheetController _updateExternalDisplayCoverSheetExistence](self, "_updateExternalDisplayCoverSheetExistence");
  }
}

- (void)coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLock:(id)a3
{
  SBCoverSheetPresentationManager *v4;
  SBCoverSheetPresentationManager *v5;

  v4 = (SBCoverSheetPresentationManager *)a3;
  if (self->_presentationManager == v4 && !self->_isInvalidated)
  {
    v5 = v4;
    -[SBExternalDisplayCoverSheetController _updateExternalDisplayCoverSheetExistence](self, "_updateExternalDisplayCoverSheetExistence");
    v4 = v5;
  }

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return (id)-[SBExternalDisplayCoverSheetViewController view](self->_rootViewController, "view", a3);
}

- (void)_updateExternalDisplayCoverSheetExistence
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  _BOOL4 shouldBeVisible;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  SBExternalDisplayCoverSheetController *v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[2];
  uint8_t buf[16];
  __int16 v21;
  uint8_t v22[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 437, CFSTR("failed to get a SBSystemShellExternalDisplaySceneManager. instead we got: %@"), v7);

  }
  v10 = -[SBExternalDisplayCoverSheetController _shouldShowExternalCoverSheet](self, "_shouldShowExternalCoverSheet");
  shouldBeVisible = self->_shouldBeVisible;
  SBLogCoverSheet();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (shouldBeVisible)
    {
      if (v13)
      {
        v21 = 0;
        v14 = "[EXTERNAL] not presenting cover sheet, it is already presented";
        v15 = (uint8_t *)&v21;
LABEL_22:
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (v13)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] presenting cover sheet", v22, 2u);
    }

    -[SBExternalDisplayCoverSheetController _notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:](self, "_notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:", 1);
    -[SBExternalDisplayCoverSheetController _setCoverSheetWindowVisible:fadeDuration:](self, "_setCoverSheetWindowVisible:fadeDuration:", 1, 0.5);
    objc_msgSend(v9, "setSuspendedUnderLock:", 1);
    -[SBExternalDisplayCoverSheetController _postNotificationForExternalCoverSheetVisibilityDidChange:](self, "_postNotificationForExternalCoverSheetVisibilityDidChange:", 1);
    -[SBExternalDisplayCoverSheetController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
    v16 = self;
    v17 = 1;
  }
  else
  {
    if (!shouldBeVisible)
    {
      if (v13)
      {
        *(_WORD *)v19 = 0;
        v14 = "[EXTERNAL] not dismissing cover sheet, it is already dismissed";
        v15 = v19;
        goto LABEL_22;
      }
LABEL_23:

      goto LABEL_24;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] dismissing cover sheet", buf, 2u);
    }

    -[SBExternalDisplayCoverSheetController _notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:](self, "_notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:", 0);
    -[SBExternalDisplayCoverSheetController _setScreenOn:](self, "_setScreenOn:", 1);
    -[SBExternalDisplayCoverSheetController _setCoverSheetWindowVisible:fadeDuration:](self, "_setCoverSheetWindowVisible:fadeDuration:", 0, 0.5);
    objc_msgSend(v9, "setSuspendedUnderLock:", 0);
    -[SBExternalDisplayCoverSheetController _postNotificationForExternalCoverSheetVisibilityDidChange:](self, "_postNotificationForExternalCoverSheetVisibilityDidChange:", 0);
    -[SBExternalDisplayCoverSheetController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 0);
    v16 = self;
    v17 = 0;
  }
  -[SBExternalDisplayCoverSheetController _notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:](v16, "_notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:", v17);
LABEL_24:

}

- (void)_setScreenOn:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    objc_msgSend(WeakRetained, "_sbDisplayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hardwareIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayCoverSheetController.m"), 479, CFSTR("We need a non-nil hardwareIdentifier in order to blank the external display"));

    }
    BKSDisplayServicesSetDisplayBlanked();
    -[SBFMouseButtonDownGestureRecognizer setEnabled:](self->_mouseButtonDownGesture, "setEnabled:", !self->_screenOn);

  }
}

- (void)_setCoversheetPresented:(BOOL)a3
{
  if (self->_coversheetPresented != a3)
  {
    self->_coversheetPresented = a3;
    -[SBExternalDisplayCoverSheetController _updateLockStateObservers](self, "_updateLockStateObservers");
  }
}

- (void)_setCoverSheetWindowVisible:(BOOL)a3 fadeDuration:(double)a4
{
  _BOOL4 v5;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[5];
  id buf;
  __int16 v19;
  double v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  self->_shouldBeVisible = a3;
  if (-[SBExternalDisplayCoverSheetController noAnimations](self, "noAnimations"))
    a4 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  SBLogCoverSheet();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] making coversheet window visible: %{BOOL}u duration: %f", (uint8_t *)&buf, 0x12u);
  }

  if (self->_shouldBeVisible)
  {
    -[UIWindow setHidden:](self->_coversheetWindow, "setHidden:", 0);
    -[SBExternalDisplayCoverSheetController _setCoversheetPresented:](self, "_setCoversheetPresented:", 1);
    -[SBExternalDisplayCoverSheetViewController prepareForPresentation](self->_rootViewController, "prepareForPresentation");
  }
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke;
  v17[3] = &unk_1E8E9DED8;
  v17[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v17);
  if ((BSFloatIsZero() & 1) != 0)
  {
    v10[2](v10);
    if (!self->_shouldBeVisible)
    {
      -[UIWindow setHidden:](self->_coversheetWindow, "setHidden:", 1);
      -[SBExternalDisplayCoverSheetViewController cleanupAfterDismissal](self->_rootViewController, "cleanupAfterDismissal");
      -[SBExternalDisplayCoverSheetController _setCoversheetPresented:](self, "_setCoversheetPresented:", 0);
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v12 = v9;
    v13 = 3221225472;
    v14 = __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke_2;
    v15 = &unk_1E8EA1F50;
    objc_copyWeak(&v16, &buf);
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v10, &v12, a4);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&buf);
  }
  objc_msgSend(WeakRetained, "_synchronizeDrawing", v12, v13, v14, v15);

}

uint64_t __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(v1 + 25))
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 32), "setAlpha:", v2);
}

void __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((unsigned __int8 *)WeakRetained + 25);
    SBLogCoverSheet();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] coversheet window animation to visible %{BOOL}u completed", (uint8_t *)v5, 8u);
    }

    if (!v3)
    {
      objc_msgSend(v2[4], "setHidden:", 1);
      objc_msgSend(v2[6], "cleanupAfterDismissal");
      objc_msgSend(v2, "_setCoversheetPresented:", 0);
    }
  }

}

- (BOOL)_shouldShowExternalCoverSheet
{
  return -[SBLockStateProvider hasAnyLockState](self->_lockStateProvider, "hasAnyLockState");
}

- (void)_wakeScreenForMouseButtonDown:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_wakeScreenForMouseButtonDown:", v3);

}

- (void)_handleScrunchGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "state");
  v5 = v14;
  if (v4 == 3)
  {
    -[SBExternalDisplayCoverSheetController viewForSystemGestureRecognizer:](self, "viewForSystemGestureRecognizer:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", v6);
    v8 = v7;
    objc_msgSend(v6, "bounds");
    v10 = v9 - v8;
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlockPasscodeThresholdForExternalDisplay");
    v13 = v12;

    if (v10 >= v13)
      -[SBCoverSheetPresentationManager _notifyDelegateRequestsUnlock](self->_presentationManager, "_notifyDelegateRequestsUnlock");

    v5 = v14;
  }

}

- (void)_notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "willUpdateExternalDisplayCoverSheetAppearance:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didUpdateExternalDisplayCoverSheetAppearance:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_postNotificationForExternalCoverSheetVisibilityDidChange:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  id v6;

  v3 = CFSTR("SBExternalDisplayCoverSheetDidDismiss");
  if (a3)
    v3 = CFSTR("SBExternalDisplayCoverSheetDidPresent");
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = v3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v5, 0);

}

- (void)_updateLockStateObservers
{
  _BOOL8 v3;
  void *v4;
  id v5;
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
  v3 = -[SBExternalDisplayCoverSheetController isUILocked](self, "isUILocked");
  v4 = (void *)-[NSHashTable copy](self->_lockStateObservers, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "lockStateProvider:didUpdateIsUILocked:", self, v3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (UIWindow)coversheetWindow
{
  return self->_coversheetWindow;
}

- (void)setCoversheetWindow:(id)a3
{
  objc_storeStrong((id *)&self->_coversheetWindow, a3);
}

- (NSString)externalDisplayUUID
{
  return self->_externalDisplayUUID;
}

- (void)setExternalDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SBExternalDisplayCoverSheetViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (SBSDisplayLayoutElement)displayLayoutElement
{
  return self->_displayLayoutElement;
}

- (void)setDisplayLayoutElement:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutElement, a3);
}

- (BSInvalidatable)displayLayoutElementAssertion
{
  return self->_displayLayoutElementAssertion;
}

- (void)setDisplayLayoutElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)_isCoverSheetPresented
{
  return self->_coversheetPresented;
}

- (void)setCoversheetPresented:(BOOL)a3
{
  self->_coversheetPresented = a3;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (void)setShouldBeVisible:(BOOL)a3
{
  self->_shouldBeVisible = a3;
}

- (SBWindowScene)_sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (void)setSbWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_sbWindowScene, a3);
}

- (SBLockStateProvider)lockStateProvider
{
  return self->_lockStateProvider;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (SBCoverSheetPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (SBExternalDisplayCoverSheetControllerWindowFactory)windowFactory
{
  return self->_windowFactory;
}

- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGesture
{
  return self->_mouseButtonDownGesture;
}

- (void)setMouseButtonDownGesture:(id)a3
{
  objc_storeStrong((id *)&self->_mouseButtonDownGesture, a3);
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, a3);
}

- (BOOL)_isScreenOn
{
  return self->_screenOn;
}

- (BOOL)noAnimations
{
  return self->_noAnimations;
}

- (void)setNoAnimations:(BOOL)a3
{
  self->_noAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGesture, 0);
  objc_storeStrong((id *)&self->_windowFactory, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_lockStateProvider, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_externalDisplayUUID, 0);
  objc_storeStrong((id *)&self->_coversheetWindow, 0);
  objc_storeStrong((id *)&self->_lockStateObservers, 0);
}

@end
