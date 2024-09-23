@implementation UIWindowScene

- (UIScreen)screen
{
  UIScreen *screen;
  void *v4;
  UIScreen *v5;
  UIScreen *v6;

  screen = self->_screen;
  if (!screen)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v4);
    v5 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    v6 = self->_screen;
    self->_screen = v5;

    screen = self->_screen;
  }
  return screen;
}

- (CGRect)_referenceBounds
{
  void *v3;
  int v4;
  void *v5;
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
  CGRect result;

  if (+[UIApplication _isClassic](UIApplication, "_isClassic")
    && (-[UIWindowScene screen](self, "screen"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_isMainScreen"),
        v3,
        v4))
  {
    -[UIWindowScene screen](self, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_unjailedReferenceBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    objc_msgSend(__UISceneEffectiveSettings((uint64_t)self), "frame");
    v11 = v14;
    v13 = v15;
    v7 = 0.0;
    v9 = 0.0;
  }
  v16 = v7;
  v17 = v9;
  v18 = v11;
  v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (UITraitCollection)traitCollection
{
  UITraitCollection *v3;
  void *v4;

  v3 = self->_traitCollection;
  if (!v3)
  {
    -[UIWindowScene screen](self, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      +[UITraitCollection _defaultTraitCollection]();
      v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

uint64_t __72__UIWindowScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInternalWindow") ^ 1;
}

- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4
{
  _BOOL8 v4;
  uint64_t (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIWindowScene *v11;
  UIWindowScene *v12;
  UIWindowScene *v13;
  int v14;
  uint64_t *v15;
  id v16;
  uint64_t (**v17)(id, void *);
  id v18;
  _QWORD v20[4];
  uint64_t (**v21)(id, void *);
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__197;
  v27 = __Block_byref_object_dispose__197;
  v28 = 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1 && +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "windowScene");
      v11 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = self;
      if (v11 != self)
      {
        if (v6)
        {
          v14 = v6[2](v6, v10);

          if (!v14)
            goto LABEL_11;
        }
        else
        {

        }
        v15 = v24;
        v16 = v10;
        v13 = (UIWindowScene *)v15[5];
        v15[5] = (uint64_t)v16;
      }

    }
LABEL_11:

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__UIWindowScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke;
  v20[3] = &unk_1E16B27A8;
  v22 = &v23;
  v17 = v6;
  v21 = v17;
  -[UIWindowScene _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:](self, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 1, v4, 0, v20);
  v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v18;
}

- (UIKeyboardSceneDelegate)keyboardSceneDelegate
{
  return (UIKeyboardSceneDelegate *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIKeyboardSceneDelegateSceneComponentKey"));
}

+ (id)_keyWindowScene
{
  id *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  +[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowEvaluator applicationKeyWindow](v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (UIStatusBarManager)statusBarManager
{
  void *v3;
  UIWindowScene *v4;

  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIStatusBarManagerWindowSceneComponentKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIScene _settingsScene](self, "_settingsScene");
    v4 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
    if (v4 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v3 = 0;
    }
    else
    {
      -[UIWindowScene statusBarManager](v4, "statusBarManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (UIStatusBarManager *)v3;
}

- (BOOL)_allowsEventUIWindowRouting
{
  void *v3;
  void *v4;
  int v5;

  if (objc_msgSend((id)objc_opt_class(), "_supportsEventUIWindowRouting"))
  {
    -[UIScene session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "role");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive")) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)_supportsEventUIWindowRouting
{
  return 1;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    -[UIWindowScene _displayInfoProvider](self, "_displayInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsetsPortrait");
    v8 = v10;
    v7 = v13;
    v6 = v11;
    v5 = v12;
    if (v13 != 0.0 || v10 != 0.0 || v12 != 0.0 || v11 != 0.0)
    {
      objc_msgSend(v9, "homeAffordanceOverlayAllowance");
      v15 = v14;
      if (-[UIWindowScene _shouldRotateSafeAreaInsetsToInterfaceOrientation](self, "_shouldRotateSafeAreaInsetsToInterfaceOrientation"))
      {
        if (a3 == 4)
          v16 = v8;
        else
          v16 = v5;
        if (a3 == 4)
          v17 = v5;
        else
          v17 = v6;
        if (a3 == 4)
          v18 = v6;
        else
          v18 = v7;
        if (a3 == 4)
          v19 = v7;
        else
          v19 = v8;
        if (a3 == 3)
        {
          v16 = v6;
          v17 = v7;
          v18 = v8;
          v19 = v5;
        }
        if (a3 == 2)
          v20 = v7;
        else
          v20 = v16;
        if (a3 == 2)
          v21 = v8;
        else
          v21 = v17;
        if (a3 == 2)
        {
          v8 = v6;
        }
        else
        {
          v5 = v18;
          v8 = v19;
        }
        -[UIScene _displayClientComponent](self, "_displayClientComponent", v16, v17, v18, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "displayBasedSafeAreaInsets");
          if (a3 == 4)
            v28 = v24;
          else
            v28 = v27;
          if (a3 == 4)
            v29 = v26;
          else
            v29 = v25;
          if (a3 != 3)
          {
            v26 = v28;
            v24 = v29;
          }
          if (a3 == 2)
            v24 = v27;
          else
            v25 = v26;
          v30 = fmax(v24, v25);
        }
        else
        {
          v30 = fmax(v5, v20);
        }
        v7 = fmax(v5, v30);
        v5 = fmax(v20, v30);

        v6 = v21;
      }
      v6 = fmax(v6, v15);
    }

  }
  v31 = v8;
  v32 = v7;
  v33 = v6;
  v34 = v5;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (_UIDisplayInfoProviding)_displayInfoProvider
{
  _UIDisplayInfoProviding *displayEdgeInfoProvider;
  void *v4;
  void *v5;
  void *v6;
  _UIDisplayInfoProviding *v7;
  void *v8;
  _UIDisplayInfoProviding *v9;
  _UIDisplayInfoProviding *v10;
  _UIDisplayInfoProviding *v11;

  if (objc_msgSend((id)UIApp, "_sceneSettingsIncludeSafeAreaInsets")
    && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, (uint64_t)CFSTR("ForceIOSDeviceInsets"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD75E3C))
  {
    -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isUISubclass"))
    {
      v9 = v8;
    }
    else
    {
      _UIDisplayInfoNullProvider();
      v9 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    displayEdgeInfoProvider = self->_displayEdgeInfoProvider;
    if (!displayEdgeInfoProvider)
    {
      -[UIWindowScene screen](self, "screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_displayInfoProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = v5;
      }
      else
      {
        _UIDisplayInfoNullProvider();
        v7 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
      }
      v11 = self->_displayEdgeInfoProvider;
      self->_displayEdgeInfoProvider = v7;

      displayEdgeInfoProvider = self->_displayEdgeInfoProvider;
    }
    v10 = displayEdgeInfoProvider;
  }
  return v10;
}

- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation
{
  void *v2;
  BOOL v3;

  -[UIWindowScene traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (UIInterfaceOrientation)interfaceOrientation
{
  void *v3;
  UIInterfaceOrientation v4;

  if (-[UIWindowScene _canReceiveDeviceOrientationEvents](self, "_canReceiveDeviceOrientationEvents"))
    -[UIScene _effectiveUIClientSettings](self, "_effectiveUIClientSettings");
  else
    -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (BOOL)_canReceiveDeviceOrientationEvents
{
  void *v2;
  char v3;

  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceOrientationEventsEnabled");

  return v3;
}

- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  void (**v11)(id, void *, uint8_t *);
  _UIContextBinder *contextBinder;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  UIWindowScene *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  objc_class *v26;
  _BYTE *v27;
  uint8_t buf[4];
  const char *Name;
  uint64_t v31;

  v8 = a5;
  v9 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, void *, uint8_t *))a7;
  if (!v11)
    goto LABEL_20;
  if (v8 || pthread_main_np() == 1)
    goto LABEL_4;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136315138;
      Name = class_getName(v26);
      _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Unsupported enumeration of %s windows on non-main thread.", buf, 0xCu);
    }
  }
  else
  {
    v22 = _enumerateWindowsIncludingInternalWindows_onlyVisibleWindows_asCopy_stopped_withBlock____s_category;
    if (!_enumerateWindowsIncludingInternalWindows_onlyVisibleWindows_asCopy_stopped_withBlock____s_category)
    {
      v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&_enumerateWindowsIncludingInternalWindows_onlyVisibleWindows_asCopy_stopped_withBlock____s_category);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v24 = v23;
    v25 = (objc_class *)objc_opt_class();
    *(_DWORD *)buf = 136315138;
    Name = class_getName(v25);
    _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Unsupported enumeration of %s windows on non-main thread.", buf, 0xCu);
  }

LABEL_4:
  contextBinder = self->_contextBinder;
  if (v9)
    -[_UIContextBinder _attachedBindablePointersAsCopy:](contextBinder, "_attachedBindablePointersAsCopy:", v8);
  else
    -[_UIContextBinder _enrolledBindablePointersAsCopy:](contextBinder, "_enrolledBindablePointersAsCopy:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count", a6);
  if (!v14)
    goto LABEL_19;
  v15 = v14;
  v16 = 0;
  v17 = v9 && v8;
  while (1)
  {
    v18 = (void *)MEMORY[0x186DC9484]();
    v19 = (void *)objc_msgSend(v13, "pointerAtIndex:", v16);
    if (!v19)
      goto LABEL_18;
    v20 = v19;
    if (!a3 && (objc_msgSend(v19, "isInternalWindow") & 1) != 0)
      goto LABEL_18;
    if (v17)
    {
      if ((_UIWindowSceneCompatibleIsHidden(v20) & 1) != 0)
        goto LABEL_18;
    }
    else if (!v8)
    {
      break;
    }
    objc_msgSend(v20, "_windowHostingScene");
    v21 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();

    if (v21 == self)
      break;
LABEL_18:
    objc_autoreleasePoolPop(v18);
    if (v15 == ++v16)
      goto LABEL_19;
  }
  buf[0] = 0;
  v11[2](v11, v20, buf);
  if (!buf[0])
    goto LABEL_18;
  if (v27)
    *v27 = 1;
  objc_autoreleasePoolPop(v18);
LABEL_19:

LABEL_20:
}

void __64__UIWindowScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  int v10;
  id v11;

  v4 = a2;
  v11 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || (objc_msgSend(v4, "windowLevel"),
        v6 = v5,
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "windowLevel"),
        v7 = v11,
        v6 > v8))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (!v9 || (v10 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v11), v7 = v11, v10))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v7 = v11;
    }
  }

}

- (void)_registerSceneComponent:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowScene;
  -[UIScene _registerSceneComponent:forKey:](&v9, sel__registerSceneComponent_forKey_, v6, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "_traitOverrides");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[UIWindowScene _componentDidUpdateTraitOverrides:](self, "_componentDidUpdateTraitOverrides:", v7);

  }
}

void __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD v13[4];
  char v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_FBSScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isMainDisplay") & 1) != 0)
    {
LABEL_12:
      v2[416] &= ~4u;

      goto LABEL_13;
    }
    objc_msgSend(v2, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "isUISubclass"))
    {
LABEL_11:

      goto LABEL_12;
    }
    v8 = v7;
    objc_msgSend(v2, "_visibleWindows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_2;
      v15[3] = &unk_1E16B8020;
      v15[4] = &v16;
      objc_msgSend(v2, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 1, 0, 0, v15);
      v12 = *((_BYTE *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
      if (v12 == objc_msgSend(v8, "disablesMirroring"))
        goto LABEL_10;
    }
    else
    {
      if ((objc_msgSend(v8, "disablesMirroring") & 1) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      LOBYTE(v12) = 0;
    }
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_3;
    v13[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v14 = v12;
    objc_msgSend(v2, "_updateUIClientSettingsWithBlock:", v13);
    goto LABEL_10;
  }
LABEL_13:

}

- (double)_systemMinimumMargin
{
  void *v3;
  double v4;
  double v5;

  if (!dyld_program_sdk_at_least())
    return 0.0;
  -[UIWindowScene _displayInfoProvider](self, "_displayInfoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemMinimumMargin");
  v5 = v4;

  return v5;
}

- (id)_topVisibleWindowPassingTest:(id)a3
{
  return -[UIWindowScene _topVisibleWindowEnumeratingAsCopy:passingTest:](self, "_topVisibleWindowEnumeratingAsCopy:passingTest:", 0, a3);
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 1;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (self && (*((_BYTE *)&self->super._sceneFlags + 1) & 0x40) != 0
    || !-[UIWindowScene _shouldDeferInitialWindowUpdateBeforeConnection:](self, "_shouldDeferInitialWindowUpdateBeforeConnection:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[UIWindowScene _addWindowNeedingDeferredInitialUpdateExecution:]((uint64_t)self, v4);
    v5 = 1;
  }

  return v5;
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  void *v3;
  void *v4;
  UIWindow *v5;
  UIWindow *delegateWindowNeedingDeferredInitialUpdate;
  _BOOL4 v7;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  UIWindow *v23;
  UIWindow *v24;
  double v25;
  char IsHidden;
  NSHashTable *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  UIWindow *v32;
  NSHashTable *windowsNeedingDeferredInitialUpdateExecution;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self || (*((_BYTE *)&self->super._sceneFlags + 1) & 0x40) == 0)
  {
    v43.receiver = self;
    v43.super_class = (Class)UIWindowScene;
    -[UIScene _performDeferredInitialWindowUpdateForConnection](&v43, sel__performDeferredInitialWindowUpdateForConnection);
    -[UIWindowScene _windowSceneDelegate](self, "_windowSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((*(_BYTE *)&self->_windowSceneFlags & 1) != 0)
    {
      objc_msgSend(v3, "window");
      v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      delegateWindowNeedingDeferredInitialUpdate = self->_delegateWindowNeedingDeferredInitialUpdate;
      v7 = -[NSHashTable containsObject:](self->_windowsNeedingDeferredInitialUpdateExecution, "containsObject:", v5);
      if (v5 == delegateWindowNeedingDeferredInitialUpdate && v7)
        -[UIWindow makeKeyAndVisible](v5, "makeKeyAndVisible");

    }
    v34 = v4;
    v9 = objc_msgSend((id)UIApp, "isFrontBoard");
    -[UIScene session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "role");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

    -[UIWindowScene _visibleWindows](self, "_visibleWindows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v9 & 1) == 0 && (v12 & 1) == 0 && !v13)
    {
      v14 = _performDeferredInitialWindowUpdateForConnection___s_category;
      if (!_performDeferredInitialWindowUpdateForConnection___s_category)
      {
        v14 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_performDeferredInitialWindowUpdateForConnection___s_category);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        -[UIScene succinctDescription](self, "succinctDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v17;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Scene has no visible windows after session connection: %@", buf, 0xCu);

      }
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = (void *)-[NSHashTable copy](self->_windowsNeedingDeferredInitialUpdateExecution, "copy");
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = *(UIWindow **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (v23 != self->_delegateWindowNeedingDeferredInitialUpdate)
          {
LABEL_23:
            -[UIWindow _executeDeferredOrientationUpdate](v23, "_executeDeferredOrientationUpdate");
            -[NSHashTable removeObject:](self->_windowsNeedingDeferredInitialUpdateExecution, "removeObject:", v23);
            continue;
          }
          v24 = v23;
          -[UIView alpha](v24, "alpha");
          if (v25 >= 0.01)
          {
            IsHidden = _UIWindowSceneCompatibleIsHidden(v24);

            if ((IsHidden & 1) == 0)
              goto LABEL_23;
          }
          else
          {

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v20);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = self->_windowsNeedingDeferredInitialUpdateExecution;
    v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          -[UIWindow _invalidateDeferredOrientationUpdate](*(void **)(*((_QWORD *)&v35 + 1) + 8 * j));
        }
        v29 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v29);
    }

    v32 = self->_delegateWindowNeedingDeferredInitialUpdate;
    self->_delegateWindowNeedingDeferredInitialUpdate = 0;

    windowsNeedingDeferredInitialUpdateExecution = self->_windowsNeedingDeferredInitialUpdateExecution;
    self->_windowsNeedingDeferredInitialUpdateExecution = 0;

  }
}

- (id)_visibleWindows
{
  return -[_UIContextBinder attachedBindables](self->_contextBinder, "attachedBindables");
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  void *v4;
  void *v5;
  UIWindow *v6;
  UIWindow *delegateWindowNeedingDeferredInitialUpdate;
  BOOL v8;

  -[UIWindowScene _windowSceneDelegate](self, "_windowSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v8 = (*(_BYTE *)&self->_windowSceneFlags & 1) != 0
    && (objc_msgSend(v4, "window"),
        v6 = (UIWindow *)objc_claimAutoreleasedReturnValue(),
        delegateWindowNeedingDeferredInitialUpdate = self->_delegateWindowNeedingDeferredInitialUpdate,
        v6,
        v6 == delegateWindowNeedingDeferredInitialUpdate)
    && -[UIView isHidden](self->_delegateWindowNeedingDeferredInitialUpdate, "isHidden");

  return v8;
}

- (id)_windowSceneDelegate
{
  void *v2;
  id v3;

  -[UIScene delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE09ED00))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_subclassTracksWindowsNeedingDeferredInitialUpdates
{
  return 1;
}

- (void)_addWindowNeedingDeferredInitialUpdateExecution:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1 && (*(_BYTE *)(a1 + 217) & 0x40) == 0)
  {
    v4 = *(void **)(a1 + 368);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 368);
      *(_QWORD *)(a1 + 368) = v5;

      v4 = *(void **)(a1 + 368);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)coordinateSpace
{
  return self->_coordinateSpace;
}

- (_UISceneUIWindowEventRouting)_sceneForKeyboardDisplay
{
  void *v3;
  void *v4;
  void *v5;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    v3 = (void *)objc_opt_class();
    -[UIWindowScene screen](self, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_keyboardWindowSceneForScreen:create:", v4, 0);
  }
  else
  {
    -[UIWindowScene screen](self, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteKeyboards keyboardWindowSceneForScreen:create:](_UIRemoteKeyboards, "keyboardWindowSceneForScreen:create:", v4, 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISceneUIWindowEventRouting *)v5;
}

+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:create:](_UIScreenBasedWindowScene, "_unassociatedWindowSceneForScreen:create:", a3, a4);
}

