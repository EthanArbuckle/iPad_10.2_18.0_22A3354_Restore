@implementation _UIKeyShortcutHUDServer

+ (_UIKeyShortcutHUDServer)sharedHUDServer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___UIKeyShortcutHUDServer_sharedHUDServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7E2E0 != -1)
    dispatch_once(&qword_1ECD7E2E0, block);
  return (_UIKeyShortcutHUDServer *)(id)_MergedGlobals_1090;
}

- (_UIKeyShortcutHUDServer)init
{
  _UIKeyShortcutHUDServer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDServer;
  v3 = -[_UIKeyShortcutHUDServer init](&v6, sel_init);
  if (v3
    && +[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled")
    && (_UIApplicationProcessIsOverlayUI() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_UIKeyShortcutHUDServer.m"), 138, CFSTR("Attempted to initialize a _UIKeyShortcutHUDServer object for an OOP HUD outside of OverlayUI!"));

  }
  return v3;
}

- (int64_t)hudPresentationState
{
  void *v3;
  int64_t v4;

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = 2;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v4 = 3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 1;
  else
    return v4;
}

- (_UIKeyShortcutHUDViewController)hudVC
{
  void *v2;
  void *v3;

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDViewController *)v3;
}

- (void)handleKeyboardEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIKeyShortcutHUDServer setLastKeyboardEvent:](self, "setLastKeyboardEvent:", v4);
  -[_UIKeyShortcutHUDServer modifierKeyListener](self, "modifierKeyListener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardEvent:", v4);

}

- (_UIKeyShortcutHUDModifierKeyListener)modifierKeyListener
{
  _UIKeyShortcutHUDModifierKeyListener *modifierKeyListener;
  _UIKeyShortcutHUDModifierKeyListener *v4;
  _UIKeyShortcutHUDModifierKeyListener *v5;

  modifierKeyListener = self->_modifierKeyListener;
  if (!modifierKeyListener)
  {
    v4 = (_UIKeyShortcutHUDModifierKeyListener *)objc_opt_new();
    v5 = self->_modifierKeyListener;
    self->_modifierKeyListener = v4;

    -[_UIKeyShortcutHUDModifierKeyListener setDelegate:](self->_modifierKeyListener, "setDelegate:", self);
    modifierKeyListener = self->_modifierKeyListener;
  }
  return modifierKeyListener;
}

- (void)modifierKeyListener:(id)a3 didUpdateModifierFlag:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _UIKeyShortcutHUDServer *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint8_t v17[16];

  v6 = a3;
  if ((unint64_t)(-[_UIKeyShortcutHUDServer hudPresentationState](self, "hudPresentationState") - 1) <= 1)
  {
    v7 = objc_msgSend(v6, "currentModifierFlags");
    -[_UIKeyShortcutHUDServer hudVC](self, "hudVC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeldModifierFlags:", v7);

    -[_UIKeyShortcutHUDServer hudVC](self, "hudVC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "presentedModifierFlag");

    if (v11 != a4)
    {
LABEL_11:
      v12 = self;
      v13 = 0;
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "currentModifierFlags") == a4)
    {
      v12 = self;
      v13 = 1;
LABEL_12:
      -[_UIKeyShortcutHUDServer setModifierKeyDownForHUDDismissal:](v12, "setModifierKeyDownForHUDDismissal:", v13);
      goto LABEL_13;
    }
    if (!objc_msgSend(v6, "currentModifierFlags"))
    {
      if (-[_UIKeyShortcutHUDServer isModifierKeyDownForHUDDismissal](self, "isModifierKeyDownForHUDDismissal"))
      {
        -[_UIKeyShortcutHUDServer hudVC](self, "hudVC");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "shouldDismissHUDForModifierKeyTap");

        if (v15)
        {
          _UIKeyShortcutHUDLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to modifier key tap", v17, 2u);
          }

          -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
        }
      }
      goto LABEL_11;
    }
  }
LABEL_13:

}

- (void)modifierKeyListenerDidPressNonModifierKey:(id)a3
{
  -[_UIKeyShortcutHUDServer setModifierKeyDownForHUDDismissal:](self, "setModifierKeyDownForHUDDismissal:", 0);
}

- (void)presentHUDWithConfiguration:(id)a3 inWindowScene:(id)a4 forConnection:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  uint64_t IsSpringBoard;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _UIKeyShortcutHUDWindow *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  void (**v67)(id, void *);
  void *v68;
  void *v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyShortcutHUDServer.m"), 226, CFSTR("Attempted to present a HUD with a nil configuration!"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyShortcutHUDServer.m"), 227, CFSTR("Attempted to present a HUD into a nil window scene!"));

