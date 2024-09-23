@implementation _UIRemoteKeyboards

- (UIRemoteKeyboardWindow)keyboardWindow
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = -[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass");
  -[_UIRemoteKeyboards _activeScreen](self, "_activeScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class remoteKeyboardWindowForScreen:create:](v3, "remoteKeyboardWindowForScreen:create:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIRemoteKeyboardWindow *)v5;
}

- (Class)keyboardWindowClass
{
  return (Class)(id)objc_opt_class();
}

- (id)_activeScreen
{
  UIScreen *lastScreen;
  UIScreen *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  lastScreen = self->_lastScreen;
  if (lastScreen)
  {
    v3 = lastScreen;
  }
  else
  {
    +[UIWindowScene _keyWindowScene]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[UIWindowScene _keyWindowScene]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  return v4;
}

+ (id)sharedRemoteKeyboards
{
  id v3;
  _QWORD block[5];

  if (objc_msgSend(a1, "enabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___UIRemoteKeyboards_sharedRemoteKeyboards__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (qword_1ECD7A2E8 != -1)
      dispatch_once(&qword_1ECD7A2E8, block);
    v3 = (id)qword_1ECD7A2E0;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)enabled
{
  int v2;
  void *v3;

  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIRemoteKeyboardsEnabled, (uint64_t)CFSTR("_UIRemoteKeyboardsEnabled")) & 1) != 0|| byte_1ECD766D4)
  {
    _UIMainBundleIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(&unk_1E1A94220, "containsObject:", v3) & 1) != 0)
      goto LABEL_11;
    if (qword_1ECD7A390 != -1)
      dispatch_once(&qword_1ECD7A390, &__block_literal_global_966);
    if ((byte_1ECD7A2B3 & 1) != 0
      || (_UIApplicationIsApplicationWidgetExtension() & 1) != 0
      || (_UIApplicationIsKeyboardExtension() & 1) != 0
      || (_UIApplicationIsWidgetServer() & 1) != 0)
    {
LABEL_11:
      LOBYTE(v2) = 0;
    }
    else
    {
      v2 = _UIApplicationIsUniversalControl() ^ 1;
    }

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (BOOL)keyboardVisible
{
  void *v2;
  char v3;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardOnScreen");

  return v3;
}

- (_UIKeyboardChangedInformation)currentState
{
  return (_UIKeyboardChangedInformation *)objc_getProperty(self, a2, 240, 1);
}

- (_UIRemoteKeyboards)init
{
  _UIRemoteKeyboards *v2;
  _UIRemoteKeyboards *v3;
  uint64_t v4;
  NSHashTable *windowControllers;
  uint64_t v6;
  NSMapTable *minimumKeyboardHeights;
  NSMutableArray *v8;
  NSMutableArray *activePIDs;
  NSMutableArray *v10;
  NSMutableArray *activeCIDs;
  NSMutableSet *v12;
  NSMutableSet *pendingKeyboardGrabs;
  NSMutableSet *v14;
  NSMutableSet *ignoredSceneIdentityTokenStringSet;
  _UIRemoteKeyboardsEventObserver *v16;
  _UIRemoteKeyboardsEventObserver *eventObserver;
  _UIAssertionController *v18;
  _UIAssertionController *assertionController;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_UIRemoteKeyboards;
  v2 = -[_UIRemoteKeyboards init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldFence = 1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    windowControllers = v3->_windowControllers;
    v3->_windowControllers = (NSHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    minimumKeyboardHeights = v3->_minimumKeyboardHeights;
    v3->_minimumKeyboardHeights = (NSMapTable *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activePIDs = v3->_activePIDs;
    v3->_activePIDs = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeCIDs = v3->_activeCIDs;
    v3->_activeCIDs = v10;

    -[_UIRemoteKeyboards checkConnection](v3, "checkConnection");
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingKeyboardGrabs = v3->_pendingKeyboardGrabs;
    v3->_pendingKeyboardGrabs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    ignoredSceneIdentityTokenStringSet = v3->_ignoredSceneIdentityTokenStringSet;
    v3->_ignoredSceneIdentityTokenStringSet = v14;

    v16 = objc_alloc_init(_UIRemoteKeyboardsEventObserver);
    eventObserver = v3->_eventObserver;
    v3->_eventObserver = v16;

    -[_UIRemoteKeyboardsEventObserver setDelegate:](v3->_eventObserver, "setDelegate:", v3);
    v18 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v3);
    assertionController = v3->_assertionController;
    v3->_assertionController = v18;

    if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_sceneDidDisconnect_, CFSTR("UISceneDidDisconnectNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationWillResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationDidSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationDidBecomeActive_, 0x1E1784A60, 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationWillAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationDidRemoveDeactivationReason_, CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationResumedEventsOnly_, CFSTR("UIApplicationResumedEventsOnlyNotification"), UIApp);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationKeyWindowWillChange_, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_applicationKeyWindowDidChange_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_sceneWillEnterForeground_, CFSTR("UISceneWillEnterForegroundNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_sceneDidEnterBackground_, CFSTR("UISceneDidEnterBackgroundNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_sceneDidActivate_, CFSTR("UISceneDidActivateNotification"), 0);
      objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_screenDidDisconnect_, CFSTR("_UIScreenDidDisconnectNotification"), 0);
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
        objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel_willLock_, CFSTR("_UISystemApplicationWillLockNotification"), 0);

    }
  }
  return v3;
}

+ (id)keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(a1, "enabled") & 1) != 0
    && objc_msgSend(a1, "wantsUnassociatedWindowSceneForKeyboardWindow"))
  {
    +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIWindowScene _keyboardWindowSceneForScreen:create:](UIWindowScene, "_keyboardWindowSceneForScreen:create:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (BOOL)wantsUnassociatedWindowSceneForKeyboardWindow
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedRemoteKeyboards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_msgSend(v2, "keyboardWindowClass"), "_isHostedInAnotherProcess") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend((id)UIApp, "isFrontBoard");

  return v3;
}

- (BOOL)hasLocalMinimumKeyboardHeightForScene:(id)a3
{
  id v4;
  NSMapTable *minimumKeyboardHeights;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  minimumKeyboardHeights = self->_minimumKeyboardHeights;
  objc_msgSend(v4, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "_sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSMapTable objectForKey:](minimumKeyboardHeights, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  return v12 > 0.0;
}

- (BOOL)assistantBarVisible
{
  void *v2;
  char v3;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantBarVisible");

  return v3;
}

- (void)completeMoveKeyboardForWindow:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = -[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass");
  objc_msgSend(v4, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class remoteKeyboardWindowForScreen:create:](v5, "remoteKeyboardWindowForScreen:create:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
    {
      objc_msgSend(v4, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputViewSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isInputViewPlaceholder");

      if ((v11 & 1) == 0)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __52___UIRemoteKeyboards_completeMoveKeyboardForWindow___block_invoke;
        v13[3] = &unk_1E16B1B28;
        v13[4] = self;
        objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v13);
      }
    }
  }
  else if (v7)
  {
    if ((objc_msgSend(v7, "_isHostedInAnotherProcess") & 1) == 0)
    {
      v8 = -[_UIRemoteKeyboards needsToShowKeyboardForWindow:](self, "needsToShowKeyboardForWindow:", v7);
      -[_UIRemoteKeyboards setWindowEnabled:](self, "setWindowEnabled:", v8);
      if (!v8)
      {
        if (-[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"))
          objc_msgSend(v7, "invalidate");
      }
    }
  }
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetAnimationFencing");

}

- (BOOL)oldPathForSnapshot
{
  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    return 1;
  if (self->_takingSnapshot)
    return -[_UIRemoteKeyboards sceneIsFullScreen](self, "sceneIsFullScreen");
  return 0;
}

- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:
{
  id v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *log;
  const __CFString *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if ((a3 & 0x100) != 0)
      v6 = objc_msgSend(a1, "currentKeyboard") ^ 1;
    else
      v6 = 1;
    v7 = objc_msgSend(a1, "isUpdatingKeyWindow");
    v8 = v7 ^ 1;
    if ((v7 & 1) == 0 && (a3 & 1) == 0)
      v8 = objc_msgSend(a1, "_sceneFocusUpdatePermittedForWindow:", v5) & v6;
    v9 = qword_1ECD7A318;
    if (!qword_1ECD7A318)
    {
      v9 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7A318);
    }
    v10 = a3 & 0x1000000;
    v11 = a3 & 0x100000000;
    v12 = a3 & 0x10000;
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v34 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316930;
        v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
        v43 = 1024;
        *(_DWORD *)v44 = v8;
        *(_WORD *)&v44[4] = 2048;
        *(_QWORD *)&v44[6] = v5;
        v45 = 1024;
        v46 = a3 & 1;
        v47 = 1024;
        v48 = (unint64_t)(a3 & 0x100) >> 8;
        v49 = 1024;
        v50 = v12 >> 16;
        v51 = 1024;
        v52 = (a3 & 0x1000000) >> 24;
        v53 = 1024;
        v54 = (a3 & 0x100000000uLL) >> 32;
        _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "%s: Update is permitted: %d; for window: %p; forcingUpdate: %d; consideringCurrentKeyboard: %d; updateFocusedS"
          "ceneIdentityStringOrIdentifierIfNil: %d; updateProxyFocusContext: %d; notifyViewServiceHostIfNeeded: %d",
          buf,
          0x3Au);
      }
    }
    if (v8)
    {
      objc_msgSend(v5, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_settingsScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_settingsScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "_FBSScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "identityToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "focusedSceneIdentityStringOrIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (v19 | v12) == 0;
      if (!v5 || v17)
      {
        objc_msgSend(v18, "stringRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = qword_1ECD7A320;
        if (!qword_1ECD7A320)
        {
          v26 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v26, (unint64_t *)&qword_1ECD7A320);
        }
        if ((*(_BYTE *)v26 & 1) != 0)
        {
          log = *(NSObject **)(v26 + 8);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
            v43 = 2112;
            *(_QWORD *)v44 = v25;
            _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "%s: Setting required scene: %@", buf, 0x16u);
          }
        }
        objc_msgSend(a1, "setRequiredScene:", v17);
        if (!v20)
        {
          v27 = qword_1ECD7A328;
          if (!qword_1ECD7A328)
          {
            v27 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v27, (unint64_t *)&qword_1ECD7A328);
          }
          if ((*(_BYTE *)v27 & 1) != 0)
          {
            v35 = *(NSObject **)(v27 + 8);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
              v43 = 2112;
              *(_QWORD *)v44 = v25;
              _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "%s: Focusing scene identity: %@", buf, 0x16u);
            }
          }
          objc_msgSend(a1, "setFocusedSceneIdentityStringOrIdentifier:", v25);
        }
        if (v10)
        {
          +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v18, v5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = qword_1ECD7A330;
          if (!qword_1ECD7A330)
          {
            v29 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v29, (unint64_t *)&qword_1ECD7A330);
          }
          if ((*(_BYTE *)v29 & 1) != 0)
          {
            v36 = *(NSObject **)(v29 + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
              v43 = 2112;
              *(_QWORD *)v44 = v28;
              _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "%s: Updating proxy context: %@", buf, 0x16u);
            }
          }
          objc_msgSend(a1, "proxy");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setClientFocusContext:", v28);

        }
      }
      else
      {
        if (v14)
          v21 = (v19 | v12) == 0;
        else
          v21 = 1;
        if (v21)
        {
LABEL_39:
          if (v11
            && (objc_msgSend(v5, "_isTextEffectsWindow") & 1) == 0
            && (objc_msgSend(v5, "_isRemoteKeyboardWindow") & 1) == 0)
          {
            v39 = CFSTR("_UIRemoteKeyboardsHostedWindowUserInfoKey");
            v40 = v5;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0, v32);

          }
          goto LABEL_44;
        }
        objc_msgSend(v14, "_FBSScene");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "identityToken");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v14, "_sceneIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v31 = qword_1ECD7A338;
        if (!qword_1ECD7A338)
        {
          v31 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v31, (unint64_t *)&qword_1ECD7A338);
        }
        if ((*(_BYTE *)v31 & 1) != 0)
        {
          v37 = *(NSObject **)(v31 + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
            v43 = 2112;
            *(_QWORD *)v44 = v25;
            _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "%s: Focusing scene identifier: %@", buf, 0x16u);
          }
        }
        objc_msgSend(a1, "setFocusedSceneIdentityStringOrIdentifier:", v25);
      }

      goto LABEL_39;
    }
  }
LABEL_44:

}

