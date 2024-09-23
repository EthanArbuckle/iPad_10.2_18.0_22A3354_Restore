@implementation _UISystemAppearanceManager

- (_UISystemAppearanceManager)initWithScene:(id)a3
{
  id v5;
  _UISystemAppearanceManager *v6;
  _UISystemAppearanceManager *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemAppearanceManager.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == nil || [scene isKindOfClass:[UIWindowScene class]]"));

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)_UISystemAppearanceManager;
  v6 = -[_UISystemAppearanceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UISystemAppearanceManager _setScene:](v6, "_setScene:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleWindowVisibilityNotification_, CFSTR("UIWindowDidBecomeVisibleNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__handleWindowVisibilityNotification_, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

  }
  return v7;
}

- (void)updateWhitePointAdaptivityStyle
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  UIWindowScene *windowScene;
  _QWORD v8[5];

  -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveWhitePointAdaptivityStyleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "preferredWhitePointAdaptivityStyle");
  else
    v6 = 0;
  self->_whitePointAdaptivityStyle = v6;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    windowScene = self->_windowScene;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61___UISystemAppearanceManager_updateWhitePointAdaptivityStyle__block_invoke;
    v8[3] = &unk_1E16B82A0;
    v8[4] = self;
    -[UIScene _updateUIClientSettingsWithUITransitionBlock:](windowScene, "_updateUIClientSettingsWithUITransitionBlock:", v8);
  }

}

- (void)updateHomeIndicatorAutoHidden
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[5];

  -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveHomeIndicatorAutoHiddenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "prefersHomeIndicatorAutoHidden");
  else
    v6 = 0;
  self->_homeIndicatorAutoHidden = v6;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIScene _FBSScene](self->_windowScene, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59___UISystemAppearanceManager_updateHomeIndicatorAutoHidden__block_invoke;
    v8[3] = &unk_1E16B2A58;
    v8[4] = self;
    objc_msgSend(v7, "updateUIClientSettingsWithBlock:", v8);

  }
}

- (void)updateScreenEdgesDeferringSystemGestures
{
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (-[UIWindowScene statusBarManager](self->_windowScene, "statusBarManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isStatusBarHidden"),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v6 = objc_msgSend(v8, "preferredScreenEdgesDeferringSystemGestures");
    else
      v6 = 0;

  }
  else
  {
    v6 = 15;
  }
  self->_screenEdgesDeferringSystemGestures = v6;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIScene _FBSScene](self->_windowScene, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70___UISystemAppearanceManager_updateScreenEdgesDeferringSystemGestures__block_invoke;
    v10[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v10[4] = v6;
    objc_msgSend(v9, "updateUIClientSettingsWithBlock:", v10);

  }
}

- (void)_handleWindowVisibilityNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[_UISystemAppearanceManager windowScene](self, "windowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(v19, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("UIWindowDidBecomeVisibleNotification")))
  {

  }
  else
  {
    objc_msgSend(v19, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UIWindowDidBecomeHiddenNotification"));

    if (!v8)
    {
LABEL_10:
      v16 = 0;
      goto LABEL_16;
    }
  }
  objc_msgSend(v19, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v19, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = v13;
  if (v12 == v13)
  {

  }
  else
  {
    if (!v13 || !v12)
    {

LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_14;
  }
  v16 = v11;
LABEL_15:

LABEL_16:
  if (v16)
  {
    -[_UISystemAppearanceManager previousWindowDrivingSystemAppearance](self, "previousWindowDrivingSystemAppearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 != v18)
      -[_UISystemAppearanceManager _windowDrivingSystemAppearanceDidChange:](self, "_windowDrivingSystemAppearanceDidChange:", v18);

  }
}

- (id)_findWindowDrivingSystemAppearance
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v7;
  UIWindowScene *windowScene;
  void *v9;
  UIWindowScene *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", self->_windowScene);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISystemAppearanceManager previousWindowDrivingSystemAppearance](self, "previousWindowDrivingSystemAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    v5 = _findWindowDrivingSystemAppearance___s_category;
    if (!_findWindowDrivingSystemAppearance___s_category)
    {
      v5 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_findWindowDrivingSystemAppearance___s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v7 = *(id *)(v5 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        windowScene = self->_windowScene;
        if (windowScene)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = windowScene;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v10);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = CFSTR("(nil)");
        }
        v14 = v13;
        -[UIScene _persistenceIdentifier](self->_windowScene, "_persistenceIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UISystemAppearanceManager previousWindowDrivingSystemAppearance](self, "previousWindowDrivingSystemAppearance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("(nil)");
        }
        v21 = v20;
        v22 = v3;
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v22);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = CFSTR("(nil)");
        }

        *(_DWORD *)buf = 138413058;
        v28 = v14;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v21;
        v33 = 2112;
        v34 = v26;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%@ (%@) Scene window driving system appearance changed: %@ -> %@", buf, 0x2Au);

      }
    }
    -[_UISystemAppearanceManager setPreviousWindowDrivingSystemAppearance:](self, "setPreviousWindowDrivingSystemAppearance:", v3);
  }
  return v3;
}