LABEL_3:
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    objc_msgSend(v13, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    IsSpringBoard = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.springboard"));

  }
  else
  {
    IsSpringBoard = _UIApplicationProcessIsSpringBoard();
  }
  objc_msgSend(v11, "clientTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSystemApp:", IsSpringBoard);

  if (v13)
    objc_msgSend(v13, "bundleIdentifier");
  else
    _UIMainBundleIdentifier();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKeyShortcutHUDLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v62;
    _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "Server received presentation request for bundle id: %{public}@", buf, 0xCu);
  }

  v19 = (void *)objc_opt_new();
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    _UIKeyShortcutHUDLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "Server rejected presentation request: already have a HUD up", buf, 2u);
    }

    objc_msgSend(v19, "setAccepted:", 0);
    v14[2](v14, v19);
    goto LABEL_37;
  }
  *(_BYTE *)&self->_flags |= 1u;
  -[_UIKeyShortcutHUDServer _addPresentationObserversIfNeeded](self, "_addPresentationObserversIfNeeded");
  _UIKeyShortcutHUDLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "Server will accept presentation request", buf, 2u);
  }

  objc_msgSend(v19, "setAccepted:", 1);
  if (!+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
    v14[2](v14, v19);
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  -[_UIKeyShortcutHUDServer setSession:](self, "setSession:", v24);

  -[_UIKeyShortcutHUDServer session](self, "session");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setKeyWindow:", v61);

  -[_UIKeyShortcutHUDServer session](self, "session");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConnection:", v13);

  objc_msgSend(v13, "addObserver:", self);
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled")
    && _UIApplicationProcessIsOverlayUI())
  {
    v27 = objc_msgSend(v11, "initialHeldModifierFlags");
    -[_UIKeyShortcutHUDServer modifierKeyListener](self, "modifierKeyListener");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCurrentModifierFlags:", v27);

  }
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setDelegate:", self);
  objc_msgSend(v29, "setConfiguration:", v11);
  +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "metricsProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setMetricsProvider:", v31);

  -[_UIKeyShortcutHUDServer modifierKeyListener](self, "modifierKeyListener");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHeldModifierFlags:", objc_msgSend(v32, "currentModifierFlags"));

  _UIKeyShortcutHUDLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "metricsProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v71 = v34;
    _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_DEFAULT, "HUD metrics provider: %{public}@", buf, 0xCu);

  }
  v35 = -[_UIKeyShortcutHUDWindow initWithWindowScene:]([_UIKeyShortcutHUDWindow alloc], "initWithWindowScene:", v12);
  -[_UIKeyShortcutHUDServer setHudWindow:](self, "setHudWindow:", v35);

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setRootViewController:", v29);

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDelegate:", self);

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHudWindow:", v38);

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "makeKeyAndVisible");

  objc_msgSend(v29, "setupPassthroughScrollInteraction");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "postNotificationName:object:", CFSTR("UIKeyShortcutHUDDidPresentNotification"), v41);

  objc_msgSend(v11, "clientTraits");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v42, "isSystemApp"))
    goto LABEL_27;
  v43 = +[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled");

  if (!v43)
  {
    +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dismissAllNonSystemHUDs");
LABEL_27:

  }
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    getSBSKeyboardFocusServiceClass();
    v59 = (void *)objc_opt_new();
    objc_msgSend(v12, "_FBSScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "identityToken");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = getpid();
    _UIKeyShortcutHUDLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_DEFAULT, "Server will request keyboard focus to OverlayUI", buf, 2u);
    }

    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __101___UIKeyShortcutHUDServer_presentHUDWithConfiguration_inWindowScene_forConnection_completionHandler___block_invoke;
    v65[3] = &unk_1E16C5E00;
    v67 = v14;
    v66 = v19;
    objc_msgSend(v59, "requestKeyboardFocusForSceneIdentity:processID:completion:", v60, v58, v65);
    objc_msgSend(v11, "clientTraits");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isSystemApp");

    if (v47)
    {
      _UIKeyShortcutHUDLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_DEFAULT, "Server requesting systemKeyCommandOverlay focus to OverlayUI", buf, 2u);
      }

      objc_msgSend(getSBSKeyboardFocusServiceClass(), "systemKeyCommandOverlayEnvironment");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v57;
      v49 = (void *)MEMORY[0x1E0D00CB8];
      objc_msgSend(v60, "stringRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "tokenForString:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "applyAdditionalDeferringRules:whenSceneHasKeyboardFocus:processID:", v52, v60, v58);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyShortcutHUDServer setSystemKeyCommandOverlayRulesToken:](self, "setSystemKeyCommandOverlayRulesToken:", v53);

    }
  }
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(1, v12, self);
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  _UIGameControllerNotifyRelevantSystemUIWillShow(v12, v54);

  objc_initWeak((id *)buf, self);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __101___UIKeyShortcutHUDServer_presentHUDWithConfiguration_inWindowScene_forConnection_completionHandler___block_invoke_21;
  v63[3] = &unk_1E16B3F40;
  objc_copyWeak(&v64, (id *)buf);
  objc_msgSend(v29, "setHidden:completionHandler:", 0, v63);
  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);