+ (id)_keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:create:](_UIKeyboardWindowScene, "_unassociatedWindowSceneForScreen:create:", a3, a4);
}

void __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void);
  void *v12;
  void (**v13)(void);

  v13 = a3;
  v4 = *(_QWORD *)(a1 + 40);
  v13[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHorizontalSizeClass:", v4);

  v6 = *(_QWORD *)(a1 + 48);
  v13[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVerticalSizeClass:", v6);

  if (qword_1ECD79C68 != -1)
    dispatch_once(&qword_1ECD79C68, &__block_literal_global_802);
  if (!byte_1ECD79BCA)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCaptured");
    v13[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSceneCaptureState:", v8);

  }
  v10 = *(_QWORD *)(a1 + 56);
  v11 = v13;
  if (v10)
  {
    ((void (*)(void (**)(void)))v13[2])(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInterfaceStyle:", v10);

    v11 = v13;
  }

}

- (void)_willRestoreInteractionStateForUserActivityManager:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWindowScene;
  -[UIScene _willRestoreInteractionStateForUserActivityManager:](&v5, sel__willRestoreInteractionStateForUserActivityManager_, a3);
  -[UIWindowScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_699);

}

- (BOOL)_supportsPassthroughInteractions
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  if (qword_1ECD79BD0 != -1)
    dispatch_once(&qword_1ECD79BD0, &__block_literal_global_187_1);
  -[UIScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
  if (_MergedGlobals_59 && (v6 & 1) == 0)
    v7 = -[UIWindowScene _enhancedWindowingEnabled](self, "_enhancedWindowingEnabled");

  return v7;
}

- (BOOL)_enhancedWindowingEnabled
{
  return self->_windowSceneFlags.enhancedWindowingEnabled != 0;
}

- (_UISystemAppearanceManager)_systemAppearanceManager
{
  return (_UISystemAppearanceManager *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UISystemAppearanceManagerWindowSceneComponentKey);
}

- (void)_windowUpdatedVisibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  UIWindow *v11;
  void (**v12)(_QWORD);
  UIWindow *keyWindow;
  NSPointerArray *keyWindowHistory;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  UIWindowScene *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD);
  _QWORD v34[4];
  id v35;
  UIWindow *v36;
  UIWindowScene *v37;
  _QWORD aBlock[5];
  id v39;
  _QWORD v40[2];
  BOOL (*v41)(uint64_t, uint64_t);
  void *v42;
  UIWindow *v43;
  char v44[9];

  v4 = a3;
  v5 = (void *)MEMORY[0x186DC9484]();
  -[UIScene _eventDeferringManager](self, "_eventDeferringManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIWindowScene__windowUpdatedVisibility___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v8 = v4;
  v39 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v34[0] = v7;
  v34[1] = 3221225472;
  v34[2] = __42__UIWindowScene__windowUpdatedVisibility___block_invoke_2;
  v34[3] = &unk_1E16B47A8;
  v10 = v6;
  v35 = v10;
  v11 = (UIWindow *)v8;
  v36 = v11;
  v37 = self;
  v12 = (void (**)(_QWORD))_Block_copy(v34);
  if (_UIWindowSceneCompatibleIsHidden(v11))
  {
    v9[2](v9);
    -[UIWindowScene _delegate_windowWillBecomeHidden:](self, "_delegate_windowWillBecomeHidden:", v11);
    -[_UIContextBinder detachBindable:](self->_contextBinder, "detachBindable:", v11);
  }
  else
  {
    -[UIWindowScene _delegate_windowWillBecomeVisible:](self, "_delegate_windowWillBecomeVisible:", v11);
    -[_UIContextBinder attachBindable:](self->_contextBinder, "attachBindable:", v11);
    -[UIWindowScene _delegate_windowDidBecomeVisible:](self, "_delegate_windowDidBecomeVisible:", v11);
    v12[2](v12);
  }
  keyWindow = self->_keyWindow;
  if (keyWindow == v11)
  {
    if (v11)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = self;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v20);
      v33 = v12;
      v23 = v10;
      v24 = v9;
      v25 = v5;
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: Key window changed visibility: %p"), v26, self->_keyWindow);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v25;
      v9 = v24;
      v10 = v23;
      v12 = v33;
LABEL_14:
      -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:]((id *)&v20->super.super.super.isa, 0, 1, 1, 0, v27);

    }
  }
  else if (!keyWindow && !-[UIView isHidden](v11, "isHidden"))
  {
    keyWindowHistory = self->_keyWindowHistory;
    v40[0] = v7;
    v40[1] = 3221225472;
    v41 = ____UIWindowSceneKeyWindowHistoryContainsMatchingPointer_block_invoke;
    v42 = &__block_descriptor_40_e13_B24__0_v8_B16l;
    v43 = v11;
    v15 = v40;
    v16 = -[NSPointerArray count](keyWindowHistory, "count");
    v44[0] = 0;
    v17 = v16 - 1;
    while (1)
    {
      if (v17 == -1)
      {
LABEL_11:

        goto LABEL_15;
      }
      v18 = -[NSPointerArray pointerAtIndex:](keyWindowHistory, "pointerAtIndex:", v17);
      if ((((uint64_t (*)(_QWORD *, uint64_t, char *))v41)(v15, v18, v44) & 1) != 0)
        break;
      --v17;
      if (v44[0])
        goto LABEL_11;
    }

    if (self)
    {
      if (v17 != 0x7FFFFFFFFFFFFFFFLL && !self->_keyWindow)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        v20 = self;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v20);
        v31 = v5;
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "stringWithFormat:", CFSTR("%@: No current key window and previous key window became visible"), v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v31;
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  -[UIWindowScene _enqueueEvaluationOfDisablesMirroring](self);

  objc_autoreleasePoolPop(v5);
}

- (void)_enqueueEvaluationOfDisablesMirroring
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id location;

  if (val)
  {
    if ((val[416] & 4) == 0)
    {
      val[416] |= 4u;
      objc_initWeak(&location, val);
      v1 = (void *)UIApp;
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke;
      v2[3] = &unk_1E16B3F40;
      objc_copyWeak(&v3, &location);
      objc_msgSend(v1, "_performBlockAfterCATransactionCommits:", v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __42__UIWindowScene__windowUpdatedVisibility___block_invoke_2(_QWORD *a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)a1[4];
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6 && (id)a1[5] == v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin fallback key window deferring for window: %p"), objc_opt_class(), a1[6], a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:]((_QWORD *)a1[6], a1[5], v5);

    v4 = v6;
  }

}

- (void)_delegate_windowDidBecomeVisible:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 8) != 0)
  {
    v4 = a3;
    -[UIScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_windowScene:windowDidBecomeVisible:", self, v4);

  }
}

- (void)_delegate_windowWillBecomeVisible:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 4) != 0)
  {
    v4 = a3;
    -[UIScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_windowScene:windowWillBecomeVisible:", self, v4);

  }
}

- (BOOL)_windowIsFront:(id)a3
{
  return -[_UIContextBinder bindableIsTopmostAttached:](self->_contextBinder, "bindableIsTopmostAttached:", a3);
}

void __42__UIWindowScene__windowUpdatedVisibility___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: end key window deferring for window hiding: %p"), objc_opt_class(), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _endEventDeferringIfNeededForWindow:withReason:](*(id **)(a1 + 32), *(void **)(a1 + 40), v2);

}

- (void)_endEventDeferringIfNeededForWindow:(void *)a3 withReason:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "_eventDeferringManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && a1[44])
    {
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager currentLocalDeferringTargetWindowMatchingEnvironment:deferringToken:]((uint64_t)v6, (uint64_t)v7, a1[44]);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = v8 == v10;
      else
        v9 = 0;
      if (v9)
        -[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]((uint64_t *)a1, v5);

    }
  }

}

- (void)_delegate_windowWillBecomeHidden:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 0x10) != 0)
  {
    v4 = a3;
    -[UIScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_windowScene:windowWillBecomeHidden:", self, v4);

  }
}

- (void)_windowUpdatedProperties:(id)a3
{
  -[_UIContextBinder updateBindable:](self->_contextBinder, "updateBindable:", a3);
}

- (BOOL)_windowsIgnoreSceneClientOrientation
{
  return 0;
}

+ (BOOL)_hostsWindows
{
  return 1;
}

+ (id)_placeholderWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:create:](_UIPlaceholderWindowScene, "_unassociatedWindowSceneForScreen:create:", a3, a4);
}

- (int64_t)_screenRequestedOverscanCompensation
{
  return self->_screenRequestedOverscanCompensation;
}

- (CGRect)_referenceBoundsForOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[UIWindowScene _referenceBounds](self, "_referenceBounds");
  v8 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v4, v5, v6, v7, v6, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_readySceneForConnection
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWindowScene;
  -[UIScene _readySceneForConnection](&v6, sel__readySceneForConnection);
  -[UIScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _loadWindowWithStoryboardIfNeeded:](self, "_loadWindowWithStoryboardIfNeeded:", v5);

}

- (void)_loadWindowWithStoryboardIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char windowSceneFlags;
  UIWindow *v9;
  UIWindow *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  unint64_t v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[UIWindowScene _shouldLoadStoryboard](self, "_shouldLoadStoryboard"))
  {
    objc_msgSend(v4, "instantiateInitialViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v12 = qword_1ECD79BE8;
      if (!qword_1ECD79BE8)
      {
        v12 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD79BE8);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        objc_msgSend(v4, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138412290;
        *(_QWORD *)&v20[4] = v15;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Failed to instantiate the default view controller for UIMainStoryboardFile '%@' - perhaps the designated entry point is not set?", v20, 0xCu);

      }
      goto LABEL_26;
    }
    -[UIWindowScene _windowSceneDelegate](self, "_windowSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      windowSceneFlags = (char)self->_windowSceneFlags;
      if ((windowSceneFlags & 1) != 0)
      {
        objc_msgSend(v6, "window");
        v9 = (UIWindow *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          -[UIWindow setWindowScene:](v9, "setWindowScene:", self);
          -[UIWindowScene coordinateSpace](self, "coordinateSpace");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bounds");
          -[UIWindow setFrame:](v10, "setFrame:");

LABEL_25:
          -[UIWindow setRootViewController:](v10, "setRootViewController:", v5, *(_QWORD *)v20);

LABEL_26:
          goto LABEL_27;
        }
        windowSceneFlags = (char)self->_windowSceneFlags;
      }
      if ((windowSceneFlags & 2) != 0)
      {
        v10 = -[UIWindow initWithWindowScene:]([UIWindow alloc], "initWithWindowScene:", self);
        objc_msgSend(v7, "setWindow:", v10);
        objc_storeStrong((id *)&self->_delegateWindowNeedingDeferredInitialUpdate, v10);
        -[UIWindowScene _addWindowNeedingDeferredInitialUpdateExecution:]((uint64_t)self, self->_delegateWindowNeedingDeferredInitialUpdate);
        goto LABEL_25;
      }
      v19 = qword_1ECD79BD8;
      if (!qword_1ECD79BD8)
      {
        v19 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD79BD8);
      }
      v17 = *(NSObject **)(v19 + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        v10 = 0;
        goto LABEL_25;
      }
      *(_WORD *)v20 = 0;
      v18 = "The scene delegate must implement the window property if it wants to use a main storyboard file.";
    }
    else
    {
      v16 = qword_1ECD79BE0;
      if (!qword_1ECD79BE0)
      {
        v16 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD79BE0);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)v20 = 0;
      v18 = "There is no scene delegate set. A scene delegate class must be specified to use a main storyboard file.";
    }
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, v18, v20, 2u);
    goto LABEL_23;
  }
LABEL_27:

}

- (BOOL)_shouldLoadStoryboard
{
  return 1;
}

- (BOOL)_isUserInteractionEnabled
{
  return self->_userInteractionDisabledCount == 0;
}

void __55__UIWindowScene__computeMetrics_withTransitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_allWindows");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inheritingWindowsIncludingInvisible:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_computeMetricsForWindows:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  _BOOL4 v4;
  _UIContextBinder *contextBinder;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  contextBinder = self->_contextBinder;
  if (a4)
    -[_UIContextBinder attachedBindables](contextBinder, "attachedBindables");
  else
    -[_UIContextBinder enrolledBindables](contextBinder, "enrolledBindables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_541);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_allWindows
{
  return -[_UIContextBinder enrolledBindables](self->_contextBinder, "enrolledBindables");
}

void __34__UIWindowScene__prepareForResume__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventDeferringManager");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5 == v8;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin fallback key window deferring for window: %p"), objc_opt_class(), *(_QWORD *)(a1 + 32), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](*(_QWORD **)(a1 + 32), (uint64_t)v8, v7);

  }
}

