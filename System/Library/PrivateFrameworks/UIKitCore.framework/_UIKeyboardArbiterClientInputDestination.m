@implementation _UIKeyboardArbiterClientInputDestination

- (_UIKeyboardArbiterClientInputDestination)init
{
  _UIKeyboardArbiterClientInputDestination *v2;
  _UIKeyboardArbiterClientInputDestination *v3;
  NSMutableSet *v4;
  NSMutableSet *pendingKeyboardGrabs;
  NSMutableSet *v6;
  NSMutableSet *activePIDs;
  NSMutableDictionary *v8;
  NSMutableDictionary *callerIDs;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  v2 = -[_UIKeyboardArbiterClient init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_clientChangeResponseLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingKeyboardGrabs = v3->_pendingKeyboardGrabs;
    v3->_pendingKeyboardGrabs = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activePIDs = v3->_activePIDs;
    v3->_activePIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    callerIDs = v3->_callerIDs;
    v3->_callerIDs = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_sceneDidDisconnect_, CFSTR("UISceneDidDisconnectNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_applicationKeyWindowDidChange_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_willResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_didBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_willAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_didRemoveDeactivationReason_, CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_applicationResume_, CFSTR("UIApplicationResumedEventsOnlyNotification"), UIApp);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_sceneWillEnterForeground_, CFSTR("UISceneWillEnterForegroundNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_sceneDidEnterBackground_, CFSTR("UISceneDidEnterBackgroundNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_sceneDidActivate_, CFSTR("UISceneDidActivateNotification"), 0);

  }
  return v3;
}

- (id)currentHostedPIDs
{
  void *v2;
  void *v3;

  -[_UIKeyboardArbiterClientInputDestination activePIDs](self, "activePIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)startConnection
{
  -[_UIKeyboardArbiterClientInputDestination startConnectionWithCompletion:](self, "startConnectionWithCompletion:", 0);
}

- (void)startConnectionWithCompletion:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke;
  v6[3] = &unk_1E16ED0B0;
  objc_copyWeak(&v7, &location);
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient startConnectionWithCompletion:](&v5, sel_startConnectionWithCompletion_, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)stopConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient stopConnection](&v3, sel_stopConnection);
  -[_UIKeyboardArbiterClient cleanSuppression](self, "cleanSuppression");
}

- (void)configureArbiterCommunication:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE0A0940);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CE948);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  KeyboardArbiterClientLog_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = &unk_1EE0A0940;
    v14 = 2112;
    v15 = &unk_1EE0CE948;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination configureArbiterCommunication:]   >>> configuring input destination protocol for %@, remote: %@, exported: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)didFailArbiterConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient didFailArbiterConnection](&v3, sel_didFailArbiterConnection);
  -[_UIKeyboardArbiterClient setDisableBecomeFirstResponder:](self, "setDisableBecomeFirstResponder:", 0);
}

- (void)setCurrentClientState:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v4 = a3;
  -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardIAVHeight");
  v7 = v6;
  objc_msgSend(v4, "keyboardIAVHeight");
  v9 = vabdd_f64(v7, v8);

  if (v9 > 0.00000011920929)
    -[_UIKeyboardArbiterClient setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 0);
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient setCurrentClientState:](&v10, sel_setCurrentClientState_, v4);

}

- (void)setSnapshotting:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[_UIKeyboardArbiterClient snapshotting](self, "snapshotting");
  v16.receiver = self;
  v16.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient setSnapshotting:](&v16, sel_setSnapshotting_, v3);
  if (v5 != v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "_isTextEffectsWindow"))
            objc_msgSend(v11, "_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)shouldSnapshot
{
  void *v3;

  +[_UIKeyboardArbiterClient mainBundleIdentifier](_UIKeyboardArbiterClient, "mainBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[_UIKeyboardArbiterClient isSpotlight:](self, "isSpotlight:", v3);

  return (char)self;
}

- (void)restorePreservedInputViewsIfNecessary
{
  objc_super v3;

  -[_UIKeyboardArbiterClientInputDestination userSelectedApp:onCompletion:](self, "userSelectedApp:onCompletion:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient restorePreservedInputViewsIfNecessary](&v3, sel_restorePreservedInputViewsIfNecessary);
}

+ (id)currentBundleIdentifier
{
  if (qword_1ECD7AE28 != -1)
    dispatch_once(&qword_1ECD7AE28, &__block_literal_global_193_0);
  return (id)qword_1ECD7AE30;
}

- (void)willResume:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[_UIKeyboardArbiterClient enqueuedWillEnterForegroundActions](self, "enqueuedWillEnterForegroundActions"))
  {
    -[_UIKeyboardArbiterClient setEnqueuedWillEnterForegroundActions:](self, "setEnqueuedWillEnterForegroundActions:", 1);
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performAsync:", v6);

  }
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
  unsigned int v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
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
        -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend((id)objc_opt_class(), "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = BSEqualStrings();
      +[UIWindowScene _keyWindowScene]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_isTargetOfKeyboardEventDeferringEnvironment");

      if ((v12 & 1) != 0 || v14)
      {
        v15 = -[_UIKeyboardArbiterClientInputDestination wantsToShowKeyboard](self, "wantsToShowKeyboard");
        KeyboardArbiterClientLog_3();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v19 = 138413314;
          v20 = v11;
          v21 = 1024;
          v22 = v12;
          v23 = 1024;
          v24 = v15;
          v25 = 1024;
          v26 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
          v27 = 1024;
          v28 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
          _os_log_debug_impl(&dword_185066000, v16, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination sceneDidDisconnect:]  Performing required scene update for disconnecting scene: %@; needsUpdateToNil: %d; wantsToShowKeyboardForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
            (uint8_t *)&v19,
            0x24u);
        }

        if ((v12 & 1) != 0)
        {
          v17 = 0;
          v18 = 0x1000000;
        }
        else
        {
          +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 16777472;
        }
        -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v17, v18 | v12);

      }
    }
  }
  else
  {

    v6 = 0;
  }

}

- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
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
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  id v33;
  uint8_t buf[4];
  _BYTE v35[14];
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if ((a3 & 0x100) != 0)
      v6 = objc_msgSend(a1, "currentInputDestination") ^ 1;
    else
      v6 = 1;
    v7 = objc_msgSend(a1, "updatingKeyWindow");
    v8 = v7 ^ 1;
    if ((v7 & 1) == 0 && (a3 & 1) == 0)
      v8 = objc_msgSend(a1, "_sceneFocusUpdatePermittedForWindow:", v5) & v6;
    v9 = a3 & 0x1000000;
    v10 = a3 & 0x100000000;
    v11 = a3 & 0x10000;
    KeyboardArbiterClientLog_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v35 = v8;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = v5;
      v36 = 1024;
      v37 = a3 & 1;
      v38 = 1024;
      v39 = (unint64_t)(a3 & 0x100) >> 8;
      v40 = 1024;
      v41 = v11 >> 16;
      v42 = 1024;
      v43 = (a3 & 0x1000000) >> 24;
      v44 = 1024;
      v45 = (a3 & 0x100000000uLL) >> 32;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Update is permitted: %d; for window: %p; forcingUpdate: %d; consideringCurrentKeyboard: %d; updateFocusedSceneIdentity"
        "StringOrIdentifierIfNil: %d; updateProxyFocusContext: %d; notifyViewServiceHostIfNeeded: %d",
        buf,
        0x30u);
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
      v20 = (v19 | v11) == 0;
      if (!v5 || v17)
      {
        v31 = v14;
        objc_msgSend(v18, "stringRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        KeyboardArbiterClientLog_3();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v35 = v22;
          _os_log_debug_impl(&dword_185066000, v24, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Setting required scene: %@", buf, 0xCu);
        }

        objc_msgSend(a1, "setRequiredScene:", v17);
        if (!v20)
        {
          KeyboardArbiterClientLog_3();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v35 = v22;
            _os_log_debug_impl(&dword_185066000, v25, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Focusing scene identity: %@", buf, 0xCu);
          }

          objc_msgSend(a1, "setFocusedSceneIdentityStringOrIdentifier:", v22);
        }
        if (v9)
        {
          +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v18, objc_msgSend(v5, "_contextId"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          KeyboardArbiterClientLog_3();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v35 = v26;
            _os_log_debug_impl(&dword_185066000, v27, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Updating proxy context: %@", buf, 0xCu);
          }

          objc_msgSend(a1, "arbiterProxy");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setClientFocusContext:", v26);

        }
      }
      else
      {
        if (v14)
          v21 = (v19 | v11) == 0;
        else
          v21 = 1;
        if (v21)
        {
LABEL_31:
          if (v10
            && (objc_msgSend(v5, "_isTextEffectsWindow") & 1) == 0
            && (objc_msgSend(v5, "_isRemoteKeyboardWindow") & 1) == 0)
          {
            v32 = CFSTR("_UIRemoteKeyboardsHostedWindowUserInfoKey");
            v33 = v5;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0, v29);

          }
          goto LABEL_36;
        }
        v31 = v14;
        objc_msgSend((id)objc_opt_class(), "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        KeyboardArbiterClientLog_3();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v35 = v22;
          _os_log_debug_impl(&dword_185066000, v23, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Focusing scene identifier: %@", buf, 0xCu);
        }

        objc_msgSend(a1, "setFocusedSceneIdentityStringOrIdentifier:", v22);
      }

      v14 = v31;
      goto LABEL_31;
    }
  }
LABEL_36:

}

- (void)didSuspend:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_UIKeyboardArbiterClientInputDestination wantsToShowKeyboard](self, "wantsToShowKeyboard");
  KeyboardArbiterClientLog_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v9 = v5;
    v10 = 1024;
    v11 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
    v12 = 1024;
    v13 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
    _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination didSuspend:]  wantsToShowKeyboardForWindow: %d; currentInputDestination"
      ": %d; keyboardVisible: %d",
      buf,
      0x14u);
  }

  if (v5 && !-[_UIKeyboardArbiterClientInputDestination isHostedInAnotherProcess](self, "isHostedInAnotherProcess"))
    -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:](self, "setWindowEnabled:", 0);
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  -[_UIKeyboardArbiterClient didSuspend:](&v7, sel_didSuspend_, v4);
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_203_3);

}

- (void)willAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 0:
      -[_UIKeyboardArbiterClient setDeactivatedBySystemGesture:](self, "setDeactivatedBySystemGesture:", 1);
      break;
    case 2:
      -[_UIKeyboardArbiterClient setDeactivatedByControlCenter:](self, "setDeactivatedByControlCenter:", 1);
      break;
    case 5:
      self->_deactivatedBySystemAnimation = 1;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hadFocusBeforeOverlay = v7 != 0;

      if (v6 == 12)
        goto LABEL_3;
      break;
    case 12:
LABEL_3:
      -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDeactivating:", 1);

      break;
    default:
      return;
  }
}

- (void)didRemoveDeactivationReason:(id)a3
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
    case 0:
      -[_UIKeyboardArbiterClient setDeactivatedBySystemGesture:](self, "setDeactivatedBySystemGesture:", 0);
      break;
    case 2:
      -[_UIKeyboardArbiterClient setDeactivatedByControlCenter:](self, "setDeactivatedByControlCenter:", 0);
      break;
    case 5:
      self->_deactivatedBySystemAnimation = 0;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      if (self->_hadFocusBeforeOverlay)
      {
        -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "applicationShouldFocusWithBundle:onCompletion:", 0, &__block_literal_global_205_2);

        }
      }
      self->_hadFocusBeforeOverlay = 0;
      if (v6 == 12)
        goto LABEL_6;
      break;
    case 12:
LABEL_6:
      -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeactivating:", 0);

      break;
    default:
      return;
  }
}

- (void)willResignActive:(id)a3
{
  BOOL v4;
  void *v5;
  id v6;

  v4 = -[_UIKeyboardArbiterClient deactivatedByControlCenter](self, "deactivatedByControlCenter", a3)
    || self->_deactivatedBySystemAnimation;
  self->_resignActiveByControlCenter = v4;
  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination")
    && !self->_resignActiveByControlCenter
    && !+[UIKeyboard isSpotlight](UIKeyboard, "isSpotlight"))
  {
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "copyWithIntersectability:", 0);

    objc_msgSend(v6, "setShouldTakeSnapshot:", 0);
    -[_UIKeyboardArbiterClientInputDestination signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v6, &__block_literal_global_207_2);

  }
}