LABEL_37:
}

- (void)dismissHUDForConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[_UIKeyShortcutHUDServer session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    _UIKeyShortcutHUDLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to a dismissal request from the client", v8, 2u);
    }

    -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
  }

}

- (void)_dismissHUD
{
  -[_UIKeyShortcutHUDServer _dismissHUDWithSelectedShortcut:](self, "_dismissHUDWithSelectedShortcut:", 0);
}

- (void)_dismissHUDWithSelectedShortcut:(id)a3
{
  int64_t v4;
  char flags;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  _BYTE location[12];
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v4 = -[_UIKeyShortcutHUDServer hudPresentationState](self, "hudPresentationState");
  if (v4 == 1)
  {
    flags = *(_BYTE *)&self->_flags & 0xFE;
    *(_BYTE *)&self->_flags = flags;
  }
  else
  {
    if (v4 != 2)
      goto LABEL_12;
    flags = (char)self->_flags;
  }
  *(_BYTE *)&self->_flags = flags | 2;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v6 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v27 = _UIInternalPreference_KeyShortcutHUDEnhancedLogging;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_KeyShortcutHUDEnhancedLogging)
    {
      while (v6 >= v27)
      {
        _UIInternalPreferenceSync(v6, &_UIInternalPreference_KeyShortcutHUDEnhancedLogging, (uint64_t)CFSTR("KeyShortcutHUDEnhancedLogging"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v27 = _UIInternalPreference_KeyShortcutHUDEnhancedLogging;
        if (v6 == _UIInternalPreference_KeyShortcutHUDEnhancedLogging)
          goto LABEL_8;
      }
      if (byte_1EDDA7D84)
      {
        _UIKeyShortcutHUDLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v31, "uiKeyCommand");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v29;
          v46 = 2114;
          v47 = v30;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "HUD is dismissing; selectedKeyCommand=%{public}@, callStack=%{public}@",
            location,
            0x16u);

        }
      }
    }
  }
LABEL_8:
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v8, self);

  -[_UIKeyShortcutHUDServer setModifierKeyDownForHUDDismissal:](self, "setModifierKeyDownForHUDDismissal:", 0);
  v9 = dispatch_group_create();
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDServer session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v31, "uiKeyCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyCommand:", v13);

  v14 = +[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled");
  v15 = MEMORY[0x1E0C809B0];
  if (v14 && objc_msgSend(v31, "isPasteShortcut"))
  {
    dispatch_group_enter(v9);
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "pid");
    v42[0] = v15;
    v42[1] = 3221225472;
    v42[2] = __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke;
    v42[3] = &unk_1E16CB990;
    v43 = v12;
    v44 = v9;
    objc_msgSend(v16, "_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock:", 0x5A4A97C3218CE65BLL, v18, v42);

  }
  dispatch_group_enter(v9);
  objc_initWeak((id *)location, self);
  -[_UIKeyShortcutHUDServer hudVC](self, "hudVC");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_3;
  v36[3] = &unk_1E16CB9B8;
  objc_copyWeak(&v41, (id *)location);
  v20 = v11;
  v37 = v20;
  v21 = v10;
  v38 = v21;
  v22 = v12;
  v39 = v22;
  v23 = v9;
  v40 = v23;
  objc_msgSend(v19, "setHidden:completionHandler:", 1, v36);

  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_4;
  block[3] = &unk_1E16B51E8;
  block[4] = self;
  v33 = v22;
  v34 = v20;
  v35 = v21;
  v24 = v21;
  v25 = v20;
  v26 = v22;
  dispatch_group_notify(v23, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)location);