- (void)_componentDidUpdateTraitOverrides:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSSet *componentsWithTraitOverrides;
  NSSet *v8;
  NSSet *v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  UIWindowScene *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIScene _sceneComponents](self, "_sceneComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = self;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Unregistered component %@ updated trait overrides for scene %@", (uint8_t *)&v16, 0x16u);
      }

    }
    else
    {
      v10 = qword_1ECD79C00;
      if (!qword_1ECD79C00)
      {
        v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD79C00);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unregistered component %@ updated trait overrides for scene %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = self;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Component %@ updated trait overrides for scene %@, but does not respond to _traitOverrides selector", (uint8_t *)&v16, 0x16u);
      }

    }
    else
    {
      v12 = qword_1ECD79C08;
      if (!qword_1ECD79C08)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD79C08);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Component %@ updated trait overrides for scene %@, but does not respond to _traitOverrides selector", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  componentsWithTraitOverrides = self->_componentsWithTraitOverrides;
  if (!componentsWithTraitOverrides)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!-[NSSet containsObject:](componentsWithTraitOverrides, "containsObject:", v4))
  {
    -[NSSet setByAddingObject:](self->_componentsWithTraitOverrides, "setByAddingObject:", v4);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = self->_componentsWithTraitOverrides;
    self->_componentsWithTraitOverrides = v8;

  }
  -[UIWindowScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](self, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 0, 0);

}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  objc_super v16;
  _OWORD v17[2];
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v7 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[UIWindowScene traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIWindowSceneTraitCollectionWithSceneUISettings(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (v10 && v11)
    {
      v13 = objc_msgSend(v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_traitCollection, v9);
    -[UIWindowScene _updateEffectiveGeometryIfNeeded](self, "_updateEffectiveGeometryIfNeeded");
    if (v10)
    {
      v18 = 0;
      memset(v17, 0, sizeof(v17));
      -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)v10, (uint64_t)v12, (uint64_t)v17);
      -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v17, self, v10);
      if (*(_QWORD *)&v17[0])

    }
    -[UIScene delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&self->_windowSceneFlags & 4) != 0)
    {
      -[UIWindowScene coordinateSpace](self, "coordinateSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", self, v15, -[UIWindowScene interfaceOrientation](self, "interfaceOrientation"), v10);

    }
  }
LABEL_14:
  v16.receiver = self;
  v16.super_class = (Class)UIWindowScene;
  -[UIScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](&v16, sel__updateSceneTraitsAndPushTraitsToScreen_callParentWillTransitionToTraitCollection_, v5, v4);
  _UIRestorePreviousFallbackEnvironment(v7);

}

- (NSArray)windows
{
  return (NSArray *)-[UIWindowScene _allWindowsIncludingInternalWindows:onlyVisibleWindows:](self, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
}

- (void)_setReachabilitySupported:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  int reachabilitySupportedCounter;
  int v8;
  unint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  reachabilitySupportedCounter = self->_reachabilitySupportedCounter;
  if (v4)
    v8 = reachabilitySupportedCounter + 1;
  else
    v8 = reachabilitySupportedCounter - 1;
  self->_reachabilitySupportedCounter = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__UIWindowScene__setReachabilitySupported_forReason___block_invoke;
  v13[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v14 = v8 > 0;
  -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v13);
  v9 = _setReachabilitySupported_forReason____s_category;
  if (!_setReachabilitySupported_forReason____s_category)
  {
    v9 = __UILogCategoryGetNode("ReachabilitySupported", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_setReachabilitySupported_forReason____s_category);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    v12 = self->_reachabilitySupportedCounter;
    *(_DWORD *)buf = 138543874;
    if (v4)
      v11 = CFSTR("YES");
    v16 = v11;
    v17 = 2114;
    v18 = v6;
    v19 = 1026;
    v20 = v12;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "_setReachabilitySupported wants:%{public}@ forReason:%{public}@. _reachabilitySupportedCounter is now %{public}d", buf, 0x1Cu);
  }

}

- (void)_setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  char v8;
  __CFString *v9;
  _QWORD v10[4];
  __CFString *v11;
  char v12;
  BOOL v13;

  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 && -[__CFString length](v6, "length"))
  {
    v8 = 0;
  }
  else
  {

    v8 = 1;
    v7 = &stru_1E16EDF20;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__UIWindowScene__setSystemVolumeHUDEnabled_forAudioCategory___block_invoke;
  v10[3] = &unk_1E16DD500;
  v12 = v8;
  v13 = a3;
  v11 = v7;
  v9 = v7;
  -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v10);

}

- (id)_windowOrientationPreferencesObserver
{
  void *v4;
  id *v5;
  id *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id from;
  id location;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 0x40) != 0)
  {
    -[UIScene delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);

    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke;
    v13[3] = &unk_1E16E4950;
    v5 = &v14;
    objc_copyWeak(&v14, &from);
    v6 = &v15;
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    v7 = v13;
  }
  else
  {
    if ((*(_BYTE *)&self->_springBoardDelegateFlags & 0x80) == 0)
      return 0;
    -[UIScene delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v8);

    objc_initWeak(&from, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke_2;
    aBlock[3] = &unk_1E16E4978;
    v5 = &v11;
    objc_copyWeak(&v11, &from);
    v6 = &v12;
    objc_copyWeak(&v12, &location);
    v7 = aBlock;
  }
  v9 = _Block_copy(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v9;
}

- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interfaceOrientationMapResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "interfaceOrientationForSupportedOrientations:preferredOrientation:", a3, a4);
  else
    v9 = objc_msgSend((id)UIApp, "_fallbackInterfaceOrientationForSupportedOrientations:preferredOrientation:currentOrientation:", a3, a4, -[UIWindowScene interfaceOrientation](self, "interfaceOrientation"));
  v10 = v9;

  return v10;
}

- (void)_beginIgnoringInteractionEventsForReason:(id)a3
{
  id v4;
  unsigned int userInteractionDisabledCount;
  unint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  userInteractionDisabledCount = self->_userInteractionDisabledCount;
  self->_userInteractionDisabledCount = userInteractionDisabledCount + 1;
  v6 = _beginIgnoringInteractionEventsForReason____s_category;
  if (!_beginIgnoringInteractionEventsForReason____s_category)
  {
    v6 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_beginIgnoringInteractionEventsForReason____s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_signpost_enabled(v7))
  {
    v8 = objc_retainAutorelease(v4);
    v9 = v7;
    v10[0] = 67109378;
    v10[1] = userInteractionDisabledCount;
    v11 = 2080;
    v12 = objc_msgSend(v8, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "beginIgnoringInteractionEvents", "level: %u; reason: %s",
      (uint8_t *)v10,
      0x12u);

  }
}

- (void)_endIgnoringInteractionEventsForReason:(id)a3
{
  id v4;
  unsigned int userInteractionDisabledCount;
  unsigned int v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  userInteractionDisabledCount = self->_userInteractionDisabledCount;
  if (userInteractionDisabledCount)
  {
    v6 = userInteractionDisabledCount - 1;
    self->_userInteractionDisabledCount = userInteractionDisabledCount - 1;
    v7 = _endIgnoringInteractionEventsForReason____s_category;
    if (!_endIgnoringInteractionEventsForReason____s_category)
    {
      v7 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_endIgnoringInteractionEventsForReason____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_signpost_enabled(v8))
    {
      v9 = objc_retainAutorelease(v4);
      v10 = v8;
      v11[0] = 67109378;
      v11[1] = v6;
      v12 = 2080;
      v13 = objc_msgSend(v9, "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_185066000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "endIgnoringInteractionEvents", "level: %u; reason: %s",
        (uint8_t *)v11,
        0x12u);

    }
  }

}

- (id)_keyWindow
{
  if (a1)
    a1 = (id *)a1[43];
  return a1;
}

- (double)_adjustedLevelForWindow:(id)a3 preferredLevel:(double)a4
{
  id v6;
  void *v7;
  double v8;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 0x20) != 0)
  {
    v6 = a3;
    -[UIScene delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_windowScene:levelForWindow:preferredLevel:", self, v6, a4);
    a4 = v8;

  }
  return a4;
}

- (void)_updateVisibleWindowOrderWithTest:(id)a3
{
  -[_UIContextBinder updateBindableOrderWithTest:](self->_contextBinder, "updateBindableOrderWithTest:", a3);
}

- (BOOL)_permitContextCreationForBindingDescription:(id *)a3
{
  BOOL v5;
  void *v6;
  int64_t v8;
  _BOOL4 v9;
  int64_t v10;
  _BOOL4 var5;

  if (!-[UIScene _hasLifecycle](self, "_hasLifecycle"))
  {
    +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isActive") & 1) != 0
      || (objc_msgSend(v6, "suspendedEventsOnly") & 1) != 0
      || (objc_msgSend((id)UIApp, "_isActivating") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v10 = -[_UIContextBinder contextManagementPolicy](self->_contextBinder, "contextManagementPolicy");
      var5 = a3->var5;
      v5 = 1;
      if (!var5 && v10 != 1)
        v5 = -[UIScene _isRespondingToLifecycleEvent](self, "_isRespondingToLifecycleEvent");
    }

    return v5;
  }
  if (-[UIScene _isActive](self, "_isActive")
    || -[UIScene _isSuspendedEventsOnly](self, "_isSuspendedEventsOnly")
    || (objc_msgSend((id)UIApp, "_isActivating") & 1) != 0)
  {
    return 1;
  }
  v8 = -[_UIContextBinder contextManagementPolicy](self->_contextBinder, "contextManagementPolicy");
  v9 = a3->var5;
  v5 = 1;
  if (v9 || v8 == 1)
    return v5;
  return -[UIScene _isRespondingToLifecycleEvent](self, "_isRespondingToLifecycleEvent");
}

- (void)_beginKeyboardEnvironmentEventDeferringForWindow:(void *)a3 reason:
{
  id *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__beginKeyboardEnvironmentEventDeferringForWindow_reason_, a1, CFSTR("UIWindowScene.m"), 1808, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

    }
    objc_msgSend(a1, "_eventDeferringManager");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = a1[44];
      v18 = v5;
      if (v6)
      {
        -[_UIEventDeferringManager beginAndEndLocalEventDeferringForToken:withReason:](v5, v6, a3);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)a1[44];
        a1[44] = v7;
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithObject:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v18[13];
        v12 = objc_msgSend(v11, "wantsSystemKeyCommandOverlayRules");

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D00CA8], "ui_systemKeyCommandOverlayEnvironment");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setByAddingObject:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v14;
        }
        -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:]((uint64_t)v18, v8, a1, a3);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)a1[44];
        a1[44] = v15;

      }
      v5 = v18;
    }

  }
}

- (void)_keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest
{
  id *v2;
  void *v3;
  int v4;
  objc_class *v5;
  const char *Name;
  void *v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1, "_eventDeferringManager");
    v2 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager internalBehavior](v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wantsLocalCompatibilityRules");

    if (v4)
    {
      if (a1[43])
      {
        v5 = (objc_class *)objc_opt_class();
        Name = class_getName(v5);
        objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %p: Begin event deferring in %@ for key window becoming application key: %p"), Name, a1, v8, a1[43]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](a1, a1[43], v7);

      }
    }
  }
}

- (UISceneSizeRestrictions)sizeRestrictions
{
  return 0;
}

- (BOOL)_isKeyWindowScene
{
  UIWindowScene *v3;

  +[UIWindowScene _keyWindowScene]();
  v3 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

void __61__UIWindowScene__setSystemVolumeHUDEnabled_forAudioCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "audioCategoriesDisablingVolumeHUD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v5);
      v4 = (id)v6;
      if (!*(_BYTE *)(a1 + 41))
      {
        if (v6)
        {
LABEL_14:
          objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
LABEL_15:

          goto LABEL_16;
        }
LABEL_13:
        v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        goto LABEL_14;
      }
    }
    else
    {
      if (!*(_BYTE *)(a1 + 41))
        goto LABEL_13;
      v4 = 0;
    }
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(v4, "count"))
    {

      v4 = 0;
    }
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAudioCategoriesDisablingVolumeHUD:", v7);

}

uint64_t __53__UIWindowScene__setReachabilitySupported_forReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setReachabilitySupported:", *(unsigned __int8 *)(a1 + 32));
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

- (UIFocusSystem)focusSystem
{
  void *v2;
  void *v3;

  -[UIScene _focusSystemSceneComponent](self, "_focusSystemSceneComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusSystem *)v3;
}

- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _UISceneMetricsCalculating *metricsCalculator;
  uint64_t v7;
  id v8;

  v4 = a4;
  v8 = a3;
  metricsCalculator = self->_metricsCalculator;
  if (v4)
    v7 = -[UIScene _isSuspendedUnderLock](self, "_isSuspendedUnderLock") ^ 1;
  else
    v7 = 0;
  -[_UISceneMetricsCalculating _updateMetricsOnWindows:animated:](metricsCalculator, "_updateMetricsOnWindows:animated:", v8, v7);

}

- (void)_attachWindow:(id)a3
{
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[UIScene _hasInvalidated](self, "_hasInvalidated");
  if (dyld_program_sdk_at_least())
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScene succinctDescription](self, "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 1038, CFSTR("Attempting to attach window to an invalidated scene: %@; window: %@"),
        v8,
        v5);

      goto LABEL_14;
    }
    goto LABEL_5;
  }
  if (!v6)
  {
LABEL_5:
    objc_msgSend(v5, "windowScene");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject isEqual:](v9, "isEqual:", self);
    if ((v10 & 1) == 0)
    {
      -[NSObject _detachWindow:](v9, "_detachWindow:", v5);
      -[UIWindowScene _delegate_windowWillAttach:](self, "_delegate_windowWillAttach:", v5);
      -[UIScene __captureWindow:](self, "__captureWindow:", v5);
      -[_UIContextBinder enrollBindable:](self->_contextBinder, "enrollBindable:", v5);
      objc_msgSend(v5, "_didMoveFromScene:toScene:", v9, self);
    }
    if ((_UIWindowSceneCompatibleIsHidden(v5) & 1) == 0)
    {
      -[UIWindowScene _delegate_windowWillBecomeVisible:](self, "_delegate_windowWillBecomeVisible:", v5);
      -[_UIContextBinder attachBindable:](self->_contextBinder, "attachBindable:", v5);
      -[UIWindowScene _delegate_windowDidBecomeVisible:](self, "_delegate_windowDidBecomeVisible:", v5);
      -[UIScene _eventDeferringManager](self, "_eventDeferringManager");
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v11, v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if ((v10 & 1) == 0 && v13 && v13 == v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin fallback event deferring for window: %p"), objc_opt_class(), self, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](self, (uint64_t)v5, v14);

      }
    }
    goto LABEL_13;
  }
  v15 = _attachWindow____s_category;
  if (!_attachWindow____s_category)
  {
    v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v15, (unint64_t *)&_attachWindow____s_category);
  }
  v16 = *(NSObject **)(v15 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v9 = v16;
    -[UIScene succinctDescription](self, "succinctDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v17;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Attempting to attach window to an invalidated scene: %@; window: %@",
      buf,
      0x16u);

LABEL_13:
  }
LABEL_14:

}

- (void)_delegate_windowWillAttach:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 1) != 0)
  {
    v4 = a3;
    -[UIScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_windowScene:windowWillAttach:", self, v4);

  }
}

- (void)_pushKeyWindow:(int)a3 ignoringOldKeyWindow:
{
  id *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  BOOL (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  char v20;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__pushKeyWindow_ignoringOldKeyWindow_, a1, CFSTR("UIWindowScene.m"), 1879, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

    }
    objc_msgSend(a2, "windowScene");
    v6 = (id *)objc_claimAutoreleasedReturnValue();

    if (v6 == a1)
    {
      if (!a1[42])
      {
        objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = a1[42];
        a1[42] = (id)v7;

      }
      if (a1[43] != a2)
      {
        v9 = a1[42];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v17 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
        v18 = &__block_descriptor_40_e13_B24__0_v8_B16l;
        v19 = a2;
        v10 = v16;
        v11 = objc_msgSend(v9, "count");
        v20 = 0;
        v12 = v11 - 1;
        while (1)
        {
          if (v12 == -1)
          {
LABEL_12:

            goto LABEL_15;
          }
          v13 = objc_msgSend(v9, "pointerAtIndex:", v12);
          if ((((uint64_t (*)(_QWORD *, uint64_t, char *))v17)(v10, v13, &v20) & 1) != 0)
            break;
          --v12;
          if (v20)
            goto LABEL_12;
        }

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "removePointerAtIndex:", v12);
          objc_msgSend(v9, "compact");
        }
LABEL_15:
        objc_msgSend(a1[42], "addPointer:", a2);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Window requested to become key in scene: %p"), objc_opt_class(), a1, a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, 1, 0, 0, a3, v14);

    }
  }
}