- (void)didBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UIKeyboardArbiterClient checkConnection](self, "checkConnection", a3);
  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination")
    && !self->_resignActiveByControlCenter)
  {
    -[_UIKeyboardArbiterClient backupState](self, "backupState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "copyWithIntersectability:", 1);
    }
    else
    {
      -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "copyWithIntersectability:", 1);

    }
    objc_msgSend(v6, "setShouldTakeSnapshot:", 0);
    -[_UIKeyboardArbiterClientInputDestination signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v6, &__block_literal_global_208_0);
    if (!-[_UIKeyboardArbiterClientInputDestination isHostedInAnotherProcess](self, "isHostedInAnotherProcess"))
      -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:](self, "setWindowEnabled:", 1);

  }
  self->_resignActiveByControlCenter = 0;
  -[_UIKeyboardArbiterClient setDeactivatedByControlCenter:](self, "setDeactivatedByControlCenter:", 0);
  self->_deactivatedBySystemAnimation = 0;
}

- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4
{
  _BOOL8 v4;
  UIWindowScene *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UIWindowScene *v23;
  void *v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  _QWORD aBlock[4];
  id v29;
  UIWindowScene *v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  uint8_t v37[128];
  uint8_t buf[4];
  _BOOL4 v39;
  __int16 v40;
  UIWindowScene *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = (UIWindowScene *)a4;
  KeyboardArbiterClientLog_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v39 = v4;
    v40 = 2112;
    v41 = v6;
    v42 = 1024;
    v43 = -[_UIKeyboardArbiterClient expectedSuppression](self, "expectedSuppression");
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination setSuppressingKeyboard:forScene:]  setSuppressingKeyboard: %d forScene: %@ (expectedSuppression: %d)", buf, 0x18u);
  }

  if (-[_UIKeyboardArbiterClient expectedSuppression](self, "expectedSuppression") != v4)
  {
    -[_UIKeyboardArbiterClient setExpectedSuppression:](self, "setExpectedSuppression:", v4);
    v8 = -[_UIKeyboardArbiterClient expectedSuppression](self, "expectedSuppression");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v12 = dispatch_time(0, 500000000);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke;
        block[3] = &unk_1E16B1B28;
        block[4] = self;
        dispatch_after(v12, MEMORY[0x1E0C80D38], block);
      }
    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mostActiveWindowSceneOnScreen:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!v6)
        v6 = v17;
      objc_storeStrong((id *)&self->_suppressedScene, v6);
    }
    else if (!v6)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
LABEL_14:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(UIWindowScene **)(*((_QWORD *)&v32 + 1) + 8 * v22);
          if (v23 == self->_suppressedScene)
            break;
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v20)
              goto LABEL_14;
            goto LABEL_20;
          }
        }
        v6 = v23;

        v9 = MEMORY[0x1E0C809B0];
        if (v6)
          goto LABEL_23;
      }
      else
      {
LABEL_20:

        v9 = MEMORY[0x1E0C809B0];
      }
      v6 = v17;
    }
LABEL_23:
    -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "notifyHostedPIDsOfSuppression:", v4);

    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke_2;
    aBlock[3] = &unk_1E16B4008;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    v31 = v4;
    v6 = v6;
    v30 = v6;
    v26 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend((id)UIApp, "isSuspended"))
    {
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pushAnimationStyle:", v27);

      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v26);
      objc_msgSend(v25, "popAnimationStyle");
    }
    else
    {
      v26[2](v26);
    }

  }
}

- (BOOL)shouldIgnoreInputDestinationChange:(BOOL)a3 withIAVHeight:(double)a4
{
  BOOL v6;
  void *v7;
  double v8;

  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination") != a3)
    return 0;
  -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardIAVHeight");
  v6 = vabdd_f64(v8, a4) < 0.00000011920929;

  return v6;
}