- (BOOL)_sceneFocusUpdatePermittedForWindow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  char isKindOfClass;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  _BOOL4 v28;
  int v29;
  id v30;
  char v31;
  char v32;

  v4 = a3;
  if (v4
    && objc_msgSend((id)UIApp, "_systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:", v4)
    && -[_UIRemoteKeyboards _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication"))
  {
    objc_msgSend(v4, "windowScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    if (self)
    {
      v8 = v5;
      if (!v5)
      {
LABEL_20:

LABEL_21:
        goto LABEL_17;
      }
      if (-[_UIRemoteKeyboards _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication"))
      {
        objc_msgSend(v6, "_keyboardClientComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "suppressKeyboardFocusRequests") & 1) != 0)
        {
LABEL_14:
          v7 = 0;
          v8 = v6;
LABEL_15:

          goto LABEL_20;
        }
        +[UIWindowScene _keyWindowScene]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v6)
        {

        }
        else
        {
          objc_msgSend(v6, "screen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)(objc_msgSend(v11, "_userInterfaceIdiom") - 2) <= 2)
          {
LABEL_13:

            goto LABEL_14;
          }
          +[_UIRemoteKeyboards keyboardWindowSceneForScreen:create:](_UIRemoteKeyboards, "keyboardWindowSceneForScreen:create:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "session");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "role");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

          v16 = objc_msgSend(v6, "activationState");
          v17 = objc_msgSend(v6, "activationState");
          if (v12 && v12 == v6)
          {

            goto LABEL_13;
          }
          v27 = v16 == 1 || v17 == 0;

          v7 = 0;
          if ((v15 & 1) != 0 || !v27)
            goto LABEL_21;
        }
        if ((objc_msgSend(v4, "_isTextEffectsWindow") & 1) != 0
          || (objc_msgSend(v4, "_isRemoteKeyboardWindow") & 1) != 0
          || (objc_msgSend(v4, "windowScene"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "_FBSScene"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20)
          || !objc_msgSend(v4, "_isHostedInAnotherProcess"))
        {
          isKindOfClass = 0;
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }
        v22 = objc_msgSend(v4, "_canUpdateSceneFocus");
        if ((isKindOfClass & 1) == 0 && !v22 || !objc_msgSend(v4, "_appearsInLoupe"))
        {
          v7 = 0;
          goto LABEL_21;
        }
        -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_FBSScene");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "identityToken");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringRepresentation");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v6, "_sceneIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v28 = -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible");
        if (v8)
          v29 = BSEqualStrings() ^ 1;
        else
          LOBYTE(v29) = 1;
        +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
        v30 = (id)objc_claimAutoreleasedReturnValue();

        if ((isKindOfClass & 1) != 0)
        {
          v31 = BSEqualStrings();
          if (v30 == v4)
            v32 = 0;
          else
            v32 = v31;
        }
        else
        {
          v32 = 0;
        }
        if (v28)
          v7 = v29 | v32;
        else
          v7 = 1;
        goto LABEL_15;
      }
      v7 = 0;
    }
    v8 = v6;
    goto LABEL_20;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (void)peekApplicationEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  unint64_t v21;
  _BOOL4 v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[10];
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    -[_UIRemoteKeyboardsEventObserver peekApplicationEvent:](self->_eventObserver, "peekApplicationEvent:", v4);
    v5 = -[_UIRemoteKeyboards _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication");
    objc_msgSend(v4, "allTouches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && !objc_msgSend(v7, "phase"))
    {
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_isRemoteKeyboardWindow");

      if ((v10 & 1) != 0)
        objc_msgSend(v7, "window");
      else
        objc_msgSend(v8, "_responderWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_FBSScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "identityToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "_sceneIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v17 = -[_UIRemoteKeyboards _sceneFocusUpdatePermittedForWindow:](self, "_sceneFocusUpdatePermittedForWindow:", v11);
      v18 = objc_msgSend(v8, "_wantsTargetOfKeyboardEventDeferringEnvironment");
      if ((v10 & 1) == 0)
      {
        v19 = objc_msgSend(v7, "type") == 2;
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "cancelDictationForResponderIfNeeded:wantsKeyboard:isPencil:", v8, v18, v19);

      }
      +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_578);
      v21 = qword_1ECD7A350;
      if (!qword_1ECD7A350)
      {
        v21 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7A350);
      }
      if ((*(_BYTE *)v21 & 1) != 0)
      {
        v33 = *(NSObject **)(v21 + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[_UIRemoteKeyboards peekApplicationEvent:]";
          v38 = 1024;
          v39 = v17;
          v40 = 2112;
          *(_QWORD *)v41 = v16;
          _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "%s: Update permitted: %d; for scene identity or identifier: %@",
            buf,
            0x1Cu);
        }
      }
      if (v17)
      {
        v35 = v16;
        v22 = -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible");
        v23 = objc_msgSend(v7, "_isPointerTouch");
        v24 = qword_1ECD7A358;
        if (!qword_1ECD7A358)
        {
          v24 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v24, (unint64_t *)&qword_1ECD7A358);
        }
        if ((*(_BYTE *)v24 & 1) != 0)
        {
          v34 = *(NSObject **)(v24 + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v37 = "-[_UIRemoteKeyboards peekApplicationEvent:]";
            v38 = 1024;
            v39 = !v22 | v23 | v18;
            v40 = 1024;
            *(_DWORD *)v41 = v22;
            *(_WORD *)&v41[4] = 1024;
            *(_DWORD *)&v41[6] = v18;
            v42 = 1024;
            v43 = v23;
            v44 = 2112;
            v45 = v16;
            _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "%s: Request scene focus: %d; keyboardOnScreen: %d; wantsKeyboard: %d; touchIsPointer: %d; for scene identi"
              "ty or identifier: %@",
              buf,
              0x2Eu);
          }
        }
        if (!v22 | v23 | v18)
        {
          v25 = 0x100010001;
          if ((_DWORD)v18 && !objc_msgSend(v8, "isFirstResponder"))
            v25 = 65537;
          -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v11, v25);
          -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "identityToken");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard") | v18) ^ 1;
          -[_UIRemoteKeyboards proxy](self, "proxy");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = getpid();
          +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v27, v11);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "focusApplicationWithProcessIdentifier:context:stealingKeyboard:onCompletion:", v30, v31, v28, &__block_literal_global_581);

          if ((objc_msgSend(v11, "_isApplicationKeyWindow") & 1) == 0)
          {
            -[_UIRemoteKeyboards setUpdatingKeyWindow:](self, "setUpdatingKeyWindow:", 1);
            objc_msgSend(v11, "makeKeyWindow");
            -[_UIRemoteKeyboards setUpdatingKeyWindow:](self, "setUpdatingKeyWindow:", 0);
          }
        }
        else
        {
          objc_msgSend(v11, "windowScene");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "keyboardSceneDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setKeyWindowCandidate:", v11);
        }
        v16 = v35;

      }
    }

  }
}

- (BOOL)allowedToShowKeyboard
{
  int v3;
  void *v4;
  char v5;

  if (objc_msgSend((id)UIApp, "isSuspendedEventsOnly"))
    v3 = objc_msgSend((id)UIApp, "isSuspendedUnderLock") ^ 1;
  else
    v3 = 0;
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isHostedInAnotherProcess") & 1) != 0
    || ((objc_msgSend((id)UIApp, "isSuspended") ^ 1 | v3) & 1) != 0
    || +[UIKeyboardImpl isActivatingForeground](UIKeyboardImpl, "isActivatingForeground"))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend((id)UIApp, "_isSpringBoard");
  }

  return v5;
}

- (BOOL)_sceneFocusPermittedForApplication
{
  int v3;

  v3 = objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter");
  if (v3)
    LOBYTE(v3) = -[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard");
  return v3;
}

- (BOOL)isUpdatingKeyWindow
{
  return self->_updatingKeyWindow;
}

- (NSString)focusedSceneIdentityStringOrIdentifier
{
  return self->_focusedSceneIdentityStringOrIdentifier;
}

- (void)setRequiredScene:(id)a3
{
  objc_storeStrong((id *)&self->_requiredScene, a3);
}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIRemoteKeyboards clearKeyboardSceneIdentifierEnteringForeground:](self, "clearKeyboardSceneIdentifierEnteringForeground:");
  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
  {
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

    if (v5)
    {
      objc_msgSend(v9, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v8)
        -[_UIRemoteKeyboards applicationDidBecomeActive:](self, "applicationDidBecomeActive:", 0);

    }
  }

}

- (BOOL)handlingRemoteEvent
{
  return self->_handlingRemoteEvent;
}

- (BOOL)snapshotting
{
  return self->_takingSnapshot;
}

- (double)intersectionHeightForWindowScene:(id)a3
{
  double result;

  -[_UIRemoteKeyboards intersectionHeightForWindowScene:isLocalMinimumHeightOut:ignoreHorizontalOffset:](self, "intersectionHeightForWindowScene:isLocalMinimumHeightOut:ignoreHorizontalOffset:", a3, 0, 0);
  return result;
}

+ (id)createArbiterConnection
{
  int v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "useSystemService");
  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v4 = v3;
  if (v2)
  {
    +[_UIRemoteKeyboards serviceName](_UIRemoteKeyboards, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "initWithServiceName:", CFSTR("com.apple.UIKit.KeyboardManagement"));
  }
  _UIKeyboardArbitration_Interface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  _UIKeyboardArbitrationClient_Interface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v8);

  return v6;
}

+ (BOOL)useSystemService
{
  BOOL result;

  result = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIRemoteKeyboardsUseSystemService, (uint64_t)CFSTR("_UIRemoteKeyboardsUseSystemService"));
  if (byte_1ECD766DC)
    return 1;
  return result;
}

+ (id)serviceName
{
  if (qword_1ECD7A2F8 != -1)
    dispatch_once(&qword_1ECD7A2F8, &__block_literal_global_370_0);
  return (id)qword_1ECD7A2F0;
}

- (void)applicationDidBecomeActive:(id)a3
{
  -[_UIRemoteKeyboards applicationDidBecomeActive:forceSignalToProxy:](self, "applicationDidBecomeActive:forceSignalToProxy:", a3, 0);
}

- (void)applicationKeyWindowDidChange:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = 16777472;
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("Reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "unsignedIntegerValue") == 1)
    v4 = 0;
  v9 = applicationKeyWindowDidChange____s_category;
  if (!applicationKeyWindowDidChange____s_category)
  {
    v9 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&applicationKeyWindowDidChange____s_category);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      _UIRemoteKeyboardsFBSSceneIdentityStringFromSettingsSceneOfWindow(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "-[_UIRemoteKeyboards applicationKeyWindowDidChange:]";
      v15 = 2048;
      v16 = v6;
      v17 = 2112;
      v18 = v12;
      v19 = 2048;
      v20 = objc_msgSend(v8, "unsignedIntegerValue");
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "%s: Application key window changed to window: %p; scene identity: %@; for reason: %lu",
        (uint8_t *)&v13,
        0x2Au);

    }
  }
  -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v6, v4);
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_516);

}

- (BOOL)wantsToShowKeyboardForWindow:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
  {
    v5 = 1;
  }
  else
  {
    -[_UIRemoteKeyboards viewHostForWindow:](self, "viewHostForWindow:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v6, "hasHostedViews") & 1) != 0
      || self->_keyboardSnapshot
      || -[_UIRemoteKeyboards isOnScreenRotating](self, "isOnScreenRotating");

  }
  return v5;
}

- (id)viewHostForWindow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDFA6868);

  if (v6)
  {
    objc_msgSend(v3, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isOnScreenRotating
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40___UIRemoteKeyboards_isOnScreenRotating__block_invoke;
  v4[3] = &unk_1E16C4060;
  v4[4] = &v5;
  -[_UIRemoteKeyboards performOnControllers:](self, "performOnControllers:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)startConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 shouldFence;
  _BOOL8 expectedSuppression;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id location[2];

  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    -[_UIRemoteKeyboards connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter"))
      {
        -[_UIRemoteKeyboards resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "userInterfaceIdiom");

        if ((unint64_t)(v5 - 2) >= 3)
        {
          objc_msgSend((id)objc_opt_class(), "createArbiterConnection");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&self->_connection, v6);
          v7 = (void *)BSDispatchQueueCreateWithQualityOfService();
          objc_msgSend(v6, "_setQueue:", v7);
          objc_initWeak(location, v6);
          v8 = MEMORY[0x1E0C809B0];
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v9 = &unk_1E16B1500;
          v23[2] = __37___UIRemoteKeyboards_startConnection__block_invoke;
          v23[3] = &unk_1E16B1500;
          objc_copyWeak(&v24, location);
          v23[4] = self;
          objc_msgSend(v6, "setInterruptionHandler:", v23);
          v21[0] = v8;
          v21[1] = 3221225472;
          v21[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_2;
          v21[3] = &unk_1E16B1500;
          objc_copyWeak(&v22, location);
          v21[4] = self;
          objc_msgSend(v6, "setInvalidationHandler:", v21);
          objc_msgSend(v6, "setExportedObject:", self);
          if (v6)
          {
            objc_msgSend(v6, "resume");
            v19 = v7;
            self->_expectingInitialState = 1;
            self->_remoteIAVHeight = 0.0;
            -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIRemoteKeyboards proxy](self, "proxy");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard");
            if (v12)
            {
              -[_UIRemoteKeyboards currentState](self, "currentState");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = 0;
            }
            if (v10)
            {
              objc_msgSend(v10, "identityToken");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v18, v9);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }
            -[_UIRemoteKeyboards currentHostedPIDs](self, "currentHostedPIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            shouldFence = self->_shouldFence;
            expectedSuppression = self->_expectedSuppression;
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_3;
            v20[3] = &unk_1E16D7868;
            v20[4] = self;
            objc_msgSend(v11, "startArbitrationWithExpectedState:focusContext:hostingPIDs:usingFence:withSuppression:onConnected:", v13, v14, v15, shouldFence, expectedSuppression, v20);

            if (v10)
            {

            }
            if (v12)

            v7 = v19;
          }
          objc_destroyWeak(&v22);
          objc_destroyWeak(&v24);
          objc_destroyWeak(location);

        }
      }
    }
  }
}

