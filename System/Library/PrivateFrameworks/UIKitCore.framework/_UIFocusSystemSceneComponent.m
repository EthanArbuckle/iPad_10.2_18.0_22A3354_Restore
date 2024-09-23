@implementation _UIFocusSystemSceneComponent

+ (id)sceneComponentForEnvironment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "sceneComponentForFocusSystem:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    goto LABEL_5;
  }
  _UIFocusEnvironmentContainingView(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_focusSystemSceneComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    os_variant_has_internal_diagnostics();

LABEL_9:
  return v6;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (_UIFocusSystemSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIFocusSystemSceneComponent *v5;
  _UIFocusSystemSceneComponent *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSystemSceneComponent;
  v5 = -[_UIFocusSystemSceneComponent init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    *(_BYTE *)&v6->_flags |= 1u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__focusBehaviorDidChange_, CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

    -[_UIFocusSystemSceneComponent _updateDeviceCapabilityObserver](v6, "_updateDeviceCapabilityObserver");
    -[_UIFocusSystemSceneComponent _adjustFocusSystemAvailabilityUpdatingTraits:](v6, "_adjustFocusSystemAvailabilityUpdatingTraits:", 0);
    -[_UIFocusSystemSceneComponent _notifyDidPerformFocusSystemInitialSetup](v6, "_notifyDidPerformFocusSystemInitialSetup");
  }

  return v6;
}

- (void)_updateDeviceCapabilityObserver
{
  void *v3;
  char v4;
  _UIFocusHardwareKeyboardObserver *hardwareKeyboardObserver;
  _UIFocusHardwareKeyboardObserver *v6;
  _UIFocusHardwareKeyboardObserver *v7;
  _UIFocusHardwareKeyboardObserver *v8;
  id v9;
  _UIFocusGameControllerObserver *gameControllerObserver;
  _UIFocusGameControllerObserver *v11;
  _UIFocusGameControllerObserver *v12;
  _UIFocusGameControllerObserver *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[_UIFocusSystemSceneComponent _focusBehaviorRespectingApplicationOverride:](self, "_focusBehaviorRespectingApplicationOverride:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredInputDevices");
  objc_initWeak(&location, self);
  hardwareKeyboardObserver = self->_hardwareKeyboardObserver;
  if ((v4 & 1) != 0)
  {
    if (!hardwareKeyboardObserver)
    {
      v6 = (_UIFocusHardwareKeyboardObserver *)objc_opt_new();
      v7 = self->_hardwareKeyboardObserver;
      self->_hardwareKeyboardObserver = v6;

      v8 = self->_hardwareKeyboardObserver;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke;
      v17[3] = &unk_1E16B44C0;
      objc_copyWeak(&v18, &location);
      v9 = -[_UIFocusStateObserver addObserver:](v8, "addObserver:", v17);
      objc_destroyWeak(&v18);
    }
  }
  else if (hardwareKeyboardObserver)
  {
    self->_hardwareKeyboardObserver = 0;

  }
  gameControllerObserver = self->_gameControllerObserver;
  if ((v4 & 2) != 0)
  {
    if (!gameControllerObserver)
    {
      v11 = (_UIFocusGameControllerObserver *)objc_opt_new();
      v12 = self->_gameControllerObserver;
      self->_gameControllerObserver = v11;

      v13 = self->_gameControllerObserver;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke_2;
      v15[3] = &unk_1E16B44C0;
      objc_copyWeak(&v16, &location);
      v14 = -[_UIFocusStateObserver addObserver:](v13, "addObserver:", v15);
      objc_destroyWeak(&v16);
    }
  }
  else if (gameControllerObserver)
  {
    self->_gameControllerObserver = 0;

  }
  objc_destroyWeak(&location);

}

- (void)_notifyDidPerformFocusSystemInitialSetup
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIFocusSystem *focusSystem;
  void *v9;
  __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    focusSystem = self->_focusSystem;
    v10 = CFSTR("SceneIdentityToken");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_UIFocusSystemSceneComponentDidFinishInitialization"), focusSystem, v9);

  }
}