- (BOOL)inputDestinationDidChange:(BOOL)a3 withIAVHeight:(double)a4 isIAVRelevant:(BOOL)a5 notifyRemote:(BOOL)a6 forScene:(id)a7
{
  int v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *context;
  _QWORD v66[4];
  id v67;
  id v68;
  id buf;
  __int16 v70;
  int v71;
  uint64_t v72;

  v7 = a6;
  v8 = a5;
  v10 = a3;
  v72 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  KeyboardArbiterClientLog_3();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v10;
    v70 = 1024;
    v71 = v7;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:]  inputDestDidChange: %{BOOL}d; shouldNotify: %{BOOL}d",
      (uint8_t *)&buf,
      0xEu);
  }

  if (!-[_UIKeyboardArbiterClientInputDestination shouldIgnoreInputDestinationChange:withIAVHeight:](self, "shouldIgnoreInputDestinationChange:withIAVHeight:", v10, a4))
  {
    -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");

    context = (void *)MEMORY[0x186DC9484](-[_UIKeyboardArbiterClient checkConnection](self, "checkConnection"));
    -[_UIKeyboardArbiterClient setBackupState:](self, "setBackupState:", 0);
    -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 0.0;
    if (v8)
      v18 = a4;
    objc_msgSend(v16, "notifyIAVHeight:", v18);

    v19 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
    if (v10)
    {
      if (v19)
      {
        -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "keyboardIAVHeight");
        if (v21 == a4)
        {
          v22 = -[_UIKeyboardArbiterClient didSignalKeyboardChangedForCurrentKeyboard](self, "didSignalKeyboardChangedForCurrentKeyboard");

          if (v22)
          {
            KeyboardArbiterClientLog_3();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              v24 = "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:not"
                    "ifyRemote:forScene:]  nothing changed, returning";
LABEL_20:
              _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
              goto LABEL_21;
            }
            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination"))
      {
        -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "keyboardIAVHeight");
        if (v30 != a4)
        {
          -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "updatingPreferences");

          v7 |= v32 ^ 1;
        }

      }
      +[_UIKeyboardChangedInformation informationForKeyboardUpWithIAVHeight:](_UIKeyboardChangedInformation, "informationForKeyboardUpWithIAVHeight:", a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiterClientInputDestination setCurrentClientState:](self, "setCurrentClientState:", v33);

      -[_UIKeyboardArbiterClient resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
    }
    else
    {
      if (!v19)
      {
        -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "resetAnimationFencing");

        -[_UIKeyboardArbiterClient setCurrentInputDestination:](self, "setCurrentInputDestination:", 0);
        v27 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
        -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setKeyboardIsVisible:", v27);

        KeyboardArbiterClientLog_3();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          v24 = "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyR"
                "emote:forScene:]  another keyboard hid us!";
          goto LABEL_20;
        }
LABEL_21:
        v15 = 0;
LABEL_43:

        objc_autoreleasePoolPop(context);
        goto LABEL_44;
      }
      if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination"))
      {
        +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformation, "informationForKeyboardDown");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardArbiterClientInputDestination setCurrentClientState:](self, "setCurrentClientState:", v25);

      }
    }
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      objc_msgSend(v12, "keyboardSceneDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scene");
      v23 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = v12;
    }
    objc_msgSend((id)objc_opt_class(), "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setSourceSceneIdentityString:", v35);

    _UIMainBundleIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSourceBundleIdentifier:", v37);

    -[NSObject screen](v23, "screen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "displayConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_nameForDisplayType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setSourceDisplayIdentifier:", v41);

    v43 = -[_UIKeyboardArbiterClientInputDestination shouldSnapshot](self, "shouldSnapshot");
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShouldTakeSnapshot:", v43);

    v45 = -[_UIKeyboardArbiterClientInputDestination localSceneCount](self, "localSceneCount") > 1;
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMultipleScenes:", v45);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hardwareKeyboardExclusivityIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIsOneness:", v48 != 0);

    -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "resizing");
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setResizing:", v51);

    v53 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
    -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setKeyboardIsVisible:", v53);

    -[_UIKeyboardArbiterClient setCurrentInputDestination:](self, "setCurrentInputDestination:", v10);
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    if (v55)
      v56 = v7;
    else
      v56 = 0;
    if (v56 == 1
      && (-[_UIKeyboardArbiterClientInputDestination allowedToShowKeyboard](self, "allowedToShowKeyboard")
       || -[_UIKeyboardArbiterClient hostedCount](self, "hostedCount")))
    {
      -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "layoutIsResizing");

      if ((v58 & 1) != 0)
      {
        v15 = 0;
LABEL_42:
        -[_UIKeyboardArbiterClient setExpectingInitialState:](self, "setExpectingInitialState:", 0);
        +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_214_2);
        goto LABEL_43;
      }
      +[_UIKBArbiterClientToken uniqueToken](_UIKBArbiterClientToken, "uniqueToken");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v12);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setSceneIdentityString:", v60);

      -[_UIKeyboardArbiterClientInputDestination pendingKeyboardGrabs](self, "pendingKeyboardGrabs");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v59);

      objc_initWeak(&buf, self);
      -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v62, "copy");
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke;
      v66[3] = &unk_1E16B1500;
      objc_copyWeak(&v68, &buf);
      v55 = v59;
      v67 = v55;
      -[_UIKeyboardArbiterClientInputDestination signalToProxyKeyboardChanged:onCompletion:](self, "signalToProxyKeyboardChanged:onCompletion:", v63, v66);

      objc_destroyWeak(&v68);
      objc_destroyWeak(&buf);
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_42;
  }
  KeyboardArbiterClientLog_3();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:]  returning early due to shouldIgnoreInputDestinationChange:", (uint8_t *)&buf, 2u);
  }

  v15 = 0;
LABEL_44:

  return v15;
}

- (void)_layoutKeyboardViews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizePlaceholders");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placementIgnoringRotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v24, 0);
  v9 = v8;

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placementIgnoringRotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v24, 1);
  v13 = v12;

  v14 = v13 - v9;
  -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyboardIAVHeight");
  if (vabdd_f64(v16, v14) <= 0.00000011920929)
    goto LABEL_4;
  v17 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

  if (!v17)
  {
    v18 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
    -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputViewSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isInputAccessoryViewPlaceholder") ^ 1;
    v21 = -[_UIKeyboardArbiterClient handlingRemoteEvent](self, "handlingRemoteEvent") ^ 1;
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:](self, "inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:", v18, v20, v21, v23, v14);

LABEL_4:
  }

}

- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  char v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  OS_os_transaction *clientChangeResponseTransaction;
  BOOL v35;
  _BOOL4 v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE *v50;
  _BYTE buf[24];
  char v52;
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  KeyboardArbiterClientLog_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination _didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:]  Keyboard client did change: %@ is local: %d", buf, 0x12u);
  }

  v37 = -[_UIKeyboardArbiterClient handlingRemoteEvent](self, "handlingRemoteEvent");
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", !v5);
  v9 = -[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke;
  v47[3] = &unk_1E16ED0F8;
  v47[4] = self;
  v11 = v10;
  v48 = v11;
  v12 = v7;
  v49 = v12;
  v50 = buf;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v47);
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyboardArbiterClient mainBundleIdentifier](_UIKeyboardArbiterClient, "mainBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiterClient setBackupState:](self, "setBackupState:", v17);

    }
    -[_UIKeyboardArbiterClientInputDestination setCurrentClientState:](self, "setCurrentClientState:", v12);
  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hardwareKeyboardExclusivityIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sourceBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIKeyboardArbiterClient isSpotlight:](self, "isSpotlight:", v20))
    v21 = (v19 == 0) ^ objc_msgSend(v12, "isOneness");
  else
    v21 = 0;

  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination"))
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v22 = 1;
    else
      v22 = v21;
  }
  else
  {
    v22 = 0;
  }
  -[_UIKeyboardArbiterClient setCurrentInputDestination:](self, "setCurrentInputDestination:", v22);
  if (v5)
  {
    if (-[_UIKeyboardArbiterClientInputDestination localSceneCount](self, "localSceneCount") >= 2)
    {
      objc_msgSend(v12, "sourceSceneIdentityString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v23 == 0;

    }
    else
    {
      v5 = 1;
    }
  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  if (v9 && (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) ? (v24 = 1) : (v24 = v21), (v24 & 1) == 0))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "responder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v27, "_isHostingRemoteContent") & 1) == 0)
    {
      objc_msgSend(v27, "_responderWindow");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_setLastFirstResponder:", v27);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v27, "interactionState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_setLastFirstResponderInteractionState:", v29);

      }
      objc_msgSend(v28, "_setWantsResponderWithoutKeyboard:", 1);
      objc_msgSend(v27, "resignFirstResponder");
      objc_msgSend(v28, "_setWantsResponderWithoutKeyboard:", 0);
      objc_msgSend(v28, "_firstResponder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_setLastNextResponder:", v30);

    }
    *((_BYTE *)v44 + 24) = 1;

  }
  else
  {
    -[_UIKeyboardArbiterClient setUpdatingHeight:](self, "setUpdatingHeight:", 1);
    -[_UIKeyboardArbiterClient performOnExistingControllers:](self, "performOnExistingControllers:", &__block_literal_global_219_2);
    if (v21)
      v25 = objc_msgSend((id)UIApp, "_isSpringBoard") ^ 1;
    else
      v25 = 0;
    if (((v5 | v25) & 1) == 0)
    {
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3;
      v40[3] = &unk_1E16D7890;
      v40[4] = self;
      v41 = v12;
      v42 = &v43;
      +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v40);

    }
    -[_UIKeyboardArbiterClient performOnExistingControllers:](self, "performOnExistingControllers:", &__block_literal_global_220_0);
    -[_UIKeyboardArbiterClient setUpdatingHeight:](self, "setUpdatingHeight:", 0);
  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7;
  v38[3] = &unk_1E16ED120;
  v38[4] = self;
  v31 = v11;
  v39 = v31;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v38);
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "resetAnimationFencing");

  }
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", v37);
  -[_UIKeyboardArbiterClient changeInfoDelegate](self, "changeInfoDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "didHandleKeyboardClientChange:", self);

  os_unfair_lock_lock(&self->_clientChangeResponseLock);
  clientChangeResponseTransaction = self->_clientChangeResponseTransaction;
  self->_clientChangeResponseTransaction = 0;

  os_unfair_lock_unlock(&self->_clientChangeResponseLock);
  v35 = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  KeyboardArbiterClientLog_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination signalToProxyKeyboardChanged:onCompletion:]  Signaling keyboard changed %@", (uint8_t *)&v10, 0xCu);
  }

  -[_UIKeyboardArbiterClient setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 1);
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signalKeyboardClientChanged:onCompletion:", v6, v7);

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

- (void)applicationKeyWindowDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("Reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue") == 1;
  else
    v8 = 0;
  v9 = 16777472;
  objc_msgSend(v5, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(v10)
    && (_UISceneSystemShellManagesKeyboardFocusForScene(v10) & 1) == 0)
  {
    v11 = objc_msgSend(v10, "_isConnecting");
    if (v11)
      v9 = 0x1000000;
  }
  else
  {
    v11 = 0;
  }
  KeyboardArbiterClientLog_3();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_settingsScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_FBSScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "identityToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 134218754;
    v20 = v5;
    v21 = 2112;
    v22 = v18;
    v23 = 2048;
    v24 = objc_msgSend(v7, "unsignedIntegerValue");
    v25 = 1024;
    v26 = v11;
    _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination applicationKeyWindowDidChange:]  Application key window changed to window: %p; scene identity: %@; for reason: %lu; nonSystemShellManagedScene: %{BOOL}d",
      buf,
      0x26u);

  }
  if (v8)
    v13 = 0;
  else
    v13 = v9;
  -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v5, v13);
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_223_0);

}

- (BOOL)isHostedInAnotherProcess
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[_UIKeyboardArbiterClient existingInputWindowRootViewController](self, "existingInputWindowRootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isHostedInAnotherProcess") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_isHostedInAnotherProcess");

  }
  return v5;
}

- (BOOL)hasWindowHostingPID:(int)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClientInputDestination activePIDs](self, "activePIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (v4)
  {
    -[_UIKeyboardArbiterClientInputDestination callerIDs](self, "callerIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    KeyboardArbiterClientLog_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination hasWindowHostingCallerID:]  nil callerID", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)addWindowHostingPID:(int)a3 callerID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClientInputDestination setWindowHostingPID:active:](self, "setWindowHostingPID:active:", v4, 1);
  if (v6)
  {
    -[_UIKeyboardArbiterClientInputDestination callerIDs](self, "callerIDs");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v7, v6);
  }
  else
  {
    KeyboardArbiterClientLog_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination addWindowHostingPID:callerID:]  nil callerID", v9, 2u);
    }
  }

}

- (void)removeWindowHostingPID:(int)a3 callerID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  uint8_t v12[16];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UIKeyboardArbiterClientInputDestination callerIDs](self, "callerIDs");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v6);
  }
  else
  {
    KeyboardArbiterClientLog_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination removeWindowHostingPID:callerID:]  nil callerID", v12, 2u);
    }
  }

  -[_UIKeyboardArbiterClientInputDestination callerIDs](self, "callerIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) == 0)
    -[_UIKeyboardArbiterClientInputDestination setWindowHostingPID:active:](self, "setWindowHostingPID:active:", v4, 0);

}

- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a4;
    v5 = *(_QWORD *)&a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWindowHostingPID:active:", v5, v4);

    -[_UIKeyboardArbiterClientInputDestination activePIDs](self, "activePIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      objc_msgSend(v8, "addObject:", v10);

      if (!-[_UIKeyboardArbiterClientInputDestination isHostedInAnotherProcess](self, "isHostedInAnotherProcess"))
        -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:](self, "setWindowEnabled:", -[_UIKeyboardArbiterClientInputDestination allowedToShowKeyboard](self, "allowedToShowKeyboard"));
    }
    else
    {
      objc_msgSend(v8, "removeObject:", v10);

      if (!-[_UIKeyboardArbiterClient hasAnyHostedViews](self, "hasAnyHostedViews"))
        -[_UIKeyboardArbiterClientInputDestination completeMoveKeyboard](self, "completeMoveKeyboard");
    }

  }
}