- (void)resetSnapshotWithWindowCheck:(BOOL)a3
{
  UIView *keyboardSnapshot;
  _BOOL4 v5;
  UIView *v6;

  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    v5 = a3;
    -[UIView removeFromSuperview](keyboardSnapshot, "removeFromSuperview");
    v6 = self->_keyboardSnapshot;
    self->_keyboardSnapshot = 0;

    if (v5)
      -[_UIRemoteKeyboards completeMoveKeyboardForWindow:](self, "completeMoveKeyboardForWindow:", 0);
  }
}

- (FBSScene)requiredScene
{
  FBSScene *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = self->_requiredScene;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    objc_msgSend(v3, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_FBSScene");
    v2 = (FBSScene *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(v4, "responder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_responderWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_settingsScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_FBSScene");
      v2 = (FBSScene *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v2;
}

- (BOOL)didHandleKeyboardChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  int v22;
  NSMutableSet *ignoredSceneIdentityTokenStringSet;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  _BOOL4 v40;
  int v41;
  int v42;
  int v43;
  int v44;
  _UNKNOWN **v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  char v55;
  void *v57;
  id v58;
  BOOL handlingRemoteEvent;
  _BOOL4 v60;
  int v61;
  _BOOL4 v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _UIRemoteKeyboards *v69;
  uint64_t *v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  char v74;
  char v75;
  _QWORD v76[4];
  id v77;
  id v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_handlingRemoteEvent = !v5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_handlingRemoteEvent)
  {
    if ((objc_msgSend(v9, "isMinimized") & 1) != 0
      || (v11 = objc_msgSend(v10, "automaticMinimizationEnabled"),
          v11 != objc_msgSend(v8, "automaticMinimizationEnabled")))
    {
      objc_msgSend(v10, "setAutomaticMinimizationEnabled:", objc_msgSend(v8, "automaticMinimizationEnabled"));
      objc_msgSend(v10, "geometryDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "syncMinimizedStateToHardwareKeyboardAttachedState");

    }
  }
  v62 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard", v10);
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke;
  v76[3] = &unk_1E16D7890;
  v58 = v13;
  v77 = v58;
  v14 = v8;
  v78 = v14;
  v79 = &v80;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v76);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hardwareKeyboardExclusivityIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sourceBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v6;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.Spotlight")))
    v18 = (v16 == 0) ^ objc_msgSend(v14, "isOneness");
  else
    v18 = 0;

  objc_msgSend(v14, "sourceBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

  objc_msgSend(v14, "sourceBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.siri"));

  ignoredSceneIdentityTokenStringSet = self->_ignoredSceneIdentityTokenStringSet;
  objc_msgSend(v14, "sourceSceneIdentityString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[NSMutableSet containsObject:](ignoredSceneIdentityTokenStringSet, "containsObject:", v24);

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "uiPosition");
  if (v26 != objc_msgSend(v14, "uiPosition"))
  {
    v27 = objc_msgSend((id)UIApp, "_isSpringBoard");

    if (!v27)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "uiPosition"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:", CFSTR("UIKeyboardDidChangeUIPosition"), v28);

  }
LABEL_12:
  if (!*((_BYTE *)v81 + 24))
  {
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sourceBundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _UIMainBundleIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqualToString:", v31);

    if (v32)
    {
      -[_UIRemoteKeyboards currentState](self, "currentState");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIRemoteKeyboards setBackupState:](self, "setBackupState:", v33);

    }
    -[_UIRemoteKeyboards updateCurrentState:](self, "updateCurrentState:", v14);
  }
  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
  {
    if (*((_BYTE *)v81 + 24))
      v34 = 1;
    else
      v34 = v18;
    v35 = v34 | v20;
  }
  else
  {
    v35 = 0;
  }
  -[_UIRemoteKeyboards setCurrentKeyboard:](self, "setCurrentKeyboard:", v35);
  -[_UIRemoteKeyboardsEventObserver setKeyboardIsVisible:](self->_eventObserver, "setKeyboardIsVisible:", -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible"));
  if (v5)
  {
    if (-[_UIRemoteKeyboards localSceneCount](self, "localSceneCount") >= 2)
    {
      objc_msgSend(v14, "sourceSceneIdentityString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v36 == 0;

    }
    else
    {
      v5 = 1;
    }
  }
  if (v62
    && v60
    && (-[_UIRemoteKeyboards currentState](self, "currentState"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = objc_msgSend(v37, "keyboardOnScreen"),
        v37,
        v38))
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2;
    v73[3] = &unk_1E16B70C0;
    v73[4] = self;
    v74 = v22;
    v75 = v18;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v73);
  }
  else if (self->_keyboardSnapshot)
  {
    -[_UIRemoteKeyboards resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
  }
  v39 = -[_UIRemoteKeyboards isShowingPasswordAutofillPanel:](self, "isShowingPasswordAutofillPanel:", v14);
  v40 = v39;
  if (!v62 || (*((_BYTE *)v81 + 24) ? (v41 = 1) : (v41 = v18), ((v41 | v20 | v22 | v61 | v39) & 1) != 0))
  {
    self->_updatingHeight = 1;
    -[_UIRemoteKeyboards performOnControllers:](self, "performOnControllers:", &__block_literal_global_399_0);
    if (v18)
    {
      v42 = objc_msgSend((id)UIApp, "_isSpringBoard") ^ 1;
      if (!v20)
        goto LABEL_38;
    }
    else
    {
      v42 = 0;
      if (!v20)
      {
LABEL_38:
        v43 = 0;
        if (v22)
        {
LABEL_39:
          v44 = objc_msgSend((id)UIApp, "_isSpringBoard") ^ 1;
LABEL_43:
          if (((v5 | v42 | v43 | v44 | v40 | v61) & 1) == 0)
          {
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7;
            v67[3] = &unk_1E16D7890;
            v68 = v14;
            v69 = self;
            v70 = &v84;
            +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v67);

          }
          -[_UIRemoteKeyboards performOnControllers:](self, "performOnControllers:", &__block_literal_global_400_0);
          self->_updatingHeight = 0;
          v45 = &off_1E167A000;
          goto LABEL_53;
        }
LABEL_42:
        v44 = 0;
        goto LABEL_43;
      }
    }
    v43 = objc_msgSend((id)UIApp, "_isSpringBoard") ^ 1;
    if (v22)
      goto LABEL_39;
    goto LABEL_42;
  }
  if (!v5)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4;
    v71[3] = &unk_1E16B1B28;
    v72 = v14;
    objc_msgSend(v46, "performWithoutDeactivation:", v71);

  }
  v45 = &off_1E167A000;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "responder");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v48, "_isHostingRemoteContent") & 1) == 0)
  {
    objc_msgSend(v48, "_responderWindow");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_setLastFirstResponder:", v48);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v48, "interactionState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_setLastFirstResponderInteractionState:", v50);

    }
    objc_msgSend(v49, "_setWantsResponderWithoutKeyboard:", 1);
    objc_msgSend(v48, "resignFirstResponder");
    objc_msgSend(v49, "_setWantsResponderWithoutKeyboard:", 0);
    objc_msgSend(v49, "_firstResponder");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_setLastNextResponder:", v51);

  }
  *((_BYTE *)v85 + 24) = 1;

LABEL_53:
  v52 = v45[483];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_10;
  v65[3] = &unk_1E16C1E50;
  v53 = v58;
  v66 = v53;
  objc_msgSend(v52, "performOnControllers:", v65);
  if ((objc_msgSend(v14, "isLocal") & 1) == 0)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_11;
    v63[3] = &unk_1E16C1E50;
    v64 = v14;
    +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v63);

  }
  if (!*((_BYTE *)v81 + 24))
  {
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "resetAnimationFencing");

  }
  self->_handlingRemoteEvent = handlingRemoteEvent;
  v55 = *((_BYTE *)v85 + 24);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  return v55;
}

- (void)performOnControllers:(id)a3
{
  void (**v4)(id, void *);
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
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[NSHashTable copy](self->_windowControllers, "copy");
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v5, "containsObject:", v7))
    v4[2](v4, v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
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
        if (*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12) != v7)
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)applicationWillAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 2:
      self->_deactivatedByControlCenter = 1;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hadFocusBeforeOverlay = v7 != 0;

      break;
    case 13:
      self->_deactivatedBySystemAlert = 1;
      break;
    default:
      break;
  }
  if (!-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
  {
    if (!-[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible"))
      return;
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIMainBundleIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {

      goto LABEL_13;
    }

  }
  if (v6 == 12)
  {
    -[_UIRemoteKeyboards proxy](self, "proxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeactivating:", 1);
LABEL_13:

  }
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  BOOL v7;

  v3 = a3;
  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard") && !v3
    || !-[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible"))
  {
    return 0;
  }
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardPosition");
  v7 = v6 != 0.0;

  return v7;
}

- (BOOL)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)applicationDidRemoveDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 2:
      self->_deactivatedByControlCenter = 0;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      if (self->_hadFocusBeforeOverlay)
      {
        -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[_UIRemoteKeyboards proxy](self, "proxy");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "applicationShouldFocusWithBundle:onCompletion:", 0, &__block_literal_global_585);

        }
      }
      self->_hadFocusBeforeOverlay = 0;
      if (v6 == 12)
        goto LABEL_6;
      break;
    case 12:
LABEL_6:
      -[_UIRemoteKeyboards proxy](self, "proxy");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeactivating:", 0);

      break;
    case 13:
      self->_deactivatedBySystemAlert = 0;
      break;
    default:
      return;
  }
}

- (double)heightForRemoteIAVPlaceholderIfNecessary
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  if (!-[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible"))
    return self->_remoteIAVHeight;
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardPositionWithIAV");
  v5 = v4;
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardPosition");
  v8 = v5 - v7;

  return v8;
}

- (CGRect)keyboardFrameIncludingRemoteIAV
{
  void *v2;
  double v3;
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
  CGRect result;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardPositionWithRemoteIAV");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateCurrentState:(id)a3
{
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
  id v16;

  v16 = a3;
  objc_msgSend(v16, "keyboardPosition");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v16, "keyboardPositionWithIAV");
  if (!-[_UIRemoteKeyboards currentStateHasEqualRect:andIAVPosition:](self, "currentStateHasEqualRect:andIAVPosition:", v5, v7, v9, v11, v12, v13, v14, v15))-[_UIRemoteKeyboards setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 0);
  -[_UIRemoteKeyboards setCurrentState:](self, "setCurrentState:", v16);

}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)currentStateHasEqualRect:(CGRect)a3 andIAVPosition:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyboardPosition");
  v27.origin.x = v14;
  v27.origin.y = v15;
  v27.size.width = v16;
  v27.size.height = v17;
  v25.origin.x = v11;
  v25.origin.y = v10;
  v25.size.width = v9;
  v25.size.height = v8;
  if (CGRectEqualToRect(v25, v27))
  {
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyboardPositionWithIAV");
    v28.origin.x = v19;
    v28.origin.y = v20;
    v28.size.width = v21;
    v28.size.height = v22;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v23 = CGRectEqualToRect(v26, v28);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)setCurrentKeyboard:(BOOL)a3
{
  self->_currentKeyboard = a3;
}

- (NSArray)currentHostedPIDs
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_activePIDs);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)reloadForSnapshotting
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_506);
}