- (void)_adjustFocusSystemAvailabilityUpdatingTraits:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _UIFocusHardwareKeyboardObserver *hardwareKeyboardObserver;
  _BOOL4 v7;
  _UIFocusGameControllerObserver *gameControllerObserver;
  _BOOL4 v9;
  int v10;
  int v11;
  UIFocusSystem *focusSystem;
  int v13;
  int v14;
  void *v15;
  id v16;

  v3 = a3;
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusSystemSceneComponent _focusBehaviorRespectingApplicationOverride:](self, "_focusBehaviorRespectingApplicationOverride:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hardwareKeyboardObserver = self->_hardwareKeyboardObserver;
  if (hardwareKeyboardObserver)
  {
    v7 = -[_UIFocusHardwareKeyboardObserver isActive](hardwareKeyboardObserver, "isActive");
    gameControllerObserver = self->_gameControllerObserver;
    if (gameControllerObserver)
    {
LABEL_3:
      v9 = -[_UIFocusGameControllerObserver isActive](gameControllerObserver, "isActive");
      goto LABEL_6;
    }
  }
  else
  {
    gameControllerObserver = self->_gameControllerObserver;
    v7 = gameControllerObserver == 0;
    if (gameControllerObserver)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_6:
  if (v16)
    v10 = objc_msgSend(v5, "wantsFocusSystemForScene:");
  else
    v10 = 0;
  v11 = v7 || v9;
  focusSystem = self->_focusSystem;
  v13 = v10 & v11;
  if (focusSystem && (v13 & 1) == 0)
  {
    -[_UIFocusSystemSceneComponent _tearDownFocusSystem](self, "_tearDownFocusSystem");
    if (v3)
      goto LABEL_24;
LABEL_21:
    if (focusSystem)
      goto LABEL_28;
    goto LABEL_25;
  }
  if (focusSystem)
    v14 = 0;
  else
    v14 = v13;
  if (v14 != 1)
  {
    if (v13)
    {
      -[_UIFocusSystemSceneComponent _updateFocusSystemCapabilities](self, "_updateFocusSystemCapabilities");
      if (v3)
        goto LABEL_24;
    }
    else if (v3)
    {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  -[_UIFocusSystemSceneComponent _setupFocusSystem](self, "_setupFocusSystem");
  if (!v3)
    goto LABEL_21;
LABEL_24:
  objc_msgSend(v16, "_componentDidUpdateTraitOverrides:", self);
  if (focusSystem)
    goto LABEL_28;
LABEL_25:
  if (-[UIFocusSystem _isEnabled](self->_focusSystem, "_isEnabled"))
  {
    -[UIFocusSystem focusedItem](self->_focusSystem, "focusedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[UIFocusSystem requestFocusUpdateToEnvironment:](self->_focusSystem, "requestFocusUpdateToEnvironment:", self->_focusSystem);
      -[UIFocusSystem updateFocusIfNeeded](self->_focusSystem, "updateFocusIfNeeded");
    }
  }
LABEL_28:

}

- (_UIFocusScrollManager)scrollManager
{
  return self->_scrollManager;
}

- (_UIFocusActiveSceneObserver)activeSceneObserver
{
  return self->_activeSceneObserver;
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (UITraitCollection)_traitOverrides
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;

  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "_isEnabled"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v6 = -[_UIFocusSystemSceneComponent _focusSystemExplicitlyDisabledForBehavior:](self, "_focusSystemExplicitlyDisabledForBehavior:", 0);
    v5 = 0;
    if (v6)
      v5 = -[_UIFocusHardwareKeyboardObserver isActive](self->_hardwareKeyboardObserver, "isActive", 0);
  }
  +[UITraitCollection _traitCollectionWithFocusSystemState:](UITraitCollection, "_traitCollectionWithFocusSystemState:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v7;
}

- (BOOL)_focusSystemExplicitlyDisabledForBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusBaseBehaviorForTraitCollection(v6);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  if (objc_msgSend(v4, "honorsFocusSystemEnabledInfoPlistKey")
    && !-[_UIFocusSystemSceneComponent isOverrideFocusSystemEnabled](self, "isOverrideFocusSystemEnabled"))
  {
    +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "focusSystemEnabled") ^ 1;

  }
  else
  {
LABEL_5:
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (UIWindowScene)_windowScene
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v3 = objc_opt_class();
  v4 = WeakRetained;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (UIWindowScene *)v6;
}

- (BOOL)isOverrideFocusSystemEnabled
{
  return -[NSMutableSet count](self->_overrideFocusSystemEnablementIdentifiers, "count") != 0;
}

+ (BOOL)needsFocusSystem
{
  return 1;
}

+ (id)sceneComponentForFocusSystem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusSystemSceneComponent.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  }
  objc_msgSend(v5, "_hostFocusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      objc_msgSend(v5, "_hostFocusSystem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_hostFocusSystem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    while (v8);
  }
  else
  {
    v7 = v5;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_focusSystemSceneComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)objc_opt_class(), "needsFocusSystem"))
        {
          objc_msgSend(v14, "focusSystem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v7)
          {

            goto LABEL_18;
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  os_variant_has_internal_diagnostics();
  v14 = 0;
LABEL_18:

  return v14;
}

+ (id)_screenForScene:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_sceneWillInvalidate:(id)a3
{
  *(_BYTE *)&self->_flags &= ~1u;
  -[_UIFocusSystemSceneComponent _tearDownFocusSystem](self, "_tearDownFocusSystem", a3);
}

- (void)_setupFocusSystem
{
  void *v3;
  void *v4;
  _UIFocusActiveSceneObserver *v5;
  _UIFocusActiveSceneObserver *activeSceneObserver;
  _UIFocusActiveSceneObserver *v7;
  uint64_t v8;
  id v9;
  void *v10;
  UIFocusSystem *v11;
  _UIFocusEventDelivery *v12;
  _UIFocusEventDelivery *eventDelivery;
  _UIFocusScrollManager *v14;
  _UIFocusSoundGenerator *v15;
  _UIFocusSoundGenerator *soundGenerator;
  _UIFocusHapticFeedbackGenerator *v17;
  _UIFocusHapticFeedbackGenerator *hapticFeedbackGenerator;
  _UIFocusItemFrameReporter *v19;
  _UIFocusItemFrameReporter *focusItemFrameReporter;
  _UIFocusAnimationCoordinatorManager *v21;
  _UIFocusAnimationCoordinatorManager *focusAnimationCoordinatorManager;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id location;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    _forceUnwrappedScene((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_screenForScene:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5 = -[_UIFocusActiveSceneObserver initWithScene:]([_UIFocusActiveSceneObserver alloc], "initWithScene:", v3);
    activeSceneObserver = self->_activeSceneObserver;
    self->_activeSceneObserver = v5;

    v7 = self->_activeSceneObserver;
    v8 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke;
    v28[3] = &unk_1E16B44C0;
    objc_copyWeak(&v29, &location);
    v9 = -[_UIFocusStateObserver addObserver:](v7, "addObserver:", v28);
    if (objc_msgSend((id)objc_opt_class(), "needsFocusSystem"))
    {
      -[_UIFocusSystemSceneComponent _focusBehaviorRespectingApplicationOverride:](self, "_focusBehaviorRespectingApplicationOverride:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UIFocusSystem initWithFocusBehavior:enabled:]([UIFocusSystem alloc], "initWithFocusBehavior:enabled:", v10, -[_UIFocusSystemSceneComponent _isSceneActive](self, "_isSceneActive"));
      -[UIFocusSystem setDelegate:](v11, "setDelegate:", self);
      objc_storeStrong((id *)&self->_focusSystem, v11);
      v12 = -[_UIFocusEventDelivery initWithFocusSystem:]([_UIFocusEventDelivery alloc], "initWithFocusSystem:", v11);
      eventDelivery = self->_eventDelivery;
      self->_eventDelivery = v12;

      -[_UIFocusSystemSceneComponent _updateFocusSystemCapabilities](self, "_updateFocusSystemCapabilities");
      -[_UIFocusSystemSceneComponent _updateWantsModernRing](self, "_updateWantsModernRing");
      v14 = -[_UIFocusScrollManager initWithScreen:]([_UIFocusScrollManager alloc], "initWithScreen:", v4);
      objc_storeStrong((id *)&self->_scrollManager, v14);
      if (objc_msgSend(v10, "supportsSounds"))
      {
        +[_UIFocusSoundGenerator defaultGenerator](_UIFocusSoundGenerator, "defaultGenerator");
        v15 = (_UIFocusSoundGenerator *)objc_claimAutoreleasedReturnValue();
        soundGenerator = self->_soundGenerator;
        self->_soundGenerator = v15;

      }
      if (objc_msgSend(v10, "supportsHaptics"))
      {
        v17 = -[_UIFocusHapticFeedbackGenerator initWithScreen:]([_UIFocusHapticFeedbackGenerator alloc], "initWithScreen:", v4);
        hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
        self->_hapticFeedbackGenerator = v17;

      }
      if (objc_msgSend(v10, "supportsFrameReporter"))
      {
        v19 = -[_UIFocusItemFrameReporter initWithFocusSystem:]([_UIFocusItemFrameReporter alloc], "initWithFocusSystem:", v11);
        focusItemFrameReporter = self->_focusItemFrameReporter;
        self->_focusItemFrameReporter = v19;

      }
      v21 = objc_alloc_init(_UIFocusAnimationCoordinatorManager);
      focusAnimationCoordinatorManager = self->_focusAnimationCoordinatorManager;
      self->_focusAnimationCoordinatorManager = v21;

      -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_allWindows");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_2;
      v27[3] = &unk_1E16C8B30;
      v27[4] = self;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v27);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__focusSystemEnabledStateDidChange_, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), self->_focusSystem);

      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_3;
      v26[3] = &unk_1E16B1B28;
      v26[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

- (void)_delayedSetupFocusDebugWindow
{
  _UIFocusDebugWindow *v3;
  void *v4;
  _UIFocusDebugWindow *v5;
  _UIFocusDebugWindow *debugWindow;

  if (self->_focusSystem)
  {
    if (+[_UIFocusDebugWindow hasAnyModules](_UIFocusDebugWindow, "hasAnyModules"))
    {
      v3 = [_UIFocusDebugWindow alloc];
      -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[_UIFocusDebugWindow initWithWindowScene:](v3, "initWithWindowScene:", v4);
      debugWindow = self->_debugWindow;
      self->_debugWindow = v5;

      -[_UIFocusDebugWindow setHidden:](self->_debugWindow, "setHidden:", 0);
    }
  }
}

- (void)_tearDownFocusSystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIFocusSystem *focusSystem;
  _UIFocusEventDelivery *eventDelivery;
  _UIFocusAnimationCoordinatorManager *focusAnimationCoordinatorManager;
  _UIFocusScrollManager *scrollManager;
  _UIFocusSoundGenerator *soundGenerator;
  _UIFocusHapticFeedbackGenerator *hapticFeedbackGenerator;
  _UIFocusItemFrameReporter *focusItemFrameReporter;
  _UIFocusActiveSceneObserver *activeSceneObserver;
  _UIFocusDebugWindow *debugWindow;
  _QWORD v17[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), self->_focusSystem);

  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_allWindows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52___UIFocusSystemSceneComponent__tearDownFocusSystem__block_invoke;
  v17[3] = &unk_1E16C8B30;
  v17[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);

  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateFocusImmediatelyToEnvironment:", 0);

  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_prepareForTeardown");

  focusSystem = self->_focusSystem;
  self->_focusSystem = 0;

  eventDelivery = self->_eventDelivery;
  self->_eventDelivery = 0;

  focusAnimationCoordinatorManager = self->_focusAnimationCoordinatorManager;
  self->_focusAnimationCoordinatorManager = 0;

  scrollManager = self->_scrollManager;
  self->_scrollManager = 0;

  soundGenerator = self->_soundGenerator;
  self->_soundGenerator = 0;

  hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
  self->_hapticFeedbackGenerator = 0;

  focusItemFrameReporter = self->_focusItemFrameReporter;
  self->_focusItemFrameReporter = 0;

  activeSceneObserver = self->_activeSceneObserver;
  self->_activeSceneObserver = 0;

  -[_UIFocusDebugWindow setHidden:](self->_debugWindow, "setHidden:", 1);
  debugWindow = self->_debugWindow;
  self->_debugWindow = 0;

}

- (void)_updateFocusSystemState
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = -[_UIFocusSystemSceneComponent _isSceneActive](self, "_isSceneActive");
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "focusSystemDeactivationMode");

  if (v6 == 1)
  {
    v7 = &unk_1E1A97C20;
    if (v3)
      v7 = 0;
    v8 = v7;
    v3 = 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  -[UIFocusSystem _setOverrideFocusDeferralBehavior:](self->_focusSystem, "_setOverrideFocusDeferralBehavior:", v8);
  -[UIFocusSystem _setEnabled:](self->_focusSystem, "_setEnabled:", v3);

}

- (id)_windowsForFocusSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  _forceUnwrappedScene((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusSystemSceneComponent _screenForScene:](_UIFocusSystemSceneComponent, "_screenForScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsMultipleWindows");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "_preferredFocusedWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v8, "windowScene"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12 == v3))
    {
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_246);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_11:

  return v9;
}

- (_UIFocusEffectManager)_focusEffectManager
{
  _UIFocusEffectManager *focusEffectManager;
  _UIFocusEffectManager *v4;
  _UIFocusEffectManager *v5;

  focusEffectManager = self->_focusEffectManager;
  if (!focusEffectManager)
  {
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      v4 = (_UIFocusEffectManager *)objc_opt_new();
      v5 = self->_focusEffectManager;
      self->_focusEffectManager = v4;

      focusEffectManager = self->_focusEffectManager;
    }
    else
    {
      focusEffectManager = 0;
    }
  }
  return focusEffectManager;
}

- (void)_updateWantsModernRing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "focusRingVisibility");

  if (((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) == ((*(_BYTE *)&self->_flags & 2) == 0))
  {
    +[UIFocusRingManager moveRingToFocusItem:](UIFocusRingManager, "moveRingToFocusItem:", 0);
    -[_UIFocusSystemSceneComponent _focusEffectManager](self, "_focusEffectManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "moveFocusToItem:", 0);

    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | (2 * ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2));
  }
}