- (void)_evaluateSceneKeyWindowForWindowMadeKey:(char)a3 consideringVisibility:(int)a4 findingNewKeyWindowIfNeeded:(int)a5 ignoringOldKeyWindow:(void *)a6 forReason:
{
  objc_class *v9;
  unint64_t v10;
  void *v11;
  _BOOL4 v12;
  int IsExtension;
  void *v14;
  id *v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_class *v34;
  id v35;
  BOOL v36;
  _BOOL4 v37;
  id v38;
  id v39;
  id v40;
  objc_class *v41;
  const char *v42;
  unint64_t v43;
  NSObject *v44;
  id v45;
  int v46;
  uint64_t v47;
  id v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  const char *Name;
  char *v56;
  int v58;
  void *v59;
  _QWORD v60[6];
  char v61;
  BOOL v62;
  _QWORD v63[8];
  char v64;
  BOOL v65;
  _QWORD v66[8];
  BOOL v67;
  _QWORD aBlock[5];
  _QWORD v69[2];
  uint64_t (*v70)(uint64_t, void *, uint8_t *);
  void *v71;
  _QWORD *v72;
  uint64_t v73;
  char v74;
  _QWORD v75[4];
  _QWORD v76[2];
  BOOL (*v77)(uint64_t, uint64_t);
  void *v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  id *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  int v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v56 = a6;
  v9 = (objc_class *)objc_opt_class();
  Name = class_getName(v9);
  v10 = qword_1ECD79BF0;
  if (!qword_1ECD79BF0)
  {
    v10 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD79BF0);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v53 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v81 = v56;
      _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "Evaluating scene key window for reason: %{public}@", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = _UIWindowKeyWindowAPIIsSceneLevel();
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  objc_msgSend(a1, "_FBSScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    IsExtension = _UIApplicationIsExtension();
    if ((IsExtension | _UIApplicationMayVendViews()) == 1)
    {
      objc_msgSend(a1, "screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:create:](_UIScreenBasedWindowScene, "_unassociatedWindowSceneForScreen:create:", v14, 0);
      v15 = (id *)objc_claimAutoreleasedReturnValue();

      v12 = v15 == a1;
      if (v15 == a1)
        v16 = 1;
      else
        v16 = -1;

      goto LABEL_12;
    }
    v12 = 0;
  }
  v16 = -1;
LABEL_12:
  objc_msgSend(a1[42], "compact");
  v17 = a1[42];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v70 = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke;
  v71 = &unk_1E16E4A00;
  v72 = v75;
  v73 = v16;
  v74 = a3;
  v18 = v69;
  v19 = objc_msgSend(v17, "count");
  buf[0] = 0;
  v20 = v19 - 1;
  while (1)
  {
    if (v20 == -1)
    {
LABEL_16:

LABEL_17:
      v22 = 0;
      goto LABEL_20;
    }
    v21 = objc_msgSend(v17, "pointerAtIndex:", v20);
    if ((v70((uint64_t)v18, (void *)v21, buf) & 1) != 0)
      break;
    --v20;
    if (buf[0])
      goto LABEL_16;
  }

  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_17;
  v22 = (void *)objc_msgSend(a1[42], "pointerAtIndex:", v20);
LABEL_20:
  v23 = v22;
  if (v23)
    v24 = 1;
  else
    v24 = v12;
  if (v24)
    v25 = v23;
  else
    v25 = 0;
  if ((v24 & 1) == 0 && a4)
  {
    v26 = a1[43];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2;
    aBlock[3] = &unk_1E16B8120;
    aBlock[4] = v26;
    v27 = _Block_copy(aBlock);
    -[UIWindowScene _findNewKeyWindowPassingTest:](a1, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v25 = (id)v28;
    if (v28)
    {
      v29 = a1[42];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v77 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
      v78 = &__block_descriptor_40_e13_B24__0_v8_B16l;
      v79 = v28;
      v30 = v76;
      v31 = objc_msgSend(v29, "count");
      buf[0] = 0;
      v32 = v31 - 1;
      while (1)
      {
        if (v32 == -1)
        {
LABEL_33:

          goto LABEL_36;
        }
        v33 = objc_msgSend(v29, "pointerAtIndex:", v32);
        if ((((uint64_t (*)(_QWORD *, uint64_t, uint8_t *))v77)(v30, v33, buf) & 1) != 0)
          break;
        --v32;
        if (buf[0])
          goto LABEL_33;
      }

      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v29, "removePointerAtIndex:", v32);
        objc_msgSend(v29, "compact");
      }
LABEL_36:
      objc_msgSend(a1[42], "addPointer:", v25);
    }

  }
  v34 = (objc_class *)objc_opt_class();
  class_getName(v34);
  v35 = a1[43];
  v36 = v25 != v35;
  v37 = v25 != v35 && v25 != 0;
  if (v58 && v37)
    objc_msgSend(v59, "postNotificationName:object:", CFSTR("_UIWindowWillBecomeKeyNotification"), v25);
  if ((a5 & 1) != 0)
    v38 = 0;
  else
    v38 = a1[43];
  v39 = v38;
  a1[43] = v25;
  v40 = v25;
  if (v25 != v35)
  {
    if (v25)
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = class_getName(v41);
    }
    else
    {
      v42 = "(nil)";
    }
    v43 = qword_1ECD79BF8;
    if (!qword_1ECD79BF8)
    {
      v43 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v43, (unint64_t *)&qword_1ECD79BF8);
    }
    v44 = *(id *)(v43 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = a1[43];
      v46 = objc_msgSend(v45, "_contextId");
      v47 = objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
      *(_DWORD *)buf = 136447490;
      v81 = Name;
      v82 = 2050;
      v83 = a1;
      v84 = 2082;
      v85 = v42;
      v86 = 2050;
      v87 = v45;
      v88 = 1026;
      v89 = v46;
      v90 = 2082;
      v91 = v47;
      _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}p: Window became key in scene: %{public}s: %{public}p; contextId: 0x%{public}X: reason: %{public}s",
        buf,
        0x3Au);
    }

    v40 = a1[43];
  }
  v48 = v40;
  v49 = (char *)+[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_239;
  v66[3] = &unk_1E16E4A28;
  v67 = v37;
  v66[4] = a1;
  v66[5] = a1;
  v66[6] = v48;
  v66[7] = Name;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2_242;
  v63[3] = &unk_1E16E4A50;
  v64 = v58;
  v65 = v36;
  v63[4] = v39;
  v63[5] = a1;
  v63[7] = Name;
  v63[6] = v59;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_243;
  v60[3] = &unk_1E16B4E20;
  v61 = v58;
  v62 = v37;
  v60[4] = v48;
  v60[5] = v59;
  v50 = v56;
  v52 = v50;
  if (v49)
    -[_UIKeyWindowEvaluator evaluateApplicationKeyWindowForWindowScene:withWindowMadeKey:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v49, a1, a2, (uint64_t)v66, a5, (uint64_t)v63, (uint64_t)v60, v51, v50, 2);
  else

  _Block_object_dispose(v75, 8);
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v3;
  id v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == *(_QWORD *)(a1 + 40))
  {
    v3 = 0;
    *a3 = 1;
  }
  else
  {
    v5 = a2;
    v6 = objc_msgSend(v5, sel_allowsWeakReference);
    if (v5)
      v7 = v6;
    else
      v7 = 0;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v8 = objc_msgSend(v5, "_canPromoteFromKeyWindowStack");
    else
      v8 = 1;
    if (*(_BYTE *)(a1 + 48))
      v9 = _UIWindowSceneCompatibleIsHidden(v5) ^ 1;
    else
      v9 = 1;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v10 = v8 & v9;
    if (v7)
      v3 = v10;
    else
      v3 = 0;

  }
  return v3;
}

+ (void)initialize
{
  id v3;
  objc_class *v4;
  Method *v5;
  unint64_t i;
  objc_method *v7;
  const char *Name;
  void (*Implementation)(void);
  const char *TypeEncoding;
  const char *v12;
  objc_class *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unsigned int outCount;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    outCount = 0;
    objc_opt_self();
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = class_copyMethodList(v4, &outCount);

    if (v5)
    {
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          v7 = v5[i];
          Name = method_getName(v7);
          if ((+[UIWindowScene instancesRespondToSelector:](UIWindowScene, "instancesRespondToSelector:", Name) & 1) == 0)
          {
            Implementation = method_getImplementation(v7);
            TypeEncoding = method_getTypeEncoding(v7);
            if (Name && Implementation != 0)
            {
              v12 = TypeEncoding;
              objc_opt_self();
              v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
              class_addMethod(v13, Name, Implementation, v12);

              if (os_variant_has_internal_diagnostics())
              {
                __UIFaultDebugAssertLog();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
                {
                  NSStringFromSelector(Name);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v22 = v19;
                  _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "COMPATIBILITY BUG IN CLIENT OF UIKIT: Moving method %@ from UICanvas to UIWindowScene", buf, 0xCu);

                }
              }
              else
              {
                v14 = initialize___s_category;
                if (!initialize___s_category)
                {
                  v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v14, (unint64_t *)&initialize___s_category);
                }
                v15 = *(NSObject **)(v14 + 8);
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  v16 = v15;
                  NSStringFromSelector(Name);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v22 = v17;
                  _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "COMPATIBILITY BUG IN CLIENT OF UIKIT: Moving method %@ from UICanvas to UIWindowScene", buf, 0xCu);

                }
              }
            }
          }
        }
      }
      free(v5);
    }
  }
}