- (void)clearKeyboardSceneIdentifierEnteringForeground:(id)a3
{
  void *v4;
  NSString *keyboardSceneIdentifierEnteringForeground;
  void *v6;
  NSString *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  v8 = v4;
  objc_msgSend(v4, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(keyboardSceneIdentifierEnteringForeground) = -[NSString isEqualToString:](keyboardSceneIdentifierEnteringForeground, "isEqualToString:", v6);

  if ((_DWORD)keyboardSceneIdentifierEnteringForeground)
  {
    v7 = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = 0;

  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *keyboardSceneIdentifierEnteringForeground;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9 == v5)
  {
    objc_msgSend(v9, "_sceneIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = v7;

    v6 = v9;
  }

}

- (void)controllerDidLayoutSubviews:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_ignoreLayoutSubviews <= 0)
  {
    v6 = v4;
    v5 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard");
    v4 = v6;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50___UIRemoteKeyboards_controllerDidLayoutSubviews___block_invoke;
      v7[3] = &unk_1E16B1B50;
      v7[4] = self;
      v8 = v6;
      -[_UIRemoteKeyboards ignoreLayoutNotifications:](self, "ignoreLayoutNotifications:", v7);

      v4 = v6;
    }
  }

}

- (void)ignoreLayoutNotifications:(id)a3
{
  ++self->_ignoreLayoutSubviews;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_ignoreLayoutSubviews;
}

- (void)registerController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EDFA9398) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Object does not implement expected protocol: %@"), v4);
  -[NSHashTable addObject:](self->_windowControllers, "addObject:", v4);
  objc_msgSend(v4, "setControllerDelegate:", self);

}

- (BOOL)isFloating
{
  void *v2;
  char v3;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFloating");

  return v3;
}

- (double)intersectionHeightForWindowScene:(id)a3 isLocalMinimumHeightOut:(BOOL *)a4 ignoreHorizontalOffset:(BOOL)a5
{
  _UNKNOWN **v5;
  void *v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char v33;
  void *v34;
  int v35;
  id *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
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
  double v56;
  double v57;
  _UIRemoteKeyboards *v58;
  void *v59;
  BOOL v60;
  void *v61;
  char v62;
  BOOL v63;
  void *v64;
  double v65;
  double v66;
  NSMapTable *minimumKeyboardHeights;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v84;
  _BOOL4 v85;
  CGFloat v86;
  void *v87;
  CGFloat v88;
  void *v89;
  CGFloat v90;
  char v91;
  CGFloat v92;
  _UIRemoteKeyboards *v93;
  BOOL *v94;
  BOOL *v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v7 = a5;
  v10 = a3;
  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    v5 = &off_1E167A000;
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyboardArbiterClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentClientState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      v94 = a4;
      v14 = v7;
      objc_msgSend(v12, "currentUIState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _UIMainBundleIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
      {

        v7 = v14;
LABEL_11:

        a4 = v94;
        goto LABEL_12;
      }
      v17 = objc_msgSend(v12, "keyboardVisible");

      v7 = v14;
      a4 = v94;
      if (v17)
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "responder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "inputView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          || (objc_msgSend(v6, "inputViewController"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "view"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v7 = v14,
              v15))
        {
          objc_msgSend(v15, "frame");
          if (v20 == 0.0)
          {

            height = 0.0;
LABEL_74:

LABEL_75:
            v32 = height;
            goto LABEL_76;
          }
        }
        goto LABEL_11;
      }
    }
LABEL_12:
    objc_msgSend(v12, "currentUIState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "keyboardPosition");
    v23 = v29;
    v25 = v30;
    v27 = v31;

    goto LABEL_13;
  }
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyboardPosition");
  v23 = v22;
  v25 = v24;
  v27 = v26;
LABEL_13:
  v32 = 0.0;
  if (v13 && (objc_msgSend(v13, "avoidIntersectability") & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.Spotlight")) & 1) != 0
      || (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      v95 = a4;
      v85 = v7;
      v33 = 0;
    }
    else
    {
      objc_msgSend(v13, "sourceBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      height = 0.0;
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight")) & 1) != 0)
        goto LABEL_74;
      v95 = a4;
      v85 = v7;
      v33 = 1;
    }
    _UIMainBundleIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")) & 1) != 0
      || (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend(v13, "sourceBundleIdentifier");
      v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")) & 1) != 0)
      {

        height = 0.0;
        if ((v33 & 1) == 0)
          goto LABEL_75;
        goto LABEL_74;
      }
      v35 = 1;
    }
    v93 = self;
    if (!v10 || +[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      if ((v35 & 1) != 0)

      if ((v33 & 1) != 0)
LABEL_28:
      +[UIWindowScene _keyWindowScene]();
      v36 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _keyWindow](v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37 && (objc_msgSend(v37, "_isHostedInAnotherProcess") & 1) == 0)
      {
        +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v10);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:", v10);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v38;
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "visualModeManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "windowingModeEnabled");

      if (v45 && (objc_msgSend(v12, "hostedViewReference"), !CGRectIsEmpty(v96)))
        objc_msgSend(v12, "hostedViewReference");
      else
        objc_msgSend(v12, "actualSceneFrame");
      v90 = v47;
      v92 = v46;
      v86 = v49;
      v88 = v48;
      objc_msgSend(v12, "_sceneBounds");
      v51 = v50;
      v53 = v52;
      +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
      v55 = v54;
      v84 = v56;
      v57 = v53;
      v58 = v93;
      if (objc_msgSend(v12, "interfaceOrientation"))
      {
        -[_UIRemoteKeyboards keyboardWindow](v93, "keyboardWindow");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v59, "interfaceOrientation"))
        {
          v60 = (unint64_t)(objc_msgSend(v12, "interfaceOrientation") - 3) < 2;
          -[_UIRemoteKeyboards keyboardWindow](v93, "keyboardWindow");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v60 ^ ((unint64_t)(objc_msgSend(v61, "interfaceOrientation") - 3) < 2);

          v63 = (v62 & 1) == 0;
          v58 = v93;
          if (v63)
            v57 = v53;
          else
            v57 = v51;
        }
        else
        {

          v57 = v53;
        }
      }
      if (objc_msgSend(v12, "_shouldResizeWithScene"))
      {
        objc_msgSend(v12, "screen");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bounds");
        v51 = v65;
        v53 = v66;

        v57 = v53;
      }
      minimumKeyboardHeights = v58->_minimumKeyboardHeights;
      objc_msgSend(v10, "_FBSScene");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v68)
      {
        objc_msgSend(v68, "identityToken");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "stringRepresentation");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v10, "_sceneIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[NSMapTable objectForKey:](minimumKeyboardHeights, "objectForKey:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "doubleValue");
      v74 = v73;

      v6 = v37;
      if (v74 > 0.0)
      {
        v97.origin.y = v90;
        v97.origin.x = v92;
        v97.size.height = v86;
        v97.size.width = v88;
        v75 = v74 + v57 - CGRectGetMaxY(v97);
        if (v95)
          *v95 = v75 > v27;
        if (v27 < v75)
          v27 = v75;
        v25 = v51;
      }
      v76 = v57 - v27;
      if (v85)
        v25 = v51;
      if (v76 != 0.0
        && v84 != 0.0
        && !-[_UIRemoteKeyboards wantsAssistantWhileSuppressingKeyboard](v58, "wantsAssistantWhileSuppressingKeyboard"))
      {
        if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
        {
          +[UIKeyboardImpl floatingPersistentOffset](UIKeyboardImpl, "floatingPersistentOffset");
          +[UIInputViewSetPlacementFloating frameAtOffset:keyboardSize:screenSize:](UIInputViewSetPlacementFloating, "frameAtOffset:keyboardSize:screenSize:");
          v23 = v77;
          v76 = v78;
          v25 = v79;
          v27 = v80;
        }
        else
        {
          +[UIInputViewSetPlacementUndocked computeOffsetForOffset:withSize:chromeBuffer:onScreenSize:](UIInputViewSetPlacementUndocked, "computeOffsetForOffset:withSize:chromeBuffer:onScreenSize:", v55, v84, v51, v27, 92.0, 0.0, 0.0, 0.0, *(_QWORD *)&v51, *(_QWORD *)&v53);
          v23 = v23 + v81;
          v76 = v76 - v82;
        }
      }
      v98.origin.x = v23;
      v98.origin.y = v76;
      v98.size.width = v25;
      v98.size.height = v27;
      v100.origin.y = v90;
      v100.origin.x = v92;
      v100.size.height = v86;
      v100.size.width = v88;
      v99 = CGRectIntersection(v98, v100);
      height = v99.size.height;
      goto LABEL_74;
    }
    v87 = v6;
    v89 = v5;
    objc_msgSend(v13, "sourceDisplayIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "displayConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_nameForDisplayType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v39, "isEqual:", v42);

    if (v35)
    if ((v33 & 1) != 0)

    if ((v91 & 1) != 0)
      goto LABEL_28;
  }
LABEL_76:

  return v32;
}

- (BOOL)remoteKeyboardUndocked
{
  return -[_UIRemoteKeyboards remoteKeyboardUndocked:](self, "remoteKeyboardUndocked:", 0);
}

- (void)applicationResumedEventsOnly:(id)a3
{
  if (!self->_windowEnabled)
    -[_UIRemoteKeyboards applicationWillResume:](self, "applicationWillResume:", a3);
}

- (void)checkConnection
{
  void *v3;
  void *v4;
  int v5;

  -[_UIRemoteKeyboards connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard")
         || (-[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v5 = objc_msgSend(v4, "_isHostedInAnotherProcess"),
             v4,
             v5))
  {
    -[_UIRemoteKeyboards startConnection](self, "startConnection");
  }
}

- (_UIKeyboardArbitration)proxy
{
  void *v2;
  void *v3;

  -[_UIRemoteKeyboards connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_365);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyboardArbitration *)v3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 232, 1);
}

- (void)prepareToMoveKeyboard:(CGRect)a3 withIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  UIScreen *v24;
  UIScreen *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  _BOOL4 v43;
  _BOOL4 v44;
  UIScreen *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BOOL8 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  _BOOL4 v92;
  _BOOL4 v93;
  _BOOL4 v94;
  uint64_t v95;
  void *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  _BOOL4 v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  int v117;
  char v118;
  double v119;
  int v120;
  double v121;
  _BOOL4 v122;
  int v123;
  void *v124;
  void *context;
  UIScreen *v126;
  _QWORD v127[5];
  id v128;
  uint8_t buf[4];
  _BYTE v130[10];
  void *v131;
  _BOOL4 v132;
  __int16 v133;
  _BOOL4 v134;
  __int16 v135;
  uint64_t v136;
  uint64_t v137;
  CGRect v138;
  CGRect v139;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v137 = *MEMORY[0x1E0C80C00];
  v20 = a8;
  KeyboardArbiterClientLog_1();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v130 = v22;
    *(_WORD *)&v130[8] = 2112;
    v131 = v23;
    _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboards prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:]  inputDestDidChange: %@; shouldNotify: %@",
      buf,
      0x16u);

  }
  context = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(v20, "screen");
  v24 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = 0;
  if (self->_enableMultiscreenHack && v9)
  {
    v26 = self->_lastScreen != v24;
    -[_UIRemoteKeyboards updateLastScreen:](self, "updateLastScreen:", v24);
  }
  v126 = v25;
  -[_UIRemoteKeyboards setBackupState:](self, "setBackupState:", 0);
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = height - v15;
  if (!v10)
    v29 = 0.0;
  objc_msgSend(v27, "notifyIAVHeight:", v29);

  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rootViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (objc_msgSend(v31, "isRotating") & 1) != 0 || self->_takingSnapshot;

  objc_msgSend(v20, "keyboardSceneDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "responder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_window");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = v35;
  v123 = v8;
  if (v35)
    v32 |= objc_msgSend(v35, "_requiresKeyboardPresentationFence") ^ 1;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "layoutIsResizing");

  v118 = v37;
  if ((v37 & 1) != 0)
  {
    v38 = 1;
  }
  else
  {
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rootViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isTransitioningBetweenFloatingStates");

    v38 = v41 | v32;
  }
  v42 = (void *)objc_opt_class();
  v43 = -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible");
  v44 = v43;
  if (!v9)
  {
    if (!-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard"))
    {
      if ((v38 & 1) == 0)
      {
        -[_UIRemoteKeyboards currentState](self, "currentState");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "animationFence");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_synchronizeDrawingWithFence:", v57);

      }
      -[_UIRemoteKeyboards currentState](self, "currentState");
      v58 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "resetAnimationFencing");
      goto LABEL_78;
    }
    if (!v44)
    {
      v120 = 1;
      goto LABEL_42;
    }
    objc_msgSend(v42, "informationForKeyboardDown");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards updateCurrentState:](self, "updateCurrentState:", v50);
    v120 = 1;