- (UIWindow)previousWindowDrivingSystemAppearance
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_previousWindowDrivingSystemAppearance);
}

- (void)window:(id)a3 didUpdateSupportedOrientations:(unint64_t)a4 preferredOrientation:(int64_t)a5 prefersAnimation:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  unint64_t supportedInterfaceOrientations;
  int64_t preferredInterfaceOrientation;
  int64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  BOOL v32;
  int v33;
  UIWindowScene *windowScene;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char v44;
  char v45;
  BOOL v46;
  id v47;
  unint64_t v48;
  int64_t v49;
  _QWORD v50[4];
  id v51;
  _UISystemAppearanceManager *v52;
  unint64_t v53;
  int64_t v54;
  unint64_t v55;
  int64_t v56;
  char v57;
  BOOL v58;
  char v59;
  BOOL v60;
  BOOL v61;
  char v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[_UISystemAppearanceManager windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISystemAppearanceManager windowScene](self, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = a4;
    v49 = a5;
    if (v12 != v13)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        {
          -[_UISystemAppearanceManager windowScene](self, "windowScene");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "windowScene");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v64 = v10;
          v65 = 2112;
          v66 = v41;
          v67 = 2112;
          v68 = v42;
          _os_log_fault_impl(&dword_185066000, v40, OS_LOG_TYPE_FAULT, "Window (%@) with unexpected windowScene passed to windowDidUpdateOrientationPreferences. Expected: %@, Received: %@", buf, 0x20u);

        }
      }
      else
      {
        v35 = window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation____s_category;
        if (!window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation____s_category)
        {
          v35 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v35, (unint64_t *)&window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation____s_category);
        }
        v36 = *(NSObject **)(v35 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = v36;
          -[_UISystemAppearanceManager windowScene](self, "windowScene");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "windowScene");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v64 = v10;
          v65 = 2112;
          v66 = v38;
          v67 = 2112;
          v68 = v39;
          _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Window (%@) with unexpected windowScene passed to windowDidUpdateOrientationPreferences. Expected: %@, Received: %@", buf, 0x20u);

        }
      }
    }
    -[UIWindowScene _windowOrientationPreferencesObserver](self->_windowScene, "_windowOrientationPreferencesObserver");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, id, unint64_t, int64_t))(v14 + 16))(v14, v10, a4, a5);
    -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v18 = v16;
    if (v18 == v17)
    {
      v46 = a6;

    }
    else
    {
      v19 = v18;
      if (!v17 || !v18)
      {

LABEL_27:
LABEL_28:

        goto LABEL_29;
      }
      v46 = a6;
      v20 = objc_msgSend(v17, "isEqual:", v18);

      if (!v20)
        goto LABEL_28;
    }
    v47 = v10;
    v21 = -[UIScene _canDynamicallySpecifySupportedInterfaceOrientations](self->_windowScene, "_canDynamicallySpecifySupportedInterfaceOrientations");
    supportedInterfaceOrientations = self->_supportedInterfaceOrientations;
    preferredInterfaceOrientation = self->_preferredInterfaceOrientation;
    v25 = v48;
    v24 = v49;
    if (v21)
    {
      -[_UISystemAppearanceManager windowScene](self, "windowScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "interfaceOrientation");
      -[_UISystemAppearanceManager windowScene](self, "windowScene");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v27 == objc_msgSend(v28, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", v48, v49);
      v25 = v48;
      v29 = !v32;
      LODWORD(v43) = v29;

      v24 = v49;
    }
    else
    {
      LODWORD(v43) = 0;
    }
    self->_supportedInterfaceOrientations = v25;
    self->_preferredInterfaceOrientation = v24;
    HIDWORD(v43) = supportedInterfaceOrientations != v48;
    -[UIScene _effectiveUISettings](self->_windowScene, "_effectiveUISettings", v43);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "_debugValidationOrientationMaskEnabled");

    v32 = supportedInterfaceOrientations == v25 && preferredInterfaceOrientation == v24;
    v33 = !v32;
    v10 = v47;
    if ((v21 | v31) != 1 || !v33)
      goto LABEL_28;
    windowScene = self->_windowScene;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __106___UISystemAppearanceManager_window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation___block_invoke;
    v50[3] = &unk_1E16B82C8;
    v57 = v45;
    v58 = v21;
    v59 = v31;
    v60 = preferredInterfaceOrientation != v49;
    v53 = v48;
    v54 = v49;
    v61 = v46;
    v51 = v17;
    v52 = self;
    v55 = supportedInterfaceOrientations;
    v56 = preferredInterfaceOrientation;
    v62 = v44;
    -[UIScene _updateUIClientSettingsWithUITransitionBlock:](windowScene, "_updateUIClientSettingsWithUITransitionBlock:", v50);
    v19 = v51;
    goto LABEL_27;
  }
LABEL_29:

}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setPreviousWindowDrivingSystemAppearance:(id)a3
{
  objc_storeWeak((id *)&self->_previousWindowDrivingSystemAppearance, a3);
}

- (void)_windowDrivingSystemAppearanceDidChange:(id)a3
{
  objc_msgSend(a3, "_updateOrientationPreferencesAnimated:", 0);
}