uint64_t __49__UIWindowScene__supportsPassthroughInteractions__block_invoke()
{
  void *v0;
  int v1;
  uint64_t result;
  char v3;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.assistivetouchd"));

  result = objc_msgSend((id)UIApp, "_isSpringBoard");
  if ((result & 1) != 0
    || (result = +[UIApplication _isSystemUIService](UIApplication, "_isSystemUIService"),
        (result & 1) != 0)
    || (result = +[UIApplication _isUIKitSystemProcess](UIApplication, "_isUIKitSystemProcess"),
        ((result | v1) & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_DisablePassthroughWindow, (uint64_t)CFSTR("DisablePassthroughWindow"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1ECD76904)
      v3 = result;
    else
      v3 = 1;
  }
  _MergedGlobals_59 = v3;
  return result;
}

- (id)_editMenuSceneComponent
{
  UIWindowScene *v2;
  char v3;
  _UIEditMenuSceneComponent *v4;
  UIWindowScene *v6;
  void *v7;

  v2 = self;
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
    && ((v3 = objc_msgSend((id)UIApp, "isFrontBoard"), -[UIScene _hasSettingsScene](v2, "_hasSettingsScene"))
     || (v3 & 1) != 0))
  {
    -[UIWindowScene _sceneForKeyboardDisplay](v2, "_sceneForKeyboardDisplay");
    v6 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();

    if (v6 == v2)
    {
      +[UIWindowScene _keyWindowScene]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_editMenuSceneComponent");
      v4 = (_UIEditMenuSceneComponent *)objc_claimAutoreleasedReturnValue();

      if (v4)
        return v4;
    }
  }
  else
  {

  }
  -[UIScene _sceneComponentForKey:](v2, "_sceneComponentForKey:", CFSTR("_UIEditMenuSceneComponentKey"));
  v4 = (_UIEditMenuSceneComponent *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[_UIEditMenuSceneComponent initWithScene:]([_UIEditMenuSceneComponent alloc], "initWithScene:", v2);
    -[UIWindowScene _registerSceneComponent:forKey:](v2, "_registerSceneComponent:forKey:", v4, CFSTR("_UIEditMenuSceneComponentKey"));
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWindowScene;
  -[UIScene setDelegate:](&v4, sel_setDelegate_, a3);
  -[UIWindowScene _updateAllDelegateFlags](self, "_updateAllDelegateFlags");
}

- (UIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  id v7;
  UIWindowScene *v8;
  UIWindowScene *v9;
  void *v10;
  void *v11;
  UITraitCollection *traitCollection;
  void *v13;
  int v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _UIContextBinder *v18;
  _UIContextBinder *contextBinder;
  void *v20;
  uint64_t v21;
  void **p_metricsCalculator;
  void *metricsCalculator;
  uint64_t v24;
  void *v25;
  UIWindowScene *v26;
  _UIWindowSceneCoordinateSpace *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UICoordinateSpace *coordinateSpace;
  void *v32;
  void *v33;
  void *v34;
  _UIAssertionController *v35;
  _UIAssertionController *assertionController;
  void *v38;
  void *v39;
  objc_super v40;

  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)UIWindowScene;
  v8 = -[UIScene initWithSession:connectionOptions:](&v40, sel_initWithSession_connectionOptions_, a3, v7);
  v9 = v8;
  if (!v8)
    goto LABEL_20;
  -[UIScene _FBSScene](v8, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  traitCollection = v9->_traitCollection;
  v9->_traitCollection = 0;

  objc_msgSend(v10, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isUISubclass");

  if (v14)
  {
    objc_msgSend(v10, "uiSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISceneLifecycleMultiplexer configureInitialDeactivationReasons:](_UISceneLifecycleMultiplexer, "configureInitialDeactivationReasons:", objc_msgSend(v15, "deactivationReasons"));

  }
  v16 = (objc_class *)objc_msgSend(v11, "sceneSubstrateClass");
  if ((-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UIWindowScene.m"), 395, CFSTR("%@ is not a subclass of _UIContextBinderSubstrate"), v39);

  }
  v17 = (void *)objc_msgSend([v16 alloc], "initWithScene:", v10);
  v18 = -[_UIContextBinder initWithSubstrate:]([_UIContextBinder alloc], "initWithSubstrate:", v17);
  contextBinder = v9->_contextBinder;
  v9->_contextBinder = v18;

  if (v14)
  {
    objc_msgSend(v10, "uiSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "interfaceOrientationMode");

    p_metricsCalculator = (void **)&v9->_metricsCalculator;
    metricsCalculator = v9->_metricsCalculator;
    if (!metricsCalculator)
    {
      if (v21 == 100)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    p_metricsCalculator = (void **)&v9->_metricsCalculator;
    metricsCalculator = v9->_metricsCalculator;
    if (!metricsCalculator)
    {
LABEL_11:
      objc_msgSend(v10, "uiCanReceiveDeviceOrientationEvents");
LABEL_12:
      v24 = objc_opt_new();
      v25 = *p_metricsCalculator;
      *p_metricsCalculator = (void *)v24;

      metricsCalculator = *p_metricsCalculator;
    }
  }
  objc_msgSend(metricsCalculator, "_setScene:", v9);
  v26 = v9;
  v27 = [_UIWindowSceneCoordinateSpace alloc];
  -[UIScene _settingsScene](v26, "_settingsScene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_effectiveSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[_UIWindowSceneCoordinateSpace initWithWindowScene:effectiveSettings:](v27, "initWithWindowScene:effectiveSettings:", v26, v29);

  coordinateSpace = v26->_coordinateSpace;
  v26->_coordinateSpace = (UICoordinateSpace *)v30;

  -[_UIContextBinder setContextCreationPolicyHolder:](v9->_contextBinder, "setContextCreationPolicyHolder:", v26);
  -[UIWindowScene _setKeepContextAssociationInBackground:](v26, "_setKeepContextAssociationInBackground:", +[UIWindow _allWindowsKeepContextInBackground](UIWindow, "_allWindowsKeepContextInBackground"));
  v26->_avkitRequestedOverscanCompensation = -1;
  v26->_screenRequestedOverscanCompensation = 0;
  if (v14)
  {
    objc_msgSend(v10, "uiClientSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayConfigurationRequest");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      v26->_screenRequestedOverscanCompensation = objc_msgSend(v33, "overscanCompensation");
    objc_msgSend(v10, "uiSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26->_windowSceneFlags.enhancedWindowingEnabled = objc_msgSend(v34, "enhancedWindowingEnabled");

  }
  -[UIWindowScene _updateAllDelegateFlags](v26, "_updateAllDelegateFlags");
  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
    -[UIWindowScene _computeMetrics:](v26, "_computeMetrics:", 0);
  v26->_reachabilitySupportedCounter = 1;
  v35 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v26);
  assertionController = v26->_assertionController;
  v26->_assertionController = v35;

LABEL_20:
  return v9;
}

- (void)_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:(BOOL)a3 withAction:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  UITraitCollection *v8;
  UITraitCollection *traitCollection;
  UIWindowScene *v10;
  _UIWindowSceneCoordinateSpace *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UICoordinateSpace *coordinateSpace;
  void *v16;
  id v17;
  int v18;
  UITraitCollection *v19;
  UICoordinateSpace *v20;
  id v21;
  UICoordinateSpace *v22;
  UITraitCollection *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unsigned int v43;
  BOOL v44;
  int v45;
  unint64_t v46;
  NSObject *v47;
  const __CFString *v48;
  NSObject *v49;
  uint64_t v50;
  void (**v51)(_QWORD);
  UIUserInterfaceStyle v52;
  void *v53;
  void *v54;
  UIWindowScene *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void (**v61)(_QWORD);
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void (**v66)(_QWORD);
  const __CFString *v67;
  id v68;
  void *v69;
  uint8_t buf[4];
  const __CFString *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  UIUserInterfaceStyle v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;
  CGRect v81;
  CGRect v82;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v68 = -[UIScene _oldSettings](self, "_oldSettings");
  -[UIWindowScene traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene coordinateSpace](self, "coordinateSpace");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  __UIWindowSceneTraitCollectionWithSceneUISettings(self);
  v8 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v8;

  v10 = self;
  v11 = [_UIWindowSceneCoordinateSpace alloc];
  -[UIScene _settingsScene](v10, "_settingsScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_effectiveSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIWindowSceneCoordinateSpace initWithWindowScene:effectiveSettings:](v11, "initWithWindowScene:effectiveSettings:", v10, v13);

  coordinateSpace = v10->_coordinateSpace;
  v10->_coordinateSpace = (UICoordinateSpace *)v14;

  if (v6)
    v6[2](v6);
  -[UIScene _settingsScene](v10, "_settingsScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "_effectiveSettings");

  v18 = 1;
  if (!a3 && v68)
  {
    v66 = v6;
    v19 = self->_traitCollection;
    v20 = v10->_coordinateSpace;
    v21 = v7;
    v22 = v20;
    v23 = v19;
    objc_msgSend(v69, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[UICoordinateSpace bounds](v22, "bounds");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v81.origin.x = v25;
    v81.origin.y = v27;
    v81.size.width = v29;
    v81.size.height = v31;
    v82.origin.x = v33;
    v82.origin.y = v35;
    v82.size.width = v37;
    v82.size.height = v39;
    LODWORD(v22) = CGRectEqualToRect(v81, v82);
    v40 = objc_msgSend(v17, "interfaceOrientation");
    v41 = v7;
    v42 = objc_msgSend(v68, "interfaceOrientation");
    LODWORD(v19) = objc_msgSend(v21, "isEqual:", v23);

    v43 = v19 ^ 1;
    v6 = v66;
    v44 = v40 == v42;
    v7 = v41;
    v45 = v22 ^ 1;
    if (!v44)
      v45 = 1;
    v18 = v45 | v43;
  }
  v46 = _computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback_withAction____s_category;
  if (!_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback_withAction____s_category)
  {
    v46 = __UILogCategoryGetNode("InterfaceStyle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v46, (unint64_t *)&_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback_withAction____s_category);
  }
  v47 = *(NSObject **)(v46 + 8);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = CFSTR("Should not");
    if (v18)
      v48 = CFSTR("Should");
    v67 = v48;
    v49 = v47;
    v50 = objc_msgSend(v7, "userInterfaceStyle");
    v51 = v6;
    v52 = -[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle");
    v53 = v7;
    v54 = (void *)MEMORY[0x1E0CB3940];
    v55 = v10;
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("<%@: %p>"), v57, v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v58;
    -[UIScene _persistenceIdentifier](v55, "_persistenceIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v71 = v67;
    v72 = 2050;
    v73 = v50;
    v74 = 2050;
    v75 = v52;
    v6 = v51;
    v76 = 2114;
    v77 = v58;
    v7 = v53;
    v78 = 2114;
    v79 = v60;
    _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ send trait collection or coordinate space update, interface style %{public}ld -> %{public}ld, %{public}@ (%{public}@)", buf, 0x34u);

  }
  if (v18)
  {
    -[UIWindowScene _updateEffectiveGeometryIfNeeded](v10, "_updateEffectiveGeometryIfNeeded");
    if ((*(_BYTE *)&v10->_windowSceneFlags & 4) != 0)
    {
      v61 = v6;
      v62 = _UISetCurrentFallbackEnvironment(v10);
      -[UIScene delegate](v10, "delegate");
      v63 = v7;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", v10, v69, objc_msgSend(v68, "interfaceOrientation"), v63);

      v7 = v63;
      v65 = (void *)v62;
      v6 = v61;
      _UIRestorePreviousFallbackEnvironment(v65);
    }
  }

}

- (void)_updateEffectiveGeometryIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIWindowSceneGeometry *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[UIWindowSceneGeometry _calculateEffectiveGeometryForWindowScene:](UIWindowSceneGeometry, "_calculateEffectiveGeometryForWindowScene:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_effectiveGeometry || (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    v5 = (void *)_UISetCurrentFallbackEnvironment(self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIWindowSceneWillUpdateEffectiveGeometryNotification"), self, 0);

    -[UIWindowScene willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("effectiveGeometry"));
    v7 = self->_effectiveGeometry;
    objc_storeStrong((id *)&self->_effectiveGeometry, v4);
    -[UIWindowScene didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("effectiveGeometry"));
    if (v7)
    {
      v10 = CFSTR("_UIWindowScenePreviousEffectiveGeometryKey");
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("UIWindowSceneDidUpdateEffectiveGeometryNotification"), self, v8);

    _UIRestorePreviousFallbackEnvironment(v5);
  }

}

- (void)_updateSpringBoardDelegateFlags
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  id v10;

  if (qword_1ECD79C60 != -1)
    dispatch_once(&qword_1ECD79C60, &__block_literal_global_783_0);
  if (byte_1ECD79BC9)
  {
    -[UIScene delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = 2;
    else
      v3 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xFD | v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 4;
    else
      v4 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xFB | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 8;
    else
      v5 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xF7 | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 16;
    else
      v6 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xEF | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 32;
    else
      v7 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xDF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 64;
    else
      v8 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = *(_BYTE *)&self->_springBoardDelegateFlags & 0xBF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 0x80;
    else
      v9 = 0;
    *(_BYTE *)&self->_springBoardDelegateFlags = v9 & 0x80 | *(_BYTE *)&self->_springBoardDelegateFlags & 0x7F;

  }
}

- (void)_updateAllDelegateFlags
{
  -[UIWindowScene _updateWindowSceneDelegateFlags](self, "_updateWindowSceneDelegateFlags");
  -[UIWindowScene _updateSpringBoardDelegateFlags](self, "_updateSpringBoardDelegateFlags");
}

- (void)_updateWindowSceneDelegateFlags
{
  char v3;
  char v4;
  id v5;

  -[UIScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&self->_windowSceneFlags = *(_BYTE *)&self->_windowSceneFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_windowSceneFlags = *(_BYTE *)&self->_windowSceneFlags & 0xFD | v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 4;
  else
    v4 = 0;
  *(_BYTE *)&self->_windowSceneFlags = *(_BYTE *)&self->_windowSceneFlags & 0xFB | v4;

}

- (void)_computeMetrics:(BOOL)a3 withTransitionContext:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__UIWindowScene__computeMetrics_withTransitionContext___block_invoke;
  v4[3] = &unk_1E16B1B78;
  v4[4] = self;
  v5 = a3;
  -[UIWindowScene _computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:withAction:](self, "_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:withAction:", 0, v4);
}

- (void)_computeMetrics:(BOOL)a3
{
  -[UIWindowScene _computeMetrics:withTransitionContext:](self, "_computeMetrics:withTransitionContext:", a3, 0);
}

- (void)_setKeepContextAssociationInBackground:(BOOL)a3
{
  -[_UIContextBinder setContextManagementPolicy:](self->_contextBinder, "setContextManagementPolicy:", a3);
}

- (void)_prepareForResume
{
  _UIContextBinder *contextBinder;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWindowScene;
  -[UIScene _prepareForResume](&v5, sel__prepareForResume);
  contextBinder = self->_contextBinder;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__UIWindowScene__prepareForResume__block_invoke;
  v4[3] = &unk_1E16E4A78;
  v4[4] = self;
  -[_UIContextBinder createContextsWithTest:creationAction:](contextBinder, "createContextsWithTest:creationAction:", 0, v4);
}

uint64_t __52__UIWindowScene__internalOverrideUserInterfaceStyle__block_invoke()
{
  void *v0;
  uint64_t result;

  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ForcedWindowSceneInterfaceStyle, (uint64_t)CFSTR("ForcedWindowSceneInterfaceStyle"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))v0 = 0;
  else
    v0 = (void *)qword_1ECD76910;
  result = _UIUserInterfaceStyleFromString(v0);
  qword_1ECD79C10 = result;
  return result;
}

- (id)_inheritingWindowsIncludingInvisible:(BOOL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIScene _interitingScenes](self, "_interitingScenes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          if (a3)
            objc_msgSend(v11, "_allWindows");
          else
            objc_msgSend(v11, "_visibleWindows");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

void __55__UIWindowScene_UIScreenshotService__screenshotService__block_invoke()
{
  uint64_t v0;
  id v1;

  v0 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _registerSceneComponentClass:withKey:predicate:](UIWindowScene, "_registerSceneComponentClass:withKey:predicate:", v0, CFSTR("_UIScreenshotServiceComponentKey"), v1);

}

- (void)_finishSceneConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  -[UIScene _finishSceneConnection](&v3, sel__finishSceneConnection);
  -[UIWindowScene _configurePassthroughWindowIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)_configurePassthroughWindowIfNeeded
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  id v5;
  BOOL v6;
  BOOL v7;
  _UIWindowSystemOverlayWindow *v8;
  id v9;
  void *v10;
  id v11;

  if (a1)
  {
    if ((objc_msgSend(a1, "_supportsPassthroughInteractions") & 1) != 0)
    {
      objc_msgSend(a1, "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "userInterfaceIdiom");
      v4 = v3 != 3;

      v5 = a1[49];
      v6 = v5 == 0;
      if (v5)
        v7 = 1;
      else
        v7 = v3 == 3;
      if (!v7)
      {
        v8 = -[UIWindow initWithWindowScene:]([_UIWindowSystemOverlayWindow alloc], "initWithWindowScene:", a1);
        v9 = a1[49];
        a1[49] = v8;

        objc_msgSend(a1[49], "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAllowsHitTesting:", 0);

        objc_msgSend(a1[49], "_setWindowHostingScene:", a1);
        objc_msgSend(a1[49], "setHidden:", 0);
        objc_msgSend(a1[49], "setWindowLevel:", 10000002.0);
        return;
      }
    }
    else
    {
      v4 = 0;
      v5 = a1[49];
      v6 = v5 == 0;
    }
    if (!v6 && !v4)
    {
      objc_msgSend(v5, "_setWindowHostingScene:", 0);
      v11 = a1[49];
      a1[49] = 0;

    }
  }
}

- (void)_setBackgroundStyle:(int64_t)a3
{
  _QWORD v5[5];

  if (-[UIWindowScene _backgroundStyle](self, "_backgroundStyle") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__UIWindowScene__setBackgroundStyle___block_invoke;
    v5[3] = &__block_descriptor_40_e89_B24__0__UIMutableApplicationSceneClientSettings_8__UIApplicationSceneTransitionContext_16l;
    v5[4] = a3;
    -[UIScene _updateUIClientSettingsWithUITransitionBlock:](self, "_updateUIClientSettingsWithUITransitionBlock:", v5);
  }
}

- (int64_t)_backgroundStyle
{
  void *v2;
  int64_t v3;

  -[UIScene _effectiveUIClientSettings](self, "_effectiveUIClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundStyle");

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  if (sel__performClose_ == a3)
  {
    v8 = (void *)_UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
    v9 = v8;
    if (v8 == (void *)6 || v8 == (void *)1)
    {
      -[UIScene _FBSScene](self, "_FBSScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;
    }
    else
    {
      v7 = 0;
    }
    if (v9 == (void *)6 || v9 == (void *)1)

  }
  else if (sel__unlockPointerLockState_ == a3)
  {
    -[UIScene pointerLockState](self, "pointerLockState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isLocked");

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIWindowScene;
    v7 = -[UIResponder canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)setActivityItemsConfigurationSource:(id)activityItemsConfigurationSource
{
  objc_storeWeak((id *)&self->_activityItemsConfigurationSource, activityItemsConfigurationSource);
}

uint64_t __111__UIWindowScene__UISceneEnhancedStateRestoration_Internal___willRestoreInteractionStateForUserActivityManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutIfNeeded");
}

- (void)_setSystemVolumeHUDEnabled:(BOOL)a3
{
  -[UIWindowScene _setSystemVolumeHUDEnabled:forAudioCategory:](self, "_setSystemVolumeHUDEnabled:forAudioCategory:", a3, 0);
}

- (void)_showProgressWhenFetchingUserActivityForTypes:(id)a3
{
  +[_UICanvasUserActivityManager _showProgressForScene:whenFetchingUserActivityForTypes:](_UICanvasUserActivityManager, "_showProgressForScene:whenFetchingUserActivityForTypes:", self, a3);
}

- (BOOL)_isPerformingSystemSnapshot
{
  return (*(_BYTE *)&self->_windowSceneFlags >> 3) & 1;
}

- (UIScreenshotService)screenshotService
{
  if (screenshotService_onceToken != -1)
    dispatch_once(&screenshotService_onceToken, &__block_literal_global_226);
  return (UIScreenshotService *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIScreenshotServiceComponentKey"));
}

- (void)_removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:(int)a3 ignoringOldKeyWindow:(void *)a4 forReason:
{
  id *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  BOOL (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  char v20;

  if (a1)
  {
    objc_msgSend(a2, "windowScene");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    if (v8 == a1)
    {
      v9 = objc_msgSend(a1[42], "count");

      if (v9)
      {
        v10 = a2;
        v11 = a1[42];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v17 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
        v18 = &__block_descriptor_40_e13_B24__0_v8_B16l;
        v19 = v10;
        v12 = v16;
        v13 = objc_msgSend(v11, "count");
        v20 = 0;
        v14 = v13 - 1;
        while (1)
        {
          if (v14 == -1)
          {
LABEL_9:

            goto LABEL_12;
          }
          v15 = objc_msgSend(v11, "pointerAtIndex:", v14);
          if ((((uint64_t (*)(_QWORD *, uint64_t, char *))v17)(v12, v15, &v20) & 1) != 0)
            break;
          --v14;
          if (v20)
            goto LABEL_9;
        }

        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "removePointerAtIndex:", v14);
          objc_msgSend(v11, "compact");
        }
LABEL_12:
        if (a1[43] == v10)
          -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, 0, 1, 1, a3, a4);

      }
    }
    else
    {

    }
  }
}

- (void)_detachWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIWindowScene _delegate_windowWillDetach:](self, "_delegate_windowWillDetach:", v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: end event deferring for detaching window: %p"), objc_opt_class(), self, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _endEventDeferringIfNeededForWindow:withReason:]((id *)&self->super.super.super.isa, v4, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Remove detaching window from key window history: %p"), objc_opt_class(), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:]((id *)&self->super.super.super.isa, v4, 0, v5);
  -[UIWindowScene _delegate_windowWillBecomeHidden:](self, "_delegate_windowWillBecomeHidden:", v4);
  -[_UIContextBinder expellBindable:](self->_contextBinder, "expellBindable:", v4);
  -[UIScene __releaseWindow:](self, "__releaseWindow:", v4);

  -[UIWindowScene _enqueueEvaluationOfDisablesMirroring](self);
}

- (void)_delegate_windowWillDetach:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_springBoardDelegateFlags & 1) != 0)
  {
    v4 = a3;
    -[UIScene delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_windowScene:windowWillDetach:", self, v4);

  }
}

- (UIAlertControllerStackManager)_alertControllerStackManager
{
  return (UIAlertControllerStackManager *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIAlertControllerStackManagerCanvasComponentKey);
}

- (id)canvasToolbar
{
  return 0;
}

- (int64_t)state
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }

  }
  else
  {
    v3 = state___s_category;
    if (!state___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&state___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  return -[UIScene activationState](self, "activationState");
}

- (BOOL)isKeyCanvas
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }

  }
  else
  {
    v3 = isKeyCanvas___s_category;
    if (!isKeyCanvas___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&isKeyCanvas___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  return -[UIWindowScene _isKeyWindowScene](self, "_isKeyWindowScene");
}

+ (id)_canvasForScene:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }

  }
  else
  {
    v6 = _canvasForScene____s_category;
    if (!_canvasForScene____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_canvasForScene____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v14, 2u);
    }
  }
  objc_msgSend(a1, "_sceneForFBSScene:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UICanvas.m"), 79, CFSTR("Attempting at access invalid frame class from legacy path. Please use non-deprecated methods"));

    }
  }
  return v8;
}