LABEL_41:

LABEL_42:
    v58 = v20;
    objc_msgSend(v58, "_FBSScene");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    v122 = v44;
    if (v60)
    {
      objc_msgSend(v60, "identityToken");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v58, "_sceneIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[_UIRemoteKeyboards currentState](self, "currentState");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setSourceSceneIdentityString:", v63);

    _UIMainBundleIdentifier();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setSourceBundleIdentifier:", v65);

    objc_msgSend(v58, "screen");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "displayConfiguration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "_nameForDisplayType");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setSourceDisplayIdentifier:", v69);

    _UIMainBundleIdentifier();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("com.apple.Spotlight")) ^ 1;

    -[_UIRemoteKeyboards currentState](self, "currentState");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setShouldTakeSnapshot:", v72);

    v74 = -[_UIRemoteKeyboards localSceneCount](self, "localSceneCount") > 1;
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setMultipleScenes:", v74);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "hardwareKeyboardExclusivityIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setIsOneness:", v77 != 0);

    v79 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setIsFloating:", v79);

    +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
    v82 = v81;
    v84 = v83;
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setPersistentOffset:", v82, v84);

    -[_UIRemoteKeyboards setCurrentKeyboard:](self, "setCurrentKeyboard:", v9);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "hasVisibleAssistantBar");
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setAssistantBarVisible:", v87);

    objc_msgSend(v86, "visualModeManager");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = objc_msgSend(v89, "windowingModeEnabled");

    objc_msgSend(v86, "visualModeManager");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "shouldShowWithinAppWindow");

    v92 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    v93 = +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced");
    if ((_DWORD)v69)
    {
      v94 = v93;
      if ((v91 & 1) != 0)
      {
        v95 = 1;
      }
      else
      {
        -[_UIRemoteKeyboards currentState](self, "currentState");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "keyboardOnScreen");

        v98 = 3;
        if (v94)
          v99 = 3;
        else
          v99 = 0;
        if (v92)
          v98 = v99;
        if (v97)
          v95 = v98;
        else
          v95 = 2;
      }
      +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
      {
        -[_UIRemoteKeyboards currentState](self, "currentState");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "keyboardOnScreen");
        *(_DWORD *)buf = 67110400;
        *(_DWORD *)v130 = 1;
        *(_WORD *)&v130[4] = 1024;
        *(_DWORD *)&v130[6] = v91;
        LOWORD(v131) = 1024;
        *(_DWORD *)((char *)&v131 + 2) = v117;
        HIWORD(v131) = 1024;
        v132 = v92;
        v133 = 1024;
        v134 = v94;
        v135 = 2048;
        v136 = v95;
        _os_log_debug_impl(&dword_185066000, v100, OS_LOG_TYPE_DEBUG, "prepareToMoveKeyboard (SM: %d, WVM: %d, OS: %d, FL: %d, FF: %d) -> uiPosition: %lu", buf, 0x2Au);

      }
      -[_UIRemoteKeyboards currentState](self, "currentState");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setUiPosition:", v95);

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "containerRootController");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "isSnapshotting");

    -[_UIRemoteKeyboardsEventObserver setKeyboardIsVisible:](self->_eventObserver, "setKeyboardIsVisible:", -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible"));
    v105 = v122;
    if ((v104 & 1) != 0 || ((v123 ^ 1) & 1) != 0)
      goto LABEL_72;
    if (-[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"))
    {
      if ((v118 & 1) != 0)
      {
LABEL_72:
        self->_expectingInitialState = 0;
        -[_UIRemoteKeyboards checkConnection](self, "checkConnection");
        if (((v120 | v105) & 1) == 0 && objc_msgSend(v58, "_isKeyWindowScene"))
          -[_UIRemoteKeyboards setWindowEnabled:](self, "setWindowEnabled:", -[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"));
        -[_UIRemoteKeyboards currentState](self, "currentState");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "resetAnimationFencing");

        if (-[_UIRemoteKeyboards pendingAutofillRequest](self, "pendingAutofillRequest"))
          -[_UIRemoteKeyboards assertNeedsAutofillUI](self, "assertNeedsAutofillUI");
        +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_524);

LABEL_78:
        v45 = v126;

        goto LABEL_79;
      }
    }
    else
    {
      if (self->_hostedCount)
        v106 = v118;
      else
        v106 = 1;
      if ((v106 & 1) != 0)
        goto LABEL_72;
    }
    +[_UIRemoteKeyboardsToken uniqueToken](_UIRemoteKeyboardsToken, "uniqueToken");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "_FBSScene");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (v108)
    {
      objc_msgSend(v108, "identityToken");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "stringRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = v122;
    }
    else
    {
      objc_msgSend(v58, "_sceneIdentifier");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v107, "setSceneIdentityString:", v111);
    -[NSMutableSet addObject:](self->_pendingKeyboardGrabs, "addObject:", v107);
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = (void *)objc_msgSend(v112, "copy");
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke;
    v127[3] = &unk_1E16B1B50;
    v127[4] = self;
    v128 = v107;
    v114 = v107;
    -[_UIRemoteKeyboards signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v113, v127);

    goto LABEL_72;
  }
  v45 = v126;
  if (v26
    || !v43
    || !-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard")
    || !-[_UIRemoteKeyboards currentStateHasEqualRect:andIAVPosition:](self, "currentStateHasEqualRect:andIAVPosition:", v18, v17, v16, v15, x, y, width, height)|| !-[_UIRemoteKeyboards didSignalKeyboardChangedForCurrentKeyboard](self, "didSignalKeyboardChangedForCurrentKeyboard")|| -[_UIRemoteKeyboards isFloating](self, "isFloating")&& ((-[_UIRemoteKeyboards persistentOffset](self, "persistentOffset"), v119 = v47, v121 = v46, +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset"), v121 != v49)
     || v119 != v48))
  {
    -[objc_class remoteKeyboardWindowForScreen:create:](-[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass"), "remoteKeyboardWindowForScreen:create:", v126, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v50, "_isHostedInAnotherProcess");
    if (objc_msgSend(v20, "_isKeyWindowScene"))
    {
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "windowLevel");
      objc_msgSend(v50, "setWindowLevel:", v52 + 1.0);

    }
    if (v44)
    {
      -[_UIRemoteKeyboards currentState](self, "currentState");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "keyboardPosition");
      v139.origin.x = v18;
      v139.origin.y = v17;
      v139.size.width = v16;
      v139.size.height = v15;
      if (!CGRectEqualToRect(v138, v139))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (objc_msgSend(v54, "updatingPreferences") & 1) == 0
           && -[_UIRemoteKeyboards allowedToEnableKeyboardWindow](self, "allowedToEnableKeyboardWindow");
        v123 |= v55;

      }
    }
    objc_msgSend(v42, "informationForKeyboardUp:withIAV:", v18, v17, v16, v15, x, y, width, height);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards updateCurrentState:](self, "updateCurrentState:", v59);

    -[_UIRemoteKeyboards resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
    goto LABEL_41;
  }
LABEL_79:

  objc_autoreleasePoolPop(context);
}

- (void)setBackupState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)pendingAutofillRequest
{
  return self->_pendingAutofillRequest;
}

- (unint64_t)localSceneCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v8, "keyboardSceneDelegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            ++v5;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateEventSource:(int64_t)keyboardSource options:(unint64_t)a4 responder:(id)a5
{
  char v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  if (keyboardSource)
  {
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((v5 & 8) != 0)
  {
LABEL_6:
    self->_keyboardSource = keyboardSource;
    goto LABEL_7;
  }
  keyboardSource = self->_keyboardSource;
LABEL_7:
  if ((v5 & 0x10) == 0 && self->_lastEventSource == keyboardSource)
    goto LABEL_14;
  self->_lastEventSource = keyboardSource;
  v11 = v8;
  if ((v5 & 1) != 0)
  {
    +[UIScribbleInteraction _lastEventSourceChanged:](UIScribbleInteraction, "_lastEventSourceChanged:", keyboardSource);
    v8 = v11;
    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 1) == 0)
        goto LABEL_12;
LABEL_17:
      -[_UIRemoteKeyboards _postInputSourceDidChangeNotificationForResponder:](self, "_postInputSourceDidChangeNotificationForResponder:", v11);
      v8 = v11;
      if ((v5 & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_11;
  }
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signalEventSourceChanged:completionHandler:", keyboardSource, &__block_literal_global_576);

  v8 = v11;
  if ((v5 & 1) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v5 & 2) != 0)
  {
LABEL_13:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 0);

    v8 = v11;
  }
LABEL_14:

}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4
{
  -[_UIRemoteKeyboards _updateEventSource:options:responder:](self, "_updateEventSource:options:responder:", a3, a4, 0);
}

- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  const __CFString **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "responder"), v4 = (id)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v15[0] = CFSTR("UITextInputSourceDidChangeInputSourceKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastEventSource);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("UITextInputResponderCapabilitiesChangedInputResponderKey");
    v16[0] = v6;
    v16[1] = v4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (void **)v16;
    v9 = (const __CFString **)v15;
    v10 = 2;
  }
  else
  {
    v13 = CFSTR("UITextInputSourceDidChangeInputSourceKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastEventSource);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v14;
    v9 = &v13;
    v10 = 1;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("UITextInputSourceDidChangeNotification"), 0, v11);

}

- (void)sceneUpdated
{
  if (self->_takingSnapshot)
    -[_UIRemoteKeyboards reloadForSnapshotting](self, "reloadForSnapshotting");
}

- (id)inputWindowRootViewController
{
  void *v2;
  void *v3;

  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applicationKeyWindowWillChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  _UIRemoteKeyboards *v18;
  char v19;

  v4 = a3;
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend((id)UIApp, "isFrontBoard");
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = objc_msgSend(v7, "_overriddenInterfaceOrientation");
    else
      v9 = objc_msgSend(v7, "interfaceOrientation");
    v10 = v9;
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      v13 = objc_msgSend(v11, "_overriddenInterfaceOrientation");
      if (!v8)
        goto LABEL_13;
    }
    else
    {
      v13 = objc_msgSend(v11, "interfaceOrientation");
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if (!v12 || v10 != v13)
    {
      -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "interfaceOrientation");

      if (v15 != v10)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53___UIRemoteKeyboards_applicationKeyWindowWillChange___block_invoke;
        block[3] = &unk_1E16B4008;
        v19 = v6;
        v17 = v8;
        v18 = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (void)checkState
{
  void *v3;

  if (objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter"))
  {
    -[_UIRemoteKeyboards checkConnection](self, "checkConnection");
  }
  else
  {
    -[_UIRemoteKeyboards connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[_UIRemoteKeyboards stopConnection](self, "stopConnection");
  }
}

- (void)queue_keyboardChangedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___UIRemoteKeyboards_queue_keyboardChangedWithCompletion___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UIRemoteKeyboards *v14;
  id v15;
  uint8_t buf[4];
  _UIRemoteKeyboards *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v17 = self;
    v18 = 2048;
    v19 = v6;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "queue_keyboardChanged (self: %p, info: %p), %@", buf, 0x20u);
  }

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55___UIRemoteKeyboards_queue_keyboardChanged_onComplete___block_invoke;
  v12[3] = &unk_1E16BAD68;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performAsync:", v12);

}

- (void)queue_getDebugInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55___UIRemoteKeyboards_queue_getDebugInfoWithCompletion___block_invoke;
    v6[3] = &unk_1E16B1D18;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