LABEL_12:
  -[_UIKeyShortcutHUDServer _removePresentationObserversIfNeeded](self, "_removePresentationObserversIfNeeded");

}

- (void)_sendResponse:(id)a3 withSession:(id)a4
{
  id v6;
  _UIOKeyShortcutHUDDismissalAction *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    v7 = -[_UIOKeyShortcutHUDDismissalAction initWithResponse:]([_UIOKeyShortcutHUDDismissalAction alloc], "initWithResponse:", v6);

    objc_msgSend(v9, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAction:", v7);

    objc_msgSend(v9, "connection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);
  }
  else
  {
    +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
    v7 = (_UIOKeyShortcutHUDDismissalAction *)objc_claimAutoreleasedReturnValue();
    -[_UIOKeyShortcutHUDDismissalAction keyShortcutHUDDidDismissWithResponse:toOverlayService:](v7, "keyShortcutHUDDidDismissWithResponse:toOverlayService:", v6, 0);
  }

}

- (void)keyShortcutHUDViewController:(id)a3 didSelectShortcut:(id)a4
{
  -[_UIKeyShortcutHUDServer _dismissHUDWithSelectedShortcut:](self, "_dismissHUDWithSelectedShortcut:", a4);
}

- (void)keyShortcutHUDViewControllerDidBeginTypeAheadSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  -[_UIKeyShortcutHUDServer lastKeyboardEvent](self, "lastKeyboardEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "_cloneEvent");

  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79___UIKeyShortcutHUDServer_keyShortcutHUDViewControllerDidBeginTypeAheadSearch___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v9 = v5;
    objc_msgSend(v7, "performBlock:", v8);

  }
}

- (void)keyShortcutHUDWindowDidResignKey:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _UIKeyShortcutHUDLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to its window resigning key", v7, 2u);
    }

    -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
  }
}

- (void)keyShortcutHUDWindowSceneDidResignKeyboardFocus:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[_UIKeyShortcutHUDServer hudWindow](self, "hudWindow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _UIKeyShortcutHUDLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to its window scene losing keyboard focus", v7, 2u);
    }

    -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
  }
}

- (void)serviceConnectionDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _UIKeyShortcutHUDLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to invalidated connection from remote client", v6, 2u);
  }

  -[_UIKeyShortcutHUDServer dismissHUDForConnection:](self, "dismissHUDForConnection:", v4);
}

- (void)_addPresentationObserversIfNeeded
{
  void *v3;
  id v4;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    *(_BYTE *)&self->_flags |= 4u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
}

- (void)_removePresentationObserversIfNeeded
{
  void *v3;
  id v4;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)&self->_flags &= ~4u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
}

- (void)_applicationWillResignActive:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _UIKeyShortcutHUDLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to application resigning active", v6, 2u);
  }

  -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
  -[_UIKeyShortcutHUDServer modifierKeyListener](self, "modifierKeyListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentModifierFlags:", 0);

}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v7[16];

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable");

  if ((v5 & 1) == 0)
  {
    _UIKeyShortcutHUDLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to hardware keyboard being disconnected", v7, 2u);
    }

    -[_UIKeyShortcutHUDServer _dismissHUD](self, "_dismissHUD");
  }
}

- (_UIKeyShortcutHUDWindow)hudWindow
{
  return self->_hudWindow;
}

- (void)setHudWindow:(id)a3
{
  objc_storeStrong((id *)&self->_hudWindow, a3);
}

- (_UIKeyShortcutHUDServerSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (UIPhysicalKeyboardEvent)lastKeyboardEvent
{
  return self->_lastKeyboardEvent;
}

- (void)setLastKeyboardEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastKeyboardEvent, a3);
}

- (BOOL)isModifierKeyDownForHUDDismissal
{
  return self->_modifierKeyDownForHUDDismissal;
}

- (void)setModifierKeyDownForHUDDismissal:(BOOL)a3
{
  self->_modifierKeyDownForHUDDismissal = a3;
}

- (BSInvalidatable)systemKeyCommandOverlayRulesToken
{
  return self->_systemKeyCommandOverlayRulesToken;
}

- (void)setSystemKeyCommandOverlayRulesToken:(id)a3
{
  objc_storeStrong((id *)&self->_systemKeyCommandOverlayRulesToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemKeyCommandOverlayRulesToken, 0);
  objc_storeStrong((id *)&self->_lastKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_hudWindow, 0);
  objc_storeStrong((id *)&self->_modifierKeyListener, 0);
}

@end