- (_UICanvasDefinition)_definition
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }

  }
  else
  {
    v3 = _definition___s_category;
    if (!_definition___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_definition___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  -[UIScene session](self, "session");
  return (_UICanvasDefinition *)(id)objc_claimAutoreleasedReturnValue();
}

- (FBSScene)_scene
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }

  }
  else
  {
    v3 = _scene___s_category;
    if (!_scene___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_scene___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  -[UIScene _FBSScene](self, "_FBSScene");
  return (FBSScene *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_contentSizePreferenceProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
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

  return v8;
}

- (_UIWindowSceneTransitionCoordinator)_transitionCoordinator
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIWindowSceneTransitionCoordinator *)v4;
}

- (id)_screenshotServiceIfPresent
{
  return -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIScreenshotServiceComponentKey"));
}

- (id)_playbackControlsStateManager
{
  _UIPlaybackControlsStateManager *v3;

  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIPlaybackControlsStateManagerSceneComponentKey"));
  v3 = (_UIPlaybackControlsStateManager *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_UIPlaybackControlsStateManager initWithScene:]([_UIPlaybackControlsStateManager alloc], "initWithScene:", self);
    -[UIWindowScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v3, CFSTR("_UIPlaybackControlsStateManagerSceneComponentKey"));
  }
  return v3;
}

- (id)_alwaysOnEnvironment
{
  return -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UIBacklightEnvironmentComponentKey"));
}

- (id)_sceneMaskingCoordinator
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
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

  return v8;
}

- (_UISearchActivityManager)_searchActivityManager
{
  _UISearchActivityManager *v3;

  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UISearchActivityStateManagerSceneComponentKey"));
  v3 = (_UISearchActivityManager *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_UISearchActivityManager initWithScene:]([_UISearchActivityManager alloc], "initWithScene:", self);
    -[UIWindowScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v3, CFSTR("_UISearchActivityStateManagerSceneComponentKey"));
  }
  return v3;
}

- (id)_contextMenuSceneComponent
{
  UIWindowScene *v2;
  char v3;
  _UIContextMenuSceneComponent *v4;
  UIWindowScene *v6;
  void *v7;

  v2 = self;
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
    && ((v3 = objc_msgSend((id)UIApp, "isFrontBoard"), -[UIScene _hasSettingsScene](v2, "_hasSettingsScene"))
     || (v3 & 1) != 0))
  {
    -[UIWindowScene _sceneForKeyboardDisplay](v2, "_sceneForKeyboardDisplay");
    v6 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();

    if (v6 == v2)
    {
      +[UIWindowScene _keyWindowScene]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_contextMenuSceneComponent");
      v4 = (_UIContextMenuSceneComponent *)objc_claimAutoreleasedReturnValue();

      if (v4)
        return v4;
    }
  }
  else
  {

  }
  -[UIScene _sceneComponentForKey:](v2, "_sceneComponentForKey:", CFSTR("_UIContextMenuSceneComponentKey"));
  v4 = (_UIContextMenuSceneComponent *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[_UIContextMenuSceneComponent initWithScene:]([_UIContextMenuSceneComponent alloc], "initWithScene:", v2);
    -[UIWindowScene _registerSceneComponent:forKey:](v2, "_registerSceneComponent:forKey:", v4, CFSTR("_UIContextMenuSceneComponentKey"));
  }
  return v4;
}

- (_UIBannerManager)_bannerManager
{
  return (_UIBannerManager *)-[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", _UIBannerManagerWindowSceneComponentKey);
}

- (void)_hostTraitCollectionDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_overrideParentTraitCollection, a3);
  -[UIWindowScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](self, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 0, 0);
}

- (id)_systemInputActivityManager
{
  _UISystemInputActivityManager *v3;

  -[UIScene _sceneComponentForKey:](self, "_sceneComponentForKey:", CFSTR("_UISystemInputActivityStateManagerSceneComponentKey"));
  v3 = (_UISystemInputActivityManager *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_UISystemInputActivityManager initWithScene:]([_UISystemInputActivityManager alloc], "initWithScene:", self);
    -[UIWindowScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v3, CFSTR("_UISystemInputActivityStateManagerSceneComponentKey"));
  }
  return v3;
}

- (void)_invalidate
{
  void *v3;
  NSSet *componentsWithTraitOverrides;
  void *v5;
  objc_super v6;

  if (self->_keyboardEventDeferringToken)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: end event deferring for scene invalidation"), objc_opt_class(), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]((uint64_t *)self, v3);

  }
  componentsWithTraitOverrides = self->_componentsWithTraitOverrides;
  self->_componentsWithTraitOverrides = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIWindowScene;
  -[UIScene _invalidate](&v6, sel__invalidate);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)_endKeyboardEnvironmentEventDeferringWithReason:(uint64_t *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    if (!a1[44])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__endKeyboardEnvironmentEventDeferringWithReason_, a1, CFSTR("UIWindowScene.m"), 1850, CFSTR("%s: Invalid request to ending event deferring without having begun: reason: %@"), "-[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]", v7);

    }
    objc_msgSend(a1, "_eventDeferringManager");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      -[_UIEventDeferringManager endLocalEventDeferringForToken:withReason:](v3, a1[44], v7);
      v5 = (void *)a1[44];
      a1[44] = 0;

    }
  }

}

- (id)traitOverrides
{
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v4;
  _UITraitOverrides *v5;

  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (void)_traitOverridesDidChange:(id)a3
{
  -[UIWindowScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](self, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 0, 0);
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _registerForTraitTokenChanges:withHandler:](self, "_registerForTraitTokenChanges:withHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  void *v6;
  void *v7;

  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v6, self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v9;
  _UITraitChangeRegistry *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v9 = objc_alloc_init(_UITraitChangeRegistry);
    v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v9;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  UIWindowScene *v9;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v11;
  _UITraitChangeRegistry *v12;
  void *v13;

  v8 = a3;
  v9 = (UIWindowScene *)a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v11 = objc_alloc_init(_UITraitChangeRegistry);
    v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v11;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)unregisterForTraitChanges:(id)a3
{
  -[_UITraitChangeRegistry unregisterForTraitChanges:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v6;
  _UITraitChangeRegistry *v7;
  id v8;

  v4 = a3;
  traitChangeRegistry = self->_traitChangeRegistry;
  v8 = v4;
  if (!traitChangeRegistry)
  {
    v6 = objc_alloc_init(_UITraitChangeRegistry);
    v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v6;

    v4 = v8;
    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);

}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  -[_UITraitChangeRegistry unregisterAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (UISceneWindowingBehaviors)windowingBehaviors
{
  return 0;
}

- (id)_windowingBehaviorsNotInstantiating
{
  return 0;
}

- (void)requestGeometryUpdateWithPreferences:(UIWindowSceneGeometryPreferences *)geometryPreferences errorHandler:(void *)errorHandler
{
  void (**v6)(void *, void *);
  void *v7;
  UIWindowSceneGeometryPreferences *v8;

  v8 = geometryPreferences;
  v6 = errorHandler;
  if (-[UIWindowSceneGeometryPreferences _type](v8, "_type") == 2)
  {
    -[UIWindowScene _performIOSGeometryRequestWithPreferences:errorHandler:](self, "_performIOSGeometryRequestWithPreferences:errorHandler:", v8, v6);
  }
  else if (v6)
  {
    _UISceneErrorWithCode(100);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

- (void)_performIOSGeometryRequestWithPreferences:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "interfaceOrientations");
  v9 = _performIOSGeometryRequestWithPreferences_errorHandler____s_category;
  if (!_performIOSGeometryRequestWithPreferences_errorHandler____s_category)
  {
    v9 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_performIOSGeometryRequestWithPreferences_errorHandler____s_category);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v25 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      _UIInterfaceOrientationMaskDebugDescription(v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v27;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Received geometry update request with interface orientations: %{public}@", (uint8_t *)location, 0xCu);

    }
  }
  if (v8)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke;
    aBlock[3] = &unk_1E16CCBA0;
    v34 = v7;
    v11 = _Block_copy(aBlock);
    if (-[UIScene _canDynamicallySpecifySupportedInterfaceOrientations](self, "_canDynamicallySpecifySupportedInterfaceOrientations"))
    {
      -[UIScene _effectiveUIClientSettings](self, "_effectiveUIClientSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "supportedInterfaceOrientations");

      if (!v13 || (v13 & v8) != 0)
      {
        objc_initWeak(location, self);
        v24 = (void *)UIApp;
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_123;
        v29[3] = &unk_1E16D7338;
        objc_copyWeak(&v32, location);
        v30 = v6;
        v31 = v11;
        objc_msgSend(v24, "_performBlockAfterCATransactionCommits:", v29);

        objc_destroyWeak(&v32);
        objc_destroyWeak(location);
      }
      else
      {
        _UIInterfaceOrientationMaskDebugDescription(objc_msgSend(v6, "interfaceOrientations"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _UIInterfaceOrientationMaskDebugDescription(v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedFormat(CFSTR("UIWindowScene.interfaceOrientationsNotSupported"), (uint64_t)CFSTR("Error for attempting a geometry request with interface orientations that are not supported by the scene's view controller."), CFSTR("None of the requested orientations are supported by the view controller. Requested: %@; Supported: %@"),
          v15,
          v16,
          v17,
          v18,
          v19,
          (uint64_t)v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        _UISceneErrorWithCodeAndDescription(101, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *))v11 + 2))(v11, v21);

      }
    }
    else
    {
      _UILocalizedString(CFSTR("UIWindowScene.orientationRequestNotAllowed"), (uint64_t)CFSTR("Error for attempting a geometry request for a window scene that must support all orientations"), CFSTR("The current windowing mode does not allow for programmatic changes to interface orientation."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _UISceneErrorWithCodeAndDescription(101, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v11 + 2))(v11, v23);

    }
  }

}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke___s_category[0];
  if (!_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke___s_category[0])
  {
    v4 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke___s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v6 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "_UIOrientationRequestAction failed with error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_123(id *a1)
{
  id WeakRetained;
  _UIOrientationRequestAction *v3;
  uint64_t v4;
  uint64_t v5;
  _UIOrientationRequestAction *v6;
  _QWORD v7[4];
  _UIOrientationRequestAction *v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = [_UIOrientationRequestAction alloc];
    v4 = objc_msgSend(a1[4], "interfaceOrientations");
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_2;
    v9[3] = &unk_1E16C6A58;
    v10 = a1[5];
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_126;
    v7[3] = &unk_1E16B82A0;
    v8 = -[_UIOrientationRequestAction initWithRequestedInterfaceOrientationMask:completion:](v3, "initWithRequestedInterfaceOrientationMask:completion:", v4, v9);
    v6 = v8;
    objc_msgSend(WeakRetained, "_updateUIClientSettingsWithUITransitionBlock:", v7);

  }
}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_2___s_category;
    if (!_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_2___s_category)
    {
      v4 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_2___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "_UIOrientationRequestAction completed successfully.", v6, 2u);
      }
    }
  }

}

uint64_t __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_126(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_3___s_category;
  if (!_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_3___s_category)
  {
    v5 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_3___s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v8 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Sending _UIOrientationRequestAction: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v6);

  return 0;
}

- (UIWindowSceneGeometry)effectiveGeometry
{
  void *v2;
  void *v3;

  -[UIWindowScene _trueEffectiveGeometry](self, "_trueEffectiveGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (UIWindowSceneGeometry *)v3;
}

uint64_t __37__UIWindowScene__setBackgroundStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "setBackgroundStyle:", v4);
  +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v6);

  return 1;
}

- (BOOL)_keepContextAssociationInBackground
{
  return -[_UIContextBinder contextManagementPolicy](self->_contextBinder, "contextManagementPolicy") == 1;
}