- (void)applicationWillResume:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!self->_enqueuedWillEnterForegroundActions)
  {
    self->_enqueuedWillEnterForegroundActions = 1;
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44___UIRemoteKeyboards_applicationWillResume___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

- (int64_t)lastEventSource
{
  return self->_lastEventSource;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  if (a3)
    return -[NSMutableArray containsObject:](self->_activeCIDs, "containsObject:");
  else
    return -[_UIRemoteKeyboards hasAnyHostedViews](self, "hasAnyHostedViews");
}

- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5
{
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  int v30;
  double requiredLevel;
  int v32;
  int v33;
  unint64_t v34;
  _BOOL8 v35;
  _BOOL8 v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  const char *v40;
  __int16 v41;
  _BYTE v42[10];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass");
  objc_msgSend(v8, "_responderWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class remoteKeyboardWindowForScreen:create:](v9, "remoteKeyboardWindowForScreen:create:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setWindowLevel:", a3);
  objc_msgSend(v8, "_responderWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_settingsScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_FBSScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identityToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = qword_1ECD7A340;
  if (!qword_1ECD7A340)
  {
    v19 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v19, (unint64_t *)&qword_1ECD7A340);
  }
  if ((*(_BYTE *)v19 & 1) != 0)
  {
    v37 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = 136315650;
      v40 = "-[_UIRemoteKeyboards setWindowLevel:sceneLevel:forResponder:]";
      v41 = 2112;
      *(_QWORD *)v42 = v8;
      *(_WORD *)&v42[8] = 2112;
      v43 = v18;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "%s: Setting window level for responder: %@; scene identity: %@",
        (uint8_t *)&v39,
        0x20u);
    }
  }
  objc_msgSend(v8, "_responderWindow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_responderWindow");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "windowScene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "_isTargetOfKeyboardEventDeferringEnvironment"))
    v23 = 1;
  else
    v23 = 16777217;
  -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v20, v23);

  -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identityToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "activeSceneIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hardwareKeyboardExclusivityIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 != 0;

  v30 = BSEqualObjects() ^ 1;
  requiredLevel = self->_requiredLevel;
  if (requiredLevel == a4)
    v32 = v30;
  else
    v32 = 1;
  if (self->_hasExclusivityIdentifier == v29)
    v33 = v32;
  else
    v33 = 1;
  v34 = qword_1ECD7A348;
  if (!qword_1ECD7A348)
  {
    v34 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v34, (unint64_t *)&qword_1ECD7A348);
  }
  if ((*(_BYTE *)v34 & 1) != 0)
  {
    v38 = *(NSObject **)(v34 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = 136315906;
      v40 = "-[_UIRemoteKeyboards setWindowLevel:sceneLevel:forResponder:]";
      v41 = 1024;
      *(_DWORD *)v42 = v33;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v30;
      LOWORD(v43) = 1024;
      *(_DWORD *)((char *)&v43 + 2) = requiredLevel != a4;
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "%s: Should reset scene: %d; identitiesAreDifferent: %d; levelsAreDifferent: %d",
        (uint8_t *)&v39,
        0x1Eu);
    }
  }
  if (v33)
  {
    self->_requiredLevel = a4;
    self->_hasExclusivityIdentifier = v29;
    objc_msgSend(v12, "resetScene");
  }
  v35 = -[_UIRemoteKeyboards needsToShowKeyboardForWindow:](self, "needsToShowKeyboardForWindow:", v12);
  v36 = v35
     && -[_UIRemoteKeyboards needsToShowKeyboardForViewServiceHostWindow:](self, "needsToShowKeyboardForViewServiceHostWindow:", v12);
  -[_UIRemoteKeyboards setWindowEnabled:force:](self, "setWindowEnabled:force:", v35, v36);

}

- (BOOL)needsToShowKeyboardForWindow:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"))
    v5 = -[_UIRemoteKeyboards wantsToShowKeyboardForWindow:](self, "wantsToShowKeyboardForWindow:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)applicationDidBecomeActive:(id)a3 forceSignalToProxy:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a4;
  if ((-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard", a3) || v4) && !self->_deactivatedByControlCenter)
  {
    -[_UIRemoteKeyboards backupState](self, "backupState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "copyWithIntersectability:", 1);
    }
    else
    {
      -[_UIRemoteKeyboards currentState](self, "currentState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "copyWithIntersectability:", 1);

    }
    objc_msgSend(v8, "setShouldTakeSnapshot:", 0);
    -[_UIRemoteKeyboards signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v8, &__block_literal_global_587);
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_isHostedInAnotherProcess");

    if ((v11 & 1) == 0)
      -[_UIRemoteKeyboards setWindowEnabled:](self, "setWindowEnabled:", 1);

  }
  self->_deactivatedByControlCenter = 0;
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  KeyboardArbiterClientLog_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboards signalToProxyKeyboardChanged:onCompletion:]  Signaling keyboard changed %@", (uint8_t *)&v11, 0xCu);
  }

  -[_UIRemoteKeyboards setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 1);
  _UIMainBundleIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceBundleIdentifier:", v9);

  -[_UIRemoteKeyboards proxy](self, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signalKeyboardChanged:onCompletion:", v6, v7);

}

- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3
{
  self->_didSignalKeyboardChangedForCurrentKeyboard = a3;
}

- (void)setWindowEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[_UIRemoteKeyboards hasAnyHostedViews](self, "hasAnyHostedViews")
    || !self->_handlingRemoteEvent
    || self->_handlingViewServiceEvent)
  {
    -[_UIRemoteKeyboards setWindowEnabled:force:](self, "setWindowEnabled:force:", v3, 0);
  }
}

- (BOOL)hasAnyHostedViews
{
  return -[NSMutableArray count](self->_activePIDs, "count") != 0;
}

- (_UIKeyboardChangedInformation)backupState
{
  return (_UIKeyboardChangedInformation *)objc_getProperty(self, a2, 248, 1);
}

- (BOOL)disableBecomeFirstResponder
{
  return self->_disablingKeyboard;
}

- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3 && -[_UIRemoteKeyboards allowedToEnableKeyboardWindow](self, "allowedToEnableKeyboardWindow");
  if (v6 && v4)
    v7 = 2;
  else
    v7 = v6;
  -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = off_1E16D7A90[v7];
  v11 = setWindowEnabled_force____s_category;
  if (!setWindowEnabled_force____s_category)
  {
    v11 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&setWindowEnabled_force____s_category);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v20 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      objc_msgSend(v9, "stringRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315650;
      v24 = "-[_UIRemoteKeyboards setWindowEnabled:force:]";
      v25 = 2080;
      v26 = v10;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "%s: Setting window state: %s for scene identity: %@", (uint8_t *)&v23, 0x20u);

    }
  }
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIRemoteKeyboards proxy](self, "proxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWindowContextID:focusContext:windowState:withLevel:", objc_msgSend(v15, "_contextId"), v13, v7, self->_requiredLevel);

  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v6 ^ 1);

  if (self->_windowEnabled != v6)
  {
    self->_windowEnabled = v6;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputModeIndicatorController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyboardWindowEnabled:", v6);

  }
  if (v6)
  {
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_matchDeviceOrientation");

  }
}

- (BOOL)allowedToEnableKeyboardWindow
{
  void *v3;
  void *v4;
  NSString *keyboardSceneIdentifierEnteringForeground;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_11;
  if (self->_deactivatedByControlCenter)
    goto LABEL_9;
  if (self->_deactivatedBySystemAlert)
    goto LABEL_9;
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  objc_msgSend(v4, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(keyboardSceneIdentifierEnteringForeground) = -[NSString isEqualToString:](keyboardSceneIdentifierEnteringForeground, "isEqualToString:", v6);

  if ((keyboardSceneIdentifierEnteringForeground & 1) != 0)
    goto LABEL_9;
  if (!objc_msgSend(v4, "activationState"))
    goto LABEL_9;
  if (objc_msgSend(v4, "activationState") != 1)
    goto LABEL_11;
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "keyboardOnScreen");

  if (!v8)
    goto LABEL_11;
  if ((objc_msgSend(v4, "_canDynamicallySpecifySupportedInterfaceOrientations") & 1) != 0)
    goto LABEL_9;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualModeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "windowingModeEnabled");

  objc_msgSend(v4, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v4, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;

  if ((v12 & 1) != 0)
    goto LABEL_11;
  if (v15 == v20 && v17 == v22)
LABEL_9:
    v9 = 1;
  else
LABEL_11:
    v9 = 0;

  return v9;
}

- (void)keyboardChangedCompleted
{
  void *v3;
  NSMutableSet *ignoredSceneIdentityTokenStringSet;
  void *v5;
  void *v6;
  id v7;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri")))
  {

  }
  else
  {
    ignoredSceneIdentityTokenStringSet = self->_ignoredSceneIdentityTokenStringSet;
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceSceneIdentityString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(ignoredSceneIdentityTokenStringSet) = -[NSMutableSet containsObject:](ignoredSceneIdentityTokenStringSet, "containsObject:", v6);

    if ((ignoredSceneIdentityTokenStringSet & 1) == 0)
      -[_UIRemoteKeyboards resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 1);
  }
}

- (void)assertNeedsAutofillUI
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (+[UIKeyboard usesInputSystemUIForAutoFillOnly](UIKeyboard, "usesInputSystemUIForAutoFillOnly"))
  {
    v3 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard");
    _UIKeyboardExtendedLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Requesting scene for autofill UI", v6, 2u);
      }

      -[_UIRemoteKeyboards proxy](self, "proxy");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject signalAutofillUIBringupWithCompletion:](v5, "signalAutofillUIBringupWithCompletion:", &__block_literal_global_368);
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "Requesting scene for autofill UI: request is pending -- not yet the current keyboard", buf, 2u);
    }

    -[_UIRemoteKeyboards setPendingAutofillRequest:](self, "setPendingAutofillRequest:", !v3);
  }
}

- (void)setPendingAutofillRequest:(BOOL)a3
{
  self->_pendingAutofillRequest = a3;
}

- (void)unregisterController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setControllerDelegate:", 0);
  -[NSHashTable removeObject:](self->_windowControllers, "removeObject:", v4);

}

- (void)_lostWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIScreen *lastScreen;
  UIScreen *v8;
  UIScreen *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateLayout");

  }
  lastScreen = self->_lastScreen;
  objc_msgSend(v10, "_screen");
  v8 = (UIScreen *)objc_claimAutoreleasedReturnValue();

  if (lastScreen == v8)
  {
    v9 = self->_lastScreen;
    self->_lastScreen = 0;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UISceneDidDisconnectNotification");
  v6[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[2] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[3] = CFSTR("UIApplicationWillResignActiveNotification");
  v6[4] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v6[5] = CFSTR("_UIApplicationWillAddDeactivationReasonNotification");
  v6[6] = CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification");
  v6[7] = CFSTR("UIApplicationResumedEventsOnlyNotification");
  v6[8] = CFSTR("_UIWindowWillBecomeApplicationKeyNotification");
  v6[9] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v6[10] = CFSTR("UISceneWillEnterForegroundNotification");
  v6[11] = CFSTR("UISceneDidEnterBackgroundNotification");
  v6[12] = CFSTR("UISceneDidActivateNotification");
  v6[13] = CFSTR("_UISystemApplicationWillLockNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[_UIRemoteKeyboards stopConnection](self, "stopConnection");
  -[_UIRemoteKeyboards resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteKeyboards;
  -[_UIRemoteKeyboards dealloc](&v5, sel_dealloc);
}

- (void)restoreKeyboardIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UIRemoteKeyboards currentState](self, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIRemoteKeyboards isShowingPasswordAutofillPanel:](self, "isShowingPasswordAutofillPanel:", v5);

    if (v6)
      -[_UIRemoteKeyboards applicationDidBecomeActive:forceSignalToProxy:](self, "applicationDidBecomeActive:forceSignalToProxy:", 0, 1);
  }
}

- (void)queue_activeProcessResignWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62___UIRemoteKeyboards_queue_activeProcessResignWithCompletion___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)queue_failedConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "interruptionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterruptionHandler:", 0);
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45___UIRemoteKeyboards_queue_failedConnection___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)setShouldFence:(BOOL)a3
{
  id v4;

  if (self->_shouldFence != a3)
  {
    self->_shouldFence = a3;
    -[_UIRemoteKeyboards proxy](self, "proxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWantsFencing:", self->_shouldFence);

  }
}

- (void)addIgnoredSceneIdentityTokenString:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_ignoredSceneIdentityTokenStringSet, "addObject:");
}

- (void)removeIgnoredSceneIdentityTokenString:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_ignoredSceneIdentityTokenStringSet, "removeObject:");
}

- (BOOL)isShowingPasswordAutofillPanel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_everPresentedPasswordAutofillPanel"))
  {
    objc_msgSend(v3, "sourceBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.SafariViewService")))
    {
      objc_msgSend(v3, "hostBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InputUI"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);
  double v10;

  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58___UIRemoteKeyboards_queue_keyboardIAVChanged_onComplete___block_invoke;
    v8[3] = &unk_1E16B44E8;
    v8[4] = self;
    v10 = a3;
    v9 = v6;
    objc_msgSend(v7, "performAsync:", v8);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _UIRemoteKeyboards *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62___UIRemoteKeyboards_queue_sceneBecameFocused_withCompletion___block_invoke;
  v11[3] = &unk_1E16BAD68;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performAsync:", v11);

}