- (void)_requestFocusEffectUpdateToEnvironment:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "_focusedItemIsContainedInEnvironment:includeSelf:", v4, 1);

  if (v5)
  {
    objc_msgSend(v7, "focusedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusSystemSceneComponent _updateFocusEffectForItem:](self, "_updateFocusEffectForItem:", v6);

  }
}

- (void)_updateFocusEffectForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "_isEnabled"))
  {

    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsFocusRingForItem:", v12);

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (v7)
    {
      -[_UIFocusSystemSceneComponent _focusEffectManager](self, "_focusEffectManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = v12;
LABEL_11:
      objc_msgSend(v9, "moveFocusToItem:", v11);

      goto LABEL_12;
    }
LABEL_10:
    -[_UIFocusSystemSceneComponent _focusEffectManager](self, "_focusEffectManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v12;
LABEL_7:
  +[UIFocusRingManager moveRingToFocusItem:](UIFocusRingManager, "moveRingToFocusItem:", v8);
LABEL_12:

}

- (void)setOverrideFocusSystemEnabled:(BOOL)a3 withIdentifier:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  NSMutableSet *overrideFocusSystemEnablementIdentifiers;
  NSMutableSet *v14;
  NSMutableSet *v15;
  int v16;
  int v17;
  unint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  NSMutableSet *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  NSMutableSet *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = (NSMutableSet *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusSystemSceneComponent.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p>"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_UIFocusSystemSceneComponent isOverrideFocusSystemEnabled](self, "isOverrideFocusSystemEnabled");
  overrideFocusSystemEnablementIdentifiers = self->_overrideFocusSystemEnablementIdentifiers;
  if (v4)
  {
    if (!overrideFocusSystemEnablementIdentifiers)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v15 = self->_overrideFocusSystemEnablementIdentifiers;
      self->_overrideFocusSystemEnablementIdentifiers = v14;

      overrideFocusSystemEnablementIdentifiers = self->_overrideFocusSystemEnablementIdentifiers;
    }
    if ((-[NSMutableSet containsObject:](overrideFocusSystemEnablementIdentifiers, "containsObject:", v11) & 1) == 0)
      -[NSMutableSet addObject:](self->_overrideFocusSystemEnablementIdentifiers, "addObject:", v11);
  }
  else
  {
    -[NSMutableSet removeObject:](overrideFocusSystemEnablementIdentifiers, "removeObject:", v11);
  }
  v16 = -[_UIFocusSystemSceneComponent isOverrideFocusSystemEnabled](self, "isOverrideFocusSystemEnabled");
  if (v12 != v16)
  {
    v17 = v16;
    v18 = setOverrideFocusSystemEnabled_withIdentifier____s_category;
    if (!setOverrideFocusSystemEnabled_withIdentifier____s_category)
    {
      v18 = __UILogCategoryGetNode("UIFocusSystemSceneComponent", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&setOverrideFocusSystemEnabled_withIdentifier____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = CFSTR("ENABLED");
      if (!v17)
        v20 = CFSTR("DISABLED");
      v21 = v7;
      if (v17)
        v21 = self->_overrideFocusSystemEnablementIdentifiers;
      *(_DWORD *)buf = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Override focusSystemState: (%@) for reason(s): %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

  }
}

- (void)_focusBehaviorDidChange:(id)a3
{
  void *v4;
  void *v5;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_UIFocusSystemSceneComponent _focusBehaviorRespectingApplicationOverride:](self, "_focusBehaviorRespectingApplicationOverride:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBehavior:", v4);

    -[_UIFocusSystemSceneComponent _updateWantsModernRing](self, "_updateWantsModernRing");
    -[_UIFocusSystemSceneComponent _updateDeviceCapabilityObserver](self, "_updateDeviceCapabilityObserver");
    -[_UIFocusSystemSceneComponent _adjustFocusSystemAvailability](self, "_adjustFocusSystemAvailability");
  }
}

- (void)_adjustFocusSystemAvailability
{
  -[_UIFocusSystemSceneComponent _adjustFocusSystemAvailabilityUpdatingTraits:](self, "_adjustFocusSystemAvailabilityUpdatingTraits:", 1);
}

- (void)_updateFocusSystemCapabilities
{
  void *v2;
  uint64_t v3;
  _UIFocusCastingController *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _UIFocusLinearMovementCache *v9;
  void *v10;
  _UIFocusLinearMovementCache *v11;
  id v12;

  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "focusCastingMode");

  if (v3)
  {
    v4 = objc_alloc_init(_UIFocusCastingController);
    objc_msgSend(v12, "_setFocusCastingController:", v4);

    if (v3 == 2)
    {
      objc_msgSend(v12, "_focusCastingController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEntryPointMemorizationTimeout:", 0.0);

    }
  }
  else
  {
    objc_msgSend(v12, "_setFocusCastingController:", 0);
  }
  objc_msgSend(v12, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stabilizedLinearFocusMovementTimeout");
  v8 = v7;

  if (v8 >= 0.0)
  {
    v9 = [_UIFocusLinearMovementCache alloc];
    objc_msgSend(v12, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIFocusLinearMovementCache initWithFocusBehavior:](v9, "initWithFocusBehavior:", v10);
    objc_msgSend(v12, "_setFocusMovementCache:", v11);

  }
  else
  {
    objc_msgSend(v12, "_setFocusMovementCache:", 0);
  }

}

- (id)_focusBehaviorRespectingApplicationOverride:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _UIFocusBaseBehaviorForTraitCollection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && -[_UIFocusSystemSceneComponent _focusSystemExplicitlyDisabledForBehavior:](self, "_focusSystemExplicitlyDisabledForBehavior:", v7))
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)_isSceneActive
{
  _UIFocusActiveSceneObserver *activeSceneObserver;

  activeSceneObserver = self->_activeSceneObserver;
  if (activeSceneObserver)
    LOBYTE(activeSceneObserver) = -[_UIFocusStateObserver isActive](activeSceneObserver, "isActive");
  return (char)activeSceneObserver;
}