- (void)_logOrientationPreferencesChangeWithOldSupportedOrientations:(unint64_t)a3 newSupportedOrientations:(unint64_t)a4 oldPreferredOrientation:(int64_t)a5 newPreferredOrientation:(int64_t)a6 animationSettings:(id)a7 fenced:(BOOL)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  UIWindowScene *windowScene;
  void *v26;
  UIWindowScene *v27;
  objc_class *v28;
  void *v29;
  __CFString *v30;
  UIWindowScene *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  float v41;
  void *v42;
  float v43;
  void *v44;
  uint8_t buf[4];
  __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != a4)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    BSInterfaceOrientationMaskDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationMaskDescription();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ -> %@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  if (a5 != a6)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    BSInterfaceOrientationDescription();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ -> %@"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

  }
  if (os_variant_has_internal_diagnostics())
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBOOL();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("fenced=%@"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v37);

    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "duration");
    objc_msgSend(v38, "stringWithFormat:", CFSTR("animationDuration=%0.4f"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v40);

    objc_msgSend(v13, "speed");
    if (v41 != 1.0)
    {
      v42 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "speed");
      objc_msgSend(v42, "stringWithFormat:", CFSTR("animationSpeed=%0.4f"), v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v44);

    }
  }
  v23 = _logOrientationPreferencesChangeWithOldSupportedOrientations_newSupportedOrientations_oldPreferredOrientation_newPreferredOrientation_animationSettings_fenced____s_category;
  if (!_logOrientationPreferencesChangeWithOldSupportedOrientations_newSupportedOrientations_oldPreferredOrientation_newPreferredOrientation_animationSettings_fenced____s_category)
  {
    v23 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v23, (unint64_t *)&_logOrientationPreferencesChangeWithOldSupportedOrientations_newSupportedOrientations_oldPreferredOrientation_newPreferredOrientation_animationSettings_fenced____s_category);
  }
  v24 = *(id *)(v23 + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    if (windowScene)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = windowScene;
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>"), v29, v27);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v31 = self->_windowScene;
    }
    else
    {
      v31 = 0;
      v30 = CFSTR("(nil)");
    }
    v32 = v30;
    -[UIScene _persistenceIdentifier](v31, "_persistenceIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("; "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v46 = v30;
    v47 = 2112;
    v48 = v33;
    v49 = 2112;
    v50 = v34;
    _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "%@ (%@) Scene updated orientation preferences: %@", buf, 0x20u);

  }
}

- (void)_setScene:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BSInvalidatable *v13;
  BSInvalidatable *stateCaptureToken;
  void *v15;
  id v16;
  id location;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemAppearanceManager.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == nil || [scene isKindOfClass:[UIWindowScene class]]"));

    }
  }
  objc_storeStrong((id *)&self->_windowScene, a3);
  objc_storeWeak((id *)&self->_previousWindowDrivingSystemAppearance, 0);
  -[_UISystemAppearanceManager stateCaptureToken](self, "stateCaptureToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[UIScene session](self->_windowScene, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("UIKit - UIWindowSceneOrientationState - %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self->_windowScene);
  v12 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v16, &location);
  BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureToken = self->_stateCaptureToken;
  self->_stateCaptureToken = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BSInvalidatable)stateCaptureToken
{
  return self->_stateCaptureToken;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UISystemAppearanceManager stateCaptureToken](self, "stateCaptureToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)_UISystemAppearanceManager;
  -[_UISystemAppearanceManager dealloc](&v4, sel_dealloc);
}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (void)updateMultitaskingDragExclusionRects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSArray *v31;
  NSArray *multitaskingDragExclusionRects;
  UIWindowScene *windowScene;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[_UISystemAppearanceManager _findWindowDrivingSystemAppearance](self, "_findWindowDrivingSystemAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveViewControllerForMultitaskingDragExclusionRects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_multitaskingDragExclusionRects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v12), "CGRectValue");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v5, "viewIfLoaded");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "convertRect:fromView:", v21, v14, v16, v18, v20);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;

        objc_msgSend(v3, "_convertRectToSceneReferenceSpace:", v23, v25, v27, v29);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v30);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v10);
  }

  v31 = (NSArray *)objc_msgSend(v7, "copy");
  multitaskingDragExclusionRects = self->_multitaskingDragExclusionRects;
  self->_multitaskingDragExclusionRects = v31;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    windowScene = self->_windowScene;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66___UISystemAppearanceManager_updateMultitaskingDragExclusionRects__block_invoke;
    v34[3] = &unk_1E16B2A58;
    v34[4] = self;
    -[UIScene _updateUIClientSettingsWithBlock:](windowScene, "_updateUIClientSettingsWithBlock:", v34);
  }

}

- (BOOL)homeIndicatorAutoHidden
{
  return self->_homeIndicatorAutoHidden;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  return self->_screenEdgesDeferringSystemGestures;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (NSArray)multitaskingDragExclusionRects
{
  return self->_multitaskingDragExclusionRects;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (void)setStateCaptureToken:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_destroyWeak((id *)&self->_previousWindowDrivingSystemAppearance);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_multitaskingDragExclusionRects, 0);
}

@end