- (void)stopConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSXPCConnection *connection;

  -[_UIRemoteKeyboards connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  -[_UIRemoteKeyboards connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterruptionHandler:", 0);

  -[_UIRemoteKeyboards connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  connection = self->_connection;
  self->_connection = 0;

  -[_UIRemoteKeyboards cleanSuppression](self, "cleanSuppression");
}

- (void)cleanSuppression
{
  void *v3;
  int externalSuppression;
  BOOL v5;

  if (self->_externalSuppression >= 1)
  {
    do
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDeactivatedKeyboard:forScene:", 0, 0);

      externalSuppression = self->_externalSuppression;
      v5 = __OFSUB__(externalSuppression--, 1);
      self->_externalSuppression = externalSuppression;
    }
    while (!((externalSuppression < 0) ^ v5 | (externalSuppression == 0)));
  }
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_505);
}

- (void)setSnapshotting:(BOOL)a3
{
  int v3;
  int takingSnapshot;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  takingSnapshot = self->_takingSnapshot;
  self->_takingSnapshot = a3;
  _UIMainBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if ((v7 & 1) == 0)
    -[_UIRemoteKeyboards reloadForSnapshotting](self, "reloadForSnapshotting");
  if (takingSnapshot != v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "_isTextEffectsWindow"))
            objc_msgSend(v13, "_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)sceneIsFullScreen
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_referenceBounds");
  v13 = v9 == v12 && v7 == v11;

  return v13;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  UIWindowScene *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v6 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();

    if (v6 && -[UIScene _hasInvalidated](v6, "_hasInvalidated"))
    {
      if (v6 == self->_suppressedScene)
      {
        self->_suppressedScene = 0;

      }
      -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "identityToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UIScene _FBSScene](v6, "_FBSScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "identityToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[UIScene _sceneIdentifier](v6, "_sceneIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v15 = BSEqualStrings();
      +[UIWindowScene _keyWindowScene]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_isTargetOfKeyboardEventDeferringEnvironment");

      if ((v15 & 1) != 0 || v17)
      {
        -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[_UIRemoteKeyboards wantsToShowKeyboardForWindow:](self, "wantsToShowKeyboardForWindow:", v18);

        v20 = sceneDidDisconnect____s_category;
        if (!sceneDidDisconnect____s_category)
        {
          v20 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&sceneDidDisconnect____s_category);
        }
        if ((*(_BYTE *)v20 & 1) != 0)
        {
          v23 = *(NSObject **)(v20 + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            v25 = 136316418;
            v26 = "-[_UIRemoteKeyboards sceneDidDisconnect:]";
            v27 = 2112;
            v28 = v14;
            v29 = 1024;
            v30 = v15;
            v31 = 1024;
            v32 = v19;
            v33 = 1024;
            v34 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard");
            v35 = 1024;
            v36 = -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible");
            _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for disconnecting scene: %@; needsUpdateToNil: %d; wantsToShowKeyboar"
              "dForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
              (uint8_t *)&v25,
              0x2Eu);

          }
        }
        if ((v15 & 1) != 0)
        {
          v21 = 0;
          v22 = 0x1000000;
        }
        else
        {
          +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 16777472;
        }
        -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v21, v22 | v15);

      }
    }
  }
  else
  {

    v6 = 0;
  }

}

- (void)applicationDidSuspend:(id)a3
{
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSXPCConnection *connection;
  NSXPCConnection *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[6];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIRemoteKeyboards wantsToShowKeyboardForWindow:](self, "wantsToShowKeyboardForWindow:", v4);

  v6 = applicationDidSuspend____s_category;
  if (!applicationDidSuspend____s_category)
  {
    v6 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&applicationDidSuspend____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v16 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      *(_DWORD *)buf = 136315906;
      v25 = "-[_UIRemoteKeyboards applicationDidSuspend:]";
      v26 = 1024;
      v27 = v5;
      v28 = 1024;
      v29 = -[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard");
      v30 = 1024;
      v31 = -[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible");
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "%s: wantsToShowKeyboardForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
        buf,
        0x1Eu);

    }
  }
  if (v5)
  {
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isHostedInAnotherProcess");

    if ((v8 & 1) == 0)
      -[_UIRemoteKeyboards setWindowEnabled:](self, "setWindowEnabled:", 0);
  }
  v9 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("_UIRemoteKeyboard XPC disconnection"), 0);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke;
  aBlock[3] = &unk_1E16B1888;
  aBlock[4] = self;
  aBlock[5] = v9;
  v11 = _Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    v13 = connection;

    -[NSXPCConnection setInterruptionHandler:](v13, "setInterruptionHandler:", 0);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_2;
    v21[3] = &unk_1E16B1BF8;
    v22 = v11;
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v21);
    -[NSXPCConnection invalidate](v13, "invalidate");

  }
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_3;
  v18[3] = &unk_1E16BAFE8;
  v20 = connection != 0;
  v18[4] = self;
  v19 = v11;
  v15 = v11;
  objc_msgSend(v14, "performAsync:", v18);

}

- (void)performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "keyWindowCandidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_settingsScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "_FBSScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "identityToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate____s_category;
      if (!performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate____s_category)
      {
        v10 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate____s_category);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315650;
          v13 = "-[_UIRemoteKeyboards performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:]";
          v14 = 2048;
          v15 = v4;
          v16 = 2112;
          v17 = v9;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for candidate window: %p; scene: %@",
            (uint8_t *)&v12,
            0x20u);
        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v4, 0);

    }
  }
}

- (BOOL)needsToShowKeyboardForViewServiceHostWindow:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"))
    v5 = -[_UIRemoteKeyboards wantsToShowKeyboardForViewServiceHostWindow:](self, "wantsToShowKeyboardForViewServiceHostWindow:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)setKeyboardSceneIdentifierEnteringForegroundForScene:(id)a3
{
  NSString *v4;
  NSString *keyboardSceneIdentifierEnteringForeground;

  objc_msgSend(a3, "_sceneIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  self->_keyboardSceneIdentifierEnteringForeground = v4;

}

- (void)screenDidDisconnect:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *keyboardSceneIdentifierEnteringForeground;
  id v7;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard") && objc_msgSend(v7, "activationState") == 1)
  {
    objc_msgSend(v7, "_sceneIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = v5;

  }
}

- (BOOL)wantsToShowKeyboardForViewServiceHostWindow:(id)a3
{
  void *v3;
  char v4;

  -[_UIRemoteKeyboards viewHostForWindow:](self, "viewHostForWindow:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasHostedViews");

  return v4;
}

- (void)updateLastScreen:(id)a3
{
  id v5;
  UIScreen **p_lastScreen;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a3;
  if (self->_enableMultiscreenHack)
  {
    v10 = v5;
    p_lastScreen = &self->_lastScreen;
    if (self->_lastScreen)
    {
      -[objc_class remoteKeyboardWindowForScreen:create:](-[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass"), "remoteKeyboardWindowForScreen:create:", self->_lastScreen, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "screen");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 != v10)
          objc_msgSend(v8, "invalidate");
      }

    }
    objc_storeStrong((id *)p_lastScreen, a3);
    v5 = v10;
  }

}

- (void)_performOnDistributedControllersExceptSelf:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___UIRemoteKeyboards__performOnDistributedControllersExceptSelf___block_invoke;
  v6[3] = &unk_1E16C40F0;
  v7 = v4;
  v5 = v4;
  -[_UIRemoteKeyboards performOnControllers:](self, "performOnControllers:", v6);

}

- (void)performOnDistributedControllers:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  -[_UIRemoteKeyboards _performOnDistributedControllersExceptSelf:](self, "_performOnDistributedControllersExceptSelf:", v5);

}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class remoteKeyboardWindowForScreen:create:](-[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass"), "remoteKeyboardWindowForScreen:create:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_hostedCount;
  -[objc_class remoteKeyboardWindowForScreen:create:](-[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass"), "remoteKeyboardWindowForScreen:create:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        objc_msgSend(v7, "windowScene"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "_hasInvalidated"),
        v10,
        v9,
        v11))
  {
    objc_msgSend(v7, "setWindowScene:", v4);
  }
  -[_UIRemoteKeyboards checkConnection](self, "checkConnection");
  if (self->_hostedCount == 1)
  {
    if (v6)
      objc_msgSend(v6, "invalidate");
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceReloadInputViews");

  }
  return v7;
}

- (void)finishWithHostedWindow
{
  int v2;
  id v3;

  v2 = self->_hostedCount - 1;
  self->_hostedCount = v2;
  if (!v2)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceReloadInputViews");

  }
}

- (BOOL)refreshWithLocalMinimumKeyboardHeight:(double)a3 forScene:(id)a4
{
  id v6;
  NSMapTable *minimumKeyboardHeights;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  minimumKeyboardHeights = self->_minimumKeyboardHeights;
  objc_msgSend(v6, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSMapTable objectForKey:](minimumKeyboardHeights, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  if (v14 != a3)
  {
    v15 = self->_minimumKeyboardHeights;
    if (a3 == 0.0)
    {
      objc_msgSend(v6, "_FBSScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "identityToken");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "_sceneIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[NSMapTable removeObjectForKey:](v15, "removeObjectForKey:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_FBSScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "identityToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "_sceneIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[NSMapTable setObject:forKey:](v15, "setObject:forKey:", v19, v23);
    }

  }
  return v14 != a3;
}

- (CGRect)keyboardPosition
{
  void *v2;
  double v3;
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
  CGRect result;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardPosition");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)persistentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIRemoteKeyboards currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)addHostedWindowView:(id)a3 fromPID:(int)a4 forScene:(id)a5 callerID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  char v32;
  id location;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    objc_msgSend(v11, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards updateLastScreen:](self, "updateLastScreen:", v13);

  }
  v14 = -[_UIRemoteKeyboards keyboardWindowClass](self, "keyboardWindowClass");
  -[_UIRemoteKeyboards _activeScreen](self, "_activeScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class remoteKeyboardWindowForScreen:create:](v14, "remoteKeyboardWindowForScreen:create:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setHidden:", 0);
  -[_UIRemoteKeyboards viewHostForWindow:](self, "viewHostForWindow:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWindowHostingPID:active:", v8, 1);

  -[NSMutableArray addObject:](self->_activePIDs, "addObject:", v18);
  if (v12)
    -[NSMutableArray addObject:](self->_activeCIDs, "addObject:", v12);
  v20 = objc_msgSend(v16, "_isHostedInAnotherProcess");
  if ((v20 & 1) == 0)
    -[_UIRemoteKeyboards setWindowEnabled:](self, "setWindowEnabled:", -[_UIRemoteKeyboards allowedToShowKeyboard](self, "allowedToShowKeyboard"));
  v21 = objc_loadWeakRetained(&location);
  objc_msgSend(v16, "updateLastRemoteView:forView:inContainer:", 1, v10, v21);

  v22 = objc_loadWeakRetained(&location);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68___UIRemoteKeyboards_addHostedWindowView_fromPID_forScene_callerID___block_invoke;
  v26[3] = &unk_1E16D7938;
  v26[4] = self;
  v23 = v18;
  v27 = v23;
  v32 = v20;
  v31 = v8;
  v24 = v12;
  v28 = v24;
  objc_copyWeak(&v30, &location);
  v25 = v10;
  v29 = v25;
  objc_msgSend(v22, "addHostedView:withViewRemovalHandler:", v25, v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(v5, "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == *(void **)(a1 + 88);

    }
    else
    {
      v8 = 0;
    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    v12 = (_DWORD)a3 ? v11 : 1;
    if (v6 && !v8 && v12)
    {
      v13 = performRequiredSceneUpdateIfPermittedForViewServiceHostWindow_servicePID____s_category;
      if (!performRequiredSceneUpdateIfPermittedForViewServiceHostWindow_servicePID____s_category)
      {
        v13 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&performRequiredSceneUpdateIfPermittedForViewServiceHostWindow_servicePID____s_category);
      }
      if ((*(_BYTE *)v13 & 1) != 0)
      {
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315394;
          v16 = "-[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]";
          v17 = 2048;
          v18 = v6;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for window hosting remote ui: %p", (uint8_t *)&v15, 0x16u);
        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]((void *)a1, v6, 0x101010001);
    }
  }

}

- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4
{
  _BOOL8 v4;
  UIWindowScene *v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UIWindowScene *v20;
  void *v21;
  id v22;
  void (**v23)(_QWORD);
  void *v24;
  _QWORD aBlock[4];
  id v26;
  UIWindowScene *v27;
  BOOL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[5];
  _BYTE v34[128];
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = (UIWindowScene *)a4;
  if (self->_expectedSuppression != v4)
  {
    self->_expectedSuppression = v4;
    v7 = MEMORY[0x1E0C809B0];
    if (v4 && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v8 = dispatch_time(0, 500000000);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    }
    -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerWindow");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!v6)
        v6 = v14;
      objc_storeStrong((id *)&self->_suppressedScene, v6);
    }
    else if (!v6)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
LABEL_15:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(UIWindowScene **)(*((_QWORD *)&v29 + 1) + 8 * v19);
          if (v20 == self->_suppressedScene)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v17)
              goto LABEL_15;
            goto LABEL_21;
          }
        }
        v6 = v20;

        if (v6)
          goto LABEL_24;
      }
      else
      {
LABEL_21:

      }
      v6 = v14;
    }