- (void)_resetFocusEventRecognizers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_UIFocusSystemSceneComponent _windowsForFocusSearch](self, "_windowsForFocusSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_resetFocusEventRecognizer");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_overridingPreferredFocusEnvironment
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIFocusSystemSceneComponent preferredFocusEnvironmentOverride](self, "preferredFocusEnvironmentOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "compact"), objc_msgSend(v3, "count")))
  {
    objc_msgSend(v3, "pointerAtIndex:", objc_msgSend(v3, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)pushPreferredFocusEnvironmentOverride:(id)a3
{
  id v4;
  void *v5;
  NSPointerArray *v6;
  NSPointerArray *preferredFocusEnvironmentOverride;
  id v8;

  v4 = a3;
  -[_UIFocusSystemSceneComponent preferredFocusEnvironmentOverride](self, "preferredFocusEnvironmentOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    preferredFocusEnvironmentOverride = self->_preferredFocusEnvironmentOverride;
    self->_preferredFocusEnvironmentOverride = v6;

  }
  -[_UIFocusSystemSceneComponent preferredFocusEnvironmentOverride](self, "preferredFocusEnvironmentOverride");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPointer:", v4);

}

- (void)removePreferredFocusEnvironmentOverride:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  unint64_t v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFocusSystemSceneComponent preferredFocusEnvironmentOverride](self, "preferredFocusEnvironmentOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compact");
  if (!objc_msgSend(v5, "count"))
  {
    v9 = qword_1ECD7DE18;
    if (!qword_1ECD7DE18)
    {
      v9 = __UILogCategoryGetNode("UIFocusSystemSceneComponent", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7DE18);
    }
    v10 = *(id *)(v9 + 8);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v11 = v4;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412290;
    v23 = v15;
    v21 = "Removing environment %@ from override is unsuccessful: no override environments.";
    goto LABEL_20;
  }
  v6 = objc_msgSend(v5, "count") - 1;
  while ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "pointerAtIndex:", v6--);
    if ((id)v8 == v4)
    {
      objc_msgSend(v5, "removePointerAtIndex:", v7);
      goto LABEL_22;
    }
  }
  v16 = qword_1ECD7DE10;
  if (!qword_1ECD7DE10)
  {
    v16 = __UILogCategoryGetNode("UIFocusSystemSceneComponent", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v16, (unint64_t *)&qword_1ECD7DE10);
  }
  v10 = *(id *)(v16 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v4;
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412290;
    v23 = v15;
    v21 = "Removing environment %@ from override is unsuccessful: environment not in list of overrides.";
LABEL_20:
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);

  }