- (int64_t)_systemUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (id)_screenTraitCollectionWithOverridesAppliedFromSceneUISettings
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  uint8_t buf[4];
  _QWORD *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "traitCollection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      objc_msgSend(a1, "_FBSScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "settings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayConfiguration");
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = qword_1ECD79C20;
        if (!qword_1ECD79C20)
        {
          v6 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&qword_1ECD79C20);
        }
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Computing the scene's trait collection without a valid screen is not supported! Please file a bug report for UIKit with the following log messages:", buf, 2u);
        }
        v8 = qword_1ECD79C28;
        if (!qword_1ECD79C28)
        {
          v8 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&qword_1ECD79C28);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = a1;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Window scene: %@", buf, 0xCu);
        }
        v10 = qword_1ECD79C30;
        if (!qword_1ECD79C30)
        {
          v10 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&qword_1ECD79C30);
        }
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v5;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Scene's display configuration: %@", buf, 0xCu);
        }
        v12 = qword_1ECD79C38;
        if (!qword_1ECD79C38)
        {
          v12 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&qword_1ECD79C38);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v2;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Scene's screen: %@", buf, 0xCu);
        }
        v14 = qword_1ECD79C40;
        if (!qword_1ECD79C40)
        {
          v14 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&qword_1ECD79C40);
        }
        v15 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(a1, "session");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "role");
          v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_FBSScene");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "settings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayIdentity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v60 = v18;
          v61 = 2112;
          v62 = v21;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Scene's role: %@, Display identity: %@", buf, 0x16u);

        }
        v22 = qword_1ECD79C48;
        if (!qword_1ECD79C48)
        {
          v22 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v22, (unint64_t *)&qword_1ECD79C48);
        }
        v23 = *(NSObject **)(v22 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          +[UIScreen _shortScreensDescription](UIScreen, "_shortScreensDescription");
          v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v60 = v25;
          _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "Connected screens: %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("UIWindowScene.m"), 2861, CFSTR("Missing screen trait collection for window scene"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_FBSScene");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_FBSScene");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "hostHandle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("UIWindowScene.m"), 2852, CFSTR("Providing a UIWindowScene with a nil displayConfiguration is not supported. THIS IS NOT A UIKIT BUG - talk to this process's scene host (%@ hosted by %@)"), v31, v33, 0);

      }
    }
    objc_msgSend(a1, "_effectiveSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    v36 = v35;
    v38 = _UIUserInterfaceSizeClassForWidth(v37);
    v39 = _UIUserInterfaceSizeClassForHeight(v36);
    if (qword_1ECD79C18 != -1)
      dispatch_once(&qword_1ECD79C18, &__block_literal_global_314_0);
    v40 = qword_1ECD79C10;
    if (!qword_1ECD79C10)
    {
      if (objc_msgSend(v34, "isUISubclass"))
        v40 = objc_msgSend(v34, "userInterfaceStyle");
      else
        v40 = 0;
    }
    v41 = objc_msgSend((id)UIApp, "_effectiveUserInterfaceStyle");
    v42 = MEMORY[0x1E0C809B0];
    if (!v41 || objc_msgSend(a1, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal"))
    {
      v41 = v40;
      if (!v40)
      {
        if (objc_msgSend((id)objc_opt_class(), "_isSystemUIService")
          && (objc_msgSend(a1, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal") & 1) == 0)
        {
          v43 = (void *)a1[37];
          if (!v43)
          {
            objc_initWeak((id *)buf, a1);
            v44 = objc_alloc(MEMORY[0x1E0DC5BA0]);
            v45 = MEMORY[0x1E0C80D38];
            v57[0] = v42;
            v57[1] = 3221225472;
            v57[2] = __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke;
            v57[3] = &unk_1E16E4AE0;
            objc_copyWeak(&v58, (id *)buf);
            v46 = objc_msgSend(v44, "initWithChangesDeliveredOnQueue:toBlock:", MEMORY[0x1E0C80D38], v57);
            v47 = (void *)a1[37];
            a1[37] = v46;

            objc_destroyWeak(&v58);
            objc_destroyWeak((id *)buf);
            v43 = (void *)a1[37];
          }
          v41 = objc_msgSend(v43, "userInterfaceStyle");
        }
        else
        {
          v41 = 0;
        }
      }
    }
    v52[0] = v42;
    v52[1] = 3221225472;
    v52[2] = __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke_2;
    v52[3] = &unk_1E16E4B08;
    v53 = v2;
    v54 = v38;
    v55 = v39;
    v56 = v41;
    v48 = v2;
    -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v51, (uint64_t)v52);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  return v49;
}

void __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = v8;
  if (WeakRetained && v8)
    objc_msgSend(v8, "_windowScene:window:didUpdateSupportedInterfaceOrientations:preferredOrientation:", *(_QWORD *)(a1 + 32), v10, a3, a4);

}

void __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;
  if (WeakRetained && v6)
    objc_msgSend(v6, "_windowScene:window:didUpdateSupportedInterfaceOrientations:", WeakRetained, v8, a3);

}

- (void)_screenDidChangeFromScreen:(id)a3 toScreen:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UIScene _FBSScene](self, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 1020, CFSTR("The changed screen does not match the screen from our scene: newScreen %@; screenFromFBSScene: %@; self: %@"),
      v8,
      v10,
      self);

  }
  objc_storeStrong((id *)&self->_screen, a4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIWindowScene _allWindows](self, "_allWindows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "_didMoveFromScreen:toScreen:", v7, v8);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[UIWindowScene _computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:withAction:](self, "_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:withAction:", 1, 0);
}

uint64_t __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_canDisableMirroring");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesMirroring:", *(unsigned __int8 *)(a1 + 32));
}

+ (void)_updateVisibleSceneAndWindowOrderWithTest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = v3;
  if ((_updateVisibleSceneAndWindowOrderWithTest__updating & 1) == 0)
  {
    _updateVisibleSceneAndWindowOrderWithTest__updating = 1;
    v5 = (void *)UIApp;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__UIWindowScene__updateVisibleSceneAndWindowOrderWithTest___block_invoke;
    v6[3] = &unk_1E16B1BF8;
    v7 = v3;
    objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v6);

  }
}

void __59__UIWindowScene__updateVisibleSceneAndWindowOrderWithTest___block_invoke(uint64_t a1)
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateVisibleWindowOrderWithTest:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  _updateVisibleSceneAndWindowOrderWithTest__updating = 0;
}

- (id)_allWindowsForInvalidation
{
  return -[_UIContextBinder enrolledUnsafeUnretainedBindables](self->_contextBinder, "enrolledUnsafeUnretainedBindables");
}

- (UIActivityItemsConfigurationReading)_activityItemsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIWindowScene activityItemsConfigurationSource](self, "activityItemsConfigurationSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    _UIEffectiveActivityItemsConfiguration(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIWindowScene _keyWindow]((id *)&self->super.super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_activityItemsConfigurationForScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIActivityItemsConfigurationReading *)v5;
}

- (BOOL)_isInLiveResize
{
  void *v2;
  char v3;

  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inLiveResize");

  return v3;
}

- (void)_inLiveResizeDidChange
{
  int v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  id v6;

  if (a1)
  {
    v2 = objc_msgSend(a1, "_isInLiveResize");
    v3 = CFSTR("UIWindowSceneDidEndLiveResizeNotification");
    if (v2)
      v3 = CFSTR("UIWindowSceneDidBeginLiveResizeNotification");
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = v3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", v5, a1);

  }
}

- (id)_holdLiveResizeSnapshotForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self->_assertionController, "vendAssertionOfType:initialState:reason:", 0, 1, a3);
}

- (void)_computeMetricsAndCrossFadeInLiveResize:(BOOL)a3 withTransitionContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  NSObject *v10;
  id *v11;
  id *v12;
  UIView *v13;
  UIView *liveResizeSnapshot;
  uint8_t v15[16];

  v4 = a3;
  v6 = a4;
  -[UIScene _effectiveUISettings](self, "_effectiveUISettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inLiveResize");

  if (v8)
  {
    if (self->_liveResizeSnapshot)
    {
      v9 = _computeMetricsAndCrossFadeInLiveResize_withTransitionContext____s_category;
      if (!_computeMetricsAndCrossFadeInLiveResize_withTransitionContext____s_category)
      {
        v9 = __UILogCategoryGetNode("LiveResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_computeMetricsAndCrossFadeInLiveResize_withTransitionContext____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Laying out window scene to new size before finished rendering at previous size.", v15, 2u);
      }
    }
    else
    {
      -[UIWindowScene _topVisibleWindowPassingTest:](self, "_topVisibleWindowPassingTest:", &__block_literal_global_182);
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        _makeUISceneViewForLiveResize(v11);
        v13 = (UIView *)objc_claimAutoreleasedReturnValue();
        if ((_os_feature_enabled_impl() & 1) == 0)
          -[UIWindow _insertLiveResizeSnapshot:](v12, v13);
        liveResizeSnapshot = self->_liveResizeSnapshot;
        self->_liveResizeSnapshot = v13;

      }
    }
    -[UIWindowScene _computeMetrics:withTransitionContext:](self, "_computeMetrics:withTransitionContext:", v4, v6);
    if ((*((_BYTE *)&self->_windowSceneFlags + 8) & 1) != 0)
      *(_BYTE *)&self->_windowSceneFlags |= 0x10u;
    else
      -[UIWindowScene _scheduleResizeFinishedActionAndFadeOutSnapshot](self, "_scheduleResizeFinishedActionAndFadeOutSnapshot");
  }
  else
  {
    -[UIWindowScene _computeMetrics:withTransitionContext:](self, "_computeMetrics:withTransitionContext:", v4, v6);
  }

}

BOOL __79__UIWindowScene__computeMetricsAndCrossFadeInLiveResize_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "_isSceneSized"))
  {
    objc_msgSend(v2, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_scheduleResizeFinishedActionAndFadeOutSnapshot
{
  void *v3;
  uint64_t v4;
  id v5;
  UIView *liveResizeSnapshot;
  UIView *v7;
  UIView *v8;
  double v9;
  UIView *v10;
  _QWORD v11[4];
  UIView *v12;
  _QWORD v13[4];
  UIView *v14;
  _QWORD v15[4];
  id v16;

  -[UIScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke;
  v15[3] = &unk_1E16B1B28;
  v5 = v3;
  v16 = v5;
  -[UIScene _scheduleSceneEventResponseWithResponseBlock:](self, "_scheduleSceneEventResponseWithResponseBlock:", v15);
  liveResizeSnapshot = self->_liveResizeSnapshot;
  if (liveResizeSnapshot)
  {
    v7 = liveResizeSnapshot;
    v8 = self->_liveResizeSnapshot;
    self->_liveResizeSnapshot = 0;

    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_LiveResizeCrossFadeDuration, (uint64_t)CFSTR("LiveResizeCrossFadeDuration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 0.1;
    else
      v9 = *(double *)&qword_1EDDA8340;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_3;
    v13[3] = &unk_1E16B1B28;
    v14 = v7;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_4;
    v11[3] = &unk_1E16B3FD8;
    v12 = v14;
    v10 = v14;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v11, v9);

  }
}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _UISceneResizeFinishedAction *v4;

  v4 = -[_UISceneResizeFinishedAction initWithInfo:responder:]([_UISceneResizeFinishedAction alloc], "initWithInfo:responder:", 0, 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActions:", v3);

}

uint64_t __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindow _removeLiveResizeSnapshot:]((uint64_t)v2, *(void **)(a1 + 32));

}

- (void)_setEnhancedWindowingEnabled:(BOOL)a3
{
  unsigned int enhancedWindowingEnabled;
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

  v16 = *MEMORY[0x1E0C80C00];
  enhancedWindowingEnabled = self->_windowSceneFlags.enhancedWindowingEnabled;
  self->_windowSceneFlags.enhancedWindowingEnabled = a3;
  if (enhancedWindowingEnabled != a3)
  {
    -[UIWindowScene _configurePassthroughWindowIfNeeded]((id *)&self->super.super.super.isa);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIWindowScene _allWindows](self, "_allWindows", 0);
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
          -[UIWindow _configurePassthroughInteractionIfNeeded](*(id **)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("_UIWindowSceneEnhancedWindowingModeChanged"), self);

  }
}

- (void)_performAfterSystemSnapshotsComplete:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a3;
  if (-[UIScene activationState](self, "activationState") != UISceneActivationStateBackground)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 1463, CFSTR("_performAfterSystemSnapshotsComplete should only be called on a background scene"));

  }
  v6 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.UIKit.PostSnapshottingAction"), 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__UIWindowScene__performAfterSystemSnapshotsComplete___block_invoke;
  v9[3] = &unk_1E16B2560;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  -[UIScene _enqueuePostSettingsUpdateResponseBlock:inPhase:](self, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v9, 0x1E16F0C40);

}

uint64_t __54__UIWindowScene__performAfterSystemSnapshotsComplete___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates
{
  return 1;
}

- (_UIContextBinder)_contextBinder
{
  return self->_contextBinder;
}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIContextBinder substrate](self->_contextBinder, "substrate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "clientSettings", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "CAContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_boundContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v16)
            goto LABEL_12;

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)_recycleAttachmentForWindow:(id)a3
{
  -[_UIContextBinder recreateContextForBindable:](self->_contextBinder, "recreateContextForBindable:", a3);
}

- (id)_findNewKeyWindowPassingTest:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__UIWindowScene__findNewKeyWindowPassingTest___block_invoke;
    v6[3] = &unk_1E16E49D8;
    v7 = v3;
    objc_msgSend(a1, "_topVisibleWindowPassingTest:", v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

uint64_t __46__UIWindowScene__findNewKeyWindowPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  id v7;
  double v8;
  char IsHidden;
  uint64_t v10;

  v3 = a2;
  if (objc_msgSend(v3, "canBecomeKeyWindow")
    && (objc_msgSend(v3, "_isTextEffectsWindow") & 1) == 0
    && (objc_msgSend(v3, "isInternalWindow") & 1) == 0)
  {
    if (objc_msgSend(v3, sel_allowsWeakReference))
      v6 = v3;
    else
      v6 = 0;
    if (v6)
    {
      v7 = v3;
      objc_msgSend(v7, "alpha");
      if (v8 >= 0.01)
      {
        IsHidden = _UIWindowSceneCompatibleIsHidden(v7);

        if ((IsHidden & 1) == 0)
        {
          v10 = *(_QWORD *)(a1 + 32);
          if (v10)
            v4 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v7);
          else
            v4 = 1;
          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    else
    {
      v7 = 0;
    }
    v4 = 0;
LABEL_15:

    goto LABEL_5;
  }
  v4 = 0;
LABEL_5:

  return v4;
}

- (void)_keyWindowWillDeallocate:(id *)a1
{
  id *v4;
  id v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a2, "windowScene");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    if (v4 != a1)
    {
LABEL_3:

      return;
    }
    if (!objc_msgSend(a1[42], "count"))
    {
      v4 = a1;
      goto LABEL_3;
    }
    v5 = a1[43];

    if (v5 == a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Key window is deallocating: %p"), objc_opt_class(), a1, a1[43]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, a1[43], 1, v6);
      v4 = (id *)v6;
      goto LABEL_3;
    }
  }
}

BOOL __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

void __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_239(uint64_t a1, int a2)
{
  id *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_eventDeferringManager");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIEventDeferringManager internalBehavior](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wantsLocalCompatibilityRules");

  if (*(_BYTE *)(a1 + 64) || (v6 & a2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %p: Begin event deferring in %@ for window: %p"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](*(_QWORD **)(a1 + 40), *(_QWORD *)(a1 + 48), v7);

  }
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2_242(uint64_t result)
{
  uint64_t v1;
  objc_class *v2;
  const char *Name;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 64))
  {
    v1 = result;
    if (*(_BYTE *)(result + 65))
    {
      result = *(_QWORD *)(result + 32);
      if (result)
      {
        v2 = (objc_class *)objc_opt_class();
        Name = class_getName(v2);
        v4 = _UIInternalPreference_DisablePassthroughWindow_block_invoke_4___s_category[0];
        if (!_UIInternalPreference_DisablePassthroughWindow_block_invoke_4___s_category[0])
        {
          v4 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, _UIInternalPreference_DisablePassthroughWindow_block_invoke_4___s_category);
        }
        if ((*(_BYTE *)v4 & 1) != 0)
        {
          v5 = *(NSObject **)(v4 + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v6 = *(_QWORD *)(v1 + 56);
            v7 = *(void **)(v1 + 32);
            v8 = *(_QWORD *)(v1 + 40);
            v9 = v5;
            v10 = 136447234;
            v11 = v6;
            v12 = 2050;
            v13 = v8;
            v14 = 2082;
            v15 = Name;
            v16 = 2050;
            v17 = v7;
            v18 = 1026;
            v19 = objc_msgSend(v7, "_contextId");
            _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%{public}s: %{public}p: Window resigning key in scene: <%{public}s: %{public}p>; contextId: 0x%{public}X",
              (uint8_t *)&v10,
              0x30u);

          }
        }
        objc_msgSend(*(id *)(v1 + 32), "resignKeyWindow");
        return objc_msgSend(*(id *)(v1 + 48), "postNotificationName:object:", CFSTR("UIWindowDidResignKeyNotification"), *(_QWORD *)(v1 + 32));
      }
    }
  }
  return result;
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_243(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    if (*(_BYTE *)(result + 49))
    {
      objc_msgSend(*(id *)(result + 32), "becomeKeyWindow");
      return objc_msgSend(*(id *)(v1 + 40), "postNotificationName:object:", CFSTR("UIWindowDidBecomeKeyNotification"), *(_QWORD *)(v1 + 32));
    }
  }
  return result;
}