LABEL_24:
    -[_UIRemoteKeyboards proxy](self, "proxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "notifyHostedPIDsOfSuppression:", v4);

    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke_2;
    aBlock[3] = &unk_1E16B4008;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    v28 = v4;
    v6 = v6;
    v27 = v6;
    v23 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend((id)UIApp, "isSuspended"))
    {
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushAnimationStyle:", v24);

      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
      objc_msgSend(v22, "popAnimationStyle");
    }
    else
    {
      v23[2](v23);
    }

  }
}

- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62___UIRemoteKeyboards_queue_keyboardSuppressed_withCompletion___block_invoke;
  v9[3] = &unk_1E16BAFE8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (-[_UIRemoteKeyboards keyboardActive](self, "keyboardActive"))
  {
LABEL_11:
    if (v12)
      v12[2](v12);
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke;
        aBlock[3] = &unk_1E16C40A8;
        v31 = v10;
        v32 = v11;
        v13 = _Block_copy(aBlock);

        v14 = v31;
        goto LABEL_9;
      case 1uLL:
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2;
        v27[3] = &unk_1E16C40A8;
        v28 = v10;
        v29 = v11;
        v13 = _Block_copy(v27);

        v14 = v28;
        goto LABEL_9;
      case 2uLL:
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3;
        v24[3] = &unk_1E16C40A8;
        v25 = v10;
        v26 = v11;
        v13 = _Block_copy(v24);

        v14 = v25;
        goto LABEL_9;
      case 3uLL:
        if (!objc_msgSend(CFSTR("Placement"), "isEqualToString:", v10))
          goto LABEL_7;
        objc_msgSend(v11, "objectForKey:", CFSTR("Placement"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4;
        v21[3] = &unk_1E16C40A8;
        v22 = v15;
        v23 = v11;
        v14 = v15;
        v13 = _Block_copy(v21);

LABEL_9:
        if (!v13)
          goto LABEL_11;
        objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5;
        v18[3] = &unk_1E16BC240;
        v18[4] = self;
        v19 = v13;
        v20 = v12;
        v17 = v13;
        objc_msgSend(v16, "performAsync:", v18);

        break;
      default:
LABEL_7:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown transition data: %@/%lu/%@"), v10, a4, v11);
        goto LABEL_11;
    }
  }

}

- (void)setDisableBecomeFirstResponder:(BOOL)a3
{
  -[_UIRemoteKeyboards setDisableBecomeFirstResponder:forSuppressionAssertion:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:", a3, 0);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4
{
  -[_UIRemoteKeyboards setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", a3, a4, 1);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5
{
  -[_UIRemoteKeyboards setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:", a3, a4, a5, 0);
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5 wantsAssistant:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;

  if (self->_disablingKeyboard != a3)
  {
    v6 = a6;
    v7 = a5;
    v8 = a4;
    v9 = a3;
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:wantsAssistant:", v9, 0, v8, v7, v6);

    self->_disablingKeyboard = v9;
  }
}

- (void)setWantsAssistantWhileSuppressingKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_wantsAssistantWhileSuppressingKeyboard != a3)
  {
    v3 = a3;
    self->_wantsAssistantWhileSuppressingKeyboard = a3;
    if (a3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setShouldSuppressAssistantBar:", 0);

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateVisibilityObserversWithReset:", 0);

    if (-[_UIRemoteKeyboards disableBecomeFirstResponder](self, "disableBecomeFirstResponder"))
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextAnimationStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updatePlacementForDeactivatedKeyboard:forSuppressionAssertion:wantsAssistant:animationStyle:", 1, 1, v3, v8);

    }
  }
}

- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3
{
  return -[_UIAssertionController hasAssertionsForReason:](self->_assertionController, "hasAssertionsForReason:", a3);
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3
{
  return -[_UIRemoteKeyboards vendKeyboardSuppressionAssertionForReason:type:](self, "vendKeyboardSuppressionAssertionForReason:type:", a3, 0);
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", a4, 1, a3, 0);
}

- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 2, 1, a3, 0);
}

- (void)setStickerPrewarmingViewControllerEnabled:(BOOL)a3
{
  UIViewController *stickerPrewarmingViewController;
  NSObject *v5;
  void *v6;
  UIViewController *v7;
  _QWORD block[5];

  stickerPrewarmingViewController = self->_stickerPrewarmingViewController;
  if (a3)
  {
    if (!stickerPrewarmingViewController)
    {
      if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
      {
        dispatch_get_global_queue(17, 0);
        v5 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke;
        block[3] = &unk_1E16B1B28;
        block[4] = self;
        dispatch_async(v5, block);

      }
    }
  }
  else
  {
    -[UIViewController willMoveToParentViewController:](stickerPrewarmingViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](self->_stickerPrewarmingViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_stickerPrewarmingViewController, "removeFromParentViewController");
    v7 = self->_stickerPrewarmingViewController;
    self->_stickerPrewarmingViewController = 0;

  }
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  if (a3 <= 1)
    return -[_UIRemoteKeyboards disableBecomeFirstResponder](self, "disableBecomeFirstResponder");
  if (a3 != 2)
    return 0;
  -[UIViewController _window](self->_stickerPrewarmingViewController, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards keyboardWindow](self, "keyboardWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == v6;

  return v7;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 > 1)
  {
    if (a4 == 2)
      -[_UIRemoteKeyboards setStickerPrewarmingViewControllerEnabled:](self, "setStickerPrewarmingViewControllerEnabled:", a3);
  }
  else
  {
    -[_UIRemoteKeyboards setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:](self, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:", a3, 1, 1, -[_UIRemoteKeyboards wantsAssistantWhileSuppressingKeyboard](self, "wantsAssistantWhileSuppressingKeyboard"));
  }
}

- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63___UIRemoteKeyboards_queue_setKeyboardDisabled_withCompletion___block_invoke;
  v9[3] = &unk_1E16BAFE8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)forceKeyboardAway
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardDown");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "signalKeyboardChanged:onCompletion:", v5, v7);

}

- (void)preserveKeyboardWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKeyboardChangedInformation informationForKeyboardPreserve:](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardPreserve:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "signalKeyboardChanged:onCompletion:", v6, v8);

}

- (void)restoreKeyboardWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKeyboardChangedInformation informationForKeyboardRestore:](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardRestore:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "signalKeyboardChanged:onCompletion:", v6, v8);

}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_1E16EDF20))
  {
    v11 = 0;
  }
  else
  {
    -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards setFocusedSceneIdentityStringOrIdentifier:](self, "setFocusedSceneIdentityStringOrIdentifier:", v10);

    -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = userSelectedApp_onCompletion____s_category;
  if (!userSelectedApp_onCompletion____s_category)
  {
    v12 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&userSelectedApp_onCompletion____s_category);
  }
  if ((*(_BYTE *)v12 & 1) != 0)
  {
    v14 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315650;
      v16 = "-[_UIRemoteKeyboards userSelectedApp:onCompletion:]";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%s: Focus bundle: %@, sceneIdentity: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  if (!v7)
    v7 = &__block_literal_global_571;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationShouldFocusWithBundle:onCompletion:", v6, v7);

}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "stringRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[_UIRemoteKeyboards requiredScene](self, "requiredScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identityToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards setFocusedSceneIdentityStringOrIdentifier:](self, "setFocusedSceneIdentityStringOrIdentifier:", v13);

    -[_UIRemoteKeyboards focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v15 = userSelectedProcessIdentifier_withSceneIdentity_onCompletion____s_category;
  if (!userSelectedProcessIdentifier_withSceneIdentity_onCompletion____s_category)
  {
    v15 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v15, (unint64_t *)&userSelectedProcessIdentifier_withSceneIdentity_onCompletion____s_category);
  }
  if ((*(_BYTE *)v15 & 1) != 0)
  {
    v19 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315650;
      v21 = "-[_UIRemoteKeyboards userSelectedProcessIdentifier:withSceneIdentity:onCompletion:]";
      v22 = 1024;
      v23 = v6;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%s: Focus PID: %d, sceneIdentity: %@", (uint8_t *)&v20, 0x1Cu);
    }
  }
  if (!v8)
    v8 = &__block_literal_global_574;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "focusApplicationWithProcessIdentifier:context:onCompletion:", v6, v18, v8);
}

- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62___UIRemoteKeyboards_queue_setLastEventSource_withCompletion___block_invoke;
  v9[3] = &unk_1E16B44E8;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)restorePreservedInputViewsIfNecessary
{
  -[_UIRemoteKeyboards userSelectedApp:onCompletion:](self, "userSelectedApp:onCompletion:", 0, 0);
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_582);
}

+ (id)bundlesThatShouldNotPreventRestoration
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.StickerKit.StickerPickerService"));
}

- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "bundlesThatShouldNotPreventRestoration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteKeyboards currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v7) & 1) != 0
    || !-[_UIRemoteKeyboards keyboardVisible](self, "keyboardVisible")
    || -[_UIRemoteKeyboards keyboardActive](self, "keyboardActive"))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "isEqual:", CFSTR("remote-keyboards"));
  }

  return v8;
}

- (void)applicationWillResignActive:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard", a3))
  {
    if (!self->_deactivatedByControlCenter)
    {
      _UIMainBundleIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Spotlight"));

      if ((v5 & 1) == 0)
      {
        -[_UIRemoteKeyboards currentState](self, "currentState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "copyWithIntersectability:", 0);

        objc_msgSend(v7, "setShouldTakeSnapshot:", 0);
        -[_UIRemoteKeyboards signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v7, &__block_literal_global_586);

      }
    }
  }
  -[_UIRemoteKeyboards inputWindowRootViewController](self, "inputWindowRootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIRemoteKeyboards inputWindowRootViewController](self, "inputWindowRootViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)setEnableMultiscreenHack:(BOOL)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  _UIMainBundleIdentifier();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.sidecar.extension.display")) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    _UIMainBundleIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Application '%@' not permitted to use '%@'"), v8, v9);

  }
  self->_enableMultiscreenHack = a3;

}

- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLastEventSource:(int64_t)a3
{
  self->_lastEventSource = a3;
}

- (BOOL)updatingHeight
{
  return self->_updatingHeight;
}

- (BOOL)shouldFence
{
  return self->_shouldFence;
}

- (BOOL)enableMultiscreenHack
{
  return self->_enableMultiscreenHack;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (BOOL)didSignalKeyboardChangedForCurrentKeyboard
{
  return self->_didSignalKeyboardChangedForCurrentKeyboard;
}

- (void)setUpdatingKeyWindow:(BOOL)a3
{
  self->_updatingKeyWindow = a3;
}

- (UIViewController)stickerPrewarmingViewController
{
  return self->_stickerPrewarmingViewController;
}

- (void)setStickerPrewarmingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPrewarmingViewController, a3);
}

- (void)setHandlingRemoteEvent:(BOOL)a3
{
  self->_handlingRemoteEvent = a3;
}

- (BOOL)handlingViewServiceEvent
{
  return self->_handlingViewServiceEvent;
}

- (void)setHandlingViewServiceEvent:(BOOL)a3
{
  self->_handlingViewServiceEvent = a3;
}

- (BOOL)wantsAssistantWhileSuppressingKeyboard
{
  return self->_wantsAssistantWhileSuppressingKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerPrewarmingViewController, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_keyboardSceneIdentifierEnteringForeground, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_minimumKeyboardHeights, 0);
  objc_storeStrong((id *)&self->_lastScreen, 0);
  objc_storeStrong((id *)&self->_ignoredSceneIdentityTokenStringSet, 0);
  objc_storeStrong((id *)&self->_pendingKeyboardGrabs, 0);
  objc_storeStrong((id *)&self->_suppressedScene, 0);
  objc_storeStrong((id *)&self->_focusedSceneIdentityStringOrIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_activeCIDs, 0);
  objc_storeStrong((id *)&self->_activePIDs, 0);
  objc_storeStrong((id *)&self->_requiredScene, 0);
  objc_storeStrong((id *)&self->_windowControllers, 0);
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 0, v6);

}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 1, v6);

}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transition:eventStage:withInfo:", v7, 2, v6);

}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v17[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[_UIRemoteKeyboards proxy](self, "proxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[0] = CFSTR("Placement");
  v16[1] = CFSTR("Quiet");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = CFSTR("Animated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = CFSTR("Notify");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transition:eventStage:withInfo:", CFSTR("Placement"), 3, v15);
}

@end
