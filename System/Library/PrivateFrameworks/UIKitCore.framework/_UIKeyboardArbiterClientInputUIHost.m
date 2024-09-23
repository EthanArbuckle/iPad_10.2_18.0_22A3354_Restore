@implementation _UIKeyboardArbiterClientInputUIHost

- (void)inputSessionDidEndUnexpectedly
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69___UIKeyboardArbiterClientInputUIHost_inputSessionDidEndUnexpectedly__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performAsync:", v4);

}

- (BOOL)isSpotlight:(id)a3
{
  return 0;
}

- (void)setCurrentUIState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardPosition");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "keyboardPosition");
    v23.origin.x = v16;
    v23.origin.y = v17;
    v23.size.width = v18;
    v23.size.height = v19;
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    v20 = CGRectEqualToRect(v22, v23);

    if (v20)
      -[_UIKeyboardArbiterClient setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 0);
  }
  v21.receiver = self;
  v21.super_class = (Class)_UIKeyboardArbiterClientInputUIHost;
  -[_UIKeyboardArbiterClient setCurrentUIState:](&v21, sel_setCurrentUIState_, v4);

}

- (BOOL)shouldSnapshot
{
  return 1;
}

- (id)currentHostedPIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)configureArbiterCommunication:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  _QWORD *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CE8E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v3);

  +[_UIKeyboardArbiterClient mainBundleIdentifier](_UIKeyboardArbiterClient, "mainBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.ios.uikit.TestingHarness"));

  v6 = &protocolRef__UIKBArbiterDelegateInputDestination;
  if (!v5)
    v6 = &protocolRef__UIKBArbiterDelegateProtocol;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v7);

}

- (id)arbiterProxy
{
  void *v2;
  void *v3;

  -[_UIKeyboardArbiterClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_381);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIKeyboardArbiterClientInputUIHost)init
{
  _UIKeyboardArbiterClientInputUIHost *v2;
  _UIKeyboardArbiterClientInputUIHost *v3;
  void *v4;
  UIKeyboardScenePresentationModeManager *v5;
  UIKeyboardScenePresentationModeManager *presentationModeManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardArbiterClientInputUIHost;
  v2 = -[_UIKeyboardArbiterClient init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIKeyboardArbiterClient setKeyboardUIHost:](v2, "setKeyboardUIHost:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_applicationKeyWindowWillChange_, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_inputSessionDidEndUnexpectedly, CFSTR("RTIInputSessionDidEndUnexpectedlyNotification"), 0);
    v5 = objc_alloc_init(UIKeyboardScenePresentationModeManager);
    presentationModeManager = v3->_presentationModeManager;
    v3->_presentationModeManager = v5;

    -[UIKeyboardScenePresentationModeManager setDelegate:](v3->_presentationModeManager, "setDelegate:", v3);
  }
  return v3;
}

- (BOOL)allowedToShowKeyboard
{
  return 1;
}

- (BOOL)isCurrentInputDestination
{
  return 0;
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  return 0;
}

- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[UIKeyboard keyboardApplicationIdentifier](UIKeyboard, "keyboardApplicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationIdentifier:", v8);

  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v9);

  KeyboardArbiterClientLog_2();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost signalKeyboardUIDidChange:onCompletion:]  Signaling keyboard UI did change: %@", (uint8_t *)&v12, 0xCu);
  }

  if ((objc_msgSend(v6, "hasValidNotification") & 1) == 0)
    -[_UIKeyboardArbiterClientInputUIHost setCurrentUIState:](self, "setCurrentUIState:", v6);
  -[_UIKeyboardArbiterClient setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 1);
  -[_UIKeyboardArbiterClient checkConnection](self, "checkConnection");
  -[_UIKeyboardArbiterClientInputUIHost arbiterProxy](self, "arbiterProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signalKeyboardUIDidChange:onCompletion:", v6, v7);

}

- (void)snapsShotKeyboard
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56___UIKeyboardArbiterClientInputUIHost_snapsShotKeyboard__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)resetSnapshotWithWindowCheck:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[_UIKeyboardArbiterClient keyboardSnapshot](self, "keyboardSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardArbiterClient keyboardSnapshot](self, "keyboardSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[_UIKeyboardArbiterClient setKeyboardSnapshot:](self, "setKeyboardSnapshot:", 0);
    if (v3)
      -[_UIKeyboardArbiterClientInputUIHost completeKeyboardChange](self, "completeKeyboardChange");
  }
}

- (void)_updateKeyboardUIScenePresentationMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[_UIKeyboardArbiterClientInputUIHost presentationModeManager](self, "presentationModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationMode");
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardScenePresentationMode:", v4);

  KeyboardArbiterClientLog_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v7, "keyboardScenePresentationMode");
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost _updateKeyboardUIScenePresentationMode]  _updateKeyboardUIScenePresentationMode to: %lu", (uint8_t *)&v8, 0xCu);

  }
}

- (void)keyboardSendNotification:(unint64_t)a3 withInfo:(id)a4 isStart:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _UIKeyboardUIInformation *v9;
  double v10;
  _UIKeyboardUIInformation *v11;
  NSObject *v12;
  const __CFString *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((objc_msgSend(v8, "shouldSendInClient") & 1) == 0)
  {
    v9 = [_UIKeyboardUIInformation alloc];
    objc_msgSend(v8, "duration");
    v11 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v9, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, v10 > 0.0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "setType:", a3);
    -[_UIKeyboardUIInformation addNotificationInfo:isStart:](v11, "addNotificationInfo:isStart:", v8, v5);
    objc_initWeak(&location, self);
    KeyboardArbiterClientLog_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("end");
      if (v5)
        v13 = CFSTR("start");
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardSendNotification:withInfo:isStart:]  InputUI sending %@ notification: %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke;
    v14[3] = &unk_1E16B3F40;
    objc_copyWeak(&v15, &location);
    -[_UIKeyboardArbiterClientInputUIHost signalKeyboardUIDidChange:onCompletion:](self, "signalKeyboardUIDidChange:onCompletion:", v11, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)keyboardVisibilityDidChangeWithFrame:(CGRect)a3 visible:(BOOL)a4 tracking:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  _BOOL4 v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  _UIKeyboardUIInformation *v27;
  _BOOL8 v28;
  _UIKeyboardUIInformation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _UIKeyboardUIInformation *v45;
  _QWORD v46[4];
  id v47;
  id location;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  v5 = a5;
  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51 = *MEMORY[0x1E0C80C00];
  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_msgSend(v12, "isRotating") & 1) != 0 || -[_UIKeyboardArbiterClient snapshotting](self, "snapshotting");

  -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "layoutIsResizing");

  if ((v15 & 1) != 0
    || (-[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isTransitioningBetweenFloatingStates"),
        v16,
        ((v17 | v13) & 1) != 0))
  {
    v18 = 0;
  }
  else
  {
    -[_UIKeyboardArbiterClient kbUIStateDelegate](self, "kbUIStateDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "shouldSkipKeyboardPresentationFence");

    v18 = v20 ^ 1u;
  }
  v21 = -[_UIKeyboardArbiterClient keyboardVisible](self, "keyboardVisible");
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (_UIKeyboardUIInformation *)objc_msgSend(v22, "copy");

  if (v6)
  {
    if (v21)
    {
      -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "keyboardPosition");
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size.width = width;
        v53.size.height = height;
        if (CGRectEqualToRect(v52, v53))
        {
          v25 = -[_UIKeyboardArbiterClient didSignalKeyboardChangedForCurrentKeyboard](self, "didSignalKeyboardChangedForCurrentKeyboard");

          if (v25)
          {
            KeyboardArbiterClientLog_2();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:]  InputUI not updating currentUIState because nothing changed", buf, 2u);
            }
            goto LABEL_28;
          }
        }
        else
        {

        }
      }
    }
    v29 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:]([_UIKeyboardUIInformation alloc], "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 1, +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"), v5, v18, x, y, width, height);

    -[_UIKeyboardArbiterClientInputUIHost resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 0);
  }
  else
  {
    if (!v21)
      goto LABEL_20;
    v27 = [_UIKeyboardUIInformation alloc];
    v28 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
    v29 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v27, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, v28, v5, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  }
  v45 = v29;
LABEL_20:
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentInputMode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "currentInputModeInPreference");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isEqual:", v33) & 1) != 0)
  {
    v34 = v6;

LABEL_24:
    goto LABEL_25;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "currentInputMode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("autofillsignup"));

  if ((v38 & 1) == 0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentInputMode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardUIInformation setCurrentInputMode:](v45, "setCurrentInputMode:", v32);
    goto LABEL_24;
  }