- (void)_prepareForSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  -[UIScene _prepareForSuspend](&v3, sel__prepareForSuspend);
  -[_UIContextBinder purgeContextsWithPurgeAction:afterPurgeAction:](self->_contextBinder, "purgeContextsWithPurgeAction:afterPurgeAction:", 0, &__block_literal_global_251_1);
}

void __35__UIWindowScene__prepareForSuspend__block_invoke()
{
  id v0;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "collectBackingStores");

}

- (id)_trueEffectiveGeometry
{
  UIWindowSceneGeometry *effectiveGeometry;
  UIWindowSceneGeometry *v4;
  UIWindowSceneGeometry *v5;

  effectiveGeometry = self->_effectiveGeometry;
  if (!effectiveGeometry)
  {
    +[UIWindowSceneGeometry _calculateEffectiveGeometryForWindowScene:](UIWindowSceneGeometry, "_calculateEffectiveGeometryForWindowScene:", self);
    v4 = (UIWindowSceneGeometry *)objc_claimAutoreleasedReturnValue();
    v5 = self->_effectiveGeometry;
    self->_effectiveGeometry = v4;

    effectiveGeometry = self->_effectiveGeometry;
  }
  return effectiveGeometry;
}

- (UIEdgeInsets)_peripheryInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    -[UIWindowScene _displayInfoProvider](self, "_displayInfoProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "peripheryInsets");
    v4 = v8;
    v3 = v9;
    v5 = v10;
    v6 = v11;

  }
  v12 = v4;
  v13 = v3;
  v14 = v5;
  v15 = v6;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (unint64_t)_currentlySupportedInterfaceOrientations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_viewControllerForSupportedInterfaceOrientations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "supportedInterfaceOrientations");
  v7 = objc_msgSend((id)UIApp, "_supportedInterfaceOrientationsForWindow:", v3) & v6;
  if (!v7)
    v7 = 1 << -[UIWindowScene interfaceOrientation](self, "interfaceOrientation");

  return v7;
}

- (void)_setShouldDisableTouchCancellationOnRotation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)&self->_windowSceneFlags + 8) = *((_BYTE *)&self->_windowSceneFlags + 8) & 0xFD | v3;
}

- (id)_disableTouchCancellationOnRotation
{
  return -[UIWindowSceneTouchCancellationOnRotationAssertion initWithWindowScene:]([UIWindowSceneTouchCancellationOnRotationAssertion alloc], "initWithWindowScene:", self);
}

- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[8];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *(*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  -[UIScene _effectiveUIClientSettings](self, "_effectiveUIClientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  if (v8 != a3)
  {
    if (-[UIScene _isUIKitManaged](self, "_isUIKitManaged"))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__264;
      v17 = __Block_byref_object_dispose__265;
      v18 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke;
      v11[3] = &unk_1E16E4AB8;
      v11[5] = &v13;
      v11[6] = a3;
      *(double *)&v11[7] = a4;
      v11[4] = self;
      v12 = fabs(a4) >= 2.22044605e-16;
      -[UIScene _updateUIClientSettingsWithUITransitionBlock:](self, "_updateUIClientSettingsWithUITransitionBlock:", v11);
      v9 = v14[5];
      if (v9)
        (*(void (**)(void))(v9 + 16))();
      _Block_object_dispose(&v13, 8);

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke_2;
      v10[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
      v10[4] = a3;
      -[UIScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v10);
    }
  }
}

uint64_t __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v7, "setInterfaceOrientation:", v6);
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", *(double *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v8);

  v9 = *(_BYTE **)(a1 + 32);
  if ((v9[416] & 2) != 0)
  {
    objc_msgSend(v5, "setDisableTouchCancellationOnRotation:", 1);
    v9 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v9, "statusBarManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateStatusBarAppearanceWithClientSettings:transitionContext:", v7, v5);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(unsigned __int8 *)(a1 + 64);
  return v14;
}

uint64_t __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

- (id)_orientationDebugDescription
{
  return -[UIWindowScene _orientationDebugDescriptionWithMultilinePrefix:](self, "_orientationDebugDescriptionWithMultilinePrefix:", 0);
}

- (CGSize)_screenRequestedDisplayNativePixelSize
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[UIScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUISubclass");

  if (v5)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfigurationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nativePixelSize");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setScreenRequestedDisplayNativePixelSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  -[UIScene _FBSScene](self, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUISubclass");

  if (v8)
  {
    -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      v12 = (id)objc_opt_new();
    }

    objc_msgSend(v12, "setNativePixelSize:", width, height);
    v11 = (void *)objc_msgSend(v12, "copy");
    -[UIWindowScene _setDisplayConfigurationRequest:](self, "_setDisplayConfigurationRequest:", v11);

  }
}

- (int64_t)_resolvedOverscanCompensation
{
  int64_t avkitRequestedOverscanCompensation;

  avkitRequestedOverscanCompensation = self->_avkitRequestedOverscanCompensation;
  if (avkitRequestedOverscanCompensation == -1)
    return self->_screenRequestedOverscanCompensation;
  return avkitRequestedOverscanCompensation;
}

- (void)_setScreenRequestedOverscanCompensation:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[UIScene _FBSScene](self, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUISubclass");

  if (v7)
  {
    self->_screenRequestedOverscanCompensation = a3;
    v8 = -[UIWindowScene _resolvedOverscanCompensation](self, "_resolvedOverscanCompensation");
    -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "overscanCompensation");

      if (v11 != v8)
      {
        -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v12, "mutableCopy");

        v13 = v15;
        if (v15)
          goto LABEL_5;
      }
    }
    else
    {
      v13 = (void *)objc_opt_new();
      if (v13)
      {
LABEL_5:
        v16 = v13;
        objc_msgSend(v13, "setOverscanCompensation:", v8);
        v14 = (void *)objc_msgSend(v16, "copy");
        -[UIWindowScene _setDisplayConfigurationRequest:](self, "_setDisplayConfigurationRequest:", v14);

      }
    }
  }
}

- (void)_setAVKitRequestedRefreshRate:(double)a3 HDRMode:(int64_t)a4 overscanCompensation:(int64_t)a5
{
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  -[UIScene _FBSScene](self, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUISubclass");

  if (v11)
  {
    self->_avkitRequestedOverscanCompensation = a5;
    v12 = -[UIWindowScene _resolvedOverscanCompensation](self, "_resolvedOverscanCompensation");
    -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshRate");
      v16 = v15;
      v17 = objc_msgSend(v14, "hdrMode");
      v18 = objc_msgSend(v14, "overscanCompensation");
      if (v16 == a3 && v17 == a4 && v18 == v12)
      {
        v22 = 0;
      }
      else
      {
        -[UIWindowScene _displayConfigurationRequest](self, "_displayConfigurationRequest");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v20, "mutableCopy");

      }
      v19 = v22;
      if (!v22)
        goto LABEL_13;
    }
    else
    {
      v19 = (void *)objc_opt_new();
      if (!v19)
        goto LABEL_13;
    }
    v23 = v19;
    objc_msgSend(v19, "setRefreshRate:", a3);
    objc_msgSend(v23, "setHdrMode:", a4);
    objc_msgSend(v23, "setOverscanCompensation:", v12);
    v21 = (void *)objc_msgSend(v23, "copy");
    -[UIWindowScene _setDisplayConfigurationRequest:](self, "_setDisplayConfigurationRequest:", v21);

    v19 = v23;
LABEL_13:

  }
}

- (FBSDisplayConfigurationRequest)_displayConfigurationRequest
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUISubclass");

  if (v5)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfigurationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (FBSDisplayConfigurationRequest *)v8;
}

- (void)_setDisplayConfigurationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[UIScene _FBSScene](self, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUISubclass");

  if (v4 && v7)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__UIWindowScene__setDisplayConfigurationRequest___block_invoke;
    v9[3] = &unk_1E16B2A58;
    v10 = v4;
    objc_msgSend(v8, "updateUIClientSettingsWithBlock:", v9);

  }
}

uint64_t __49__UIWindowScene__setDisplayConfigurationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayConfigurationRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  -[UIScene _noteDisplayIdentityDidChangeWithConfiguration:](&v3, sel__noteDisplayIdentityDidChangeWithConfiguration_, a3);
}

- (void)_applySnapshotSettings:(id)a3 forActions:(id)a4
{
  *(_BYTE *)&self->_windowSceneFlags |= 8u;
  -[UIScene _applyOverrideSettings:forActions:](self, "_applyOverrideSettings:forActions:", a3, a4);
  *(_BYTE *)&self->_windowSceneFlags &= ~8u;
}

void __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 1, 1);
      v2 = v4;
    }
  }

}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return -[UIWindowScene _traitTrace:](self, "_traitTrace:", 0);
}

- (void)_setOverrideParentTraitEnvironment:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:", self);
    objc_storeWeak((id *)&self->_overrideParentTraitEnvironment, obj);
    if (obj)
      objc_msgSend(obj, "_registerAuxiliaryChildEnvironmentForTraitInvalidations:", self);
    -[UIWindowScene _invalidateAuxiliaryChildTraits](self, "_invalidateAuxiliaryChildTraits");
  }

}

- (void)_invalidateAuxiliaryChildTraits
{
  -[UIWindowScene _updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:](self, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 0, 0);
}

- (void)_updateAuxiliaryChildTraitsIfNeeded
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIWindowScene _allWindows](self, "_allWindows", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateTraitsIfNeeded");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_parentTraitEnvironment
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[UIWindowScene screen](self, "screen");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  void *v6;

  if (!a3)
    return *((_BYTE *)&self->_windowSceneFlags + 8) & 1;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 3034, CFSTR("Unknown _UIAssertionType %lu"), a3);

  return 0;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  void *v8;
  $6715AFF9AB89549E17F5C86673836CCC *p_windowSceneFlags;
  id v10;

  if (pthread_main_np() == 1)
  {
    if (a4)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 3056, CFSTR("Unknown _UIAssertionType %lu"), a4);

      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowScene.m"), 3041, CFSTR("Call must be made on main thread"));

    if (a4)
      goto LABEL_3;
  }
  p_windowSceneFlags = &self->_windowSceneFlags;
  *((_BYTE *)&self->_windowSceneFlags + 8) = *((_BYTE *)&self->_windowSceneFlags + 8) & 0xFE | a3;
  if (!a3 && (*(_BYTE *)p_windowSceneFlags & 0x10) != 0)
  {
    *(_BYTE *)p_windowSceneFlags &= ~0x10u;
    -[UIWindowScene _scheduleResizeFinishedActionAndFadeOutSnapshot](self, "_scheduleResizeFinishedActionAndFadeOutSnapshot");
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 1;
}

- (id)_keyCommands
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIWindowScene;
  -[UIResponder _keyCommands](&v11, sel__keyCommands);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  -[UIWindowScene keyWindow](self, "keyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "_isHostedInAnotherProcess") & 1) == 0)
  {
    if (qword_1ECD79C58 != -1)
      dispatch_once(&qword_1ECD79C58, &__block_literal_global_339);
    objc_msgSend(v6, "arrayByAddingObject:", qword_1ECD79C50);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }

  return v6;
}

uint64_t __29__UIWindowScene__keyCommands__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel__performClose_);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)qword_1ECD79C50;
  qword_1ECD79C50 = v1;

  objc_msgSend((id)qword_1ECD79C50, "_setEnumerationPriority:", -1);
  return objc_msgSend((id)qword_1ECD79C50, "setAttributes:", objc_msgSend((id)qword_1ECD79C50, "attributes") | 4);
}

- (void)_performClose:(id)a3
{
  UIDestroySceneAction *v3;
  void *v4;
  id v5;

  -[UIScene _FBSScene](self, "_FBSScene", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = -[UIDestroySceneAction initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:]([UIDestroySceneAction alloc], "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:", 0, 1, 1, 1, 0, &__block_literal_global_344_0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendActions:", v4);

  }
}

- (void)_unlockPointerLockState:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _UIPointerUnlockAction *v7;
  void *v8;
  id v9;

  -[UIScene _FBSScene](self, "_FBSScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    -[UIScene pointerLockState](self, "pointerLockState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLocked");

    v4 = v9;
    if (v6)
    {
      v7 = -[_UIPointerUnlockAction initWithInfo:responder:]([_UIPointerUnlockAction alloc], "initWithInfo:responder:", 0, 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendActions:", v8);

      v4 = v9;
    }
  }

}

- (int64_t)_avkitRequestedOverscanCompensation
{
  return self->_avkitRequestedOverscanCompensation;
}

- (void)_setAVKitRequestedOverscanCompensation:(int64_t)a3
{
  self->_avkitRequestedOverscanCompensation = a3;
}

- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment
{
  return (_UITraitEnvironmentInternal *)objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
}

- (id)activityItemsConfigurationSource
{
  return objc_loadWeakRetained((id *)&self->_activityItemsConfigurationSource);
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)set_isKeyWindowScene:(BOOL)a3
{
  self->__isKeyWindowScene = a3;
}

- (BOOL)isExcludedFromWindowsMenu
{
  return self->_excludedFromWindowsMenu;
}

- (void)setExcludedFromWindowsMenu:(BOOL)a3
{
  self->_excludedFromWindowsMenu = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityItemsConfigurationSource);
  objc_destroyWeak((id *)&self->_overrideParentTraitEnvironment);
  objc_storeStrong((id *)&self->_overrideParentTraitCollection, 0);
  objc_storeStrong((id *)&self->_metricsCalculator, 0);
  objc_storeStrong((id *)&self->_liveResizeSnapshot, 0);
  objc_storeStrong((id *)&self->_passthroughWindow, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_windowsNeedingDeferredInitialUpdateExecution, 0);
  objc_storeStrong((id *)&self->_delegateWindowNeedingDeferredInitialUpdate, 0);
  objc_storeStrong((id *)&self->_keyboardEventDeferringToken, 0);
  objc_storeStrong((id *)&self->_keyWindowHistory, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_effectiveGeometry, 0);
  objc_storeStrong((id *)&self->_componentsWithTraitOverrides, 0);
  objc_storeStrong((id *)&self->_currentUserInterfaceStyleValueForSystemUIServices, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayEdgeInfoProvider, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_2;
  v22[3] = &unk_1E16B1B50;
  v23 = *(id *)(a1 + 40);
  v18 = v2;
  v24 = v18;
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sceneSettings"), v4, v22);

  objc_msgSend(*(id *)(a1 + 32), "_effectiveUIClientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_3;
  v19[3] = &unk_1E16B1B50;
  v20 = *(id *)(a1 + 40);
  v9 = v6;
  v21 = v9;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("clientSettings"), v8, v19);

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ui_appendOrientationDebugDescription:withName:", v11, CFSTR("screen"));

  if (objc_msgSend(v18, "interfaceOrientationMode") == 1)
  {
    +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(*(id *)(a1 + 32), "_allWindows");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v15, "removeObject:", v12);
    objc_msgSend(*(id *)(a1 + 40), "ui_appendOrientationDebugDescription:withName:", v12, CFSTR("windowDrivingOrientation"));
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v15, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ui_appendOrientationDebuggingArraySection:withName:skipIfEmpty:", v17, CFSTR("otherWindows"), 1);

  }
}

id __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  UIApplicationSceneStringForInterfaceOrientationMode(objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("mode"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), CFSTR("orientation"));
}

id __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), CFSTR("orientation"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "supportedInterfaceOrientations"), CFSTR("supported"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:skipIfUnknown:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientation"), CFSTR("preferred"), 1);
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIWindowScene _orientationDebugDescriptionBuilderWithMultilinePrefix:](self, "_orientationDebugDescriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_remoteSheetClientProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  -[UIScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "componentForExtension:ofClass:", v3, objc_opt_class());
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

  return v8;
}

@end