- (BOOL)wantsToShowKeyboard
{
  BOOL v3;
  void *v4;

  if (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination")
    || -[_UIKeyboardArbiterClient hasAnyHostedViews](self, "hasAnyHostedViews"))
  {
    return 1;
  }
  -[_UIKeyboardArbiterClient keyboardSnapshot](self, "keyboardSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = 1;
  else
    v3 = -[_UIKeyboardArbiterClient isOnScreenRotating](self, "isOnScreenRotating");

  return v3;
}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  void *v4;
  void *v5;

  ++self->_hostedCount;
  objc_msgSend(a3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient checkConnection](self, "checkConnection");
  if (self->_hostedCount == 1)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forceReloadInputViews");

  }
  return 0;
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

  -[_UIKeyboardArbiterClient currentClientState](self, "currentClientState");
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

- (BOOL)needsToShowKeyboard
{
  _BOOL4 v3;

  v3 = -[_UIKeyboardArbiterClientInputDestination allowedToShowKeyboard](self, "allowedToShowKeyboard");
  if (v3)
    LOBYTE(v3) = -[_UIKeyboardArbiterClientInputDestination wantsToShowKeyboard](self, "wantsToShowKeyboard");
  return v3;
}

- (BOOL)needsToShowKeyboardForViewServiceHost
{
  _BOOL4 v3;

  v3 = -[_UIKeyboardArbiterClientInputDestination allowedToShowKeyboard](self, "allowedToShowKeyboard");
  if (v3)
    LOBYTE(v3) = -[_UIKeyboardArbiterClientInputDestination wantsToShowKeyboardForViewServiceHost](self, "wantsToShowKeyboardForViewServiceHost");
  return v3;
}

- (BOOL)allowedToShowKeyboard
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  return -[_UIKeyboardArbiterClient allowedToShowKeyboard](&v4, sel_allowedToShowKeyboard)
      || -[_UIKeyboardArbiterClientInputDestination isHostedInAnotherProcess](self, "isHostedInAnotherProcess");
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
    goto LABEL_9;
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  objc_msgSend(v4, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(keyboardSceneIdentifierEnteringForeground) = -[NSString isEqualToString:](keyboardSceneIdentifierEnteringForeground, "isEqualToString:", v6);

  if ((keyboardSceneIdentifierEnteringForeground & 1) != 0)
    goto LABEL_7;
  if (!objc_msgSend(v4, "activationState"))
    goto LABEL_7;
  if (objc_msgSend(v4, "activationState") != 1)
    goto LABEL_9;
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "keyboardOnScreen");

  if (!v8)
    goto LABEL_9;
  if ((objc_msgSend(v4, "_canDynamicallySpecifySupportedInterfaceOrientations") & 1) != 0)
    goto LABEL_7;
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
    goto LABEL_9;
  if (v15 == v20 && v17 == v22)
LABEL_7:
    v9 = 1;
  else
LABEL_9:
    v9 = 0;

  return v9;
}

- (void)resignFirstResponderIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "_isHostingRemoteContent") & 1) == 0)
  {
    objc_msgSend(v6, "_responderWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setLastFirstResponder:", v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "interactionState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setLastFirstResponderInteractionState:", v4);

    }
    objc_msgSend(v6, "resignFirstResponder");
    objc_msgSend(v3, "_firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setLastNextResponder:", v5);

  }
}

- (void)setWindowEnabled:(BOOL)a3
{
  -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:force:](self, "setWindowEnabled:force:", a3, 0);
}

- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3
    && -[_UIKeyboardArbiterClientInputDestination allowedToEnableKeyboardWindow](self, "allowedToEnableKeyboardWindow");
  if (v6 && v4)
    v7 = 2;
  else
    v7 = v6;
  -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = off_1E16ED1B0[v7];
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "responder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_responderWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_contextId");

  if (!(_DWORD)v14)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "_contextId");

  }
  KeyboardArbiterClientLog_3();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "stringRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = v10;
    v22 = 2112;
    v23 = v19;
    _os_log_debug_impl(&dword_185066000, v16, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination setWindowEnabled:force:]  Setting window state: %s for scene identity: %@", (uint8_t *)&v20, 0x16u);

  }
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v9, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWindowContextID:focusContext:windowState:withLevel:", 0, v18, v7, 10000001.0);

}

- (void)updateWindowState
{
  _BOOL8 v3;
  _BOOL8 v4;

  v3 = -[_UIKeyboardArbiterClientInputDestination needsToShowKeyboard](self, "needsToShowKeyboard");
  v4 = v3
    && -[_UIKeyboardArbiterClientInputDestination needsToShowKeyboardForViewServiceHost](self, "needsToShowKeyboardForViewServiceHost");
  -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:force:](self, "setWindowEnabled:force:", v3, v4);
}

- (void)completeMoveKeyboard
{
  id v3;

  if (!-[_UIKeyboardArbiterClientInputDestination isHostedInAnotherProcess](self, "isHostedInAnotherProcess"))
    -[_UIKeyboardArbiterClientInputDestination setWindowEnabled:force:](self, "setWindowEnabled:force:", -[_UIKeyboardArbiterClientInputDestination needsToShowKeyboard](self, "needsToShowKeyboard"), 0);
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAnimationFencing");

}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_1E16EDF20))
  {
    v11 = 0;
  }
  else
  {
    -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination setFocusedSceneIdentityStringOrIdentifier:](self, "setFocusedSceneIdentityStringOrIdentifier:", v10);

    -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  KeyboardArbiterClientLog_3();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination userSelectedApp:onCompletion:]  Focus bundle: %@, focusedSceneIdentity: %@", (uint8_t *)&v14, 0x16u);
  }
  if (!v7)
    v7 = &__block_literal_global_231_0;

  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationShouldFocusWithBundle:onCompletion:", v6, v7);

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
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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

      KeyboardArbiterClientLog_3();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = 134218242;
        v12 = v4;
        v13 = 2112;
        v14 = v9;
        _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:]  Performing required scene update for candidate window: %p; scene: %@",
          (uint8_t *)&v11,
          0x16u);
      }

      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v4, 16777217);
    }

  }
}

- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if (objc_msgSend(a1, "expectedSuppression"))
    {
      objc_msgSend(v5, "windowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == (void *)a1[22];

    }
    else
    {
      v7 = 0;
    }
    v8 = (void *)a1[31];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    v11 = (_DWORD)a3 ? v10 : 1;
    if (v5 && !v7 && v11)
    {
      KeyboardArbiterClientLog_3();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = 134217984;
        v14 = v5;
        _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]  Performing required scene update for window hosting remote ui: %p", (uint8_t *)&v13, 0xCu);
      }

      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v5, 0x101010001);
    }
  }

}

- (BOOL)_sceneFocusPermittedForApplication
{
  int v3;

  v3 = objc_msgSend((id)UIApp, "_shouldAllowKeyboardArbiter");
  if (v3)
    LOBYTE(v3) = -[_UIKeyboardArbiterClientInputDestination allowedToShowKeyboard](self, "allowedToShowKeyboard");
  return v3;
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
  _BOOL4 v23;
  int v24;
  _BOOL4 v26;
  id v27;
  char v28;
  char v29;

  v4 = a3;
  if (v4
    && objc_msgSend((id)UIApp, "_systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:", v4)
    && -[_UIKeyboardArbiterClientInputDestination _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication"))
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
      if (-[_UIKeyboardArbiterClientInputDestination _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication"))
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
          v26 = v16 == 1 || v17 == 0;

          v7 = 0;
          if ((v15 & 1) != 0 || !v26)
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
        -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
        if (v8)
          v24 = BSEqualStrings() ^ 1;
        else
          LOBYTE(v24) = 1;
        +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
        v27 = (id)objc_claimAutoreleasedReturnValue();

        if ((isKindOfClass & 1) != 0)
        {
          v28 = BSEqualStrings();
          if (v27 == v4)
            v29 = 0;
          else
            v29 = v28;
        }
        else
        {
          v29 = 0;
        }
        if (v23)
          v7 = v24 | v29;
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
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peekApplicationEvent:", v4);

    v6 = -[_UIKeyboardArbiterClientInputDestination _sceneFocusPermittedForApplication](self, "_sceneFocusPermittedForApplication");
    objc_msgSend(v4, "allTouches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "phase");
    if (v6 && !v9)
    {
      objc_msgSend(v8, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_responderWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_class();
      objc_msgSend(v11, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[_UIKeyboardArbiterClientInputDestination _sceneFocusUpdatePermittedForWindow:](self, "_sceneFocusUpdatePermittedForWindow:", v11);
      v16 = objc_msgSend(v10, "_wantsTargetOfKeyboardEventDeferringEnvironment");
      v17 = objc_msgSend(v8, "type") == 2;
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cancelDictationForResponderIfNeeded:wantsKeyboard:isPencil:", v10, v16, v17);

      +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_237_1);
      KeyboardArbiterClientLog_3();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        v33 = v15;
        v34 = 2112;
        *(_QWORD *)v35 = v14;
        _os_log_debug_impl(&dword_185066000, v19, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination peekApplicationEvent:]  Update permitted: %d; for scene identity or identifier: %@",
          buf,
          0x12u);
      }

      if (v15)
      {
        v31 = v14;
        v20 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
        v21 = objc_msgSend(v8, "_isPointerTouch");
        KeyboardArbiterClientLog_3();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110146;
          v33 = !v20 | v21 | v16;
          v34 = 1024;
          *(_DWORD *)v35 = v20;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v16;
          v36 = 1024;
          v37 = v21;
          v38 = 2112;
          v39 = v14;
          _os_log_debug_impl(&dword_185066000, v22, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination peekApplicationEvent:]  Request scene focus: %d; keyboardOnScreen"
            ": %d; wantsKeyboard: %d; touchIsPointer: %d; for scene identity or identifier: %@",
            buf,
            0x24u);
        }

        if (!v20 | v21 | v16)
        {
          v23 = 0x100010001;
          if ((_DWORD)v16 && !objc_msgSend(v10, "isFirstResponder"))
            v23 = 65537;
          -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v11, v23);
          -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identityToken");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (-[_UIKeyboardArbiterClient currentInputDestination](self, "currentInputDestination") | v16) ^ 1;
          -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = getpid();
          +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v25, objc_msgSend(v11, "_contextId"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "focusApplicationWithProcessIdentifier:context:stealingKeyboard:onCompletion:", v28, v29, v26, &__block_literal_global_239_0);

          if ((objc_msgSend(v11, "_isApplicationKeyWindow") & 1) == 0)
          {
            -[_UIKeyboardArbiterClientInputDestination setUpdatingKeyWindow:](self, "setUpdatingKeyWindow:", 1);
            objc_msgSend(v11, "makeKeyWindow");
            -[_UIKeyboardArbiterClientInputDestination setUpdatingKeyWindow:](self, "setUpdatingKeyWindow:", 0);
          }
        }
        else
        {
          objc_msgSend(v11, "windowScene");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "keyboardSceneDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "setKeyWindowCandidate:", v11);
        }
        v14 = v31;

      }
    }

  }
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80___UIKeyboardArbiterClientInputDestination_queue_endInputSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E16B1BF8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performAsync:", v6);

}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v6;
  id v7;
  OS_os_transaction *v8;
  OS_os_transaction *clientChangeResponseTransaction;
  dispatch_time_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _UIKeyboardArbiterClientInputDestination *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  os_unfair_lock_lock(&self->_clientChangeResponseLock);
  v8 = (OS_os_transaction *)os_transaction_create();
  clientChangeResponseTransaction = self->_clientChangeResponseTransaction;
  self->_clientChangeResponseTransaction = v8;

  os_unfair_lock_unlock(&self->_clientChangeResponseLock);
  v10 = dispatch_time(0, 300000000);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v12 = v6;
  v22 = v12;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke_241;
  v16[3] = &unk_1E16ED148;
  v14 = v12;
  v17 = v14;
  v18 = self;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v19 = v15;
  objc_msgSend(v13, "performAsync:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)handleKeyboardUITrackingChange:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[8];
  _QWORD v16[8];

  v4 = a3;
  v5 = -[_UIKeyboardArbiterClient handlingRemoteEvent](self, "handlingRemoteEvent");
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", 1);
  objc_msgSend(v4, "keyboardPosition");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke;
  v16[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
  v16[4] = v7;
  v16[5] = v9;
  v16[6] = v11;
  v16[7] = v13;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v16);
  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke_2;
  v15[3] = &__block_descriptor_64_e22_v24__0__UIWindow_8_B16l;
  v15[4] = v7;
  v15[5] = v9;
  v15[6] = v11;
  v15[7] = v13;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v15);
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", v5);
}