LABEL_21:

LABEL_22:
}

- (id)_syncResponderWithFocusUpdateContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "syncsFocusAndResponder"))
  {
    objc_msgSend(v4, "nextFocusedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      _UIFirstResponderCandidateForEnvironment(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_nextResponderThatCanBecomeFirstResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10
        || (objc_msgSend(v10, "isFirstResponder") & 1) == 0
        && objc_msgSend(v11, "_allowsChangingFirstResponderForFocusUpdateWithContext:", v4))
      {
        _UIFocusEnvironmentContainingView(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_window");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstResponder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((!v14 || objc_msgSend(v14, "_allowsChangingFirstResponderForFocusUpdateWithContext:", v4))
          && (!v11
           || !+[UIResponder _callBecomeFirstResponder:withIntent:](UIResponder, "_callBecomeFirstResponder:withIntent:", v11, 1)))
        {
          +[UIResponder _callResignFirstResponder:withIntent:](UIResponder, "_callResignFirstResponder:withIntent:", v15, 1);
        }

      }
      if (objc_msgSend(v11, "isFirstResponder"))
        v16 = v11;
      else
        v16 = 0;
      v17 = v16;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_firstResponderDidUpdateFromResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[UIResponder _currentChangeIntent](UIResponder, "_currentChangeIntent") != 1)
  {
    -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "syncsFocusAndResponder"))
    {
      v28 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      +[UIFocusSystem _allFocusSystems](UIFocusSystem, "_allFocusSystems");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v31 != v9)
              objc_enumerationMutation(obj);
            v11 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v11, "_hostFocusSystem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              do
              {
                objc_msgSend(v11, "_hostFocusSystem");
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v13, "_hostFocusSystem");
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                v11 = v13;
              }
              while (v14);
            }
            else
            {
              v13 = v11;
            }
            -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13 == v15)
            {
              +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "firstResponder");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              _UIFocusEnvironmentSafeCast(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v4)
              {
                _UIFocusEnvironmentSafeCast(v4);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                  v20 = objc_msgSend(v13, "_focusedItemIsContainedInEnvironment:includeSelf:", v4, 1) ^ 1;
                else
                  v20 = 1;

              }
              else
              {
                v20 = 0;
              }
              if (!v18)
              {
                if (v17)
                  v26 = 0;
                else
                  v26 = v20;
                if ((v26 & 1) != 0)
                {
                  v18 = 0;
                }
                else
                {
                  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "_updateFocusImmediatelyToEnvironment:", 0);

LABEL_35:
                }

                goto LABEL_37;
              }
              v21 = objc_msgSend(v13, "_focusedItemIsContainedInEnvironment:includeSelf:", v18, 1);
              if (v17)
                v22 = v21;
              else
                v22 = 1;
              if ((v20 & v22 & 1) != 0)
                goto LABEL_35;
              -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "focusedItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24 == v18)
                goto LABEL_35;
              -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "_updateFocusImmediatelyToEnvironment:", v18);

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_37:

      v6 = v28;
    }

  }
}

- (void)_validateFocusedItemForFirstResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  objc_class *v31;
  void *v32;
  __CFString *v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  objc_class *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  objc_class *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  id v55;
  objc_class *v56;
  void *v57;
  id v58;
  objc_class *v59;
  void *v60;
  void *v61;
  id v62;
  __CFString *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  NSObject *v67;
  os_log_t log;
  NSObject *loga;
  os_log_t logc;
  os_log_t logd;
  os_log_t loge;
  os_log_t logb;
  void *v74;
  const __CFString *v75;
  const __CFString *v76;
  void *v77;
  uint8_t buf[4];
  os_log_t v79;
  __int16 v80;
  os_log_t v81;
  __int16 v82;
  const __CFString *v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  const __CFString *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "syncsFocusAndResponder"))
  {
    -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "focusedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && v8 && (objc_msgSend(v4, "isFirstResponder") & 1) == 0)
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        _UIFocusEnvironmentSafeCast(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = CFSTR("N");
        if (v11 && _UIFocusEnvironmentIsAncestorOfEnvironment(v10, v8))
          v12 = CFSTR("Y");
      }
      else
      {
        v12 = CFSTR("N");
      }
      _UIFocusEnvironmentSafeCast(v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CFSTR("N");
      if (v13 && _UIFocusEnvironmentIsAncestorOfEnvironment(v4, v8))
        v14 = CFSTR("Y");
      v15 = qword_1ECD7DE20;
      if (!qword_1ECD7DE20)
      {
        v15 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD7DE20);
      }
      v16 = *(id *)(v15 + 8);
      v76 = v12;
      v77 = v10;
      v75 = v14;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = v8;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v21;
        v10 = v77;
        log = v22;
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v4;
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v27;
        v29 = v77;
        if (v77)
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p>"), v32, v29);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v10 = v77;
        }
        else
        {
          v33 = CFSTR("(nil)");
        }

        *(_DWORD *)buf = 138413314;
        v79 = log;
        v80 = 2112;
        v81 = v28;
        v82 = 2112;
        v12 = v76;
        v83 = v75;
        v84 = 2112;
        v85 = v33;
        v86 = 2112;
        v87 = v76;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

        v14 = v75;
      }

      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          logc = (os_log_t)MEMORY[0x1E0CB3940];
          v74 = v8;
          v55 = v8;
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringWithFormat:](logc, "stringWithFormat:", CFSTR("<%@: %p>"), v57, v55);
          logd = (os_log_t)objc_claimAutoreleasedReturnValue();

          v67 = logd;
          loge = (os_log_t)MEMORY[0x1E0CB3940];
          v58 = v4;
          v59 = (objc_class *)objc_opt_class();
          NSStringFromClass(v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringWithFormat:](loge, "stringWithFormat:", CFSTR("<%@: %p>"), v60, v58);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          logb = v61;
          v62 = v10;
          if (v10)
          {
            v64 = (void *)MEMORY[0x1E0CB3940];
            v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "stringWithFormat:", CFSTR("<%@: %p>"), v66, v62);
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v63 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138413314;
          v79 = v67;
          v80 = 2112;
          v81 = logb;
          v82 = 2112;
          v83 = v14;
          v84 = 2112;
          v85 = v63;
          v86 = 2112;
          v87 = v12;
          _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

          v8 = v74;
        }
      }
      else
      {
        v34 = qword_1ECD7DE28;
        if (!qword_1ECD7DE28)
        {
          v34 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v34, (unint64_t *)&qword_1ECD7DE28);
        }
        v35 = *(id *)(v34 + 8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          loga = v35;
          v36 = (void *)MEMORY[0x1E0CB3940];
          v37 = v10;
          v38 = v8;
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v41;
          v43 = (void *)MEMORY[0x1E0CB3940];
          v44 = v4;
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v46, v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = v47;
          v49 = v37;
          if (v37)
          {
            v50 = (void *)MEMORY[0x1E0CB3940];
            v51 = (objc_class *)objc_opt_class();
            NSStringFromClass(v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "stringWithFormat:", CFSTR("<%@: %p>"), v52, v49);
            v53 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v53 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138413314;
          v79 = v42;
          v80 = 2112;
          v81 = v48;
          v82 = 2112;
          v83 = v75;
          v84 = 2112;
          v85 = v53;
          v86 = 2112;
          v87 = v76;
          v35 = loga;
          _os_log_impl(&dword_185066000, loga, OS_LOG_TYPE_ERROR, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

          v10 = v77;
        }
      }

      -[_UIFocusSystemSceneComponent focusSystem](self, "focusSystem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "_updateFocusImmediatelyToEnvironment:", 0);

    }
  }

}

+ (BOOL)__applicationIsSpringBoard
{
  if (qword_1ECD7DE30 != -1)
    dispatch_once(&qword_1ECD7DE30, &__block_literal_global_64);
  return _MergedGlobals_1064;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  _UIFocusSystemSceneComponent *v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  _UIFocusSystemSceneComponent *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  _forceUnwrappedScene((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || +[_UIFocusSystemSceneComponent __applicationIsSpringBoard](_UIFocusSystemSceneComponent, "__applicationIsSpringBoard")&& (-[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "traitCollection"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "userInterfaceIdiom"), v5, v4, v6 != 3))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___UIFocusSystemSceneComponent_coordinateSpace__block_invoke;
    block[3] = &unk_1E16B1B28;
    v8 = v3;
    v35 = v8;
    if (qword_1ECD7DE38 != -1)
    {
      dispatch_once(&qword_1ECD7DE38, block);
      v8 = v35;
    }

    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "coordinateSpace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        goto LABEL_23;
      if (self)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = self;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v28);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = CFSTR("(nil)");
      }
      v19 = v26;
      -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p>"), v33, v20);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412546;
      v37 = v19;
      v38 = 2112;
      v39 = v24;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Unable to locate a screen for scene component %@. Scene: %@", buf, 0x16u);
    }
    else
    {
      v12 = qword_1ECD7DE40;
      if (!qword_1ECD7DE40)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7DE40);
      }
      v13 = *(id *)(v12 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      if (self)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = self;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v15);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = CFSTR("(nil)");
      }
      v19 = v18;
      -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v23, v20);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412546;
      v37 = v19;
      v38 = 2112;
      v39 = v24;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Unable to locate a screen for scene component %@. Scene: %@", buf, 0x16u);
    }

LABEL_23:
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "coordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(v3, "_coordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (UICoordinateSpace *)v7;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (BOOL)_uiktest_allowsForwardingFocusMovementActions
{
  return 1;
}