LABEL_25:
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v26 = objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation setAssistantBarVisible:](v45, "setAssistantBarVisible:", -[NSObject hasVisibleAssistantBar](v26, "hasVisibleAssistantBar"));
  -[_UIKeyboardUIInformation setRequiresHeightForIntegratedAssistantBar:](v45, "setRequiresHeightForIntegratedAssistantBar:", -[NSObject hasIntegratedAssistantBar](v26, "hasIntegratedAssistantBar"));
  -[_UIKeyboardArbiterClientInputUIHost _updateKeyboardUIScenePresentationMode](self, "_updateKeyboardUIScenePresentationMode");
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation setKeyboardScenePresentationMode:](v45, "setKeyboardScenePresentationMode:", objc_msgSend(v39, "keyboardScenePresentationMode"));

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation setResizing:](v45, "setResizing:", objc_msgSend(v40, "layoutIsResizing"));

  -[_UIKeyboardArbiterClient eventObserver](self, "eventObserver");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setKeyboardIsVisible:", v34);

  objc_initWeak(&location, self);
  KeyboardArbiterClientLog_2();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIKeyboardUIInformation animationFence](v45, "animationFence");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v43;
    _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:]  InputUI created fence: %@", buf, 0xCu);

  }
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke;
  v46[3] = &unk_1E16B3F40;
  objc_copyWeak(&v47, &location);
  -[_UIKeyboardArbiterClientInputUIHost signalKeyboardUIDidChange:onCompletion:](self, "signalKeyboardUIDidChange:onCompletion:", v45, v46);
  -[_UIKeyboardArbiterClient setExpectingInitialState:](self, "setExpectingInitialState:", 0);
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "resetAnimationFencing");

  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_138);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
LABEL_28:

}

- (void)completeKeyboardChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61___UIKeyboardArbiterClientInputUIHost_completeKeyboardChange__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v5);
  -[_UIKeyboardArbiterClientInputUIHost resetSnapshotWithWindowCheck:](self, "resetSnapshotWithWindowCheck:", 1);
  -[_UIKeyboardArbiterClient changeInfoDelegate](self, "changeInfoDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didHandleKeyboardUIChange:", self);

  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAnimationFencing");

}

- (void)_layoutKeyboardViews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizePlaceholders");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placementIgnoringRotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v33, 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[_UIKeyboardArbiterClient inputWindowRootViewController](self, "inputWindowRootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_inputViewPadding");
  v18 = v15 + fabs(v17);

  if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "keyboardPosition");
    v22 = v20;
    v23 = v21;
    if (v13 * v18 == 0.0 && v21 * v20 == 0.0)
    {

    }
    else
    {

      if (v13 != v22 || v18 != v23)
      {
LABEL_10:
        objc_msgSend(v33, "inputView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "window");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "rootViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if (((objc_opt_isKindOfClass() & 1) == 0
           || (objc_msgSend(v24, "isTranslating") & 1) == 0 && (objc_msgSend(v24, "isSplitting") & 1) == 0)
          && !-[_UIKeyboardArbiterClient handlingKeyboardTransition](self, "handlingKeyboardTransition"))
        {
          -[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:](self, "keyboardVisibilityDidChangeWithFrame:visible:tracking:", -[_UIKeyboardArbiterClientInputUIHost showing](self, "showing"), 0, v9, v11, v13, v18);
        }
        goto LABEL_15;
      }
    }
  }
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applicationIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
LABEL_15:

    goto LABEL_16;
  }
  v26 = (void *)v25;
  -[_UIKeyboardArbiterClient currentUIState](self, "currentUIState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applicationIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard keyboardApplicationIdentifier](UIKeyboard, "keyboardApplicationIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqualToString:", v29);

  if ((v30 & 1) == 0)
  {
    -[_UIKeyboardArbiterClient setDidSignalKeyboardChangedForCurrentKeyboard:](self, "setDidSignalKeyboardChangedForCurrentKeyboard:", 0);
    goto LABEL_10;
  }
LABEL_16:

}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)scenePresentationModeManager:(id)a3 didChangeToMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  KeyboardArbiterClientLog_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = a4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost scenePresentationModeManager:didChangeToMode:]  scenePresentationModeManager: %@ didChangeToMode: %lu", (uint8_t *)&v8, 0x16u);
  }

  -[_UIKeyboardArbiterClientInputUIHost _updateKeyboardUIScenePresentationMode](self, "_updateKeyboardUIScenePresentationMode");
}

- (CGRect)keyboardFrameIncludingRemoteIAV
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrameIncludingRemoteIAV.origin.x;
  y = self->_keyboardFrameIncludingRemoteIAV.origin.y;
  width = self->_keyboardFrameIncludingRemoteIAV.size.width;
  height = self->_keyboardFrameIncludingRemoteIAV.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (UIKeyboardScenePresentationModeManager)presentationModeManager
{
  return self->_presentationModeManager;
}

- (BOOL)inputDestinationInWindowedMode
{
  return self->_inputDestinationInWindowedMode;
}

- (void)setInputDestinationInWindowedMode:(BOOL)a3
{
  self->_inputDestinationInWindowedMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationModeManager, 0);
}

@end