- (void)handleKeyboardUIDidChange:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _UIKeyboardArbiterClientInputDestination *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "isRotating") & 1) != 0 || -[_UIKeyboardArbiterClient snapshotting](self, "snapshotting");

  v21 = v6;
  -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutIsResizing");

  if ((v8 & 1) != 0
    || (-[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isTransitioningBetweenFloatingStates"),
        v9,
        v10))
  {
    *((_BYTE *)v19 + 24) = 1;
  }
  v11 = -[_UIKeyboardArbiterClient handlingRemoteEvent](self, "handlingRemoteEvent");
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke;
  v14[3] = &unk_1E16ED190;
  v12 = v4;
  v16 = self;
  v17 = &v18;
  v15 = v12;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v14);
  -[_UIKeyboardArbiterClient setHandlingRemoteEvent:](self, "setHandlingRemoteEvent:", v11);
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetAnimationFencing");

  _Block_object_dispose(&v18, 8);
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasValidNotification");
  KeyboardArbiterClientLog_3();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(v6, "notificationInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardUIDidChange:onComplete:]  Destination posting notification: %@", buf, 0xCu);

    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardUIDidChange:onComplete:]  Keyboard UI did change: %@", buf, 0xCu);
  }

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81___UIKeyboardArbiterClientInputDestination_queue_keyboardUIDidChange_onComplete___block_invoke;
  v15[3] = &unk_1E16BAD68;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "performAsync:", v15);

}

- (void)syncKeyboardUIChangeInfo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  KeyboardArbiterClientLog_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination syncKeyboardUIChangeInfo:]  Sync Keyboard UI Change info: %@", (uint8_t *)&v6, 0xCu);
  }

  -[_UIKeyboardArbiterClientInputDestination keyboardUIDidChange:onComplete:](self, "keyboardUIDidChange:onComplete:", v4, 0);
}

- (void)keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  NSObject *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_msgSend(v6, "currentInputMode");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentInputMode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((objc_msgSend(v6, "tracking") & 1) == 0)
      {
        if ((v14 & 1) == 0)
        {
          objc_msgSend(v6, "currentInputMode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "postNotificationName:object:", CFSTR("UITextInputCurrentInputModeWillChangeNotification"), 0);

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "postNotificationName:object:", CFSTR("UITextInputWillPersistFindUINotification"), 0);

          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "updateCurrentInputMode:", v16);

        }
        goto LABEL_9;
      }
    }
    else if (!objc_msgSend(v6, "tracking"))
    {
LABEL_9:
      if ((objc_msgSend(v6, "hasValidNotification") & 1) == 0)
      {
        -[_UIKeyboardArbiterClient setCurrentUIState:](self, "setCurrentUIState:", v6);
        KeyboardArbiterClientLog_3();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          v29 = v6;
          _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination keyboardUIDidChange:onComplete:]  Setting currentUIState: %@", (uint8_t *)&v28, 0xCu);
        }

      }
      v23 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
      -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setKeyboardIsVisible:", v23);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSuppressUpdateInputMode:", 1);

      -[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:](self, "handleKeyboardUIDidChange:", v6);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSuppressUpdateInputMode:", 0);

      if (v7)
        objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v7);
LABEL_15:
      -[_UIKeyboardArbiterClient changeInfoDelegate](self, "changeInfoDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "didHandleKeyboardUIChange:", self);

      goto LABEL_16;
    }
    -[_UIKeyboardArbiterClient setCurrentUIState:](self, "setCurrentUIState:", v6);
    v20 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
    -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setKeyboardIsVisible:", v20);

    -[_UIKeyboardArbiterClientInputDestination handleKeyboardUITrackingChange:](self, "handleKeyboardUITrackingChange:", v6);
    if (v7)
      v7[2](v7);
    goto LABEL_15;
  }
LABEL_16:

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
  v7[2] = __84___UIKeyboardArbiterClientInputDestination_queue_activeProcessResignWithCompletion___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

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
  if (-[_UIKeyboardArbiterClient expectingInitialState](self, "expectingInitialState") && !a3)
    -[_UIKeyboardArbiterClient setAvoidDisableKeyboard:](self, "setAvoidDisableKeyboard:", 1);
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85___UIKeyboardArbiterClientInputDestination_queue_setKeyboardDisabled_withCompletion___block_invoke;
  v9[3] = &unk_1E16BAFE8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

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
  _UIKeyboardArbiterClientInputDestination *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84___UIKeyboardArbiterClientInputDestination_queue_sceneBecameFocused_withCompletion___block_invoke;
  v11[3] = &unk_1E16BAD68;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performAsync:", v11);

}

- (NSString)focusedSceneIdentityStringOrIdentifier
{
  return self->_focusedSceneIdentityStringOrIdentifier;
}

- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSMutableSet)pendingKeyboardGrabs
{
  return self->_pendingKeyboardGrabs;
}

- (void)setPendingKeyboardGrabs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingKeyboardGrabs, a3);
}

- (NSMutableSet)activePIDs
{
  return self->_activePIDs;
}

- (void)setActivePIDs:(id)a3
{
  objc_storeStrong((id *)&self->_activePIDs, a3);
}

- (NSMutableDictionary)callerIDs
{
  return self->_callerIDs;
}

- (void)setCallerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_callerIDs, a3);
}

- (BOOL)updatingKeyWindow
{
  return self->_updatingKeyWindow;
}

- (void)setUpdatingKeyWindow:(BOOL)a3
{
  self->_updatingKeyWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerIDs, 0);
  objc_storeStrong((id *)&self->_activePIDs, 0);
  objc_storeStrong((id *)&self->_pendingKeyboardGrabs, 0);
  objc_storeStrong((id *)&self->_focusedSceneIdentityStringOrIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardSceneIdentifierEnteringForeground, 0);
  objc_storeStrong((id *)&self->_clientChangeResponseTransaction, 0);
  objc_storeStrong((id *)&self->_lastScreen, 0);
  objc_storeStrong((id *)&self->_suppressedScene, 0);
}

@end