- (id)_topEnvironmentForFocusSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "syncsFocusAndResponder") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "_hostFocusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_6:
    v11 = v4;
    goto LABEL_7;
  }
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _keyWindow](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentSafeCast(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    if (v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11 = (id)v10;

LABEL_7:
  return v11;
}

- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresLegacyScreenBasedWindowLookup");

  if (v5)
  {
    _forceUnwrappedScene((uint64_t)self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFocusSystemSceneComponent _screenForScene:](_UIFocusSystemSceneComponent, "_screenForScene:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_preferredFocusedWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "windowScene"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10 == v6))
    {
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyWindow");
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12;
    if (v12)
    {
      v14 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return v11;
}

- (BOOL)_focusSystem:(id)a3 shouldRestoreFocusInContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_destinationItemInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, sel_allowsWeakReference);

  if (!v11)
    goto LABEL_7;
  objc_msgSend(v7, "_destinationItemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  objc_msgSend(v6, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "allowsRestoringFocusForScreen:", v17);

  if (!v18)
    goto LABEL_7;
  objc_msgSend(v7, "nextFocusedItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "behavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "ignoresKeyWindowStatusWhenRestoringFocus");

    if ((v21 & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      objc_msgSend(v7, "_destinationItemInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containingView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)UIApp;
      -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "screen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_keyWindowForScreen:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      if (v30 && v26 == v30)
      {
        objc_msgSend(v26, "windowScene");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v31 == v32;

      }
    }
  }
  else
  {
LABEL_7:
    v22 = 0;
  }

  return v22;
}

- (void)_focusSystem:(id)a3 willUpdateFocusInContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void (**v16)(void *, void *);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  int v22;
  UIResponder *v23;
  UIResponder *expectedFirstResponder;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  uint64_t aBlock;
  uint64_t v32;
  void (*v33)(_QWORD *, void *);
  void *v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = a3;
  v7 = a4;
  -[_UIFocusSystemSceneComponent focusAnimationCoordinatorManager](self, "focusAnimationCoordinatorManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willUpdateFocusInContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_sourceItemInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "itemIsKindOfView");

  objc_msgSend(v7, "_destinationItemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "itemIsKindOfView");

  if ((v11 & 1) != 0 || v13)
  {
    v30 = v6;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v41 = 0;
    aBlock = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __70___UIFocusSystemSceneComponent__focusSystem_willUpdateFocusInContext___block_invoke;
    v34 = &unk_1E16C8B78;
    v14 = v7;
    v35 = v14;
    v15 = v9;
    v36 = v15;
    v37 = &v38;
    v16 = (void (**)(void *, void *))_Block_copy(&aBlock);
    v39[3] = (uint64_t)v16;
    objc_msgSend(v14, "previouslyFocusedItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nextFocusedItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_commonAncestorEnvironment");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19
      && (v17 == (void *)v19 ? (v21 = v11) : (v21 = 0),
          v18 == (void *)v19 ? (v22 = v13) : (v22 = 0),
          (v21 & 1) != 0 || v22))
    {
      objc_msgSend(v15, "_prepareForFocusAnimation:", 1, v30, aBlock, v32, v33, v34, v35);
      v16[2](v16, v20);
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v15, "_prepareForFocusAnimation:", 1);
        v16[2](v16, v17);
      }
      if (v13)
      {
        objc_msgSend(v15, "_prepareForFocusAnimation:", 0);
        v16[2](v16, v18);
      }
    }

    _Block_object_dispose(&v38, 8);
    v6 = v30;
  }
  -[_UIFocusSystemSceneComponent _syncResponderWithFocusUpdateContext:](self, "_syncResponderWithFocusUpdateContext:", v7, v30);
  v23 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  expectedFirstResponder = self->_expectedFirstResponder;
  self->_expectedFirstResponder = v23;

  objc_msgSend(v7, "nextFocusedView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "previouslyFocusedView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 == v26
    || !objc_msgSend(v26, "canBecomeKeyWindow")
    || (objc_msgSend(v26, "isKeyWindow") & 1) != 0)
  {

  }
  else
  {
    v29 = objc_msgSend(v26, "_isTextEffectsWindow");

    if ((v29 & 1) == 0)
      objc_msgSend(v26, "makeKeyWindow");
  }

}

- (void)_focusSystem:(id)a3 didUpdateFocusInContext:(id)a4
{
  UIFocusSystem *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = (UIFocusSystem *)a3;
  v7 = a4;
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_focusSystem == v6)
  {
    v22[0] = CFSTR("UIFocusUpdateContextKey");
    v22[1] = CFSTR("UIFocusUpdateAnimationCoordinatorKey");
    v23[0] = v7;
    v23[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIFocusDidUpdateNotification"), v6, v10);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69___UIFocusSystemSceneComponent__focusSystem_didUpdateFocusInContext___block_invoke;
  v20[3] = &unk_1E16B1B50;
  v20[4] = self;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v9, "addCoordinatedAnimations:completion:", v20, 0);
  -[_UIFocusSystemSceneComponent focusAnimationCoordinatorManager](self, "focusAnimationCoordinatorManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previouslyFocusedItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didUpdateFocusInContext:fromItem:", v12, v14);

  objc_msgSend(v12, "_request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v15, "shouldPerformHapticFeedback");

  if ((_DWORD)v14)
  {
    -[_UIFocusSystemSceneComponent hapticFeedbackGenerator](self, "hapticFeedbackGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performHapticFeedbackForFocusUpdateInContext:", v12);

  }
  objc_msgSend(v12, "_request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldPlayFocusSound");

  if (v18)
  {
    -[_UIFocusSystemSceneComponent soundGenerator](self, "soundGenerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playSoundForFocusUpdateInContext:", v12);

  }
}

- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4
{
  id v6;
  UIResponder *expectedFirstResponder;
  UIResponder *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  expectedFirstResponder = self->_expectedFirstResponder;
  if (expectedFirstResponder)
  {
    self->_expectedFirstResponder = 0;
    v8 = expectedFirstResponder;

    -[_UIFocusSystemSceneComponent _validateFocusedItemForFirstResponder:](self, "_validateFocusedItemForFirstResponder:", v8);
  }
  -[_UIFocusSystemSceneComponent scrollManager](self, "scrollManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performScrollingIfNeededForFocusUpdateInContext:", v6);

  objc_msgSend(v6, "_focusMovement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isVelocityBased");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)UIApp;
    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_keyWindowForScreen:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_focusEventRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_resetProgressAccumulator");

  }
}

- (void)_focusSystem:(id)a3 willMessageOldFocusNodes:(id)a4
{
  id v4;

  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_prepareForFocusAnimation:", 1);

}

- (void)_focusSystem:(id)a3 willMessageNewFocusNodes:(id)a4
{
  id v4;

  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_prepareForFocusAnimation:", 0);

}

- (void)_focusSystem:(id)a3 environment:(id)a4 didUpdateFocusInContext:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didUpdateFocusInContext:withAnimationCoordinator:", v6, v8);

}

- (CGRect)_clippingRectForFocusSystem:(id)a3 inCoordinateSpace:(id)a4
{
  id v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v5 = a4;
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "convertRect:toCoordinateSpace:", v5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldWaitForFocusMovementActionToEnableFocusSystem:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "waitForFocusMovementActionToEnableFocusSystem");

  return v4;
}

- (BOOL)_focusSystem:(id)a3 handleFailedMovementRequest:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIFocusMovementAction *v18;
  void *v19;
  UIFocusMovementAction *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "movementInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIFocusSystemSceneComponent _shouldForwardFocusMovementRequest:](self, "_shouldForwardFocusMovementRequest:", v5);
  if (v7)
  {
    objc_msgSend(v5, "focusSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFocusSystemSceneComponent coordinateSpace](self, "coordinateSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _UIFocusItemFrameInCoordinateSpace(v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v18 = [UIFocusMovementAction alloc];
    objc_msgSend(v5, "inputDeviceInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIFocusMovementAction initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:](v18, "initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:", v6, v19, objc_msgSend(v5, "shouldPerformHapticFeedback"), v11, v13, v15, v17);

    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_preferredFocusedWindow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_forwardFocusMovementAction:", v20);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_allWindows");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v29), "_focusEventRecognizer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "reset");

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v27);
    }

  }
  return v7;
}

- (BOOL)_focusSystem:(id)a3 isScrollingScrollableContainer:(id)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;

  v7 = a4;
  -[_UIFocusSystemSceneComponent scrollManager](self, "scrollManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScrollingScrollableContainer:", v7);

  if (a5 && v9)
  {
    -[_UIFocusSystemSceneComponent scrollManager](self, "scrollManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetContentOffsetForScrollableContainer:", v7);
    a5->x = v11;
    a5->y = v12;

  }
  return v9;
}

- (BOOL)_shouldForwardFocusMovementRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a3, "movementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (-[_UIFocusSystemSceneComponent _uiktest_allowsForwardingFocusMovementActions](self, "_uiktest_allowsForwardingFocusMovementActions"))
  {
    v8 = 0;
    if (objc_msgSend(v4, "_isInitialMovement") && v7 != 2)
    {
      objc_msgSend(v5, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");

      v8 = v10 == 3 || (objc_msgSend(v4, "heading") & 0x300) == 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_focusSystem:(id)a3 shouldReverseLayoutDirectionForEnvironment:(id)a4
{
  void *v4;
  char v5;

  __viewOrWindowFallbackForRTLProbing(self, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldReverseLayoutDirection");

  return v5;
}

- (BOOL)_focusSystem:(id)a3 shouldReverseLinearWrappingForEnvironment:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  __viewOrWindowFallbackForRTLProbing(self, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_reversesLinearFocusWrapping");

  return v6;
}

- (NSString)description
{
  UIDescriptionBuilder *v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;

  v3 = -[UIDescriptionBuilder initWithObject:]([UIDescriptionBuilder alloc], "initWithObject:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v5 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("scene"), WeakRetained);

  v6 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("focusSystem"), self->_focusSystem);
  -[UIDescriptionBuilder string](v3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (_UIFocusItemFrameReporter)_focusItemFrameReporter
{
  return self->_focusItemFrameReporter;
}

- (void)set_focusItemFrameReporter:(id)a3
{
  objc_storeStrong((id *)&self->_focusItemFrameReporter, a3);
}

- (_UIFocusEventDelivery)_eventDelivery
{
  return self->_eventDelivery;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setFocusSystem:(id)a3
{
  objc_storeStrong((id *)&self->_focusSystem, a3);
}

- (_UIFocusHardwareKeyboardObserver)hardwareKeyboardObserver
{
  return self->_hardwareKeyboardObserver;
}

- (_UIFocusGameControllerObserver)gameControllerObserver
{
  return self->_gameControllerObserver;
}

- (_UIFocusDebugWindow)debugWindow
{
  return self->_debugWindow;
}

- (NSPointerArray)preferredFocusEnvironmentOverride
{
  return self->_preferredFocusEnvironmentOverride;
}

- (_UIFocusSoundGenerator)soundGenerator
{
  return self->_soundGenerator;
}

- (void)setSoundGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_soundGenerator, a3);
}

- (_UIFocusHapticFeedbackGenerator)hapticFeedbackGenerator
{
  return self->_hapticFeedbackGenerator;
}

- (void)setHapticFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_hapticFeedbackGenerator, a3);
}

- (_UIFocusAnimationCoordinatorManager)focusAnimationCoordinatorManager
{
  return self->_focusAnimationCoordinatorManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusAnimationCoordinatorManager, 0);
  objc_storeStrong((id *)&self->_scrollManager, 0);
  objc_storeStrong((id *)&self->_hapticFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_soundGenerator, 0);
  objc_storeStrong((id *)&self->_activeSceneObserver, 0);
  objc_storeStrong((id *)&self->_preferredFocusEnvironmentOverride, 0);
  objc_storeStrong((id *)&self->_debugWindow, 0);
  objc_storeStrong((id *)&self->_gameControllerObserver, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboardObserver, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_storeStrong((id *)&self->_focusEffectManager, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_eventDelivery, 0);
  objc_storeStrong((id *)&self->_focusItemFrameReporter, 0);
  objc_storeStrong((id *)&self->_overrideFocusSystemEnablementIdentifiers, 0);
  objc_storeStrong((id *)&self->_expectedFirstResponder, 0);
}

@end
